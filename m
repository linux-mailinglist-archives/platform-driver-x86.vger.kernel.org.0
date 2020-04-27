Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2900D1BAD00
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Apr 2020 20:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgD0SlP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Apr 2020 14:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgD0SlP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Apr 2020 14:41:15 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC873C0610D5
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2020 11:41:14 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id k13so21793738wrw.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2020 11:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8TB5J7LWLeaW8++7bKbHy2XpLIrZzUa1CUaU5nteOwc=;
        b=BMu3SP9symPT7yalehZ0HvpYBF+xjY+qXJz/oFlRk80o+q6cprc4pNsjFdkkBrc91G
         IBZD7DCUjYWHq3ATSYWGYtiItOWeMe2Pz1qH/KWG7AJtQVQ2SKO9W3AcRlDQ++RWd/Sa
         jdGra6GOgkfNkYEM8jc+JAM8LJ87ivp+5RwWWTILXbIEW/s7fcDQ/3ICnJeuW2vs0WxN
         k49EbL4dCXW9zQ1OJPHXRbm0mljgxqsRgmUu89D1FjJ84FjxoJkdNeKIWZ77lHifRD8R
         q99HEdIP26sdrrampw0P7Gvtf/HnAyUVQ1+I6fEhag1XWENHTAP6guw7EUaMuK7jmrWS
         Ow4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8TB5J7LWLeaW8++7bKbHy2XpLIrZzUa1CUaU5nteOwc=;
        b=E81eKB/eMj+InApCcAuGJ2Y9niTylm+MS1qWG7U7X8/dEnvvuU3K0UMR6CpCr5x0MP
         vfUhW5Qyr6YehIzN2KDMDhUGXp1zhLgyH9TIfBN8MzRH+bdw8PQMB9PwAlY97AuchCv9
         1/l4a9NyPMmJihchlvpaxNb7FMV/zVUUyT2PyoNeP6NUhk2U5JWh9lxdtLD01VKlkywO
         u7ENsfyRtThlHINd6/Uz/99u84xaTdCsSmKVKelSzh3iJxTJAKQWY/zJ8/EZy454LR74
         07DEDHscnMkjbZLoRxPJPDqj7UAW3fD8o5F+6P8fCNYNLjfUDxdorUi/JUzy8ZnYqeki
         f01Q==
X-Gm-Message-State: AGi0Pub8VyTKfGmwv9HN9qlHWi3aHCpRAXr4M0Tvv3bDnliO//z2tYnN
        iW4u447pN0U9+Ln6wrIB/NR9VHBk+Wc=
X-Google-Smtp-Source: APiQypLPxnoElAr6Ys8wtVWKqBGQhJBu3CR+X1TqJ9Yx2PydStTH7pBkBt9DGFUvW8eBeJOgHRR8kQ==
X-Received: by 2002:adf:f004:: with SMTP id j4mr28280876wro.123.1588012873482;
        Mon, 27 Apr 2020 11:41:13 -0700 (PDT)
Received: from lenovodario.localnet (host196-76-dynamic.50-79-r.retail.telecomitalia.it. [79.50.76.196])
        by smtp.gmail.com with ESMTPSA id a67sm22350wmc.30.2020.04.27.11.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 11:41:12 -0700 (PDT)
From:   Dario Messina <nanodario@gmail.com>
To:     Lars <larsh@apache.org>
Cc:     ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, kjslag@gmail.com,
        bastidoerner@gmail.com, sassmann@kpanic.de, agk@godking.net,
        arc@osknowledge.org
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual fan control on select models
Date:   Mon, 27 Apr 2020 20:41:11 +0200
Message-ID: <11041815.WYjWQN8m1R@lenovodario>
In-Reply-To: <20200423215709.72993-1-larsh@apache.org>
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Apr 23, 2020 at 23:57:59 CEST, Lars <larsh@apache.org> wrote:
> This adds dual fan control for the following models:
> P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
> 
> Both fans are controlled together as if they were a single fan.
> [...]
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always
> changed together. So rather than adding controls for each fan, this controls
> both fans together as the BIOS would do.
Hi Lars, why have you chosen to control multiple fans in this way?
I know that BIOS controls both fans together, but the EC has the capabilities 
to control both fans independently, so maybe it can be convenient to expose 
this feature.


Distinti saluti/Best regards,
Dario Messina


