Return-Path: <platform-driver-x86+bounces-1118-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7A8431D6
	for <lists+platform-driver-x86@lfdr.de>; Wed, 31 Jan 2024 01:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 400D6B24B8D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 31 Jan 2024 00:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED65E365;
	Wed, 31 Jan 2024 00:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="PyaEF4/N"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DED1865
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 00:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706660623; cv=none; b=QChjD3iqgEwZ69ofvX0/q1qM756yPbcRQ4ih8B7IPV/elL4a6Bo74vUJkS0OUC9aBGiGTnwqPQYzLE+shuvZ1JrnFNkPQ6qsKvnf/sc1EWwBja4uxCvbqxEf3abytRVxc3YwuGZgJxZ3p4MuOFUlq47EM7YTcyubO85DoDIv1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706660623; c=relaxed/simple;
	bh=3Rj3F0vLfTq4/ynJ66a15e/Bdu0XKbUKQmnCGzKFxUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=n2DA/CBQj7ofNbGIM341jg6r7p4quLL2J0edZekNP99PCgEBc7WEVEkrYSJORt9iAxtkE/HUKIUeZ6FQAkYQuxu03jiCqH2lIRq4zwZD2i7nsBILYSei4t2Y69tyaPPRZscYHuR5lVWmRnRnFpBp42tNUODpBHl00RbXtUOK6iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=PyaEF4/N; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-783fa618997so218870285a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jan 2024 16:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706660621; x=1707265421; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Rj3F0vLfTq4/ynJ66a15e/Bdu0XKbUKQmnCGzKFxUU=;
        b=PyaEF4/NqPfS3c3kEHWRZlIBRd/7/xZKM9qPIuKbVo3RJOwXPrL6KMzLRsIJm/1M7a
         VBDK6AYedaXPk/iMxTLec4UpyLOwlG0i76Sq2M4weGqYFFIC9lGqytbL7PUFJ2Cw9Qjq
         7fi6gqhq+8fAr8297Vuw+csnayFhn/uCkIhbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706660621; x=1707265421;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Rj3F0vLfTq4/ynJ66a15e/Bdu0XKbUKQmnCGzKFxUU=;
        b=CpCys5OmT20P+1jhDNmufnFMVSnwJYsvh/ziqNKASIVDUNqTZFPo2ZbSbArf0dkHg/
         MXcWqEOBq/OMaYA62uw6lLLFrwzRKsY3XOMTJrc69Fb5VdFcOboePlqoa3KDacqUsuFT
         7t5R6Z5omPtGphXY1Dfxe8CxXkgLfokmeW1J0YKlDUF8GA5orIPyj3pvry6O4GIYMaPk
         AfYC01xUyqmunFCScc4KkbF7/YNCjJpZMLePCM6PyI2ZodxHSh7nfquYcv0ciWYeenm5
         W5jQiUNCWxr/crRFFUa/3JLDI5T6hEO7ic3p8KEn/ROg5pQCguZsdDrnEGh6vp1Cg9zY
         vpEw==
X-Gm-Message-State: AOJu0Yyaozr5ewg7Z9kI42/Rwpc5LkL5yaP6ZIN8FjeO87aY+GEZxL40
	gOD0Hczp528HM7v+ZsmUrwD5wT4UIi35gVPa9X8S0xmKt7lQGQEvo2MFAYFB2i8=
X-Google-Smtp-Source: AGHT+IHDeLHxsLl0jVfDYP5QKiXxJqwSK3+ZDSQa+cDd5nZ4qk10qTUH6lAMjTkuKwnyS0h+WDgqHw==
X-Received: by 2002:a05:6214:1315:b0:68c:46e0:78d with SMTP id pn21-20020a056214131500b0068c46e0078dmr172271qvb.45.1706660620930;
        Tue, 30 Jan 2024 16:23:40 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id lq7-20020a0562145b8700b006819bb31533sm988523qvb.99.2024.01.30.16.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 16:23:40 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	hdegoede@redhat.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	markgross@kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: add fan speed monitoring driver for Surface devices
Date: Tue, 30 Jan 2024 19:23:37 -0500
Message-Id: <20240131002337.6122-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <975f0b2e-5cb0-480f-af96-b0bd5004e0b2@roeck-us.net>
References: <975f0b2e-5cb0-480f-af96-b0bd5004e0b2@roeck-us.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Hello Guenter,

> What is your baseline? It doesn't even seem to be based on a mainline kernel.
Ah, yes, this is from the linux-surface kernel tree, which is still on v6.6.

> Please base your patches on the latest mainline kernel.
Will rebase this and send v5 shortly.

~Ivor

