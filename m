Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27009621205
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Nov 2022 14:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234327AbiKHNKz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 8 Nov 2022 08:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbiKHNKy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2022 08:10:54 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1338F1FF97
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Nov 2022 05:10:53 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id x21so9039463qkj.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Nov 2022 05:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=NaUdmeynLzicbTCbUHL/fVRVkfgDwybW1Mo5D7cObL6OtqwAqoIOQuPiA6H9nRhnMm
         kIAQURF1hTMOByVzpVQb2pyT9jQQARxppXGmi/jpL4EPBJaOrOg0DZ8rhXTGOZ+Ec26Y
         BdqvRTH7ROsALGcSewuLx2bxcA7K60sZN/spcdi8MVbJg0JecI2M6DihbQ1WbSIpkOb/
         keNh2HbeVbzPIJWAHqiNMmiqoQVFvMccgwzEO015nPuFPhrXwTgzGMpQ/9NA87YLZYp9
         qV9kXTHIkW8viHjIQlZV5eJGRChaOShcc4HzDq+dwTgh3ufPIc6qykU6TfsCfOJN7pxL
         mqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=pou4rYfsmeZiyqR6KI02nLGvS5LTlcn8BRDeTZtmqlCsZYS+8h8yXfKZeiImZFqx/R
         xFpukzYaazPt8tRYTPT/h2RQRAdcCm//Ep5orfBPLb+KvggxgJr1ETk/3BVouYFaq99G
         PaBKTF5N/uHmxyi7cjdH1ForGfO9Ksp7bUF0Sl2KkUuX3ZAN0OV0kZgBcFmniv513z5R
         Mmd9CON0/P5c6K40cNlQC8S5nNdj9V9NTuYNSZMNRyv31pfAT9z7pif3hj9/qHYMeYFf
         +pu/loEMMRw/Okd9ktBIPWvV8C72nEU3rRDkcG9FGeQ8/mBysNPweHXPJGVDazjfcx2z
         Aiuw==
X-Gm-Message-State: ACrzQf27BWN03f6AYeAJ9Hi1uKu6hMmvTnu+Lo4jK/HFCDM0rTmsfK3E
        ERmQe/ay2/5RYqBthpdpymaSbO/zBh4Wbfy055Y=
X-Google-Smtp-Source: AMsMyM7Yh7xRLewWzHEQsn4ggD+AS9BGXBVj2JT8I32jKyRBU4jp5TjVyYMPluNW4V7/RmJgRIdwZUx7DxevRCCeGTI=
X-Received: by 2002:ae9:e90e:0:b0:6fa:12aa:9377 with SMTP id
 x14-20020ae9e90e000000b006fa12aa9377mr39120523qkf.170.1667913051929; Tue, 08
 Nov 2022 05:10:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad4:5cc5:0:0:0:0:0 with HTTP; Tue, 8 Nov 2022 05:10:51 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli1001@gmail.com>
Date:   Tue, 8 Nov 2022 13:10:51 +0000
Message-ID: <CA+f86QkPC_ZNUD5ixHLr=dEPFQWtjSt+ckp=xtGFhXxTC4G1-Q@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:734 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4967]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli1001[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli1001[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
