Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E556AE15D
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 Mar 2023 14:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbjCGNwd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 7 Mar 2023 08:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjCGNwQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2023 08:52:16 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0979E85A42;
        Tue,  7 Mar 2023 05:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
        In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=HRxyhd/oioqCd1sk0WdqUmIMu/OMpK9WfvQPOPeq7Ug=; b=DQ7g2c2BMp8ZPP4hKL1VFOU3bs
        azkC6kh0McljNC0+WknUd53nc3sRqr7ltLbdYpsCPaqX+LMUC/HAEUz0RvFxG+s+xhTyqI3Q7gH1r
        63XW2E8KO/uSe1RAAOMEDmOAWELWhkg/OX78Wy6fO/VE51RsP9wxxpgBHQBFEGoezWN0tCUgLvhei
        zgXdZcSPDVyPn5XqPpHJ6j2LW+/mQEvM6QDObWrWBk6AiQOGUUSifS4Y16egJMe8dv6B/EacdxLHu
        VcG23NN9SebUgWOPpkKfNEUiJdkAN0HYh3ed16+ffaFPw9RK2p1tV3P8ctP+dDIGgJuW9gcs8hz2+
        mnV7o76A==;
Received: from [2001:8b0:10b:5:c09:fa3d:b1cb:4d7e] (helo=u3832b3a9db3152.ant.amazon.com)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pZXj0-006OFM-F6; Tue, 07 Mar 2023 13:51:31 +0000
Message-ID: <f149fe1eb3836c14655e3e7eaa4032298ae68545.camel@infradead.org>
Subject: Re: [PATCH v6 20/20] irqdomain: Switch to per-domain locking
From:   David Woodhouse <dwmw2@infradead.org>
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        xen-devel <xen-devel@lists.xenproject.org>
Cc:     x86@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Date:   Tue, 07 Mar 2023 13:51:29 +0000
In-Reply-To: <20230213104302.17307-21-johan+linaro@kernel.org>
References: <20230213104302.17307-1-johan+linaro@kernel.org>
         <20230213104302.17307-21-johan+linaro@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
        boundary="=-V5MNw96SXBJUAIQxb11D"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--=-V5MNw96SXBJUAIQxb11D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-02-13 at 11:43 +0100, Johan Hovold wrote:
> The IRQ domain structures are currently protected by the global
> irq_domain_mutex. Switch to using more fine-grained per-domain locking,
> which can speed up parallel probing by reducing lock contention.
>=20
> On a recent arm64 laptop, the total time spent waiting for the locks
> during boot drops from 160 to 40 ms on average, while the maximum
> aggregate wait time drops from 550 to 90 ms over ten runs for example.
>=20
> Note that the domain lock of the root domain (innermost domain) must be
> used for hierarchical domains. For non-hierarchical domains (as for root
> domains), the new root pointer is set to the domain itself so that
> &domain->root->mutex always points to the right lock.
>=20
> Also note that hierarchical domains should be constructed using
> irq_domain_create_hierarchy() (or irq_domain_add_hierarchy()) to avoid
> having racing allocations access a not fully initialised domain. As a
> safeguard, the lockdep assertion in irq_domain_set_mapping() will catch
> any offenders that also fail to set the root domain pointer.
>=20
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Broke Xen. And it's *so* easy to test. As long as you have qemu master
branch from no older than last Thursday, that is...

$ qemu-system-x86_64 -serial mon:stdio  -display none \
 -accel kvm,xen-version=3D0x4000e,kernel-irqchip=3Dsplit \
 -kernel arch/x86/boot/bzImage -append "console=3DttyS0"=20

...

