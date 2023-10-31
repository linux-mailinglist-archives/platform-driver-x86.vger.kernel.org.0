Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9D797DD060
	for <lists+platform-driver-x86@lfdr.de>; Tue, 31 Oct 2023 16:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344810AbjJaPUU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Oct 2023 11:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344793AbjJaPUQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 11:20:16 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5D41988
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 08:17:51 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a7c95b8d14so50666237b3.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698765469; x=1699370269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VVokwlv4EgWjfwIfgjLNp6YdLR04B4foMomExEIuPtI=;
        b=dTlsYB7yCQNNPbKwCCL7jw3O6wasKIAfV4n7FQFi9wahbvoHBxC7N4N8IksVeS8QXu
         On+TNwr9yuyA2yMd+PrD5YpY8Ztto6aLskVthdgEVdOJyqpipbu8wREZ1VvLWCDmLt99
         so4dOIzPB6yOqXsDSeDqjzmnmB/Oab2bd61qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698765469; x=1699370269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVokwlv4EgWjfwIfgjLNp6YdLR04B4foMomExEIuPtI=;
        b=F6dah9E6hTuj2t1UFWkLlM5hW/GTVZ+MhnkLz9SDCxIhL95G3SxtI55o8rLAy5HzK3
         lSczg1HZv1jzu2FKPCeht86yI3fUMb0rehqEZCqx4jc4IYtr5AklaoIt3ogIMH7qMZNU
         Gld2mMcG41rWj2C8OZ7QbkrfUbbr/G9VbPoVB1innDjST+HcsYvwtyUqC5oAVM4H24oN
         f+SsvxSkOxiPUUdLYMjuNa/BGNl46nCAmfNegPCiRW5gxEYfp3RbQdH8ROz3ggsggr5q
         m0ij3bwUq+2GOLvbFetSMPCsr0V1r1w1qPHzU8mEhwGwNprdyCgs2406gOfjjpE8GJQl
         syiA==
X-Gm-Message-State: AOJu0Yz6ArijvLsYlDoHgDe7mBHA5YcvM1RpZuW4lm0JB3vkkthM1Qx4
        yaA4+ZTkCq/T8hy4eMdW+bzzpzIDQD/YpssmI2LYmA==
X-Google-Smtp-Source: AGHT+IFKe4YagDmd1at7aanmi7ofKqUh3QCjbP4e2+xwuTZh0DNpik9W7OCq/p43vUvMc8UXHS7bf1HSWfY/9U03/HA=
X-Received: by 2002:a81:b143:0:b0:5a7:c72b:812 with SMTP id
 p64-20020a81b143000000b005a7c72b0812mr10331369ywh.17.1698765469004; Tue, 31
 Oct 2023 08:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231027212916.1035991-1-markhas@chromium.org>
 <2b8335a7-4b9b-825-c1b8-84158aaf2c42@linux.intel.com> <CANg-bXCcNPjmQC9vgd1JJcV4QoruhhbeEg8o=S9K-22kb746kQ@mail.gmail.com>
 <8f1b5075-6b12-4fa8-a173-804d4657415e@amd.com>
In-Reply-To: <8f1b5075-6b12-4fa8-a173-804d4657415e@amd.com>
From:   Mark Hasemeyer <markhas@chromium.org>
Date:   Tue, 31 Oct 2023 09:17:37 -0600
Message-ID: <CANg-bXA8zSJkO_rgDQCwEFxsFyXHO6Ad2eYwV2xGdxL_vCh04A@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86/amd/pmc: Get smu version before reading
 dram size
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> I have a patch in place that should address the problem you are
> mentioning. I will send that out next Monday after some tests.

Great, thanks Shyam! I'll hold off on pushing a patch implementing
what Mario suggested.
