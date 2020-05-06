Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012061C6670
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 05:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgEFDsE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 23:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgEFDsD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 23:48:03 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEEAC061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 20:48:03 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id z1so346013pfn.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 20:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6UEQ+7zAPr2eE7KgESnH45qNIvgu0UikmxnyZZtWeT0=;
        b=cGwwPuJ/RQHd/qZFnxrDMAh7+NnVUiKx41O9/oe5ocTy1h/ZH126K8m3vycw3QPSHr
         R9e/rRJJxcy4khEHMW48+XILvFkY3yxkVnIyprWlnCE1ITlfK6YkAePnMCmFYmvUGxHH
         X4hEFtfdaTy74uWU7QA13W+Hy2Lw7Swvz0jL9JNUpZUK9m1wWEl2wmChdeRmxQUSgScM
         lnti7eGN2wl7xhH1WoTqHrh4ZiiawLBEDWFffZpbWb8JHEXD/Ip0d7hXE7uD6DBI/JFD
         vhWbmS+HWQWoLza9u1+Zd+z3vsbgr+/nTXJvx8Knd5PO0PvPNAtYizKEy6ZsFiolE7Ly
         doAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=6UEQ+7zAPr2eE7KgESnH45qNIvgu0UikmxnyZZtWeT0=;
        b=rY89N2CfDq42KIW3/RAmDwyJfBs8i7oMQVfKak7gp0b88XDy62Mlvroq9oyTZ1RGjk
         Gnx4RAQwaMJDPi5dPE2Byf77lJTkyghqKCwSp+bElABvI0vgR4vQorWRXfPT0s8rwLwG
         CG8jr+rgN/J+2TOy6RCDu2iQOqUYmmb83RwYfwmuMysPQZq0WTLXTw7D65tEobIGC/Qn
         3j4aIx+xTDp9BAvLL34NNb3+haPt/YjKfGVK14w4awN7xzVIK2YRm4Q0OvMl/l4DyHZj
         5yqoXgFKAtrzCZzpDpSjd7TbcCcZGYX5dUbAYJ0e4H72BW/4D1jE5E4Z32qIvOpTxCU8
         DATQ==
X-Gm-Message-State: AGi0PuYRiSj4vAH/1WRe49HOe0+ksfy0yozRht9ogru00lAVUp8lsFsU
        cGOtRfZ2g6sOS56LNabernQ=
X-Google-Smtp-Source: APiQypIuplE6I7YzX8CcsHbMK8EwVqfhFcCEWNnzTiiVinmlkmxnZZv7lelf/lDHw1hWOhNpvAp8DA==
X-Received: by 2002:aa7:8d93:: with SMTP id i19mr6337080pfr.112.1588736883038;
        Tue, 05 May 2020 20:48:03 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id q21sm320969pfg.131.2020.05.05.20.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 20:48:02 -0700 (PDT)
Date:   Wed, 6 May 2020 12:47:58 +0900
From:   Mattia Dongili <malattia@linux.it>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: Re: [PATCH v2 2/2] [sony-laptop] Make resuming thermal profile safer
Message-ID: <20200506034758.GA18684@taihen.jp>
References: <20200506014843.18467-1-malattia@linux.it>
 <20200506014843.18467-3-malattia@linux.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506014843.18467-3-malattia@linux.it>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 5.7.0-rc4+ x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 06, 2020 at 10:48:43AM +0900, malattia@linux.it wrote:
...
> Reported-by: William Bader <williambader@hotmail.com>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1830150

William notes that he didn't report NULL pointer dereference and it's
only in Dominik's report.

Do you want me to send a v3 or can you remove these two lines from the
commit when applying the patches?

Thanks
-- 
mattia
:wq!
