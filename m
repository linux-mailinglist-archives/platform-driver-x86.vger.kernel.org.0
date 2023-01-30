Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C675A681370
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Jan 2023 15:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbjA3Ofx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 30 Jan 2023 09:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235123AbjA3Ofu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 09:35:50 -0500
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A90C212F
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:35:40 -0800 (PST)
Date:   Mon, 30 Jan 2023 14:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1675089336; x=1675348536;
        bh=sx5iV95AGjo5EHDRDuNUJ2CW1R2JxQXKdt7wsTRJxMU=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=TXD9RDBp5xneMu2fWkSe5W9TgISN4UwVKsCLtdRF59B3IQk6uEdREEH4NuHO0ND6j
         /oQjuchUenf+ATCX0id1keSP1MfTp3+/FMxYe7J1jiWpiDrMphdXpkSPv/XjtUwbyG
         3YMeD9l8+3+9q23M2OWxoouKP1qUX3kVnuIWzrkmyWgFmsYQWyY2rQBt3Ph8LIpCT3
         leDLlt1XxqW3owHhvzm9edWJnrPnBIrOq5KXXN8RHKZls8EINBRVgajWdtPw8Dgfa1
         Aassr2Zz1QHwt44tp815ruZUu8pKcE99m+ciEzaqHk48oeZg/fuZruMD69ZjuAhsAY
         BXkmEh1DMv4xA==
To:     Hans de Goede <hdegoede@redhat.com>
From:   "john.martens.linux" <john.martens.linux@proton.me>
Cc:     John Martens <john.martens4@proton.me>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "ike.pan@canonical.com" <ike.pan@canonical.com>
Subject: Re: New Lenovo Legion Fan, Temperature, Power Mode Driver
Message-ID: <AGUOmNWQZ2ZmbBVDbwjELwdxZmr4fpscuwkdlofEpskNGo0RLyrzuEsUhQTG7K13KKhb7KpxkFmrhz6FyoDQOpdjXrax30CF3dDjx3IEXzY=@proton.me>
In-Reply-To: <a41ebfef-e589-dbff-c93c-eb7c197d28f0@redhat.com>
References: <cchW8yA1BnN-yMnXp0EY8oKubzPC721jNMylHVzSVuf5C0YAhC7gYkSjhxIpZMv7K9hMw4ezLbxGEtEd7Gs_bAIoDizRSQG2V3Ql5nl5G_0=@proton.me> <a41ebfef-e589-dbff-c93c-eb7c197d28f0@redhat.com>
Feedback-ID: 66605271:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On Thursday, January 12th, 2023 at 8:07 PM, Hans de Goede wrote:
> Thank you for reaching out. I'm currently catching up with
> quite a big patch/bug backlog after being on holiday for
> 2 weeks. I'll get back to you on this, but please give
> me some time.
>=20
> If you have not heard back from me in 2 weeks, feel free
> to ping me about this.
>=20

I would be happy to get your opinion if you find some time.=20

In the meantime I have tested it successfully with more=20
different laptop models. It seems to work on all the expected=20
models and does not work on other models as expected - just=20
like the Windows tools.=20
Moreover, it will probably get patched into the Nobara kernel,=20
a Fedora based distro for gaming.

Best regards,

John Martens
