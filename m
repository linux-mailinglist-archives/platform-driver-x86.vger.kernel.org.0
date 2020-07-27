Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE54622EAA7
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 13:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgG0LEG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 07:04:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35547 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726311AbgG0LEG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 07:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595847844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TYZO8UGubVO6b7TbEK9k+KaBQ0ioiWH78ppSx0l6/rM=;
        b=Ncyy5Tm1A7N41s0D/DINCmhULkBKx3ypi8A4ljUypq+Efd8s4RgHBvaLDAZ99TiJOyPGM3
        rAyVaj5CStPaHeCkztPkSkjHZHFFRTjtrClcm7Xr4jDYEQ8w/1T8LFM5Xw7yb71QqjkLZn
        ojYQiRk1uMx42C0kzP61OS9zM2vPaG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-NA2wYjmLO_yPOSUdgtAlwQ-1; Mon, 27 Jul 2020 07:03:55 -0400
X-MC-Unique: NA2wYjmLO_yPOSUdgtAlwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88C62106B244;
        Mon, 27 Jul 2020 11:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D70D5C1B2;
        Mon, 27 Jul 2020 11:03:54 +0000 (UTC)
Received: from zmail20.collab.prod.int.phx2.redhat.com (zmail20.collab.prod.int.phx2.redhat.com [10.5.83.23])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D4B8180954D;
        Mon, 27 Jul 2020 11:03:54 +0000 (UTC)
Date:   Mon, 27 Jul 2020 07:03:54 -0400 (EDT)
From:   Bastien Nocera <bnocera@redhat.com>
To:     Nitin Joshi1 <njoshi1@lenovo.com>
Cc:     Mark RH Pearson <markpearson@lenovo.com>,
        Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>,
        ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br,
        platform-driver-x86@vger.kernel.org
Message-ID: <321690127.4797880.1595847834329.JavaMail.zimbra@redhat.com>
In-Reply-To: <SG2PR03MB2718DFC08C4ECF7816D1B4E48C720@SG2PR03MB2718.apcprd03.prod.outlook.com>
References: <markpearson@lenovo.com> <20200629191748.3859-1-markpearson@lenovo.com> <732277929.1313334.1593596757447.JavaMail.zimbra@redhat.com> <SG2PR03MB2718DFC08C4ECF7816D1B4E48C720@SG2PR03MB2718.apcprd03.prod.outlook.com>
Subject: Re: [External]  Re: [ibm-acpi-devel] [PATCH v4] platform/x86:
 thinkpad_acpi: lap or desk mode interface
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.36.114.75, 10.4.195.19]
Thread-Topic: [External]  Re: [ibm-acpi-devel] [PATCH v4] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Thread-Index: AQHWY8DIP68AvAZQjE24ENYf+sTd3Jx998kl
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



----- Original Message -----
> Hello Bastien
> 
> >-----Original Message-----
> >From: Bastien Nocera <bnocera@redhat.com>
> 
> >----- Original Message -----
> >> Newer Lenovo Thinkpad platforms have support to identify whether the
> >>   system is on-lap or not using an ACPI DYTC event from the firmware.
> >>
> >>   This patch provides the ability to retrieve the current mode via sysfs
> >>   entrypoints and will be used by userspace for thermal mode and WWAN
> >>   functionality
> >>
> >> Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
> >> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
> >> Reviewed-by: Sugumaran <slacshiminar@lenovo.com>
> >> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> >
> >
> >You can add my:
> >Reviewed-by: Bastien Nocera <bnocera@redhat.com>
> 
> It's already added in latest patch and currently in "for-next"
> http://git.infradead.org/linux-platform-drivers-x86.git/commit/acf7f4a59114471c3964f118564fe8e7a6f34bb8

I sent my message nearly a month ago, 2 days before the authoring date
of the patch that was merged, so I'm not sure what you're trying to
tell me here :)

