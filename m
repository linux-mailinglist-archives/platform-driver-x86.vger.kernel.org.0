Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4B9519F965
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 Apr 2020 17:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgDFP5u (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Apr 2020 11:57:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40553 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728690AbgDFP5u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Apr 2020 11:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586188669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mYadafEf2dHzsAtvL1A3mRX9tgv7C1wkjybbY7fHUNg=;
        b=TZ0XCPxqEoN3gO6pm0KZABYBbTQ15LFkI8aGCtApnHrdeQxBQF2ZksUWwvsYvesBgNSa6s
        opgdT6xIrGvbSLajTPCcXu8hi4KPNK3zevfMlWYUjKt4gHrch1pRubQf+J4Ktj2WLwIZKd
        BalkfYBCh+eD+2dZe/T619NpcekFX88=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-97WjPP9-OdmkUguQQ4Kb3A-1; Mon, 06 Apr 2020 11:57:47 -0400
X-MC-Unique: 97WjPP9-OdmkUguQQ4Kb3A-1
Received: by mail-wr1-f71.google.com with SMTP id k11so14115wrm.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2020 08:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mYadafEf2dHzsAtvL1A3mRX9tgv7C1wkjybbY7fHUNg=;
        b=tryF2j16R1maXe89r/XZTVw+9Xco/HuUe1FN/CBIPbV1bJZ/4dwEwJCC6VQ+jKGRYe
         5UStZhlm5BOrat7wsxqsXRmWDzWcfAvYowaGNzsjSMYsj8z2kB/ytfN8/Hl8JSlVzYt5
         1qplFIlPdtEDvWzZwSUi4TgRHDRttHUaNu5MzgMcnXkQmeG9sFpYxWi2ToUXuuXYKkm0
         q/sTWUQsnkJRit1LxqFtbsmuU2ObMFmTMJPybO7Whb0Ojfl/MTP+u+Au5q/5/K7sZ6Y8
         jO7NY3qnc6IGGk+3RCdZg0GER3LfpKogApIkXX13yxZ0yq1VhsZvJ2nfwFOXYYx7cs9P
         JVdA==
X-Gm-Message-State: AGi0PubyMd6zkrIAr9973fE4Job8bIcoWCEItwcG930/D/uWx4BBoRWw
        BHXA6YLnrBny+nSUBTl3YwgL3ZeudVESK2o0+51nRcRR9QDFN7C5IWdXKWAQB5rJkdsxl9LZuMo
        YLo+TUJ+iggsCwLS3VLMTPNZLpqGbQZw5sg==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr8809750wrr.354.1586188666451;
        Mon, 06 Apr 2020 08:57:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypJIgQGlWFOIgWSCeubvPOjYqpvDuQLV4/yUVkI1Zn2LL67ge2cp9C7u+SLHfxdIwD4AcPvUdA==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr8809739wrr.354.1586188666301;
        Mon, 06 Apr 2020 08:57:46 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id f3sm37676wmj.24.2020.04.06.08.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 08:57:45 -0700 (PDT)
Date:   Mon, 6 Apr 2020 11:57:43 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, Sudeep Dutt <sudeep.dutt@intel.com>,
        Ashutosh Dixit <ashutosh.dixit@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Jason Wang <jasowang@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 1/2] virtio: stop using legacy struct vring
Message-ID: <20200406115653-mutt-send-email-mst@kernel.org>
References: <20200406153245.127680-1-mst@redhat.com>
 <20200406153245.127680-2-mst@redhat.com>
 <20200406155602.GA160445@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406155602.GA160445@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Apr 06, 2020 at 05:56:02PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 06, 2020 at 11:35:23AM -0400, Michael S. Tsirkin wrote:
> > struct vring (in the uapi directory) and supporting APIs are kept
> > around to avoid breaking old userspace builds.
> > It's not actually part of the UAPI - it was kept in the UAPI
> > header by mistake, and using it in kernel isn't necessary
> > and prevents us from making changes safely.
> > In particular, the APIs actually assume the legacy layout.
> > 
> > Add struct vring_s (identical ATM) and supporting
> > legacy APIs and switch everyone to use that.
> 
> How are we going to know that "struct vring_s" is what we need/want to
> use?  What does "_s" mean?
> 
> "struct vring_kernel"?
> 
> naming is hard...
> 
> greg k-h

Hmm. I guess I can just add an ifdef so kernel doesn't see the UAPI
version anymore ...

-- 
MST

