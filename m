Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB61210883
	for <lists+platform-driver-x86@lfdr.de>; Wed,  1 Jul 2020 11:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgGAJqD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 1 Jul 2020 05:46:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38203 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726343AbgGAJqC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Jul 2020 05:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593596761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fm2hacvcJh/LVKAI6LvO72ISQWLbBcTh99ZHxmp5Tvc=;
        b=gdeyzjdplJVHbWS3NyIke1OiauBcuT3lY2qvUbQ2e5ydVtO89vitiBOfTvdSt/B1ljV+Du
        SXqu5SWEUtxusY+z3N7LED+B51yESJQ/hXKzhKvIBc6YxAFU19J1mdwwossDpQgsN9yCWR
        5n2eNIqaV+2MXeiLjJtU2LB6HVzdJNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-55JdHF1DMqi0lGH3NpVi9w-1; Wed, 01 Jul 2020 05:45:59 -0400
X-MC-Unique: 55JdHF1DMqi0lGH3NpVi9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00BD319057A0;
        Wed,  1 Jul 2020 09:45:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id EB09A1025EB0;
        Wed,  1 Jul 2020 09:45:57 +0000 (UTC)
Received: from zmail20.collab.prod.int.phx2.redhat.com (zmail20.collab.prod.int.phx2.redhat.com [10.5.83.23])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id C60371809542;
        Wed,  1 Jul 2020 09:45:57 +0000 (UTC)
Date:   Wed, 1 Jul 2020 05:45:57 -0400 (EDT)
From:   Bastien Nocera <bnocera@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
Message-ID: <732277929.1313334.1593596757447.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200629191748.3859-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com> <20200629191748.3859-1-markpearson@lenovo.com>
Subject: Re: [PATCH v4] platform/x86: thinkpad_acpi: lap or desk mode
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.36.114.193, 10.4.195.20]
Thread-Topic: platform/x86: thinkpad_acpi: lap or desk mode interface
Thread-Index: DNhKh74HzXWd2JukZKZQM+djAoanYA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



----- Original Message -----
> Newer Lenovo Thinkpad platforms have support to identify whether the
>   system is on-lap or not using an ACPI DYTC event from the firmware.
> 
>   This patch provides the ability to retrieve the current mode via sysfs
>   entrypoints and will be used by userspace for thermal mode and WWAN
>   functionality
> 
> Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
> Reviewed-by: Sugumaran <slacshiminar@lenovo.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>


You can add my:
Reviewed-by: Bastien Nocera <bnocera@redhat.com>

Cheers

