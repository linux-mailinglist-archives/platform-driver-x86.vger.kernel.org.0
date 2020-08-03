Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F5823AADA
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 18:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgHCQrt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 12:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726888AbgHCQrt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 12:47:49 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA9EC06174A
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2020 09:47:49 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h12so8828478pgf.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2020 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5f4Tu9DGFia7ncKFXtvAYOAEASARYpUErdWmkWwCZOY=;
        b=tBnWWNalJPVi1FuHf2TepjnFeWrRu/rhLMiWv788tIRTSruAhyeLJWfqA8bOOTrqB/
         nORBpoK6t70HPx+D7cLk9qZUJX+txTtDl4SIEtbmHxUMMPz77JjtwcDTGzt+dsN3fHy1
         LcdgYMPUwMnXuXOaqGAn0wz8njd0gZXCXDS9Bu/CRC0AGdQnJdAG6a8dR9iBjWO1BPWo
         +EPpNH7e0zT/iub1N7mcqegvJktvkXymD90T3Uc8SW14HvkbxEprDC4kiZy/kli941vE
         HWmo7wKZ9KjIDawevyi1m6XbD9O+zN7hBUdrqt5VZu/B0Yhap9u9qEB6yHEclH98AWrx
         hJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5f4Tu9DGFia7ncKFXtvAYOAEASARYpUErdWmkWwCZOY=;
        b=fFCDZFjM7vbytOBkl9r7qdSpvMvNthHIVrVCy4RgJtMA1ZlhbqbEiklc69AkhECS5a
         zkt5O0BN7bNPZagzS+WjwoqxX6bB7ay5epifwGI1oCEjiCFPnGnVxm3xy3xL8nBpqtbm
         RLVeTfjd6sokKeglLkf2Ia/6dw4+Dt7A607OMcI6PzebnggUPvEs1oQT5+oQ15I9E4yY
         yXASwFHMWMTZOB1BnKJRaRbWBVo0piGpiVhWYAgzHod0CEuryI/MaJIw7QpLFMFpiWWn
         m+Tc0AxfJnHrh2sJnelwMAU/mhDKxgozQjQVeo+RVNkqIIk1UkHs5ycTj5s+37vb/LwR
         dQqQ==
X-Gm-Message-State: AOAM530m0tDP3Av5mO9JyOylia313HnCpbp6zGv5r3LPWqxg9qr/j/ZS
        0O3phBXTT8aKe1+SmLOqKOxBxClARqF1UZuRS8k=
X-Google-Smtp-Source: ABdhPJzos3cwtzAdxl9VY7VvWDUTdmSpyaPq1u/sSnKGzl0KN/oKYSD9P0eKiQeFyKHR4D0E3+2Y3+54TPK//b56KE0=
X-Received: by 2002:a63:924b:: with SMTP id s11mr15157741pgn.74.1596473268646;
 Mon, 03 Aug 2020 09:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200802041705.79870-1-zappel@retarded.farm> <CAHp75Vf9BwaU2y3smc0pMpohLcAbbQt_RDS1kzzgOsbqN2ZaEA@mail.gmail.com>
 <ba68ddc0216ee23c772b4e73c84de0a25f9fe53a.camel@retarded.farm>
 <CAHp75Vdwa2DWKYzHFKbK5UB_htuws5sX2Hi64PN0YEOBdFKbZg@mail.gmail.com> <df518901cb2c5a1a4bd96f403f82451f2637e7cb.camel@retarded.farm>
In-Reply-To: <df518901cb2c5a1a4bd96f403f82451f2637e7cb.camel@retarded.farm>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 3 Aug 2020 19:47:33 +0300
Message-ID: <CAHp75VcmsTnZ+AfBCPmxX6GpfM=PRGAd3Y51zaj2WHmcY8XPYQ@mail.gmail.com>
Subject: Re: [PATCH v5] asus-nb-wmi: add support for ASUS ROG Zephyrus G14
 (GA401) and G15 (GA502)
To:     Armas Spann <zappel@retarded.farm>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: Jonathan.
(newbie's adventures below)

On Mon, Aug 3, 2020 at 7:39 PM Armas Spann <zappel@retarded.farm> wrote:

> I think I missed that checklist.. But what I was looking for was some kind of a
> "quick"-list, like that one you send me some weeks ago. (howto use git to send
> those emails, for example)
>
> For a newcomer like me in this process, it's hard to sort out the right
> information and where to put description/changelog/etc. in the (git)patch
> itself. It might be helpful to have an example for a full git-driven patch
> (IMHO) - Yes of course I looked in to other submitted patches to get a clou.
> Because after reading all the kernel howtos to submit and participate, I felt
> more lost then before due to the informational overflow.
>
> And of course, that I screwed up the branch/repo in my last patches was totally
> my fault because I did not recognized that I need to checkout another repo and
> branch to get ontop of my/your previously applied patch in this case.
>
>
> Im very thankful for all the support you gave me, but I think I should have
> asked first, before submitting patches. ;)

But your evaluation of [1] will be quite helpful exactly b/c you are a newbie!
Maybe you can read it again and propose changes that will help people
like you now (I believe you will learn things fast) to be not lost on
the first steps?

> Best regards and thanks for your feedback,
> Armas

Please, avoid top postings in the future. It's not welcome by the community.

...

> > Do you think we need to expand / update checklist [1] in kernel documentation?
> >
> > [1]:
> > https://www.kernel.org/doc/html/latest/process/submit-checklist.html

-- 
With Best Regards,
Andy Shevchenko
