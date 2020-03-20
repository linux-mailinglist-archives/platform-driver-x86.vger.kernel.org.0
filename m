Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD6A18D0B3
	for <lists+platform-driver-x86@lfdr.de>; Fri, 20 Mar 2020 15:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbgCTOZm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 20 Mar 2020 10:25:42 -0400
Received: from mail-pj1-f42.google.com ([209.85.216.42]:37211 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgCTOZm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Mar 2020 10:25:42 -0400
Received: by mail-pj1-f42.google.com with SMTP id ca13so2529741pjb.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2020 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6W4srFJVmCR42ZSMxC0CIO7+VYFI5vVMRCJ5y/hc2Ms=;
        b=jLkyqjNh1Cww3h0PrN9VM8lxEzSx4uDiFSCREh6yyAlyaV1NHL0SGnEOINPg5jR3Y3
         yNkTV1SP1vsUk/f1YrfRMl6oWhNTbyw/Y9Y1YICx8re4xIV7zbcFFWjX4jEk9eCDgzUx
         vxyagOaDbAxY58lG2co4JyRUNdgL1mByaUb+s7scXlpKwMYufN4oQsIdY4XhL71QgroG
         ZQVJhYKbE9K7NhK7rIityWOB1Pp93PmPDNIwzrEXYdtGEXtqg9YnIEmUVT9sQIlOXo4s
         BnVtIxU4eRAt2fiM57Yjr724BMnvW2IAbvhW8ZyM2dk+frjo2d/6VY58X9bFohU5J9CU
         h8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6W4srFJVmCR42ZSMxC0CIO7+VYFI5vVMRCJ5y/hc2Ms=;
        b=rfyq4DL1PI+Hmn9Jf5MUy6zC57LpN31/BrRSN14hUWHOsBu/tin/st6+N1vHQVTGm9
         aSdE1zN8T0GPsFVPHJn3hGdsR1ISbI75MpXz9JDryh+34v0nZz77B28PghiiZjNmYDSs
         8hKD0i/wcFFD8a1Yiox4KlI1RKWWaJHJWBrIWhgB2X9Fq3S1OrhmTyV73bFZr6QWFzIG
         YQICm1PoOCOenj3U5e2xAUBsBIdqx5OkPkPpv0gd99NElTsE94BAVhsew0KGnSplcMFM
         Z+6XhQzWXJfPmkJhtw+hrxeUWkwraNjb3uev0DUmVE3Pi7FehDnNukO43UDDcOfmWolA
         fhHA==
X-Gm-Message-State: ANhLgQ0G1KicJ00P6VgVtDxATRUT1gU10hD2nIWQSRkgnUG/y4kpiLWx
        7nDhPMYetk4lnvdK3vbWjeeFbuhQYILniF0ej2c=
X-Google-Smtp-Source: ADFU+vuzrmwsIzX2wMNXvaY4ysWbP+NcK9mypKcoSp+b1eO4Q3MeapJqlNe09ClWLOfc4hAYMZ4BhzCn9M/0hbdRQ4M=
X-Received: by 2002:a17:90a:f007:: with SMTP id bt7mr5562716pjb.1.1584714341204;
 Fri, 20 Mar 2020 07:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <a53f7cc8-a054-4afb-b8d6-a318347614c5@www.fastmail.com>
 <CAHp75VeiYE3sPtNEw+uLAwyhx6RBd-MHK1Y=XTxD99YHKRG2TA@mail.gmail.com> <eb437cb4-9e11-4f94-98f0-f7a1011c0570@www.fastmail.com>
In-Reply-To: <eb437cb4-9e11-4f94-98f0-f7a1011c0570@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 20 Mar 2020 16:25:33 +0200
Message-ID: <CAHp75VeCm_0+AknrnEyEioCtiZT_VzPZUrsjns3UaObogoMoPA@mail.gmail.com>
Subject: Re: [PATCH] [v4] platform/x86: surface3_power: MSHW0011 rev-eng implementation
To:     =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Mar 20, 2020 at 3:28 AM Bla=C5=BE Hrastnik <blaz@mxxn.io> wrote:
>
> > Unfortunately it does not apply to our for-next branch. Care to rebase?
>
> Sorry about that! I've gone ahead and rebased it on top of for-next.

Awesome, thanks!

However, you forgot to bump the version and patchwork misses it, so,
please send it correctly.

--=20
With Best Regards,
Andy Shevchenko
