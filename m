Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B42A5419AD
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jun 2019 02:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405050AbfFLAt1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jun 2019 20:49:27 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46844 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405015AbfFLAt1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jun 2019 20:49:27 -0400
Received: by mail-pg1-f193.google.com with SMTP id v9so6194485pgr.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jun 2019 17:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=iCMVssMue4i78v6tXzq6907ZVYn5+xHglaf31Xw9N4Q=;
        b=kvkkA6XlrOLhsSH04Ky/VZcQ/d2+aO3t4FYB59dqnkyZH1IT23uAjt8fC3gq2OJB4X
         vgD5wVsoHVBp8pqxBEXpOVVHBEP9sQ07uu7jMH5960se5XOvIaWvgjTisge6qvLp/fF4
         bAOzMrQ14Dnak9ZP6AbXOtSoZ9YOIWPkob6w+alcOwcpWjPuNz4AA9Xfotr1FQTqulEr
         YAKYVQ7/Oe1A9Fhdup5xDSBb0DLziUEVcwUdGA3rqAxQR4xWNK3aQFbxHWPfo08BbIGl
         9XNqwChkOw/IOtcHTeFrQScn1rqopAH24Uzjqvebv2jxxJ6aAgTH2ZPFpM8T7c7mkmYA
         Lm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iCMVssMue4i78v6tXzq6907ZVYn5+xHglaf31Xw9N4Q=;
        b=GFopxspTHyH4Po4X9YmXC2wbSAxppKltLbBMwALlMNGwaDREciQvPe+WyT4AOZ3Ulq
         sCYYRlFo+EMQ8Y/V9sC9WFJu6OGDqaUd+j8tdO5EUtAGE0rG/g0NJgW9z0lVu5ijLZbs
         xwOGCNugroz4GSozzUTpWXTYU1kbul08t7uFfkvWw7EoLtM/tz6rOpDZlVbMJsEfvDbs
         zrUnwGwwnkAncmXxxYXMlASqGRevi+jOrMTw28425pj+lSJLHeYgmGcJQVpFLaBjXQL7
         eaeSmzKc0w0DH+yZObWADkzTyGp8EoTBX9SZhGrMVjBX6C/mhVa+2Ei9h+e5QAqv3gnk
         P0mw==
X-Gm-Message-State: APjAAAUaUu6gk9slbjJlKiqGfD9UyKcOYytiUEHO63f/fulnGyaMUPeP
        YKrsOUBTvlzLAiI2wLtgc88=
X-Google-Smtp-Source: APXvYqx/A/RCgr+upMJ4QPtlL4hKNex1t8U/MoPO+HzT1vOts9Rkd7g4Dh+dxKYt+J9jleJmBgI65A==
X-Received: by 2002:a65:42c3:: with SMTP id l3mr22760562pgp.372.1560300566275;
        Tue, 11 Jun 2019 17:49:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c69sm10423951pje.6.2019.06.11.17.49.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 17:49:25 -0700 (PDT)
Date:   Tue, 11 Jun 2019 17:49:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Alex Hung <alex.hung@canonical.com>,
        Tristian Celestin <tristiancelestin@fastmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Make power-button key report the button-up event when
 the 5-button array does not exist
Message-ID: <20190612004923.GH143729@dtor-ws>
References: <13513063.74pX3ZfeIS@sanji>
 <CAHp75VdtuqS1+hqXuLT-0qZiy4WANXhnSmHr6=hUSxheqpiTJQ@mail.gmail.com>
 <CAJ=jquaSc9qjYde7A75KxzGV+XRqJokunV5CbAM28Qge-_Zvrw@mail.gmail.com>
 <1525059933.1098515.1355095072.21C4A0BE@webmail.messagingengine.com>
 <1525062909.1113096.1355123680.2B2A0D81@webmail.messagingengine.com>
 <CAJ=jquZmqQitoHz_asNfqvQhEWepGmNRhY-1kRC+2oyFjoA59Q@mail.gmail.com>
 <CAHp75VcDMjaMWrj_h6Q-xm5AG=Cz1n1pzg1hwaOZGobdzRhfag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcDMjaMWrj_h6Q-xm5AG=Cz1n1pzg1hwaOZGobdzRhfag@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 11, 2019 at 10:00:35PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 30, 2018 at 8:20 AM Alex Hung <alex.hung@canonical.com> wrote:
> >
> > On Sun, Apr 29, 2018 at 9:35 PM, Tristian Celestin
> > <tristiancelestin@fastmail.com> wrote:
> > > I have a patch ready, but I don't know the underlying cause of the problem, and this is preventing from writing a meaningful commit message.
> >
> > According to my understanding, the original intel-hid spec supported
> > 0xC0 notification and events are reported by HDEM method, and an
> > update of "5 button array" added other notification numbers such as
> > 0xce for power button; however, some BIOS failed to report 5 button
> > array is supported via HEBC method, and the DMI quirk was a workaround
> > to always enable 5 button array.
> >
> > I personally think a commit message similar to c454a99d4ce1cebb is
> > good enough, but Andy or Darren will provide more feedbacks if they
> > think a refinement is necessary.
> >
> 
> This is still in the patchwork queue by some reason.
> Can you elaborate if this needed or not? If so, would it be
> anticipated a new version?

Looks another copy of the patch was merged:

commit e97a34563d18606ee5db93e495382a967f999cd4
Author: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Date:   Sun Jan 6 18:56:44 2019 +0100

    platform/x86: intel-hid: Missing power button release on some Dell models

Thanks.

-- 
Dmitry
