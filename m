Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7887358E255
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Aug 2022 00:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiHIWFB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 9 Aug 2022 18:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiHIWEd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Aug 2022 18:04:33 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A00C2616
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Aug 2022 15:04:32 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r69so6069847pgr.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Aug 2022 15:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=GI1h58u9NHz7rI/vIwOU5DkUcoHPmL+b4tk5i/xxv5Y=;
        b=O4ExYwVsSy3Dl6++O1+MqdMH/+ysz4a4MffYbcjSWfxELFG16SlheHZsthOt/pYAr3
         JwEDURhXt/RlTHKES3xstZn/uNSVYTSkXgNo/0xTWrSe1NuvF4b7A3QQCVg4aQZxZnIh
         J5R8wp3sZ55Jm24H26mIIEczq6olCZynaXQYFwg8vDs5w7v5i3C4OZQULAvb4I3tBbNs
         jnOOUsx1sMNPnXAUkXJRgZdaURNxIc78kMKe6Sd5aCYlY+6w/obg6eBqmWj9gIv93gb4
         PI8uVhRs0Z59yI2NPATiOaZv+wh36lb6qNS/N8IPHbCl+EzTio1hvdTsx1w/uvgRCI3Y
         bW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=GI1h58u9NHz7rI/vIwOU5DkUcoHPmL+b4tk5i/xxv5Y=;
        b=MbF7xgxcEN3hLrT4OXj2iZ+D+0z2/eQMCndejSvJ2CmMhj7O9mbNZLm7ChnDKRdiAX
         i+rLHFCSW59lnK+oaUgx43RhMG3jqSWMJWJPMPcX0zkpZ8vKtdbX/2zEPvDas1OeKugt
         a1oSnYTLPOh86Jz32aa9ZrLJ6p+ZlsOl5nQxE7c0vgUAW35bazsTPKwOpBwMbbhuDmam
         v0/Q0EdHHn5QCEr8DaXWvJNUlAqU7zxiigLvq2k6YXhAyoKE8y9RpngA5U7H8zl7gH5O
         I/89cTcImbG6ytdB7ogPj8ZcgFTlRT6z3uOIdb/cjm8Qi6AmbYcPkiXnpoBRwSCJbWHr
         Vn8A==
X-Gm-Message-State: ACgBeo1/nQfjNVt8y/47hn8eAtDA+JKJvTvPX5IGHX2MxsgTRHTWtkKi
        XcsgRp5EF77em3e0y6yziurSPTXi9bS0O0mc70Y=
X-Google-Smtp-Source: AA6agR7ljSmLQdIPLnpLEFHV5M4MnDtHaB9QnINAt9T5hd3d/ko7Glaa4z9+odUhRh5UFBvGU+uBITz5lAO0hi5KT2M=
X-Received: by 2002:a63:491f:0:b0:41d:89d5:b3e7 with SMTP id
 w31-20020a63491f000000b0041d89d5b3e7mr8864257pga.18.1660082671489; Tue, 09
 Aug 2022 15:04:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:e8a6:b0:2d4:fb1c:cc5e with HTTP; Tue, 9 Aug 2022
 15:04:30 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Dr. Ali Moses" <alimoses07@gmail.com>
Date:   Tue, 9 Aug 2022 15:04:30 -0700
Message-ID: <CADWzZe6=o9cjTsyf=pPKYZHTX=2zM3dFjJDVCCyhcd2w1e63nA@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:52d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [alimoses07[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [alimoses07[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
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
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

My regards,
Dr. Ali Moses..

Sincerely,
Prof. Chin Guang
