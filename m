Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541614AB6C3
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Feb 2022 09:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235093AbiBGIfH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Feb 2022 03:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241567AbiBGIZN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Feb 2022 03:25:13 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3F5C043181
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Feb 2022 00:25:12 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id z15so7321482vkp.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Feb 2022 00:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=uxF4C70BGh1p4gymtTkbdQp4WM0vS7/g8ye4ukOpm1Y=;
        b=KrMnEYZws/KVtiTXCjqOY7tN1qLvCwz5zx5V9/v6GCOowyY9Rt2CWNKekJ0+jbSkOZ
         CzuPcQ0k3m1iAdhhQwG3fcn1M6Ti1lpT7wC8z8niUVp4jyIFGlwuf30m3FR2wETjFWZh
         419P/UgS5lZYMB3okCYsddTaH1Humi4BznWnPTIcipHaCn4Md2vTD3AXvdljKf72Z/N3
         g43eAMcRPiP9Hyp9VTu0ApibDieMBsYwb/TwZKmYCn6bYxx/G3YfYcNNMyD+iQ3F0FSX
         6ib7xtHzDKJKiY8txncPGuVsputv3/Ul9Qb7Z1jsEXugYkNs7lavdA3al5OFXAbkD5mU
         Et4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=uxF4C70BGh1p4gymtTkbdQp4WM0vS7/g8ye4ukOpm1Y=;
        b=mL+72rBU6p0usTi7aQ9VhKjxfhUs5anmIhFXFLGKWl/85ptXfQSZ2Zul8bg3H6nlmF
         odx1zVXNUHQJWI/I02yIlF2D2SRIgtTybsLfcLO4Cjg8xf+sWKQ+EVG14AXwvwqODrwz
         QuUcxWq5wG49HBVr7ZVjjIaYiZr1OZicF1fnAEfj7y9JK5+mBerDdCl21QFUK2y3TF71
         AkLXTs4yhdNam1HiNyCBOFL8sPZ/Xgi6BoVlJ9rsgnx2tJY9M7Q823++z28Ptue7Z8qn
         koDH/whMgHmV4LyM2o+Eq4gJPPxyArGr9kS2vpYAy7yVtDMSTEh/eOWAnLBA8hStCd8d
         9CjA==
X-Gm-Message-State: AOAM533fVn57C5Jafyr9/X8w+PZBK85zsG8OCCeOFj1kk6gDUnAzox0E
        IsR81oNknurtctsuNvVqYn0hUh8+3PUcAWvVBXs=
X-Google-Smtp-Source: ABdhPJxm+3Ox/qoeB+47n9zyRstraLin60mVYZjIYeBvc4iHYae6sw0xtUMYBaQcU13sVMBcHnUDkSkOL9xCkXPkaD0=
X-Received: by 2002:a1f:ad89:: with SMTP id w131mr4704501vke.17.1644222311482;
 Mon, 07 Feb 2022 00:25:11 -0800 (PST)
MIME-Version: 1.0
Sender: jubrilubaro11@gmail.com
Received: by 2002:a59:b78f:0:b0:28c:768e:f5a7 with HTTP; Mon, 7 Feb 2022
 00:25:11 -0800 (PST)
From:   Miss Qing Yu <qing9560yu@gmail.com>
Date:   Mon, 7 Feb 2022 08:25:11 +0000
X-Google-Sender-Auth: 9VmLz5oVazlyE5yhk28dmf_N7RU
Message-ID: <CA+QoaZcnoZbGiSaFeq5C0GtzYhTf7=aydeSsog1Aq2tDONdMXA@mail.gmail.com>
Subject: Hello Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I am Mrs Yu. Ging Yunnan, and i have Covid-19 and the doctor said I
will not survive it because all vaccines has been given to me but to
no avian, am a China

woman but I base here in France because am married here and I have no
child for my late husband and now am a widow.

My reason of communicating you is that i have $9.2million USD which
was deposited in BNP Paribas Bank here in France by my late husband
which am the next of

kin to and I want you to stand as the beneficiary for the claim now
that am about to end my race according to my doctor.

I will want you to use the fund to build an orphanage home in my name
there in your country, please kindly reply to this message urgently if
willing to handle this project.

God bless you and i wait your swift response asap.

Yours fairly friend,

Mrs Yu. Ging Yunnan.
