Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE5A75B3EE1
	for <lists+platform-driver-x86@lfdr.de>; Fri,  9 Sep 2022 20:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbiIISdM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 9 Sep 2022 14:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiIISdL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2022 14:33:11 -0400
Received: from vorpal.se (unknown [IPv6:2a01:7e00::f03c:91ff:fe73:398e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50394124609;
        Fri,  9 Sep 2022 11:33:01 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 88E93142D4;
        Fri,  9 Sep 2022 18:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662748364; bh=97mXvc72DnZ+amLXbSvMjAEso371TDIcGo9jme7wwVg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jwt+5ocyWWBJydKSX32gguJHeO//r1+kyfJzBIHbTK4YINyvmzwhpOYpWICo0QV14
         bCp6faHXjb9ntGvStv/G9GZPFxjIITOCSXBowKv/FByR50dJ/ThD1+7z7p8qfqDwOv
         N+WY/H4n4P4I1QM24zvUvcwm0YmP5SuoergRr9wRag97ec2txto/wUbNG5ILO0evg5
         VJArv0COEvQTAPs9nH2NDLCHIX3fQVrfREx176mKZ8MUMC4jsTTOImILsagZEMMC0x
         L5tf23Mty5H8obbWYwpibXCPvNQiRfa7s4/LjeYfJvLC66oMVDU7+Lzl3+l8hc87Kv
         T53vCzWzzVHTQ==
Message-ID: <de8a1f37-414d-3a06-0b56-54b0daa4a250@vorpal.se>
Date:   Fri, 9 Sep 2022 20:32:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/2] drivers/platform: toshiba_acpi: Call
 HCI_PANEL_POWER_ON on resume on some models
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mark Gross <mgross@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20220909153239.34606-1-hdegoede@redhat.com>
 <ee77aadf-8adc-c812-55ae-c534fb523de5@vorpal.se>
 <cc8ae460-9ebd-6c47-a938-eb515ce42104@redhat.com>
From:   Arvid Norlander <lkml@vorpal.se>
In-Reply-To: <cc8ae460-9ebd-6c47-a938-eb515ce42104@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NICE_REPLY_A,RCVD_IN_SBL_CSS,RCVD_IN_XBL,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2022-09-09 19:42, Hans de Goede wrote:
> Hi,
> 
> On 9/9/22 19:29, Arvid Norlander wrote:
>> Hi,
>>
>> Given the changes, do you want me to test this again? If so, on what branch?
> 
> I have just pushed this new version + all your pending toshiba_acpi patches
> to my review-hans branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans\
> 
> If you can give this branch a quick test and let me know if everything works
> as expected that would be great.

My changes (battery charge threshold, fan HWMON support, ECO LED work as
expected.

Display does come on after resume. Unfortunately the computer also
completely locks up (I can't even switch from X to a VT). SSH is dead.
When I suspend with a VT active the cursor is no longer blinking on resume.
So something else is severly broken in this version and I cannot fully test
this.

I notice your tree is based on rc1. I was previously testing with 5.19 as
well as rc2 and newer. Is it possible this is a bug from mainline? Or is
it something introduced by your tree? I'm wondering it it would be easier
to first rebase your tree on the latest RC rather than trying to bisect it
as is.

Or the easiest test is perhaps: Does suspend and resume with this tree work
on your computer? I remember hearing that there were SATA issues in early
6.0-rcs (don't remember the details), the Toshiba uses mSATA.

> 
> Thanks,
> 
> Hans
> 
<snip>

Best regards,
Arvid Norlander
