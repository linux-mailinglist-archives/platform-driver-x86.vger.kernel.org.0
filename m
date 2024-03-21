Return-Path: <platform-driver-x86+bounces-2135-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF1886281
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Mar 2024 22:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF7FE1F236C2
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Mar 2024 21:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D843135A79;
	Thu, 21 Mar 2024 21:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="PPg4n7vg"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC9134420
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Mar 2024 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711056329; cv=none; b=V1oF6QwySLtryJhPJFjv8OkqHAnU9DouO3mGWnzGMaf1ouumw7xVpK+MWQHcfQDAOH6lvZxuc88eZJ/9i3Gumnu+d9vEVx0hEPTfsagItbBlhjCOdVSWVtI9ps8eFuPAAqWPkJ6chCNN1u4SF0Zb/yFIdNFVTzaZ5ELb6DMtRFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711056329; c=relaxed/simple;
	bh=ZmeXOty/8haX7G/IQpzwTPK1G6wnQWo2YpkXl5B1tEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uYbA3KE5bIsRrlSq/0KlpNJDdIwkodphk1+OQhTD8egJqCw8b2TyrH27rZBud/dxzTB1V/A7VPuzJJZlO0k5b6NNbZ5Zo2r3XeEbDZOdhIOpCCOFP30xurdwF/R1SVU4U6ZuYPJ59/FiSll4NGgTVI1g5X3XkRyJ/ywi8CbLrJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=PPg4n7vg; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7e050223d43so458866241.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Mar 2024 14:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1711056325; x=1711661125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmeXOty/8haX7G/IQpzwTPK1G6wnQWo2YpkXl5B1tEw=;
        b=PPg4n7vgZMhHVL7qHRoVMVdHbuRJDg3UmZHpH3eKGVgp/BZE8Mx+s/3obwSClXiyFM
         XRdM9Y6j6B2X/HMJVLa4F8+wipXXNISLg5WHuU/+2Av0dvyEnIQ0YaS6ejH2vE0iwUEB
         9iWqPoYjrBBxwLvDEBCpiCayYgRwebKWJwRC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711056325; x=1711661125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmeXOty/8haX7G/IQpzwTPK1G6wnQWo2YpkXl5B1tEw=;
        b=dShoA6kI2vQqhFi2YrCBnJiYINz9S70slz6+FYLutDEriVaL2mDc8XdGMwJYdfAyaB
         8FVKjzMGA25qm72Ul7UGHeS/VeWOL3uf9XF2Sh19YipBqn6N+meZH4aOk2dYCFUl6m1q
         1G/hIanDj/Z1DYP19QcFEpxD04lBkSgtzl7wIO4pnj4J8K+zhUAsS0Z+PXlSZsQiVwq9
         XYe2gk2J43rHmWP00Ng+wIsF4IykmHEZSa2rjCJ/0FsEH9xkPXwaTNGCZblSGPKrA7LH
         CVWAAG1NmHhJcPrzcaX+aLDfxrzyeQhoHj9NJvRA0VFHC4M0q1iXPjLl9H1lWAVGh2ui
         eSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlP7uF9GrGM77W7R3iY4LzPfXt77t0HOxVwWVSZUOhx6GLnfLvwMlHvsiw+iDxIQGXqxS6yquF/ul5Tc61b11h41dSQnOaTViFPJT3ZBn8Bxfj8Q==
X-Gm-Message-State: AOJu0Yx4O2dLy2Em6Gf0x28h7UQa/vBpBlsDpulh2g8ZaeMkfJFUl2gq
	S7wWM+LbC4pGI4D0m5rjP8MzeadbnvQmMhjOiK6S4uyK08qbClQACoxZ45sRNZQ=
X-Google-Smtp-Source: AGHT+IFGVoYlWmW/2LhORkKDCpnHJ5RgISbUB2EttX/8dcFtWMsr/KoKwOBaHZgcy59oLKuTzjc1+g==
X-Received: by 2002:a67:eb57:0:b0:473:3801:e113 with SMTP id x23-20020a67eb57000000b004733801e113mr777972vso.23.1711056324851;
        Thu, 21 Mar 2024 14:25:24 -0700 (PDT)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id js4-20020a0562142aa400b0069049298fccsm313202qvb.65.2024.03.21.14.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 14:25:24 -0700 (PDT)
From: Ivor Wanders <ivor@iwanders.net>
To: ilpo.jarvinen@linux.intel.com
Cc: hdegoede@redhat.com,
	ivor@iwanders.net,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/1] platform/surface: platform_profile: add fan profile switching
Date: Thu, 21 Mar 2024 17:25:21 -0400
Message-Id: <20240321212521.3834-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <71c9e24b-c64b-581c-87f0-fb0c58066ceb@linux.intel.com>
References: <71c9e24b-c64b-581c-87f0-fb0c58066ceb@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

What is the process to get this merged if no further review is coming in?
Maximilian Luz approved v1 already. I just confirmed this patch still
applies cleanly on the latest upstream master. Do I need to send v3 with
this reviewed-by tag added to the commit or can this version be merged?

Thanks,

~Ivor

