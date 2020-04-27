Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561461B98EF
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Apr 2020 09:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgD0Hoe (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Apr 2020 03:44:34 -0400
Received: from sonic314-15.consmr.mail.bf2.yahoo.com ([74.6.132.125]:40182
        "EHLO sonic314-15.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726349AbgD0Hoe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Apr 2020 03:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1587973472; bh=SYsUU+0uTENJBRiLkZysmMZhB+GQ5d1f3ci1ZkycS4Y=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=GtbsuGbRXo+8p+jYv9hWbD35M/FAiVmhrTnbZdKFoV7v1ja/j1prekf7RP3po+6ixp4fyC+S4XLqE2apRDVAbVHOYBy6Ge5wSphQw+KrQFylykMOwhHnIr2yuJI2M/Y8LeUU/RGz2ndPQ7n/tuAPZO/gMNng2ns0iLFJ256SNdCFD9slTbDsv/yZMPVc8/PUU28vldRG06irD5zoDhTGLP3GHUQvjewFUAj0TG+jQaLFwN8vFwMSx0UAAwuzQaVJLEJygm+LkFocImZkWIx5O/moH4F6tdFUFnYeF4iuPkVydUIhuiKiGLfqCMOyfU8lnaPOXUkroKTsPIE1ioYAmw==
X-YMail-OSG: ctU.o2kVM1lzIGIptpGvwW1KYa44oyoOKi438z_SVRrhjmD3U3FfvA_ZEiSBcoB
 y.shQQZCxTnVEuZHFkQtYxV_d3V6YCSoqQ6e.HGYRli8PDxflyKtfmoEemsQGNtjTeWc_U24zUE8
 miUGwhoFr8Pp01vTkttcwytAydm6MI2I4LN8gYxtx6NvzlX2yeKOhK9_I.yU_fe7Q7YREZnNRSEF
 9Diz3fSv2FnxuONVCmq0ALM9dmZITyr0UHmsSCIg4zks67tSpe7o1RmvzS1Dr03vWbCVH3OVtAOo
 SnF9K2joiEoI9DaILmFivzLGC95spBw_QsKoZqOct7mHStr44QmQy7NOcjoeurx7lW.Apwm7XGWT
 8wKi2Oyv2QCFDnkM1hM5r9nXihah7laUJv_9fNW9_iwf.vHqhHVcy2wN_mGUuhLmKkj4GZxeHGTw
 mq3.gG1ZuyJFLAqMgqnxE8P7lZi10K4P.zK7tfqjT0K94xI8Kkqgoamqq46C0tdfsPIHzgwV4hFT
 GCVkWmmoXW2T7EitqKXKnei1x_KyCJPMIWbZCGTAEmW8r79gRdyHwgxjVc.2Qi1ntUHCMsTs_CSr
 CEo0G.5IxmTmAVDHljDJaj3qrPp288OGJsWwujx8vvoBFPuTageWlP87TYX8azdAFV6Vmlvn6Hvo
 xLBU2jb9itzBCDQetfQ5YI85h3X_HOsum0_n.36Aig__wfMMq7pQEYRvNtj3qhnM_Ajgy71Bm_5d
 d5nOew3HOlB9exEc_pGrK.53xwofTzc9e8uGAR0IaE6nD0AzUpNTNMF1Lj6gD1uwtaXyIkpmkxxu
 G_7ufHOvzUYEtSk_7Uori_VLhbCZ4RGFRstgHBlZFDektQQOd1w1WYyRpoeTnr2W4rTHlEneuE41
 pRdaOb6FjxKXRY3730k887jya.mTJlEjNEAcqk..8N3ot.5r7QDdYhUAhVHF5bJ_aP2hE5M2ayNF
 OFy0DFD540ZXrvJLwfVMJQi4IgCx0BkX2iMwa3a7zdzNL4f8SF_nJpsWAWNioPJk2dO_ywUFYifY
 2Wvn5RWD.jLb1G9PwbH_SIxE5v1pj2eHEbTwQ5GQriXqB8IPXIw2TCTXXiXxcIjTvOGeyeV5V.kZ
 Hqs46k8erSwKRyap.4ODbi.C8_wAk8KX5CXEd2eJzxLQaVw6RiPLZVsT3EOIdOa_gtKkDEqTVHTf
 QYPXtbl.WtgrKWy4fmORT2nl7qCgGwkVBHKZRfM.ILhTubXuAj8OjSZWVM._HsKLrAifx8MUWoAg
 17RiQ3gcglyH7VSyQGRLu0m_wShvuYJNCERL2oGPJcbyGmfpQb1XzflUzSfZ_xSWBFurlU6V4h0d
 3Odrp7q4VoxN.9Mws3.Q3BdfFsMxeUkk-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Mon, 27 Apr 2020 07:44:32 +0000
Date:   Mon, 27 Apr 2020 07:44:23 +0000 (UTC)
From:   "larsh@apache.org" <larsh@apache.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Kevin Slagle <kjslag@gmail.com>,
        =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner@gmail.com>,
        Dario Messina <nanodario@gmail.com>,
        Stefan Assmann <sassmann@kpanic.de>,
        Alexander Kappner <agk@godking.net>,
        Marc Burkhardt <marc@osknowledge.org>
Message-ID: <1630425700.517847.1587973463950@mail.yahoo.com>
In-Reply-To: <CAHp75VeX2SjX5J-w933FKh_yii=cJ9_tWj3RRNx7Q6vijtt6AQ@mail.gmail.com>
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org> <CAHp75VeX2SjX5J-w933FKh_yii=cJ9_tWj3RRNx7Q6vijtt6AQ@mail.gmail.com>
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual fan control on
 select models
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.15756 YMailNorrin Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hi Andy,

my full name is Lars Hofhansl.
Should I send a new post?

Just in case, I hereby:

Signed-off-by: Lars Hofhansl <larsh@apache.org>

-- Lars

On Friday, April 24, 2020, 4:12:05 AM PDT, Andy Shevchenko <andy.shevchenko@gmail.com> wrote: 





On Fri, Apr 24, 2020 at 12:57 AM Lars <larsh@apache.org> wrote:
>
> This adds dual fan control for the following models:
> P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
>
> Both fans are controlled together as if they were a single fan.
>
> Tested on an X1 Extreme Gen1, an X1 Extreme Gen2, and a P50.
>
> The patch is defensive, it adds only specific supported machines, and falls
> back to the old behavior if both fans cannot be controlled.
>
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always
> changed together. So rather than adding controls for each fan, this controls
> both fans together as the BIOS would do.
>
> This was inspired by a discussion on dual fan support for the thinkfan tool
> [1].
> All BIOS ids are taken from there. The X1E gen2 id is verified on my machine.
>
> Thanks to GitHub users voidworker and civic9 for the earlier patches and BIOS
> ids, and to users peter-stoll and sassman for testing the patch on their
> machines.
>
> [1]: https://github.com/vmatare/thinkfan/issues/58
>
> Signed-off-by: Lars <larsh@apache.org>

One question though, is Lars your real name here? [1]


[1]: 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

-- 
With Best Regards,
Andy Shevchenko

