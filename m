Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4765B6DF22A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Apr 2023 12:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjDLKqg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Apr 2023 06:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjDLKqR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 06:46:17 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5555A6A76
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 03:46:16 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id s2so7146036wra.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 03:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681296375; x=1683888375;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b9hSn8ZWObn0FlHkk+rwYaVaufISYusIZ7dspuZnGU=;
        b=nE1DvpzE0K/YsSTy2SqqZca4NHdoo0RGWl4vyBh8L/Oj3zqTr3kzK++nuu/a/XxNXP
         xlvRU/C0T6iFXi166unKDTqgUltTL71iHfD2kZxgD6upnqT8CCTUbh5EPo0mTWyxlquf
         CkZWaLQcuORqPeYLMHHxRvOg4b51ZG0GUff0tCN6t81DXzCirM9ma4FjqIYuQMUfMI3o
         HQq9Dp0cYF8FJp0v7gPyEjsMOzdTIDn4Dj6PI3RIjn0gXRCw/3uZA/3qgqVX+svPyOPk
         K5lo1nyQitlsCE2MdQIWlkQ0vb+oZcmJtuMpjNi+Yp8WhCZ9jlf3HSq+Kc2wgPf9UeWJ
         uyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681296375; x=1683888375;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/b9hSn8ZWObn0FlHkk+rwYaVaufISYusIZ7dspuZnGU=;
        b=c4QR5G3naKNzGvonD6BoOxAYHRm+uKRL/dxwRv0iWK9U/mEeFnBJvzb1ATz71KLUS5
         rS51/wHLZkhYLddVVtHm5KrgHZP3yvWyJg7vDMJK1wJ1s4JCnu9F5jWelGxJ13zrnoDq
         az5UnY8SQyFOW4TUfcUh1tBF0IisARa1MZFg+bgOB60ZZ9chv+LlEnH1dH349rPRTiGa
         GFU2KjMu7wgaqNZotYqHg9SHKWXsQ497c/cz7k4f1FsrLH0NCCh68OZ4IeDLagn8NBdz
         wTKCMplkWZ6mFgUzcHbWIbBcOAkm6A3vUCrIEVlgE7jnM0iXzshM+C5gzxKnqZNZf3Lw
         8E2Q==
X-Gm-Message-State: AAQBX9ccMDlnnJ3nOLbscOYz0gIbTpfovhwNs0C0G+41/KVsLIlPKTrK
        OYF/fY19Irs+OIX9HDQP06dQqOZ4toDoMzMHlww=
X-Google-Smtp-Source: AKy350ZxMFEPKn1cMQlvz8Yr9RdKJ/Jd3QXO94zGB63koc1Kh4jUerZj3Dk9fgyHkCD9rmPrb/izqHx3A3GxYwTE1e8=
X-Received: by 2002:a5d:4241:0:b0:2ce:a3a6:79f6 with SMTP id
 s1-20020a5d4241000000b002cea3a679f6mr1303384wrr.4.1681296374724; Wed, 12 Apr
 2023 03:46:14 -0700 (PDT)
MIME-Version: 1.0
Sender: abdoukerims@gmail.com
Received: by 2002:adf:e352:0:b0:2ce:9fd8:fd0a with HTTP; Wed, 12 Apr 2023
 03:46:14 -0700 (PDT)
From:   Kayla Manthey <sergeantkayllamanthey@gmail.com>
Date:   Wed, 12 Apr 2023 10:46:14 +0000
X-Google-Sender-Auth: 2mSqUpXyv_7tHWtSBCUPvMEqoZ4
Message-ID: <CANEDhdznNXeq7SjPeOhCbGENKEMEDy-8Faex7f=NKSTyOd0XJA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello!, Please did you get the previous message? thank you