[    0.466554] BUG: kernel NULL pointer dereference, address: 0000000000000=
0c0
[    0.467249] #PF: supervisor read access in kernel mode
[    0.467249] #PF: error_code(0x0000) - not-present page
[    0.467249] PGD 0 P4D 0=20
[    0.467249] Oops: 0000 [#1] PREEMPT SMP PTI
[    0.467249] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc4+ #1206
[    0.467249] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[    0.467249] RIP: 0010:irq_domain_create_hierarchy+0x2c/0x70
[    0.467249] Code: 1e fa 0f 1f 44 00 00 41 54 49 89 fc 48 89 cf 55 89 f5 =
53 85 d2 74 40 89 d6 31 c9 89 d2 e8 2c fa ff ff 48 89 c3 48 85 db 74 21 <49=
> 8b 84 24 c0 00 00 00 09 6b 28 48 89 df 4c 89 a3 f0 00 00 00 48
[    0.467249] RSP: 0000:ffffc90000013e60 EFLAGS: 00010286
[    0.467249] RAX: ffff8880053a1a00 RBX: ffff8880053a1a00 RCX: 00000000000=
00000
[    0.467249] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffff848=
28fa0
[    0.467249] RBP: 0000000000000010 R08: 0000000000000003 R09: 00000000000=
00000
[    0.467249] R10: 0000000025a89be7 R11: 00000000442a63fa R12: 00000000000=
00000
[    0.467249] R13: ffffffff83ac1b98 R14: 0000000000000000 R15: 00000000000=
00000
[    0.467249] FS:  0000000000000000(0000) GS:ffff888007a00000(0000) knlGS:=
0000000000000000
[    0.467249] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.467249] CR2: 00000000000000c0 CR3: 0000000002824000 CR4: 00000000000=
006f0
[    0.467249] Call Trace:
[    0.467249]  <TASK>
[    0.467249]  ? __pfx_pci_arch_init+0x10/0x10
[    0.467249]  __msi_create_irq_domain+0x85/0x170
[    0.467249]  ? __pfx_pci_arch_init+0x10/0x10
[    0.467249]  xen_create_pci_msi_domain+0x34/0x40
[    0.467249]  x86_create_pci_msi_domain+0x12/0x1e
[    0.467249]  pci_arch_init+0x31/0x7a
[    0.467249]  ? __pfx_pci_arch_init+0x10/0x10
[    0.467249]  do_one_initcall+0x5f/0x320
[    0.467249]  ? rcu_read_lock_sched_held+0x43/0x80
[    0.467249]  kernel_init_freeable+0x189/0x1c6
[    0.467249]  ? __pfx_kernel_init+0x10/0x10
[    0.467249]  kernel_init+0x1a/0x130
[    0.467249]  ret_from_fork+0x2c/0x50
[    0.467249]  </TASK>
[    0.467249] Modules linked in:
[    0.467249] CR2: 00000000000000c0
[    0.467249] ---[ end trace 0000000000000000 ]---
[    0.467249] RIP: 0010:irq_domain_create_hierarchy+0x2c/0x70
[    0.467249] Code: 1e fa 0f 1f 44 00 00 41 54 49 89 fc 48 89 cf 55 89 f5 =
53 85 d2 74 40 89 d6 31 c9 89 d2 e8 2c fa ff ff 48 89 c3 48 85 db 74 21 <49=
> 8b 84 24 c0 00 00 00 09 6b 28 48 89 df 4c 89 a3 f0 00 00 00 48
[    0.467249] RSP: 0000:ffffc90000013e60 EFLAGS: 00010286
[    0.467249] RAX: ffff8880053a1a00 RBX: ffff8880053a1a00 RCX: 00000000000=
00000
[    0.467249] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffff848=
28fa0
[    0.467249] RBP: 0000000000000010 R08: 0000000000000003 R09: 00000000000=
00000
[    0.467249] R10: 0000000025a89be7 R11: 00000000442a63fa R12: 00000000000=
00000
[    0.467249] R13: ffffffff83ac1b98 R14: 0000000000000000 R15: 00000000000=
00000
[    0.467249] FS:  0000000000000000(0000) GS:ffff888007a00000(0000) knlGS:=
0000000000000000
[    0.467249] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.467249] CR2: 00000000000000c0 CR3: 0000000002824000 CR4: 00000000000=
006f0
[    0.467249] Kernel panic - not syncing: Fatal exception


--=-V5MNw96SXBJUAIQxb11D
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMzA3MTM1MTI5WjAvBgkqhkiG9w0BCQQxIgQgH1mcpSq3
H29WUi6FBHHKyOt1OXVRZGfAvLfmorma6gQwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCBiO2scwjQK9nvrOCTo6fZaWzZvkDMnQY3
KfnzStAQfueWONgl8xJIyIMbl0c4VQ4Fy2kprpDxnVZu5O8le7opbiCrKXA8o+MWL/h7vQWbur7n
fhIf6KwRCeN2wjkL8GJQdn2c9iVaoy2DOqPLGsj3BLwvvwupn7gAUO0CxrSC75QHbBxHnewG9OtU
rOp99n/ZMYN5FEuNRZYcrrEGcbAgTTL70kzHuCd1QnFPTFkRy5rZgzkCPnqHt6aOWC2B8Md/9BzO
rDNp5ioFtL0qRcxfcAUTZcqKTg46/rGfG+RD4GnMc1DgmMNJLqUXLwz4hgy9pCKpIBDHjosEelAy
5vMEtD10V3Ljz4MECaRp6F5u/rQ/sDxqlCy1JwyG19v9cRWbqvBBhIcrSD7xbHCjiPPA2CJyJpU5
rI2GcNVEJ6Z+5MziKfgMCIIetdEuD1OrDgx3QBfqxlnNF3CW3GdYVtuknBqrorTkfqPZoF7BBQWT
R45pUXw0ykIrYDJL7EQGlrRsS9UcrkkTy+Eweky4W9dFv9ReAkYAMSU20oQbFpIqGDSwZ0oqOO7E
S5R+uM2w0HsYyWhKElqdIV/PgOXjwrtaD98ir+Tg8ELSyTAO6QXiHINBwglyISRqntZrmfdNVAoy
biga24iyM7G0NrqFQqznpzoldpG9XS1MSAmE2KN9wQAAAAAAAA==


--=-V5MNw96SXBJUAIQxb11D--
