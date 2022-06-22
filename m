Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F3C554E93
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Jun 2022 17:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358007AbiFVPFE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jun 2022 11:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358721AbiFVPEv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 11:04:51 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109F03983F
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:04:48 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id h192so16354720pgc.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=NNrbGK6djS0CRtM3/UQ95LhI2eEXoWUxLsDnUA13MFRNJk/9mmQU3ox4fvrjHHphG6
         Uk/KgNtAhYWz5i7hein52o157kcoxgXWDZDT27h/956I4acbXf9Y/nkriGxcNVM2r8P4
         wcgFg1F/jkIaLSrQaqlUO+8pMLEosbdY7OOsWr3AMLc2TBO3+SIkCWKgxM/nVMk6ZFoJ
         uDK8nqq6dnszsTc7PBBlIz9Hg4YUuuTbSHyTc+E08CrWi3+L7GeeFiCasIYZ9Q8VsLG8
         S4vhAK+7u11z+m5Hxkc6y5oajBPWYBYxPxJpo4DQkMntf9H3LyL8L9ttwwDWjcJf+c8U
         PpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=CymIk39ZGhM8GkycKmozochgNhN4tmlxXSBafd8ZTB89Tor6BD0FIJl+HZyHNAtjaK
         IOR8UfL3HctDXUCNEET5zSS/aKCI5yoCgwEEwiLp8M2XCjOdNjpr/chefV2f+cnIPGp4
         d0tCwcdYVXf6yCet6qqLfis0YIHIKG5WOAmKVHKrzs0pHgTbxkdojZRLR6HMPindt3ef
         plz2BkXJnaZ72fvDNVm3l5Tm/wee21ziJyJ1U4EMS+kGrPP0u1NQOlO5LOwDB8qCrR6z
         i3+Ddv4++ElXLG6DHY89kggzom/WNPO5J1tkLlW0/Nb5Nw5uqIOZ8Gj6HaORL60Rwi7V
         2Yqg==
X-Gm-Message-State: AJIora9Rp56eUjqFPXEE1mtuIcfrxJAV4TXxuRPvpbblmdTBynMxy7v5
        cbASUlx69sbWsJvosFQXz+EDumiyqFBLQV6qmvc=
X-Google-Smtp-Source: AGRyM1vUU+8KcpqHjKd+XwOIzLZo81GCNo8g1T8NcsXoedjztrD28nv6b5dX/4HlbDQGNJto4FvnUxTvx2PWypG1x+c=
X-Received: by 2002:a62:5a81:0:b0:525:301a:1445 with SMTP id
 o123-20020a625a81000000b00525301a1445mr12459103pfb.53.1655910287542; Wed, 22
 Jun 2022 08:04:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2308:b0:16a:1b3f:f74b with HTTP; Wed, 22 Jun 2022
 08:04:46 -0700 (PDT)
Reply-To: sales0212@asonmedsystemsinc.com
From:   Prasad Ronni <lerwickfinance7@gmail.com>
Date:   Wed, 22 Jun 2022 16:04:46 +0100
Message-ID: <CAFkto5svN1NyCQiZSkoPmgcYL+0E3kX-uHcBQ6dfg3Gd861ZGQ@mail.gmail.com>
Subject: Service Needed.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hi,

Are you currently open to work as our executive company representative
on contractual basis working remotely? If yes, we will be happy to
share more details. Looking forward to your response.

Regards,
