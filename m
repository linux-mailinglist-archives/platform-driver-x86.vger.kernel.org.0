Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838D26A55DD
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Feb 2023 10:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjB1Jdc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Feb 2023 04:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjB1JdX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2023 04:33:23 -0500
X-Greylist: delayed 496 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Feb 2023 01:33:16 PST
Received: from smtp-out.abv.bg (smtp-out.abv.bg [194.153.145.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE289212A
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 01:33:16 -0800 (PST)
Received: from nm83.abv.bg (nm83.ni.bg [192.168.151.146])
        by smtp-out.abv.bg (Postfix) with UTF8SMTP id 53C826199
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 11:24:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
        t=1677576298; bh=2wTmZ5vH+BHZ/0XLnguFNBM3c5XMnDWPVGRXu8qYweI=;
        h=Date:From:To:Subject:From;
        b=AowZybEjhXeew5qiVCX5pBYiQ7N1dYIPDK0z7Hmhi/tIGdc1SIEbMFt8A0es6cDlj
         IFV4D2q4euypRIN6cFCP8GX8NGOkUF58MBBYLQwZp2RJsd0Da8b64GyDt0/8mlOT1a
         dNBO4Q2fEIE1QvHyIia7pAtYpOsNdMwkawEeBfv0=
Received: from nm83.abv.bg (localhost [127.0.0.1])
        by nm83.abv.bg (Postfix) with UTF8SMTP id 207B09D7FB
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 11:24:58 +0200 (EET)
Date:   Tue, 28 Feb 2023 11:24:53 +0200 (EET)
From:   Kristian Angelov <kristiana2000@abv.bg>
To:     platform-driver-x86@vger.kernel.org
Message-ID: <443078148.491022.1677576298133@nm83.abv.bg>
Subject: [bug report] platform/x86: asus-wmi: Unable to set rgb mode on TUF FX505 laptop
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Mailer: AbvMail 3.0
X-Originating-IP: 145.93.102.78
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I am unable to set the color/mode on my TUF FX505 laptop. Upon investigation of the asus-wmi driver, I can see a correct implementation of the color setting functionality (based on my own reverse engineering) however writing to the appropriate /sys/class/leds device does not work. Upon further investigation it seems to have to do with asus-wmi.c:747 where cmd = !!cmd is done. On my specific laptop the WMI interface expects the magic value 0xB3 however it is impossible to write this value as any positive value will be replaced by 1.


Best regards,
Kristiyan


PS: Please CC
