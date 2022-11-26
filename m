Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81DAA6395AB
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Nov 2022 12:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiKZLPJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 26 Nov 2022 06:15:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiKZLPJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Nov 2022 06:15:09 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97491B1DA
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Nov 2022 03:15:08 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id d123so4548753iof.7
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Nov 2022 03:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqOZv15Yf4gVOmWzHI0J1v/xb5Kltp8OETWX+cvk8Ps=;
        b=S0z0Tin6dSoU8ewdjuYLZeo4SRoHx9I/9M24ao2fXU/sMb8S+Xg/lGdHixDm+QMowL
         XKF0kF2JldKd/nBA8pna4ODHSCx8Zg8y8YkXybP+sOW4lqBbCbSqkVYXqkgcMoEu+VCz
         kS5BX4+sjBUvWryVhN0n7P2D9WuI/S3b6q3DkMx/c9NUXs4um1pWB6EIiR3aTQn2GZq8
         3N3yf5i4chy9diT3bdBoJcLUS+SMKM4T5Cav5GR3HD3DLlHBxG7dMf4++TQvl54plVju
         jZFhTBDK8CzrKY2Zy/GgBr4GuyaDJClZhukB/RxOes4L/T6I4CBWDzntIeEQxT4tjrJd
         lAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqOZv15Yf4gVOmWzHI0J1v/xb5Kltp8OETWX+cvk8Ps=;
        b=mOK2dEU/3OWnKaYp9EmoiOaD6SX9V8aReQWQGXor68bi+B/C3MGMVN63oXLLdez856
         NzEGzF1aV8J4b9/VhdJsOVVAXPxQTYA0oMBK029qtvTuSErVXIFH6mTWtWlhTISLLP8u
         ABsjIqZVMLTjoy4LOo3r0o15G/tbyuaWLWMn92uryflyeePeck41eW44TgPw/EX8u5yK
         +Ia7wxGfDtKxqstjKHgP01napiUh3xryXXbazWzbAQWxHa80WviVqc66xE/wtYQ/kdMH
         tLh9os4vuYg04zHYfelPrh9IGp/Dg4WBXSxDfF7JTg44QoY4S8e4V16eL+4eM1yOPmVg
         wr+A==
X-Gm-Message-State: ANoB5plckaQRmU5lTC0psFXcD731rYJS3i5kFcdaXxJpMjpppf/r26aU
        /CItNtEfKgAN/aO2YHdZWw2QXs2S4fCFPSnlAWw=
X-Google-Smtp-Source: AA0mqf5wacHfyt1HK4LdZXAvGcNuxbfjROUzek6hWx+Lb/ZMENNOUb1f1R/zL/OAfwkRMjbiu/mcT2B3HIsiZpumxIM=
X-Received: by 2002:a02:c918:0:b0:376:2324:bfe1 with SMTP id
 t24-20020a02c918000000b003762324bfe1mr19980989jao.189.1669461308225; Sat, 26
 Nov 2022 03:15:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:ce83:0:b0:375:f2e:e025 with HTTP; Sat, 26 Nov 2022
 03:15:07 -0800 (PST)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <regionalmanager.nina02@gmail.com>
Date:   Sat, 26 Nov 2022 11:15:07 +0000
Message-ID: <CAE4etd6=T1U1caiLkYLgEbenZyQ6QUfCbk6qA_Gjj_R6MnmQMQ@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs.Nina coulibaly
