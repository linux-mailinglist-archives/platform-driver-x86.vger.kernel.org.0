Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7134F5E698A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 22 Sep 2022 19:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbiIVRWO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 22 Sep 2022 13:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbiIVRWN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 13:22:13 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB90101972
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 10:22:12 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id j16so15834166lfg.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FHk82wnT5upmAL9U2Ppt51tTSNetmvVdtzhUocqSk6g=;
        b=oaNwr90OubMAUZ9IGhMzOJJPfXMcc6lB/Owc4t6K4yvx+artv8Ug2V2Fjuw3AvJqoz
         LUnPsIe6RR/QZTY9YC7FQd3t0M4c4JdVJX3Y5F+maidTxaCR40MY87ZQRK3M8ISmlI9K
         L90fhAKzlrzzyKGqlplHtupV+fwvwHlY1rSBveoNIzCGf+7sK1N1cPPrfZfC0k1hJTQQ
         6CfbMyblEgN7+cL8A+9rhJpcfw6pnMBopYraWyh6bFH5V0Wq3TyKrLPQ3u2ye8+xEvhZ
         kdlk28dUuzrHlnmrE0wCi05c8zO+tBTXujKoXbC+RG+DfBY5669DrzyOZLPFmtaLOFT2
         iEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FHk82wnT5upmAL9U2Ppt51tTSNetmvVdtzhUocqSk6g=;
        b=1FYslgLCiMOTDmfMuEaLMMwRO8R44zMu/R1+DiWeN+nhW1K32nksz56Hq0kQFuvxHd
         KDU6iDACYIjvvnmkA6BNfzMhuTu71a18s8PeIHkGzFFWAC/sFmafbbR+RoUG4dBmOrkC
         d698TYBjnPxAKJDG1pWJm62c9Hdce/7lbk4naeEMTJpHsTUVVpR6VTEbuddhDJYKUmbC
         qYWx1g1Ta19ibClVew4RYmpdQlSS+r1+4Bgh/n+4FXKwJRv3hbL7kQQkRVBulUESPH05
         TNkEvKVOAAmIyBRWIsaVYThfK2M0aF6xGQQn/e1rAJ+o40rCgzzWcmEAGLAdALCIXHTO
         WMYg==
X-Gm-Message-State: ACrzQf3S8weWnGeEyXk8rklZAW7XgbWFPA7ha8VtI7vK5if6i+aRR2S8
        nASJsDO1WTXKGlUpAY+R/CeIbNfd5ZxYkRFJiiQ=
X-Google-Smtp-Source: AMsMyM7m9u6eHdJwiM3j8M4nOdT9/jHcc09GE9nWWP0abBWROkzgVf2Ao6ZfrAJs10n5BIT2bQwxxoal7oirYavF5Ls=
X-Received: by 2002:a05:6512:1050:b0:499:f8f4:992e with SMTP id
 c16-20020a056512105000b00499f8f4992emr1529729lfb.424.1663867331152; Thu, 22
 Sep 2022 10:22:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:58b:0:0:0:0:0 with HTTP; Thu, 22 Sep 2022 10:22:10 -0700 (PDT)
Reply-To: sgtkaylam28@gmail.com
From:   SgtKayla Manthey <erikacontton7@gmail.com>
Date:   Thu, 22 Sep 2022 17:22:10 +0000
Message-ID: <CAAr1escu_oSQ9kZDVCeBryKmfdGxGxcaaRBXTi9YcLAo-uCOCQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:132 listed in]
        [list.dnswl.org]
        *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9732]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylam28[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [erikacontton7[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [erikacontton7[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello,
please did you receive my previous message?
write me back.
