Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8430FF04F9
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 Nov 2019 19:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390423AbfKESVy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 Nov 2019 13:21:54 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34403 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389356AbfKESVy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Nov 2019 13:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572978113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w9g15sENYBEZnjXMt46nW0z05EByEidvyKLXDGTiGtk=;
        b=MDj6K9ouAzeVjurOs7zKasZQmfKRli1usT0rBvUE5nqZWsdGZZAywZOEBbsh7tlUVEHYIx
        GqTMIZdYadz9R1BEvOSJFtCVgu/jJqd3FDHambnYxKXcfzdH4K/DMLM38yZ0G62rjpefpm
        2E/SxpJ/Vy1TXiJPLuiYOcNLcryzeew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-Dwlai_faOi6eYeoD9w8hrg-1; Tue, 05 Nov 2019 13:21:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6E581005500;
        Tue,  5 Nov 2019 18:21:50 +0000 (UTC)
Received: from prarit.bos.redhat.com (prarit-guest.khw1.lab.eng.bos.redhat.com [10.16.200.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 63A8D5C1BB;
        Tue,  5 Nov 2019 18:21:50 +0000 (UTC)
Subject: Re: [RESEND][PATCH 00/10] intel-speed-select tool updates targetted
 for 5.5
To:     andriy.shevchenko@intel.com
Cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191010202945.73616-1-srinivas.pandruvada@linux.intel.com>
From:   Prarit Bhargava <prarit@redhat.com>
Message-ID: <905ec7d0-bc1b-987c-a9db-e898d7ba7e96@redhat.com>
Date:   Tue, 5 Nov 2019 13:21:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191010202945.73616-1-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Dwlai_faOi6eYeoD9w8hrg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/10/19 4:29 PM, Srinivas Pandruvada wrote:
> There are no new patches in this series. This is just for clean apply on
> 5.4-rc1 for Andriy.
>=20

Andriy, what is the location of your "next" tree?

Thanks,

P.

