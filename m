Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C524E1C64BD
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 02:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgEFAC1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 20:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbgEFAC1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 20:02:27 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A64BC061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 17:02:27 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n11so1776632pgl.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 17:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UZI+KpNHqcA9m9GZ9qtV/wP6f0+ftNv7wycmh4FEmzU=;
        b=VvrDeGgvpvx1tdhTLY3HdY/MtTjINbxQ0m+/nabi71Zoc21KgQfqznJIzpj7I+lpAv
         0wC5e8pH7cGbDp8OlOLWJfN00ebmqxTqvuU9ryNNhzMyPWmDdyFlDPA9fNUR1RlpehV7
         XTnjF5dTnjNly05cGJ4jh6nqD8Ay3GzLO8V5649yImkIKx10TmOy+/hn+xdSoLOhDHhP
         Dt2aYTI8yPgqrOQ7JKtyvgGmIbu5MaT2LlFmuQEfVoat9gIKGAiWkFkeYhMebUkLQk+N
         1PMHVtP0pxSlUlnZjBh7vJxksOY+gMy1z2jLshBJwQ469iAm25Enn4rcoAn0vdI6Z8zU
         9IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=UZI+KpNHqcA9m9GZ9qtV/wP6f0+ftNv7wycmh4FEmzU=;
        b=WlaVBP4AXlp8UgJi1eXKc9jFuawA+Sr3wr4rqmHgK3ShvwkFx3cV6T+wOMyyGpyD2u
         MmPduEMp+/eBLNKV/Rj/sEP/PuyiyHq9w7Rp4npj8CjkVN2qKfu9pJStFXnF7FBA8ORq
         TlY/2rN70j+/1F1KG5pGYfYDvW1oaEn9qFs5u504FHHCXackqnF9G3F5HCavIviBw4aM
         OpSce0DRmq6ItQVp3vHnxcuvRE9++JefLCx0sKN3zg4UjH1SEZgwmbZc9vtpmQCjsMX0
         gv/46nEGb4Ig1NI1vFf4tD/MYOwf8virfhvd2VY1pl3qhbWK8VavQRglQKpzAOO5f4qU
         8xFw==
X-Gm-Message-State: AGi0Pubkk53noAVAmuIJZmCIpjMYqTN7QnX70b++VcX86K4U4pDtKb0+
        bIeSMwoD+6CJY399bfudlLs=
X-Google-Smtp-Source: APiQypLuaj54ZWc0hPVxST/k8P4kRJGk2bwSk70/yWxzN8bbc4uC2k6h25u9tW2uHVk9oRZtBM8K6Q==
X-Received: by 2002:a63:ed50:: with SMTP id m16mr5231841pgk.271.1588723346513;
        Tue, 05 May 2020 17:02:26 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id 131sm220478pgg.65.2020.05.05.17.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:02:25 -0700 (PDT)
Date:   Wed, 6 May 2020 10:04:41 +0900
From:   Mattia Dongili <malattia@linux.it>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: Re: [PATCH 2/2] [sony-laptop] Don't use thermal handle if NULL
Message-ID: <20200506010441.GC119615@taihen.jp>
References: <20200505111810.65586-1-malattia@linux.it>
 <20200505111810.65586-3-malattia@linux.it>
 <CAHp75VdCsscavP5sGrMjk5dWFZDYjevW94_RNRw50nAaM3jQpA@mail.gmail.com>
 <20200505141948.GA119615@taihen.jp>
 <CAHp75VdGemLeyujDZZ+fPZn-0hhTVcQjNkjU0MNEGJ+WS+ouSw@mail.gmail.com>
 <20200505151731.GB119615@taihen.jp>
 <CAHp75VdSVKu8Kbrggmj-jUVETGp3GNkw0cZXRLQOqyQTF9Gsng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdSVKu8Kbrggmj-jUVETGp3GNkw0cZXRLQOqyQTF9Gsng@mail.gmail.com>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 5.7.0-rc4+ x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 05, 2020 at 05:31:59PM +0300, Andy Shevchenko wrote:
> On Tue, May 5, 2020 at 5:15 PM Mattia Dongili <malattia@linux.it> wrote:
...
> > Another (possibly better) fix is to keep a list of which functions
> > successfully initialized and only attempt to resume those instead of
> > blindly going through all the known ones.
> > I'm not against this last one but it's quite more invasive.
> 
> OK, can we go with the series out of two (besides another fix for
> ACPICA changed behaviour):
> - (temporary) fix for the failing initialization (so, can be backported)
> - real invasive fix as described by you
> ?

In all fairness (and after sleeping on it), the thermal_profile 
function is the only ones that depends on pointers from module
load-time initialization. I'm going to send a v2 with an early exit in
sony_nc_thermal_resume to avoid doing any attempt at resuming if the
handle pointer is NULL.

-- 
mattia
:wq!
