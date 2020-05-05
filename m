Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFAD1C559B
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 14:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgEEMi1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 08:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729039AbgEEMiX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 08:38:23 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D64C061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 05:38:22 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id z6so766187plk.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kyawPYXJg5+3Okgb+irRCc6ToTGPZK3LZV3zm8FwPPg=;
        b=lBSmKtfPmiFD1AEU3uFSiSu+jJOcxVStPKkYQfuKEp45hpDyr7IphK92zIi9uVKxqu
         FOeB4hNUb1ocnE6rmkZttCq1hVRLGRN1PaIbgmDQQ82u1gpuEbVTz4J1XWspq3z6Th75
         PZR6koipe6r4cjkdVbAsfmdXe5JxZ9NMtga6rSdwPH1svxkSKCyMl5yV2qAxvgxGw5xy
         uPQDNcAziNkUNEKsYCOwFdNIbZKHnsvu05078AiJMeoEWaBd+GA98QUiFWCqAEEQNnZi
         xLsFqAQ0J3YCth5hGhW4Cf2+KMisK3m07BN9AJcZN83I2OGqinb9+T2cJNB7jnd6SPaK
         oeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kyawPYXJg5+3Okgb+irRCc6ToTGPZK3LZV3zm8FwPPg=;
        b=V2x6SN1E+SXg51nAwyNxYpfmkA6sXYoInnibe/EUFu/MqA51FQ5SI0ttr585DC/WTI
         kpxdYmGXQ8nS/xSH0XFezYQ3wX603Q99J9tTOx7C7+lA+tBOD0NQ/uJf2G4hpV59XgpD
         tAX7Yb5HNSZv1dsfHJdlOoYpHjwogmEz5s2dl5kc1NsRKW8zM+jZH8iAT2dx+vX8wOFo
         4wlFZRxRvte6AoxJ43+rmfTpzRKLy7vFfBCGJKwLCt3EUhBB40lqWGfDfafVTfyvBkXt
         IyXEfog3vrjgO/3/PsWf1Z+CKSRTPuRDLaLz8sL2OmFJah04mtXtj+QP7eI/FB5QsFQF
         ouNA==
X-Gm-Message-State: AGi0Puavi+iVM1TDN10NmMPPJjJj+kt+i0emNMoraMZjz3VP4ThOOrzo
        FULNfUaVMaNhQCdcDJAqr3Wy+wR1zX2sHT4uyNo=
X-Google-Smtp-Source: APiQypKWvh8ONGu9c2SKQePDNjtouwYIpmLune3cgLwM8tlWdkeNqHxAN4rD0jginRNyZ/gzU1iWQj9ua9KMuP0tpxM=
X-Received: by 2002:a17:90a:fa81:: with SMTP id cu1mr2839937pjb.25.1588682302197;
 Tue, 05 May 2020 05:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200505111810.65586-1-malattia@linux.it> <20200505111810.65586-3-malattia@linux.it>
In-Reply-To: <20200505111810.65586-3-malattia@linux.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 May 2020 15:38:15 +0300
Message-ID: <CAHp75VdCsscavP5sGrMjk5dWFZDYjevW94_RNRw50nAaM3jQpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] [sony-laptop] Don't use thermal handle if NULL
To:     Mattia Dongili <malattia@linux.it>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 5, 2020 at 1:16 PM <malattia@linux.it> wrote:
>
> From: Mattia Dongili <malattia@linux.it>
>
> The thermal handle object may fail initialization when the module is
> loaded the first time.
>

But isn't it a papering over the real issue that it fails first time?
AFAIU user needs to try first time and if it fails to try again. Can
we rather understand the root cause first?

-- 
With Best Regards,
Andy Shevchenko
