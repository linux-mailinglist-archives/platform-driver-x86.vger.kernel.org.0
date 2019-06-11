Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9E2D3D307
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jun 2019 18:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388316AbfFKQyI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jun 2019 12:54:08 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39803 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387963AbfFKQyI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jun 2019 12:54:08 -0400
Received: by mail-pf1-f196.google.com with SMTP id j2so7798787pfe.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jun 2019 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kuyFrzztSocuifIsLLj50nFQf/Kjr6kOJzFzgOwm08w=;
        b=Gc0B4M9hSe5YdcOxEPZwQwJpXStdpsoWdahe8KKQa3QAzP19hlRwLTlmgOREEFOw/+
         A52VMtvrKQ5JI1A+WMfIASDoi8ME1Ko1nM9OxJ34ZC9kK/O3q1EHj/w5n15D7YI/3Clj
         n+ujIhyzh4ImfKZjzCYh/fBxUHF+K17sJMUcMnWB6svMUwlDTrhFeTQ40sMo8PrHZasB
         y+ijAEoI/s3heRFwx3Dr5grLr0+pHSjf0coDNmutgSARz1a3DmTe1pKgVoFmfsMrD+kB
         Y3meM1gNGLh5W58ta/bsfBPdaKIkZrELSEPsKq7YxUAY7OYkRIrCtblOCyVbVBYXweW/
         2iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kuyFrzztSocuifIsLLj50nFQf/Kjr6kOJzFzgOwm08w=;
        b=R2GDGjvCpjwTsxEEexyk3ZLUiWpUMrQXoAuW9CD3TSd/6Cbcxz9VK/jC/3k2uZ657D
         nCybVoOqOEF0nSFVW8xUmcp356KSYojgn47RKwrtAMslwK1xqk290VEfNcipH45q6VEo
         IIhrND90k6fkkLuiFxDZyETBO1MfiHkgOUgac3uKb6KX6NmWQIJrP2IeVavyJMAX4XGi
         yvKOZqegx2aHk88FdfC29Dn7l2Faz72kuotj/Ub1OZdi7o3DrWJCDxYMwN6khVhAF1cf
         qkWWALBgMhV7NauBvXQFVf9WbGwKtLL9Xyywgxxv8WZNXWxeZzA5hTXxhyhoXI1VUKIR
         zjlg==
X-Gm-Message-State: APjAAAXTT9Pu/0V+xtF1W4Rt7C2SIplFaQNocEvT9A0tdKx44MyyTxzw
        w+2HDd6RN6fXE5b0OP2EaQ1aMOE9tUBJmSRqgY4=
X-Google-Smtp-Source: APXvYqxD85PxdiVzNPl17zseY/e6kB/eLiw4TEdYkdHZ4XpfmYp0aREKOFy2n2SuINRV9OTzFduD34+qSMqufDCSt7c=
X-Received: by 2002:a63:d84a:: with SMTP id k10mr6579637pgj.74.1560272048074;
 Tue, 11 Jun 2019 09:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190603111446.5395-1-csindle@gmail.com> <CAB6-Ya3z1mZKa8LrJw30a7XV+wk51gy8nrd+AacCxrkc4aWXgA@mail.gmail.com>
In-Reply-To: <CAB6-Ya3z1mZKa8LrJw30a7XV+wk51gy8nrd+AacCxrkc4aWXgA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Jun 2019 19:53:57 +0300
Message-ID: <CAHp75VderY4NJ=9wD=Q0ad3eHidcaw-N5tzJuzrMX9h+roiNRw@mail.gmail.com>
Subject: Re: [PATCH] hp_accel: Add support for HP ProBook 450 G0.
To:     Colin Sindle <csindle@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Eric Piel <eric.piel@tremplin-utc.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 11, 2019 at 6:27 PM Colin Sindle <csindle@gmail.com> wrote:
> Please, do you have any feedback on this small patch?

Please, don't ping, especially privately.
This patch is in the queue of patchwork, so, it will be handled in the
future when I have dedicate time slot for it.

-- 
With Best Regards,
Andy Shevchenko
