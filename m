Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 919F656922D
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 Jul 2022 20:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbiGFSuv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 6 Jul 2022 14:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbiGFSuu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jul 2022 14:50:50 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A2725C5B
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Jul 2022 11:50:49 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id ay16so28646786ejb.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jul 2022 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=TlXCz1iFvCs2hnALRZrmgquXWezzzTyEnjk9d7HXxA2LYTdHo2vUR2BURubUo9mcc6
         R1jyPhBOJLhLjmEc1BJ6nYsidyliTDRDOwNXL9p4RVZlFF7ufd78J7kJSbFVe7XSs8Pu
         CQpRIrUqNTiRrlpHRTK4A7Bi5fXsRK1WdXz3wQdsg9Qtb0ktZ4RZfR/xMZCeHbEUAkeO
         jqA1HzVW3PI7rFhSK8NG9WnyeoQ8DRL+YvGe0aajlEVBYLKkhYt6s5kDxP0YvAmYrSeX
         YB0dqd1gWWPbBkmXyv05GZhH1X68xxvj9aBoHx8cEnGJ5ZdFJWAaRSqeDRxJiTs0y3jQ
         m2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=PdNL2flVCRODi6W9RQahXrnIqcqX+ZEGPg/qOXnXJGitzGDsp0shz9ZT/ZbxnktaYG
         VhQ4Jd1n/MpAioZ99hx0ru49Ch0cwSxm5PNeru7I0VcHB+o1d2KVeas8VIQrDjjhrtEC
         kvlS04/FElMZhFr363oS4dqhfbIfdf9ITjGDpEyGBxm/vrlF/yBqNUrRrwSKEozKJ8eK
         WXlcDHoQzqM+uAeJhTPrr/5TZECPQAwVslhQ7Cv1Kb9tWQcqTyqhn6/5pc5lIXcGwnYR
         +0hDHVW4EgYuRoir8NRM3XhQTA3C4DUOFVPnQXlLIHXur8+ymZ/8G0fo/y9Jb2/L/7jR
         3rAg==
X-Gm-Message-State: AJIora8WS3BTzc4JzbZwKSYo5Ih5I9D01LSrDl1FRsadj3nJPt9Q5CpW
        l0GHWH6LQk24kP5oAEW+hZmKHhJQKDm4zbHGCiw=
X-Google-Smtp-Source: AGRyM1sbPYNe/Q+vocK+14iiwOtu3YMW3aypK6BD+h55HuC4eqFzrcW+NoucqrKlQm42UT6lf8DHcQf68z+2Gy3y3PQ=
X-Received: by 2002:a17:907:75cc:b0:726:f11c:4c5c with SMTP id
 jl12-20020a17090775cc00b00726f11c4c5cmr41104458ejc.404.1657133448016; Wed, 06
 Jul 2022 11:50:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:1dc9:b0:6ff:3434:a568 with HTTP; Wed, 6 Jul 2022
 11:50:46 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <marvelouschinaza54@gmail.com>
Date:   Wed, 6 Jul 2022 10:50:46 -0800
Message-ID: <CAE53ddaA+=w8Y0++ZTm3B_yu9H0UmW=DFqGUkgQGMrgqh0Z0jQ@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
