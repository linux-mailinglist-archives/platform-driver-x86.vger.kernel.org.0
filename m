Return-Path: <platform-driver-x86+bounces-25-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 204377F57E3
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 06:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BE561C20C46
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 05:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7775BE58;
	Thu, 23 Nov 2023 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiGn2bI+"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7815F19D;
	Wed, 22 Nov 2023 21:53:32 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3b837d974ecso339544b6e.2;
        Wed, 22 Nov 2023 21:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700718812; x=1701323612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdUNABR6Mifi2m+aoepA5AMZHmcuu2ymDmdpy19JJlA=;
        b=RiGn2bI+Wy1l1D0qhXvj/+DN3MHQOCS0qR8FyGPos/lR40uhxsRK9Kp+NIp51iFZxB
         GFpU1bdCE+V4X8rIiHABAS92SkEm3rgYlmwMqLV8RLmjsCcZmyMOeEmLyMTMHIhTbdu1
         btG9FW1y91sI5eK0cLyIqj9ywfrp1d/uwQMiTrE1p7S2L06MoJquyoziBEPrvjUVZ1Fj
         4HBo+EdsRjiPz5KtIikH4W74Tmj8DM0uMrXYu1fDPlDM/Qjq3Z4Io+8Ep3jVDE0LFHol
         Aglbg6bXW/tqSki3/WAAj1dj2ndARlT0z6V2otHgKALfAc1L1di8r0Gwa75soJjIja8F
         J29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700718812; x=1701323612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdUNABR6Mifi2m+aoepA5AMZHmcuu2ymDmdpy19JJlA=;
        b=e3YpGZujy3oS27uYxQ4toVJLSoFQpzaSNe1F+JGg/rxCVMctIlC5P6CMY3Uzbi0aKt
         dgJUYOjH5z6fFqm1Ibbljdun/Mecx0ekke0l4Txok63EJw/O5hlYOv2T+o4EaVuxoKfg
         AlC7cmLy3hMNatOa7eJU8ePOmwFvAjnmv6cR/niKzztx1C+2NlbZ0drGO1BPCxVDZ9m8
         fZhg0M8whLA5uvYL5SxUF4OL6bxukroDiReZNtdPAA3YyDPeuwzGMl+ra5lfwI3eoheU
         T3WJ1bDBkTWnjtJZMEQHTK0BXVRGBliU+tsBGYS8FK0lSKnQzBnFcELc5KDi87hYwFpU
         tBLA==
X-Gm-Message-State: AOJu0YzjBOTk8UXk7wjcIG7AFKVKwXcwLiHs8FQIWboLYLai3aJUxjLT
	Dxc9ELy4kZtE3xFSbKn3cGA=
X-Google-Smtp-Source: AGHT+IGn7QzG9DaCsRCcjqAPRW3yKy2dFCdW/Gzty+AL0RBIV+vk1a4EV6ImJUUWF7zaet1wZozNgQ==
X-Received: by 2002:a05:6808:1915:b0:3b2:f275:18a8 with SMTP id bf21-20020a056808191500b003b2f27518a8mr6942617oib.22.1700718811822;
        Wed, 22 Nov 2023 21:53:31 -0800 (PST)
Received: from localhost.localdomain ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id u26-20020a62ed1a000000b006cbcd08ed56sm429438pfh.56.2023.11.22.21.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 21:53:31 -0800 (PST)
From: SungHwan Jung <onenowy@gmail.com>
To: lkp@intel.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	jlee@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	oe-kbuild-all@lists.linux.dev,
	onenowy@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: Re: [PATCH v2 2/2] platform/x86: acer-wmi: add fan speed monitoring for Predator PHN16-71
Date: Thu, 23 Nov 2023 14:53:23 +0900
Message-ID: <20231123055323.417287-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202311230750.psygl1ot-lkp@intel.com>
References: <202311230750.psygl1ot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is caused by dependency on hwmon. Setting both hwmon and acer-wmi as
module (or in-kernel) in config fixes this error.

