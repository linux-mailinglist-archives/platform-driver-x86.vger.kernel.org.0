Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073A56D27DA
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Mar 2023 20:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjCaSat (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Mar 2023 14:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbjCaSat (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Mar 2023 14:30:49 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2431BF49
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 11:30:48 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id w133so17347769oib.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 11:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680287448;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d893z3BvTWKiVb8OCIsuHGjkrdOBkhU0uQOX5zjpLPs=;
        b=a3fW+k+Qpmwcm3MfDu/ykEQFPn1Bqat1tsneLuC08lis/gDyiFuFqbJtkDzs1Xfbu/
         9Rt7sj7SrxYjJPgX7JOoctJBvKzsV9hTkIQWp1UL1nF9L8bXqp1PMSV1rMFB72sO2qS0
         kwu0DcwAucDddqNKjXSrt3g8O5XeWIQl97v8blga+cSQWrug/pXJYaEupkJjCD8w/+Ee
         4C9fvpUjHtyuO9AoRb6i8ARsThvOGcu3zOxAKkLI6wZv+dBsBZcphOrwbxDGtbAMnMj6
         if3aNu67NRUmiAng/gqZZqu7yTyUMIMivprNZzw1XgJEv60PVLZB1RDg0XgekzT0aqs3
         GEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680287448;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d893z3BvTWKiVb8OCIsuHGjkrdOBkhU0uQOX5zjpLPs=;
        b=65mhZ23GqJ++PH0lGz1MmNEiuaNsTii0eaxMkKE5Hu76mVQCF93YW281Jfobxqeedx
         gf1+oKVZWml6CswWuAC6fkthoMRV6s5tgnMRrkMpDnD6TtDGgWUCufSeuFQcEM3z5oIl
         QSOammK9l9yJrUkcNo0bOUospfSb8JjeGNIqmG2qp0NHcbuoiV2S2yCI7U5xwuG9NxmX
         FN9WCiiHwYEULCHgRNG/kXF2CtVwL3MauNHEexfTNOdZAz/RGY/0NEDRUtDIU61n43TK
         YAn+VvfYkfLMvTQcmK200WdcRdwX8GKlXmbQxqQ1b48l98BZxTTclyIw33n8u/2TNuXW
         ZukQ==
X-Gm-Message-State: AAQBX9fqlTkMGn4b96S6U9LvOZFHbJsxHy6Ax2sTKUKE5p1DGtCzP4fQ
        8Ul/MwhIdAUcLVe+1xz1jiOpYuK2dJXrsxhQxvg=
X-Google-Smtp-Source: AKy350Zs5UNzdOPYMqBf/sbYe7Lsd4KK06uaIzFkHjNRS2UERRsnClnoIWB5lJLFC2SKm/rzeqix5xVqX4LA3z8Qj8w=
X-Received: by 2002:a54:448c:0:b0:389:4e54:79f0 with SMTP id
 v12-20020a54448c000000b003894e5479f0mr2181776oiv.3.1680287446323; Fri, 31 Mar
 2023 11:30:46 -0700 (PDT)
MIME-Version: 1.0
Reply-To: eng.kelly103@gmail.com
Sender: peterfuller301@gmail.com
Received: by 2002:a05:6358:6f8e:b0:104:d450:23ab with HTTP; Fri, 31 Mar 2023
 11:30:45 -0700 (PDT)
From:   "Eng. Kelly Williams" <eng.kelly103@gmail.com>
Date:   Fri, 31 Mar 2023 11:30:45 -0700
X-Google-Sender-Auth: hBtFrtiatORSp3IlEPoN5YvQRcE
Message-ID: <CACzHKndiOQgLZwg+o3MkS9-_Gpg4pavU=f-L7_VArQWwXn4n-g@mail.gmail.com>
Subject: PARTNERSHIP WITH YOU
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,RISK_FREE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PARTNERSHIP WITH YOU


My name is Eng. Kelly Williams I work with Texas oil and gas
Association USA. I need your honest cooperation to partner with me to
invest in your company or in any other viable business opportunity in
your country under mutual interest benefits. Our partnership will be
absolutely risk free, please I will also like to know the laws as it
concerns foreign investors like me.

I look forward to your cordial response.


Best Regards
Eng. Kelly Williams
