Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960EB5BBC44
	for <lists+platform-driver-x86@lfdr.de>; Sun, 18 Sep 2022 09:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiIRHQe (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 18 Sep 2022 03:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiIRHQe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Sep 2022 03:16:34 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0D3140E1
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Sep 2022 00:16:33 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-3452214cec6so306656647b3.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Sep 2022 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=Mu8Fn4C0YnsMlj+J4NrMcn8c1yCIW1Q32SMhc1R9Hp3JbedOK8uhvtvFmyaiYqsJbD
         tWoN2/oHGGY6tE9qf/HoanJLXCxXnmFFYOS2znZjWzGpP6bguTOFnO3i1F0HlszX4oyh
         79AqpgF7L0y8jGEU632oA+FC6qhqeN2bZGT525xVbGSUdt+zyX8UnTP0jTogbaUaD2cl
         kH0rUXLj6i4FJ3zRbH0sbC+fEB2vcV4ohWr5uT7TM05774GTetFsRRWpfNE52ZgImMN6
         ZZlV6Eunyq4OqvPsvMwV6xELfZbHqmSq/zkuLCSzVBnp3sVxHvZ0x97f/SDHUQ1ojM4R
         iwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=X3SsTSB8LM+W7kjQa49cQNVrZeFEFKRD/EC3kinqAtN/vy6NeNpr64qJfxhp0xtcBl
         ENA0JKetx9EcUSbfJvWncAoF6N8qOVUhiCginbtdEUP3s/EVqNyeEEFLxid4jrkAL89m
         4QpEdmQjU/y4lXLcbUCRrDO9xAGvoi1t1wugoBJNnj9NUoRr3mKePtQgO/GO/1evAiV9
         TURx7TGqIrmroBKI1+TRYGFJyjuP3wOJ3sqmO0QkKwjRuJ5vAkUK6VyC0aemWnRp1zu3
         965Omi7l/hyqsgZ420KWosWW+sU8WuSFwOxj1K07eOc92QGaCRlW5kDpwQweW86i89As
         Ot6w==
X-Gm-Message-State: ACrzQf3WYYe6cUAOMwmzqU3BtSTifCsh+o1pc73gNfGd3+ZOmbTfQI9B
        uvpgoj5jm3n7w96i4n4qsAgQ7AwU3HPm9TIRpKI=
X-Google-Smtp-Source: AMsMyM630npuxh3uD/y5OJ0mP9tRbc5nf583vg92Liwx+QDiWddCX1YtgjmK944DwknsDruqgt+DaVcpxq6khGOg+hQ=
X-Received: by 2002:a0d:d881:0:b0:349:241c:b164 with SMTP id
 a123-20020a0dd881000000b00349241cb164mr10892763ywe.372.1663485392800; Sun, 18
 Sep 2022 00:16:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:f87:0:0:0:0:0 with HTTP; Sun, 18 Sep 2022 00:16:32 -0700 (PDT)
Reply-To: maryalbertt00045@gmail.com
From:   Mary Albert <ourogounimouhamed@gmail.com>
Date:   Sun, 18 Sep 2022 08:16:32 +0100
Message-ID: <CAHwLVq6V36bkONyvwWM5T8Wr-P67YXYtuPbkJe5MufJWM2q6YQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1129 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4970]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ourogounimouhamed[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [maryalbertt00045[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
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
