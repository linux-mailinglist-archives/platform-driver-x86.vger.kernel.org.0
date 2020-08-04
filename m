Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5998623BCC3
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Aug 2020 16:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729310AbgHDO4t (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 4 Aug 2020 10:56:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56205 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726556AbgHDO4q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Aug 2020 10:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596553005;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DMOTVo2nXPJDPcxy6Vss9JxAA8ekMj6IlI6j1pIdU+g=;
        b=ibmRJql/kojVYsqW/Llvblq7TSKIJv0vGKFKEsdYgOHGBYMV3Xgv2Es0YRxGnkEz4qtRvf
        CdLeDQI0VkSvw1BkYhd5AN4k/F+FfAyrEBfKzjDOQKabeV2eIR8rrek7Xc4oDbpfvJc/9a
        NeEP43qQvBsx9jGmqKrax6wNqpsg4Dw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-sgEWH1yEPLOqX6Ehiv_m2Q-1; Tue, 04 Aug 2020 10:56:42 -0400
X-MC-Unique: sgEWH1yEPLOqX6Ehiv_m2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3930E1B2C983;
        Tue,  4 Aug 2020 14:56:41 +0000 (UTC)
Received: from gondolin (ovpn-112-169.ams2.redhat.com [10.36.112.169])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A978689501;
        Tue,  4 Aug 2020 14:56:36 +0000 (UTC)
Date:   Tue, 4 Aug 2020 16:56:34 +0200
From:   Cornelia Huck <cohuck@redhat.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>,
        platform-driver-x86@vger.kernel.org,
        Darren Hart <dvhart@infradead.org>,
        virtualization@lists.linux-foundation.org,
        Andy Shevchenko <andy@infradead.org>
Subject: Re: [PATCH v2 18/24] mlxbf-tmfifo: sparse tags for config access
Message-ID: <20200804165634.4df11c6b.cohuck@redhat.com>
In-Reply-To: <20200803205814.540410-19-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
        <20200803205814.540410-19-mst@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 3 Aug 2020 17:00:01 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> mlxbf-tmfifo accesses config space using native types -
> which works for it since the legacy virtio native types.
> 
> This will break if it ever needs to support modern virtio,
> so with new tags previously introduced for virtio net config,
> sparse now warns for this in drivers.
> 
> Since this is a legacy only device, fix it up using
> virtio_legacy_is_little_endian for now.

I'm wondering if the driver should make this more explicit?

No issues with the patch, though.

> 
> No functional changes.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>

