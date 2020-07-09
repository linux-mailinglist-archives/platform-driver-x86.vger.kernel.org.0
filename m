Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68A121A7AD
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 21:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgGITUx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 15:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGITUx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 15:20:53 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F543C08C5CE
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2020 12:20:53 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p3so1402212pgh.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2020 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tE3dfcq3okvYXoWU0ocsguF5oIBkT2unYEhCfWoYOM=;
        b=cHHqFSP1GO4OhsvHZuwKmT5+cptPhEly/v+Z6L46FXpW/PwJjg8AP8DV75JfMR8uDv
         pD+Gm7aLlGlhgDGA0GAEW/5typyempa9YfQtZHlGmoGF0fRu+nu/NkWHHefUV4DKFweZ
         +yFUlnxbKmyuGIQgKLDzVIySlQM8A5y5yNNiX8gIlptFHUQH4mtBc8QiK+2i8uromRMs
         teGzHk+RHP1N0upboZ/ZCxmI4lOr69Ilxa2qbF3U1wcWIKHho6pZm47ffS5b0yVAMUzM
         KS87AVVLFVoXi3ocFYKMCt0lTUsstb8G5DjlQTliP02+tn+SYLxWU15PCaY6DUW6RA1s
         y6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tE3dfcq3okvYXoWU0ocsguF5oIBkT2unYEhCfWoYOM=;
        b=oBwoOWqkyywKotz1G9y6oKKPLUvqPA3/A5ryXGaBW2AQe5ITcYF3yf2CK1hY5Aesm5
         T05DBPsI06YCvOfTC5XZ/ZhI/kZBncV+ox4Ro6P8kNtcCYAqAQigbwA6fSnd2WgEih6j
         CIISvBZXd2MuYVAtD1AqlfKZamDUHtGLdsESS+SQYCtOHnPOYQK1rCIi7k2QqUaujtdg
         YQUXW4KGfIAN1EkwiaGpP1meNGmJjhlXxNj2vl8fbJf5CN9xeOaWFGGoQ2fEMef0hzvv
         fMd3ji3W6wcy62VFExn7B/c3W3tKZc1WvnJaI6Ry0N4q7mdhz3URr4LKAy7BP1cKy+Ua
         wh8A==
X-Gm-Message-State: AOAM530UKqpuoK+7RmoE5gVJlQxh/0XloKRU4VDTFzQHkXy3KgK4DCJX
        7Jz+BuxFfIimpYs8su/6SCAZmhPS2SJcPK6q65WqN3z3
X-Google-Smtp-Source: ABdhPJzeZv1VLzUIetbLzrTAkUocQp7mevbuUIwUxQNrJJztnaJN/NH8rH+CsUUTUCkU4MjVIFcDATal7vDKkVYD7MQ=
X-Received: by 2002:a62:7657:: with SMTP id r84mr57572054pfc.130.1594322452579;
 Thu, 09 Jul 2020 12:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
 <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com> <CADjEuPtkKjBqCXxVUHX9f19cAkW10uss2QyYn5P-b=XNeg6gRg@mail.gmail.com>
In-Reply-To: <CADjEuPtkKjBqCXxVUHX9f19cAkW10uss2QyYn5P-b=XNeg6gRg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 22:20:36 +0300
Message-ID: <CAHp75VeubG03p=A8aEERjsnF1idVc40gmGAwgB=8rp9ZOHPZGw@mail.gmail.com>
Subject: Re: [RESEND PATCH] system76-acpi: Fix brightness_set schedule while atomic
To:     Nick Shipp <git@segbrk.com>
Cc:     Jeremy Soller <jeremy@system76.com>, productdev@system76.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 9, 2020 at 10:13 PM Nick Shipp <git@segbrk.com> wrote:
>
> On Thu, Jul 9, 2020 at 2:50 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > This patch is mangled and can not be applied.
>
> Wow, let's try that one more time. I made the mistake of thinking the
> gmail web interface would actually work for sending a patch. I'll
> resend after I set up a proper client.

Please, increase a version number as well to avoid confusion and don't
forget to add a changelog after cutter ('---') line.
Thanks!


-- 
With Best Regards,
Andy Shevchenko
