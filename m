Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C62D6F247D
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Apr 2023 13:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjD2Lpt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Apr 2023 07:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjD2Lpr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 07:45:47 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6A21BF2
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 04:45:46 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-3f174c4b404so966975e9.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682768745; x=1685360745;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=447DttLGWlnXVhl3+i4qWwJxEj6tFprhGwRHCuyrWEY=;
        b=X52G9yQf0r8v9OBep5lRpKXFrhihXB8U+55uWnP7vbQNGKQmPAqY4F4ov0AmZ3oinR
         LzQ0HkzXiMH/AHKB2ATUBRox18vmIbpFZAA+Q+IiC6d2KiSnb7L8vf6CiUcKRwHniVJX
         tN2sg/yDDtQ6preP36CxpptAAq/pVYApi53yfjR6QOfMxtFs4gP7Z5q/Av7e7xCXsuau
         LrCgtEc9BRXaKPJ7iz5TUJ+/nx9aUuaMGIbRbL5FucsOWlHZZqRUxIqYRszzjFO+geT7
         yOsFLS/7fcGO/3OND7Fx9/IU87bcLrlTcqo0FKT2B4zelQJxd4HW1DSnRiqr/L508DU5
         b11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682768745; x=1685360745;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=447DttLGWlnXVhl3+i4qWwJxEj6tFprhGwRHCuyrWEY=;
        b=ezT+MK4yRtIcOhBGjC7/Hz1EPXFAe2+mFFD1wYepu9dkw2HUlrGJuBYu/hYDIotrfZ
         ix9sF6p3ovhF5uLJOAJgUcJigbvB2HPPx/g0BKBThVRi+vU0uewRrJBFLDF1qLgWFvpd
         x0iSmljlhQi+K1pjhKdy9ZNw/DAbsAItNpINOI78wCerVErvxE7WJzIERu4Rj2NKAIg5
         xPRsTXOsxt45x6PgDhw25lPmcBaM3h6mxneLmNC9U+4hVzfoSyuPwX3ExAL5BhLwrI+m
         zOB7jX4wug/wMTSSK1W6Fvgu764qsfAKl4skD6xIZzGjJDKphN19IjqSpiY1kGNO4+JS
         8vyg==
X-Gm-Message-State: AC+VfDy8TG6ocvVqXdY/dSA8HXD576h/J7cfIC4GBRYtnrIjUjGowpFw
        ySwQ39/voHjLAufX2sECuSXk4mEuvAaTJG0jssk=
X-Google-Smtp-Source: ACHHUZ5X0SWqb3coCrzfoOgVz7L/cTPAivhByCVqwS4yKCvhZQs7e9aSjRshTbtO1CpCDtQLTH7UyvQms7MFthGLMwg=
X-Received: by 2002:a05:600c:3d9b:b0:3f1:7a10:f2f2 with SMTP id
 bi27-20020a05600c3d9b00b003f17a10f2f2mr6396358wmb.1.1682768745358; Sat, 29
 Apr 2023 04:45:45 -0700 (PDT)
MIME-Version: 1.0
Sender: www.owinfuturejessica@gmail.com
Received: by 2002:adf:db44:0:b0:2d1:77c2:40eb with HTTP; Sat, 29 Apr 2023
 04:45:44 -0700 (PDT)
From:   "Mrs. Margaret Christopher" <mrsmargaretchristopher001@gmail.com>
Date:   Sat, 29 Apr 2023 05:45:44 -0600
X-Google-Sender-Auth: Lu8TjinsJwOeClFxVSE-TbHVl_w
Message-ID: <CAAAz2V68SQLC4hnsDyZMdxGdnu0Lh7GsvOsTXbQ=1BOxM1aF9A@mail.gmail.com>
Subject: Humanitarian Project For Less Privileged.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_NAME_FM_MR_MRS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello Dear

  Am a dying woman here in the hospital, i was diagnose as a
Coronavirus patient over 2 months ago. I am A business woman who is
dealing with Gold Exportation, I Am 59 year old from USA California i
have a charitable and unfufilling  project that am about to handover
to you, if you are interested to know more about this project please reply me.

 Hope to hear from you

Best Regard

Mrs. Margaret
