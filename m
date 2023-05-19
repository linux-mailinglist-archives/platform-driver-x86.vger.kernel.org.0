Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0EA70973D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 19 May 2023 14:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjESMa3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 19 May 2023 08:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjESMa1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 May 2023 08:30:27 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3661B3
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 May 2023 05:30:25 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50d897af77bso761958a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 May 2023 05:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684499424; x=1687091424;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=fxfC2fX6zlr6TMZ8xdOsmg/mPCd43Yg1YjLFDtwQM3Sg9VrJ2cJtenbFpseT2Xll6l
         9OvRv00GXk4xPcfhpqEy8iET8dneH6RDHfKhaRyjjZ4poSYgJKtfmdANHL9jwXv9WXnN
         0iFAv+u92SqcBhMs1xCVeD3ipqMKYtw4uZh2+ZpU675WwjpIuYs4ahnadHCg39Mp+CMp
         qjUVxhXEHPwCkBk8QMKPBCTZnHjHD5fvqn1v5g6hut0p9djYsyLwCjp/IPQYytUsl8ss
         QYuY6FvbI3zCrqrRMDoW+iVo3bOnHqWBZov/m6NCm360IMeUYk7+P6u++Fj2sZor1wv0
         K3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684499424; x=1687091424;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=DZJxLh0ywZevSQQG9PXa/CKbGEX1ui5ZxBDTeYauSBcKTndFXdhzjGf7K0TE3reXC2
         tQw0RAp2Fpb+woHlz1IuNQ0xjnCESH/LxKcPd2O42MCSUQnp6Q77r5hg+RHnFOQQRDfc
         wDwlV+iqvWgsnFCSo+SzUEm9oZZjLG6agTpmfCnS8aa8BvoxGyHZhP2qxcD/NTnWJ51B
         r4zfzgOwJmA4iE4yZsEcX94PYfAvUSo6+/k1Ebr7zcwxoWXXQiHvVnXzrtaJ7Sku8PIi
         N9eLy3PxKUk9nD7ILjK609Yieivy9Qe4JFzxKPHh1H9GX7YB2+N43I9J5WiyXarsYe2N
         H0lw==
X-Gm-Message-State: AC+VfDxEuVV1aiyinq9KERXUjOHSuG6shmBwxQYXSX8Iwcdc7Udh7WNd
        cuxgyT2ufS5PwWA7DP9zxAAiZoAVjHs+mNS5H94=
X-Google-Smtp-Source: ACHHUZ5cnhQ2O0niiz1qpuVV+JOIgGOo3CjAFuTIRj/ocOF29hSMbviWJbWz5eqknuAGsAbG38xU23s2DmUvF+bGTxE=
X-Received: by 2002:a05:6402:274e:b0:506:6c2a:528f with SMTP id
 z14-20020a056402274e00b005066c2a528fmr1700253edd.4.1684499424192; Fri, 19 May
 2023 05:30:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa7:d7c1:0:b0:506:6f15:2723 with HTTP; Fri, 19 May 2023
 05:30:23 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly80.info@gmail.com>
Date:   Fri, 19 May 2023 05:30:23 -0700
Message-ID: <CAFKNpgjP-dmtgjS4RNaViHp_4CCHxX9ba68YfzBmaWgnV-C9ZA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
