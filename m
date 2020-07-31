Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFE8F233EFF
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Jul 2020 08:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731152AbgGaGT1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Jul 2020 02:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731369AbgGaGTY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Jul 2020 02:19:24 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83D3C06174A
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2020 23:19:23 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c80so7593165wme.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2020 23:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qPKXXpJdjKCrkxbnD31J9NcdUb/tXEBn+ARL8Y6Ysd8=;
        b=tXVqKIx9YeutJTEwLUXbENDyhttvDO3dblr6fxNoUIoyOSofGamNKD+xTV0WpAfiEG
         3ETCLAtRqNYrUxOT8PIb1nlELDzskGVDilJdLjyn69+hgV+lW/viQf+ympqGXsDJo9xD
         sY/kqBtch/f0zMWm1AVKLTE9ZGdpSTtfzRjrkNU5oWnX/gbBMQNZJis6dQY9ZVuDr/Ph
         tUPi0o6j4p5N89JlWf62pCKWk/t36X1Mdf/pz9wMf3LNac7hKSDW604IMOJJTNEiwg9l
         xwiVZQ9EAUdWLT2hXFEUlY5jGh1Fz6m8IQORxoTZDMtO33eEQkiouNcCDRBj7zo8AGmt
         K00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qPKXXpJdjKCrkxbnD31J9NcdUb/tXEBn+ARL8Y6Ysd8=;
        b=eJxGkuNLBtqFU9Td+ZXU+i8lGzsoro5Mh05dPA61fbIa/M3TjLtX22msVCJZOVXXzQ
         h3UmcOyIe2ORJ9F5W9K7JfOWL+xXBmzAr7sWDzy/x85ehc7s31o6tMZifZsMTbCYrSz2
         68LcSxn69zTZU29rLLNevrIXoA40P74idDhXD014XhrAhryn4B9obAKkcKbfeMn9vqEu
         cBKC+5I4JPYvxr8m0DYYp9OreajcmkCRUK7W78LTSSXuok0Gpu0U0jQ+yGS015r3RLtO
         XWWA75tuLE84tDVnYr+6J8VCjqtdCohbEEBdAkTWuYwb4tnSuK3V2Z5uiBbZwWZY44bO
         Wp7g==
X-Gm-Message-State: AOAM532TQtEamcqTl8B4cZBux5M8xLOrC+6r0BbND9oEefOwn3oIUe5L
        lre759lvV5+eQAoJdHtvRrhWHw==
X-Google-Smtp-Source: ABdhPJwcZeUYAOIT7hP4EH+JmFxHst2IgQ5lloYBKPkq4SUaU7RgmepyQcQ91JfPqooLOOrlqaMcEA==
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr2360258wmg.55.1596176362350;
        Thu, 30 Jul 2020 23:19:22 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id n24sm4604652wmi.36.2020.07.30.23.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 23:19:21 -0700 (PDT)
Date:   Fri, 31 Jul 2020 07:19:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark D Rustad <mrustad@gmail.com>
Cc:     "David E. Box" <david.e.box@linux.intel.com>, dvhart@infradead.org,
        andy@infradead.org, bhelgaas@google.com,
        alexander.h.duyck@linux.intel.com,
        linux-kernel <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V4 2/3] mfd: Intel Platform Monitoring Technology support
Message-ID: <20200731061919.GJ2419169@dell>
References: <20200714062323.19990-1-david.e.box@linux.intel.com>
 <20200717190620.29821-3-david.e.box@linux.intel.com>
 <20200728075859.GH1850026@dell>
 <3DCA0A88-0890-49EE-8644-E6311E891C55@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3DCA0A88-0890-49EE-8644-E6311E891C55@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 29 Jul 2020, Mark D Rustad wrote:

> at 12:58 AM, Lee Jones <lee.jones@linaro.org> wrote:
> 
> > If you do:
> > 
> > 	do {
> > 		int pos;
> > 
> > 		pos = pci_find_next_ext_capability(pdev, pos, PCI_EXT_CAP_ID_DVSEC);
> > 		if (!pos)
> > 			break;
> > 
> > Then you can invoke pci_find_next_ext_capability() once, no?
> 
> Part of your suggestion here won't work, because pos needs to be initialized
> to 0 the first time. As such it needs to be declared and initialized outside
> the loop. Other than that it may be ok.

Right.  It was just an example I quickly hacked out.

Feel free to move the variable, or make it static, etc.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
