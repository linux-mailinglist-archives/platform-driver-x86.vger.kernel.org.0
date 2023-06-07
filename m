Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 378D67269D9
	for <lists+platform-driver-x86@lfdr.de>; Wed,  7 Jun 2023 21:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjFGTcl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 7 Jun 2023 15:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjFGTck (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2023 15:32:40 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C690210D
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jun 2023 12:32:31 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-75e1ec47c3fso330357485a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Jun 2023 12:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686166350; x=1688758350;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoJWmXqTHgXnCqx+hm7z9QQ2D6T5WvP//oIy5YAj96k=;
        b=oYhopo7N/GVGU4WPKWbKWNfmyoeqB1O6K0fnc+nm0tym+8ySEYyTpFqSCa6JDO67j0
         zfxtsBL48NcSOYYcYlsLl+/cYXxA0tU6AOvbLefCoQCc64DmMcJhUT7AgIc07ldpC0mm
         9rMxdQOkfm3+JjJ48yOg3JmIgcaLKKFApgZslasqLTrXV89g2/jCwljvJ6gkV3E9kZgp
         YryfeI5FOrvgc/wqeVfhN4uglyq6DnsW553bNlsdeu2XKzOlfX6UeGRYCLq2VLwwM8PF
         +x7hXEZVNvQ/p19pFIBo8L8JUVyyS08Rqp5P7JZJye7+Bns3ZxsG9bQ1KwUMXLGFjohH
         JIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686166350; x=1688758350;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoJWmXqTHgXnCqx+hm7z9QQ2D6T5WvP//oIy5YAj96k=;
        b=DaTiC8GW68wZv2BJSCB9ODcHWxWAQ2R833k9aYaawBTY7IgjYmcXi6JAyrKGGHFhIC
         NBWLbUDHym99eUxqZG4BeWPVxsNwKZUMcbC5p5BjMXFpJ64SmcGxjzRtRtFmI6/y9qLO
         Qbd07A/CeSrXqMTiqhIAL+Lak+a+36dgc3jCHLGDOc0KT+186ER5bgPBBmIbfqa33Cur
         I6E3s2V/0MuRlZYrtf6Im4ySh0V3VV+N92fD5ClP6UpwRRBR5fDRXPPIEULvBXMDfsT1
         f+6T6KbgDC3iAYrG9ReoPl87F3CO1TmX93UriPUH1K8bBZMvj8ZfuYN4umz/FZjKrXRi
         fXwQ==
X-Gm-Message-State: AC+VfDzMy60bPbBSTBZzBh+y/WgkJWD3O0HbmpsMRG46nB2bBziVZbVD
        WFWfXZDSXzixAWKyDwptNMHJ47GuNbNA4Tnnukw=
X-Google-Smtp-Source: ACHHUZ5qzJkyAOogLo52th6cK+dAd+jEZ//+49YpqWNsMpeQgFrRJKMOF0sMlWcKMJI1zztkBw9ZhtZFN69KDwAG+2I=
X-Received: by 2002:a1f:cb05:0:b0:464:cf55:de5d with SMTP id
 b5-20020a1fcb05000000b00464cf55de5dmr1709976vkg.13.1686166350355; Wed, 07 Jun
 2023 12:32:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:a5ce:0:b0:3da:8482:985a with HTTP; Wed, 7 Jun 2023
 12:32:29 -0700 (PDT)
Reply-To: david.harden.chantal08@gmail.com
From:   "david.harden.chantal08" <sanagoaoua@gmail.com>
Date:   Wed, 7 Jun 2023 19:32:29 +0000
Message-ID: <CALDXXuxed4DPBAFS+ySNqwoCgCshZ-p6AZ7G4xSsudPHf+086g@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,HK_SCAM,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:72c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 HK_RANDOM_FROM From username looks random
        *  0.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [sanagoaoua[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [david.harden.chantal08[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 HK_SCAM No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.2 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SANTANDER BANK COMPENSATION UNIT, IN AFFILIATION WITH THE UNITED
NATION: Your compensation fund of 5.2 million euro. is ready for
payment. contact me for more details.

thanks
