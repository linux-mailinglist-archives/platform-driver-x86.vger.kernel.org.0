Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EE421A799
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 21:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgGITN0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 15:13:26 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44525 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgGITN0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 15:13:26 -0400
Received: by mail-qk1-f193.google.com with SMTP id b4so2891561qkn.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2020 12:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7v6wnG3jpmJ2fzFmU3wC+in0v+Re/QNNYB8cL0LlTg0=;
        b=OBdmmDBAKoA9NJAin2MQH+if3pRgB5SCzzLLwfSk9ajpZI2TaIoPIpZBwv5Yg5MxcI
         odERG9HkiU43mOV8CXyC7Nefu1uAOV7CFk+A3xfspGtLBrvhRLWkCf/tAAzZadyGFotl
         jkvn6HP0KN4XF0GUQxZ5qser29CiEDA9cSHFwf+7bWA9xrL73vEDk++vJ4f485BFlD3X
         0tazBefJdfkhsOcA0DkCoqNbeAvcWUPld1flv7vdIuSb63yxYFJonoTnzSvISdSvEI8i
         vhEzyDw+2olT4WuxVQ1XRG6bQxYzcJFKkqwwgaXWCSEY85vyB7q7eWfiSR9pmG5KCaTj
         MIPA==
X-Gm-Message-State: AOAM5314zkeYNy7nk//7SeydCvT1CPOSyrgkdFIE+ZUQkJWLxcfpQIUO
        0EHxUrmA7IzesH4ISGODhEoOv0in3e3QpRB23eDdTw==
X-Google-Smtp-Source: ABdhPJyE9ihCCY0IHWWHLE9slBAAdgiMfXe9ccZJFklHe1b5lSRw3XsHWSyJbL9lNVmZqNF88mwvUMOQr2E3fPqBXw0=
X-Received: by 2002:a37:9b01:: with SMTP id d1mr67715745qke.65.1594322005505;
 Thu, 09 Jul 2020 12:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
 <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com>
In-Reply-To: <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com>
From:   Nick Shipp <git@segbrk.com>
Date:   Thu, 9 Jul 2020 15:13:13 -0400
Message-ID: <CADjEuPtkKjBqCXxVUHX9f19cAkW10uss2QyYn5P-b=XNeg6gRg@mail.gmail.com>
Subject: Re: [RESEND PATCH] system76-acpi: Fix brightness_set schedule while atomic
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jeremy Soller <jeremy@system76.com>, productdev@system76.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 9, 2020 at 2:50 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> This patch is mangled and can not be applied.

Wow, let's try that one more time. I made the mistake of thinking the
gmail web interface would actually work for sending a patch. I'll
resend after I set up a proper client.
