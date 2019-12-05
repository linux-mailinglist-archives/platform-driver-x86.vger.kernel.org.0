Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 308031140DB
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Dec 2019 13:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbfLEMda (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Dec 2019 07:33:30 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43728 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbfLEMda (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Dec 2019 07:33:30 -0500
Received: by mail-pf1-f196.google.com with SMTP id h14so1551324pfe.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Dec 2019 04:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mss3s3t8H1IM+yj+k08qtaggStLqpqDPgjiOxvMPCZE=;
        b=sZ3S1RvaCs5pJabm2UidkAYr252/LhOf1s+Y2PhoxXTFxM+IOi2UPFfCMtSE7LVaUX
         U5fBNxDmrC0nuMoVewFBKola/M0uwC+diSh/tP/6h1Z+pwVuitolp+sC9SqYBFz/DTtJ
         VzrZz6vgCHki1CMVa068KrnWtgQPhK70c2Kp/ohBEdqn+6Py4SQvavLhTf5Mn+Ll35zt
         lkbKnNd01sQxkeDexRb8IpAq3wJdFCzyi414cAZYEh6urBrSQncoloUDH7Pt9pv4zSvU
         7rYpdrKn3P+zJqn4bNWw5+Ia0uKG+ZhO8/QcP3HZ5egq6VrKfzgntQWja86q7Xi0Vb51
         I2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mss3s3t8H1IM+yj+k08qtaggStLqpqDPgjiOxvMPCZE=;
        b=W4cVRs+m3HLACnMNe5+PIepOWRUT6YGyrQl4VC80jCWNRsro+rR3PGNGc7XNAn4veM
         fQNdg+5rHFhB6PZI4qDxV0MzwzvoNF39qoEsMxMj8Sg2ssI5ABp2HbcSnd3iy2+g4J/u
         /6v9MVXvZY2IQoIrKyUcS/v8bEDV4OVEyDyL4Z7BbMh5258L4PHfaq23TUgqfNMF32wi
         fYHYmI+t0RbaEHITj1cxyB/rP7B6/YCYd2mluU8rUd4gOVRl9oJhxjIjpy+Zx4py5SJG
         VxVACxz1Kn8okv6FmlijVoHHLD2t07JrRflLUftJrJBwKr2BvXaG6MTW7RiFDV41rJ2B
         1WBQ==
X-Gm-Message-State: APjAAAVs33wLRvssBJtjd1FBjjuM6FOf3kMozbSwGzJcNpYa/pT9o9HZ
        dfBZ+9XIbG2dAOeQ5sEsBAmjpa9mtoDTdRART7A=
X-Google-Smtp-Source: APXvYqwZDQGaR7Tp95kKkuTJQLBxLwlsF6PEcm/ZsWP24kKS/NZaBFB3nJERHSkPSSe0/+GtpF5mwv6ucPRDzpSnstU=
X-Received: by 2002:a63:941:: with SMTP id 62mr9368375pgj.203.1575549209615;
 Thu, 05 Dec 2019 04:33:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575103866.git.matan@svgalib.org>
In-Reply-To: <cover.1575103866.git.matan@svgalib.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 14:33:19 +0200
Message-ID: <CAHp75VeFRu5b--W8=M6q8V=XghoTiyHBa3txzVbCFvL3Coi=tA@mail.gmail.com>
Subject: Re: [PATCH V2 0/7] *** SUBJECT HERE ***
To:     Matan Ziv-Av <matan@svgalib.org>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Nov 30, 2019 at 10:53 AM Matan Ziv-Av <matan@svgalib.org> wrote:
>
> *** BLURB HERE ***

This message is a stub. You forgot to fill it with crucial information.

>
> Matan Ziv-Av (7):
>   platform/x86: lg-laptop.c: Add module version and fix whitespace
>   platform/x86: lg-laptop.c: Use a small buffer instead of a full page
>     for sysfs
>   platform/x86: lg-laptop.c: Fix a bug in writing fan mode value
>   platform/x86: lg-laptop.c: Get model name and year from DMI product
>     name
>   platform/x86: lg-laptop.c: Manage battery limit correctly for 2019
>     models
>   platform/x86: lg-laptop.c: Expose reader mode as a LED, rather than a
>     sysfs file for 2018 and newer models
>   platform/x86: lg-laptop.c: Document difference in reader mode handling
>
>  .../admin-guide/laptops/lg-laptop.rst         |  13 ++-
>  drivers/platform/x86/lg-laptop.c              | 106 +++++++++++++++---
>  2 files changed, 102 insertions(+), 17 deletions(-)
>
> --
> 2.21.0
>


-- 
With Best Regards,
Andy Shevchenko
