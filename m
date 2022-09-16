Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9692A5BAE40
	for <lists+platform-driver-x86@lfdr.de>; Fri, 16 Sep 2022 15:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbiIPNf3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 16 Sep 2022 09:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbiIPNf0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Sep 2022 09:35:26 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708504A120
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Sep 2022 06:35:25 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n23-20020a17090a091700b00202a51cc78bso19451164pjn.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Sep 2022 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=XBgI6ZlxmVZJbSOGVrVn4ynHthe1TjLbMLt+ayh57JNlHB099nou1IKB9vCUUFQDEx
         k/fD4T8kRegnEhHpLrtEKjPwXlL1sbx/ycvFoIY4apD86k3NoI0AoCCM97tfpqzFfLmc
         GIPOGZVQM5+OJVKphzap/IfpiJln1AmkGDlmhec5EFseeTYXVrPqFlZCLw0omWNze7dT
         hfxVycXEcJNhVl7HZ+ITDWMyQWDUxZ/A5vRZaHbUxVUX2qksXIduCJiPPrzmnGBWqUya
         t050uVC/vabnjK/IdABQgcg7qylpSRoH176zYT/ouCsaV7zC0CY4bGMITzL+7U8LPj9s
         kUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=k6Nybv4qER+VT8zJNrkUUGPodrNp3J9tK+NxuIW7vB1whmYrXo+8CkBbYRruEwKsxQ
         yyvs9LzIPQqQwb1i1lg67/uZaXqvkbL7tYBlLB9FAKHU9W4BMctZdZxbpxsbZKZe3Rze
         wkFmDAP52AbIOJeUhRsVHRtYA9XDNVKak11WJwvNDjtzSn5OC7OX2nj5nGgkkGpM6xDn
         BdUZdzCv3gCAJdaoLUUSSgg46GWzBtsngkOe2CMVlQyntvR2WgX4e5soFbBALzG19Ndi
         SpmQ+WTnqEhA1Hwi7YUOXc53czyK0IFC5UEDwR2EJ+OkqQzn4s+xJDuQLsYV+IS5+B/z
         Lp+w==
X-Gm-Message-State: ACrzQf0h2PSpw+5dzm/gMhHeXkS0MMtCWDwkoYDVngRb1piwt4ByhOJj
        p1Ba3YwMSrpmDeO6JSWj1w5GwLQE2Yl7kOEnojo=
X-Google-Smtp-Source: AMsMyM7a/9Gl0doc8PT0Z+Zg4Xeg5lrFx5rHzKI8eQeU8iCHnIFlNKvH0ZiL10n2KlC3qcaoLXtnIKvEtlUO400Mzjk=
X-Received: by 2002:a17:90b:4c8f:b0:202:bcbb:1984 with SMTP id
 my15-20020a17090b4c8f00b00202bcbb1984mr16081621pjb.64.1663335324869; Fri, 16
 Sep 2022 06:35:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:902:7787:b0:173:104b:45f5 with HTTP; Fri, 16 Sep 2022
 06:35:24 -0700 (PDT)
Reply-To: maryalbertt00045@gmail.com
From:   Mary Albert <edithbrown044@gmail.com>
Date:   Fri, 16 Sep 2022 14:35:24 +0100
Message-ID: <CALdG5eq90Bmc6HmZ=CDk5mBdwNaME=aLeTXc5ch_UHmZz9DLWw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:102d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4866]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [edithbrown044[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [maryalbertt00045[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [edithbrown044[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello,
how are you?
