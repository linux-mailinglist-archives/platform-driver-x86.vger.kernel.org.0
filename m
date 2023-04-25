Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33DC16EE85E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Apr 2023 21:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235354AbjDYTka (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 25 Apr 2023 15:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235349AbjDYTk2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 15:40:28 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1599C1545E
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 12:40:25 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54f8d59a8a9so75036287b3.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682451625; x=1685043625;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/2kSPjs4lrshG3mnxArnPWo04GDps+mwQUIW9ldmT8=;
        b=bJ6QPtlMi0sL9OsTD5cjebH7r5BBJj08u06rHqxyyUO2JdfLEHl8rp0rt5FzKd/UiJ
         Kfdrl1hnU3oNv3T/o53BOTnK72ZCMTFg3kE3eworhVKp39F9bn+yzgr9TbnWpD3+8bqB
         TIDfeRslA0SLHrTf+vjAAAaYBVC7lV2i11J0Yqs+lgtcgiP4K3hSGUjIyxnw8KKxP6fU
         YK1z09u7BFWVyMK7bOOCErdl+WE1NYvJhWHZh+gnZFgMkwtL5TH856K5c/5A9lgLREGQ
         Oiakio4i4zV6Rd5/ZyY6zY7+hzPm5m9+VCD+kusCs2VmH2vF97L+mLKwKOB95+unfpI+
         adug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682451625; x=1685043625;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/2kSPjs4lrshG3mnxArnPWo04GDps+mwQUIW9ldmT8=;
        b=didVQUCMow7jH2JHKQ5QgZpHEQjsuy4qr8+iGg4DJsUzhkfQDD1kLWZIj04jZq+1ib
         tCvOyO1Bo2asHBA9pwHHqde4GKutqsnnNiuhOmMyyvxZaFiTBFJOkuCfGC4ZLBswsIvN
         BTpxNxODiY3EIMQueJTe78QlDjABYWlquByGsgiLTVXrHh0PnFppcImSpPLt7jOsufg4
         lvodC3AcQSIvIeUfDSt58cQ+oHbfpIAWF+mlloUCIxVygYF2USD3Z2vnFdwz0tzqD87T
         hQn1RyxzD9ICu4JnhVt6J+AX3VMj1ftNdwXroDEaNwKxH2b1y9L6pDaWs02rk81DU7sa
         Tcjw==
X-Gm-Message-State: AAQBX9c+YjxpMDIFr535OD2eq/PPml+YgP3V1P0jsuj7c7kFnly7+BNy
        E37IEioXpUbsXPkWZRn0nf+/okYTblYAUM5eynI=
X-Google-Smtp-Source: AKy350aqpSmRAWgrsnTcJZK5pprH1Fl2aZspsoi5m5uwT1XeuVzgdfQx5PvR/dVGnjZ7ElFmyUJudVWgoCJub7TjbQM=
X-Received: by 2002:a0d:e681:0:b0:54f:190a:4571 with SMTP id
 p123-20020a0de681000000b0054f190a4571mr11286383ywe.46.1682451624950; Tue, 25
 Apr 2023 12:40:24 -0700 (PDT)
MIME-Version: 1.0
Sender: miraclechidinma2222@gmail.com
Received: by 2002:a05:7108:9102:b0:2e7:a0ca:fb13 with HTTP; Tue, 25 Apr 2023
 12:40:24 -0700 (PDT)
From:   "Mrs. Margaret Christopher" <mrsmargaretchristopher001@gmail.com>
Date:   Tue, 25 Apr 2023 13:40:24 -0600
X-Google-Sender-Auth: j3SeSZL4CyLfIO2WIL4kd9OOxvk
Message-ID: <CA+_ZsQnudwuzEfpH2oJdTaVwiO2-OJi8ngqrkKuXUfhaPWQcFw@mail.gmail.com>
Subject: Humanitarian Project For Less Privileged.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
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

Regards
