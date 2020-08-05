Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6589C23D05A
	for <lists+platform-driver-x86@lfdr.de>; Wed,  5 Aug 2020 21:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgHETrl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 5 Aug 2020 15:47:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20096 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727987AbgHERBI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Aug 2020 13:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596646856;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZlNXGeTfp4AaGj7FagUROXadawxdtFtkc3vB/EgDPDU=;
        b=fnqUZyJwBTcglKwRnzavTbc2N9y2EQnUhd3PDLCm5pQeqEPV0W1YEMHS4Y7kgadX6vphRE
        hDzPEnxNOq4DY0db1I8MgajPq2+l14uWlVyzHxG2Mtdi5uDSnkdiugyd15xCv0jDZyX6GF
        AtMQk7tTf6unWHXsNs3t8VJBSWTu9lQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-YrkjkeHaOg-ud8AnRsB-pw-1; Wed, 05 Aug 2020 09:29:19 -0400
X-MC-Unique: YrkjkeHaOg-ud8AnRsB-pw-1
Received: by mail-wm1-f70.google.com with SMTP id h6so2459032wml.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2020 06:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZlNXGeTfp4AaGj7FagUROXadawxdtFtkc3vB/EgDPDU=;
        b=ZXzN1hjODq8ngwZCobIyxZ2TbBl2qXS5RcCCeYCvha+cEWdTACzzERNYsH0YkG89+g
         bjhHqA4hAAw2Lzu7sgDjn/rb/qEFHlzUEQLd5kDCoEnA3dprHHkq7kuSqzjl9tq8GO8o
         qqYvu7CQDQrwAv2PVBAgUPguF5yS0Cnx3tsWWpzT3pYQMuSoqwbNOzLpPGqNqKtojn4v
         HQQbVkjbtilJBXp/UTjd9S3i+5pH8XMqTUAuTNVqr8P5kk0upgU8Lun+3Gzib70npbnX
         500FAJPNLfX+apAqB5WjZRK6OFJQtqsSWyXl6H/Zsf9KMogT8qSdjdY+2a+6Cu3/mQA9
         FF6Q==
X-Gm-Message-State: AOAM530Ft1Q8PohaicQj+T7vwTI1guDU/VML2eiLQHq0HFOWAw0dcMZv
        n3bwq5/PwniKYQMUOlOpYRGZiNebK+0OKFMpqMmCB/8sfjRxCEMKnWUvtFczZ9Uv8yfc9HjVbSy
        GYnEl53OFAeoLqLdz6/LIgLv/ALhM/JJqtQ==
X-Received: by 2002:a1c:2dc6:: with SMTP id t189mr3492801wmt.26.1596634158283;
        Wed, 05 Aug 2020 06:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJbh142iguNxC67bdTgdKSa8fH88cZSGiuSiR54HZcWK+ZPtzZyXH9COzQuExoJPoIfhvlDw==
X-Received: by 2002:a1c:2dc6:: with SMTP id t189mr3492788wmt.26.1596634158107;
        Wed, 05 Aug 2020 06:29:18 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
        by smtp.gmail.com with ESMTPSA id d14sm2806981wre.44.2020.08.05.06.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 06:29:17 -0700 (PDT)
Date:   Wed, 5 Aug 2020 09:29:12 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>,
        platform-driver-x86@vger.kernel.org,
        Darren Hart <dvhart@infradead.org>,
        virtualization@lists.linux-foundation.org,
        Andy Shevchenko <andy@infradead.org>
Subject: Re: [PATCH v2 18/24] mlxbf-tmfifo: sparse tags for config access
Message-ID: <20200805092904-mutt-send-email-mst@kernel.org>
References: <20200803205814.540410-1-mst@redhat.com>
 <20200803205814.540410-19-mst@redhat.com>
 <20200804165634.4df11c6b.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804165634.4df11c6b.cohuck@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Aug 04, 2020 at 04:56:34PM +0200, Cornelia Huck wrote:
> On Mon, 3 Aug 2020 17:00:01 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > mlxbf-tmfifo accesses config space using native types -
> > which works for it since the legacy virtio native types.
> > 
> > This will break if it ever needs to support modern virtio,
> > so with new tags previously introduced for virtio net config,
> > sparse now warns for this in drivers.
> > 
> > Since this is a legacy only device, fix it up using
> > virtio_legacy_is_little_endian for now.
> 
> I'm wondering if the driver should make this more explicit?


Not sure how though.

> No issues with the patch, though.
> 
> > 
> > No functional changes.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  drivers/platform/mellanox/mlxbf-tmfifo.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> Acked-by: Cornelia Huck <cohuck@redhat.com>

