Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17DD693206
	for <lists+platform-driver-x86@lfdr.de>; Sat, 11 Feb 2023 16:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjBKPnG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 11 Feb 2023 10:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKPnF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Feb 2023 10:43:05 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11693274AC
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Feb 2023 07:43:04 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id h16so8003270wrz.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Feb 2023 07:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=px4wtYVhn7OFX3ytPNluHmTb8EkvlOzVGA1H/53YB7mz9tc0FvlkQUlYwfqVMDNSgQ
         ODxy/zbtKY1MCk1Bd6NdZAQrpTGNL1aRMFU+fM81JBa2C8gOwCq3SmfdGYOTtxKuzsgs
         oHNrrBUa+teDZlwUZu8pqKaFuK2HnQzuv9zwF9+8fTIzORChhwRKotC7gOuTF5wNG+9T
         3Mj4HGKb5gMcmxDWs6Sp+jZI4jDN3WpaS+R0eIdxYcH95o6JuD/VtAlqFX6A/WJ5OSxh
         O0MRQRhmRYszNSWhocwo2nUgztC2FGqGX2V9C5ZBUjHZoB6wLboeLauibWcsaZXFMY4h
         NaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=vMdXDXC9Ikl/KWP7RKHGtiN2R7nbAtDXoUcL1yCOJllV1UI7iVzWWiTGO1FLhgZH7d
         rxIIz6anKNoG+3PrY0nF5ojw4iWE15EQ5yE0dEXDCYWtvzD7svLFP0lNKRRGD2hL/C4V
         i4LTZyuhyIZqUCHmNGQFZCwzf5H1nL4rnWeye4akTw/qsJ9ErYCpgt39PE5KCI5CQojy
         qFXTLqY/Ll6OPfRI1OlXTEFfCGBd3wk2W1qXGlhZgqR+BCYbPRHJHCuenrSdDDViCDJZ
         majsIcPhZ2HNAQ9Jt6KORt8U0sIc6UNhVw/qszsxCo4CMg1Ri/pd54GknxcdlwozM0Tv
         Qriw==
X-Gm-Message-State: AO0yUKWhpQ8ZH6kFAXS2Mf5O6Jvk3ax8mv9hGFfslA0v6FTKlGjdd2EN
        M+s6tFXhpYepeIHfTtJ64NjdQfRP6xnuFsQakog=
X-Google-Smtp-Source: AK7set/v/VjOGmgEKn08KqNhRlJd1s/Gpb/Q1PJCGSc8Luo2u9vNp8TcUiQR4DQnJ79fgFr0U4Rx2TK9QnBxrW1AOPI=
X-Received: by 2002:a5d:44c4:0:b0:2c3:e060:f178 with SMTP id
 z4-20020a5d44c4000000b002c3e060f178mr482305wrr.474.1676130182429; Sat, 11 Feb
 2023 07:43:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6020:90b8:b0:25e:1497:642b with HTTP; Sat, 11 Feb 2023
 07:43:01 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <harikunda7@gmail.com>
Date:   Sat, 11 Feb 2023 07:43:01 -0800
Message-ID: <CALNCe2Qw2eOFLppLqeKX56g_uL55QFYg4w+iqL0aAUs=p8-r1w@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:42b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [harikunda7[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [harikunda7[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
