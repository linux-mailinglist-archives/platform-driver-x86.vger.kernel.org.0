Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D2742A35
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jun 2019 17:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408548AbfFLPDn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Jun 2019 11:03:43 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:40240 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408311AbfFLPDn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jun 2019 11:03:43 -0400
Received: by mail-it1-f195.google.com with SMTP id q14so11061491itc.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jun 2019 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ygq+KHSEQRQIEHONmKZkoT8Uaq0lNvgFKUBcdRKHfHA=;
        b=iwRPmBe801N9hR0YvzFAhGnAE7EljexowHeDlrGId+Ef7g7lKCbTmm6oVgFkzVxkWz
         3PQlvzI1iliK/iD4YD1asKUnBoCXl/KsjRcb/I6UZMQriXJaqXiuM34ybMQwlnDzkG7q
         /4qQQxQceg5b430zLVVf9sgVuWfRg51Wmm3SiWDL9EJscjP36bZHHtI8ky6V26nZO9Oc
         P+wyUOycDuNv0D0481ZiC1+Gyf+faPxBQeGoyhgOsQkWfAxxUgfz3TpPETtTebX+B8Ft
         sOTckgZtw19QINpplP1/KB/XbMfVE5teE/MmpownrH7J9mrkkMOsArIpBlLD4HUedicj
         Hfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ygq+KHSEQRQIEHONmKZkoT8Uaq0lNvgFKUBcdRKHfHA=;
        b=q6jb37sKXPVUEnWyFBHLBLd/TrEndDvSfCudPOzM1nuUkCU5OLk+mhxJr1CVyv/xmr
         xQyDltn74CJzo4eLRUG75nzTF3HMtwET6aC8zP2NBLuexslQ0/URCOEW5y9Z1Ju8BCN2
         iv7Y5YLEpIWM0wIcWASVj6brmz/UV85tnK0uYwstvF1WEMCzx6F+8s8/LDMHzklduQbH
         lAwXNmQS9RctPKOntWOQ/MHzo8gn67BEX0B41xuZQ58dw5Nko+ZJibK9d25WKMeRLBZm
         WmDR9GEWSJ5K5RDj7Cr8xR/OO4nANGpcNFuIlOuAzR92VtHjnNGWNB26IX4wYK0tBgIY
         eNjw==
X-Gm-Message-State: APjAAAXfRmAN0t8WvEIkQZ7b6IJ2wL+9p/HA9juDgUi2+C7JMMaYVnDl
        eTbMIPPV/qRFwYgIDYJ4XeURJisyhoGH5tPlLyU=
X-Google-Smtp-Source: APXvYqyTNdxTn5riV6GwZoMnZnU7w4pr1n761LlQg35AI6uQrcvfMtmZ7tGfUdJ94ohUBAjbCzUgg0ukRfy9Y513S3g=
X-Received: by 2002:a24:ee87:: with SMTP id b129mr15921596iti.34.1560351822495;
 Wed, 12 Jun 2019 08:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190603111446.5395-1-csindle@gmail.com> <CAB6-Ya3z1mZKa8LrJw30a7XV+wk51gy8nrd+AacCxrkc4aWXgA@mail.gmail.com>
 <CAHp75VderY4NJ=9wD=Q0ad3eHidcaw-N5tzJuzrMX9h+roiNRw@mail.gmail.com>
In-Reply-To: <CAHp75VderY4NJ=9wD=Q0ad3eHidcaw-N5tzJuzrMX9h+roiNRw@mail.gmail.com>
From:   Colin Sindle <csindle@gmail.com>
Date:   Wed, 12 Jun 2019 17:03:16 +0200
Message-ID: <CAB6-Ya2VOj8A-EnxbN7fD0jK2z4XoLG0wNZ9wt0kHVE-OGNtxg@mail.gmail.com>
Subject: Re: [PATCH] hp_accel: Add support for HP ProBook 450 G0.
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 11 Jun 2019 at 18:54, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> Please, don't ping, especially privately.
> This patch is in the queue of patchwork, so, it will be handled in the
> future when I have dedicate time slot for it.


I sincerely apologize.

Colin
