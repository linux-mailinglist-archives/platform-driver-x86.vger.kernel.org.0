Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9B464C865
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Dec 2022 12:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238018AbiLNLuN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 14 Dec 2022 06:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238006AbiLNLuM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Dec 2022 06:50:12 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83AF2F4
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Dec 2022 03:50:11 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id i2so17593749vsc.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Dec 2022 03:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ngJ6kQtmZQvtx47n4DBmEi5drYo1sfiuiMC0behxSp0=;
        b=mT2j6FZVs9cTC9nWnexQtF7KLyGlUlJgnzva7YnYqFaQ/dbf4+Nk0JV9JzARasfAw2
         AxywHf5mtGFbiGv8A6ZI8uCkH5Uhk3IGHQ0vvMdfem39FnJoHs6Qdkins3PBs0Ic5Ms8
         6bAtsUsRr50mKRS7jSngEwN0MWyyfxCbirJPBhbgEPBes/6Dya/+yTX6yy6NbVweXUNx
         E0sLEKWYUihIf4QeG3ALXXZivWFrI4l2rHwMmvkIFq9PO7zJ/1LFqxjXtvgd0YZUBI7H
         o012zC3U0l7d30JxRGeRnDWzekdxd20El2VBBAN3XQnrsfd5DMPCxZ7z7M9HnKG1Ahbm
         qJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngJ6kQtmZQvtx47n4DBmEi5drYo1sfiuiMC0behxSp0=;
        b=DwfwQER1IwYkhi9vSgvV9VZozV9JojJxgLD/iHdDvC+ejQNTPN3GcqrzzA1RO7TVBH
         3RKzaM5YKgs+uViHWNmIWGD1BY/B1DrVdTB8BR+wAKxW4F8unwEB+YVfArOtYpabyocg
         MbkmyECG8uYoz+e+0y57kbKktVFQuT/Bze//WpfL1OA2Z3P6DtB7xQ4ehFveEn3xo6vu
         647w9tEtZFqWL2/cl6yorjznwFPeGEQ7OOHeQZgTCPd1ZEB48cg+qDyNkdw7V6i0LSAm
         jouwPB7dDaqe+xsI2j6sCfwrdl9wScN4LpvBT4zJ7/BX0nnuwbPxC0XxlBxzQcTF4hdj
         bFUA==
X-Gm-Message-State: ANoB5pkf+hcjjjxZMlvasGwTl8Ntgo0wRV0UNjgqSBlGIE1ycmaCL45X
        oOUWTztKo5coCKFXq7WAkr9xnBQpccLGYqaZHR0=
X-Google-Smtp-Source: AA0mqf4TFEtS9fXmNJzwANzbIXyfKSpJC91a1bU5blu2pLNv/FT6KoiHRpYxP10ymLa76wHefvjpofxJadf+Dc/qHkA=
X-Received: by 2002:a67:c40e:0:b0:3b1:4b76:5b44 with SMTP id
 c14-20020a67c40e000000b003b14b765b44mr10662895vsk.53.1671018610583; Wed, 14
 Dec 2022 03:50:10 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d7d0:0:b0:32b:a6dc:5605 with HTTP; Wed, 14 Dec 2022
 03:50:10 -0800 (PST)
Reply-To: michellegoodman035@gmail.com
From:   michelle goodman <goodmanmichelle700@gmail.com>
Date:   Wed, 14 Dec 2022 11:50:10 +0000
Message-ID: <CAL=4yxdGG-=DGkPCb75Lke+hNX9Y2EOkoq8Nincs=HNFubQgEQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

TWVyaGFiYSwgdW1hcsSxbSBtZXNhasSxbcSxIGFsbcSxxZ9zxLFuZMSxci4NCkjEsXpsxLEgeWFu
xLF0bGFyYSBpaHRpeWFjxLFtIHZhcg0KDQpUZcWfZWtrw7xybGVyLg0KTWljaGVsbGUNCg==
