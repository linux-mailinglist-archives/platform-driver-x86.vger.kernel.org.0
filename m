Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FCC540AC7
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 Jun 2022 20:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350139AbiFGSXu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 7 Jun 2022 14:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352814AbiFGSVS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 14:21:18 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721FBBDA23
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 10:54:07 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 129so16571887pgc.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=E2AIxNklHpAkEmvdFb/6QmrZopBm26DEbGRIJwurv7Y=;
        b=S9jxFSvFHMbjxSTRxo6LlsmArcwHDOESa8yH5xEscCiWf4/s0ou5jZeUr/QivWWfvI
         zixKxL+xRb1gFg8V+tFI98OpxDnkWG8CigUtmkGI1a4TQzo4hn2/eRBL8sARtfrkDmRJ
         Jq0vMzPFauyBXzx08mY5iFVjC6UG0nvZUXeNMzksTAO4dN1IUDqWrSZRNzlUaqmotTBD
         iJN99h/+uPjXwbklEfGZUrIXUBLzTTfe5AJFv8+NiOvLk86Cf4q2RZbBei670eHNA1Ck
         QBRec2esb/FP74CsGFpF3Mf9ss8O6Q1ynQYgrEJyKR5EDSFMtcMa4gwcobNllnBWEJra
         DsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=E2AIxNklHpAkEmvdFb/6QmrZopBm26DEbGRIJwurv7Y=;
        b=3N56wEwz2+X6gt0cPeNHg8KwzJPoz+ICqHC9ChBNQOo5vXAm0kqjRfQIaN4FS0YOkJ
         R/Iu3rEeCGoTip2Ml255uE+jd72S+xgk/53TCK5YhIbtfcX5QK5ScCVpwG6JP6yWXSAo
         QU3tIIyF/2w3Guzh608ZaT6i0Fa+HA7m1niicuAGfKTNyCwxqAuCrfohRUMtjwoyZqR9
         hJ3pUoadBkPx1MGNNz+6flKAQGV04Xyb+ZLCjjya1wfe3Idl9kzO0V3KWPkPc0vxDvku
         8l1BJQx/BfYEa72AktdYQhw5OAIvyVn7UPgFgzaE/P/Xk1kS6S2bknHKzV31RP4BdKmP
         y3dA==
X-Gm-Message-State: AOAM532roVKlxkYBScDX3T9WwKx3Elt1kNaQvDwrSRIOWkdwn/07UgSK
        jLFIGRfubPS27kuOuewTu+j//NQ5G8hbb3+Gr2Q=
X-Google-Smtp-Source: ABdhPJyx8nrjZq0Y5nntoHOaBeWyKsB9fZGamU2s+GAHR1rvdoBW8lc9X7S1YIZb73Z6Fuo3WEzs/AUmH6hFRNQ9/Y8=
X-Received: by 2002:a63:5b18:0:b0:3fc:9921:f8b3 with SMTP id
 p24-20020a635b18000000b003fc9921f8b3mr26226193pgb.52.1654624439345; Tue, 07
 Jun 2022 10:53:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:1342:b0:58:4245:bc22 with HTTP; Tue, 7 Jun 2022
 10:53:58 -0700 (PDT)
Reply-To: suzara.wans2021@gmail.com
From:   Mrs Suzara Maling Wan <suzara.wankind@gmail.com>
Date:   Tue, 7 Jun 2022 10:53:58 -0700
Message-ID: <CAJsbueBMzdfmuz_pXZ5pUPosGrfcpGy5o-mmcuAg+yd7Sq2jjg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I am Mrs Suzara Maling Wan from (Philippine) but based in West
AfricaCountry since eight years as a business woman dealing with gold
exportation, I have a dream and desire of building an orphanage home
in your country, and i have a deposit fund to the project, but
presently my health condition we not allow me to carry out the project
my self, now my doctor has already told me that I have just few period
of time to leave because of my ovarian cancer disease, can you help
fulfill this project.

If you have the mind to help me in this project, contact me privet
email address  for more details on the way forward

With kind Regards,
Mrs Suzara Maling Wan
