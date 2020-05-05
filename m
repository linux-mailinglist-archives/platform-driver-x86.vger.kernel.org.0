Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62761C52D5
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 12:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgEEKPy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 06:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728663AbgEEKPx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 06:15:53 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA1CC061A10
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 03:15:53 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l12so820830pgr.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 03:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3mwYcTC2+EFvRjSl5JMyFLhCDOJRuPFglfZBkJLhNYw=;
        b=drVxMcugjFFC+1isesM1hlpPaEfzgXeNUYh0nm87FXIvINarpfUl+FKE7apHB0xnuO
         zX7W4ih5xTVm1XdpHHSkTEgD6xFjXrFh0a3Mx10c0GHMNL7ZrtpEvpEbh9ufzeg1qDIo
         dagT6CDoSPPBkXrHq9Nxq0FQefIV0VA9zSXlA9M63cWBJQS/pHoblRp2904EATpj3joj
         eQhdY6zAJOByngZEzCDn149t5BnYQaczWZAjRuy4KtBolQsNyxGrUZyiLbvU5xMtJsbW
         tyPAQKAGPOkqwsYePR8iV/stOIJWaeyxBRyWwZyXQS4Dw7yp2bVnpcDw7HU/rDKWKtfa
         etdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=3mwYcTC2+EFvRjSl5JMyFLhCDOJRuPFglfZBkJLhNYw=;
        b=YjXp76/lnz3KduREG31Gz5YAFeTFzCzduFWo4E8fCUIUsRuhX97dOJ8MeXKXjPrXKo
         vstFa4/0+zrWeT82zIp4kvKulmXwyz3yviAPjzfZ6wCgtZh6X+gVHhFSqziLdbC2t33D
         G89kyKisyak/pNjTd7mXpVGrF3dd5aCUXqTlxDbwew7V7RxFTmN62yrTPhUytHAhgp+e
         HjC/Mstpk68mhTHIaZUDjV+DhNzyzgkXn7Qj1YUdaM4cLf6XE/EFOPHvBVaXBSa09eby
         R8oSd3J9rUXAbA8GXzZ29OdL6JFaqUynPWXN/PXz3yVxcFxaEY6KO38TSP9gMsOmqqc6
         uwBw==
X-Gm-Message-State: AGi0PuYC9HR/zkR06rNV6NKOPonP5FZk3YDoUKc0RU44Wi6ZUIsb56kS
        m5W7kNTdSm8oDP00bPSrmSo=
X-Google-Smtp-Source: APiQypJoAVTIyq83iTIJPlsinRxjuWqmuaqCu7IqElFI3i5MHoHXve3EXPFW/N3lPP4HQnebm6b4+g==
X-Received: by 2002:a63:745:: with SMTP id 66mr2229458pgh.337.1588673753091;
        Tue, 05 May 2020 03:15:53 -0700 (PDT)
Received: from hilbert.taihen.jp (ae146065.dynamic.ppp.asahi-net.or.jp. [14.3.146.65])
        by smtp.gmail.com with ESMTPSA id a12sm1297661pgv.14.2020.05.05.03.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 03:15:52 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id 84F21240AE0; Tue,  5 May 2020 20:18:11 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: [PATCH 2/2] [sony-laptop] Don't use thermal handle if NULL
Date:   Tue,  5 May 2020 20:18:10 +0900
Message-Id: <20200505111810.65586-3-malattia@linux.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505111810.65586-1-malattia@linux.it>
References: <20200505111810.65586-1-malattia@linux.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mattia Dongili <malattia@linux.it>

The thermal handle object may fail initialization when the module is
loaded the first time.

Reported-by: Dominik Mierzejewski <dominik@greysector.net>
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=207491
Reported-by: William Bader <williambader@hotmail.com>
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1830150
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 425707e8d188..0c94e414d785 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2280,7 +2280,7 @@ static void sony_nc_thermal_resume(void)
 {
 	unsigned int status = sony_nc_thermal_mode_get();
 
-	if (status != th_handle->mode)
+	if (th_handle && status != th_handle->mode)
 		sony_nc_thermal_mode_set(th_handle->mode);
 }
 #endif
-- 
2.25.1

