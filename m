Return-Path: <platform-driver-x86+bounces-2232-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EC88A3A2
	for <lists+platform-driver-x86@lfdr.de>; Mon, 25 Mar 2024 15:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 369211C39286
	for <lists+platform-driver-x86@lfdr.de>; Mon, 25 Mar 2024 14:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CDF16F84C;
	Mon, 25 Mar 2024 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TKtB8jWs"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE37184EEA
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711359898; cv=none; b=G6gotRZdLsZ81Zjjw1MBT05DcDF16k+DxMrx1hI7yDECL2JsfcaPHTH6snXwVmEfRoIcjjS2+ymawGkhiZGozf/tydx26+WOwA940EafcyTNg//zimpl8HUsDhK0WzMPNcpWkUEehcbxp9Rvj8IIffkSNNV8ry4n+8mvvmvjzTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711359898; c=relaxed/simple;
	bh=yKCyNRThwZiKQFl3ZGytN6SP5I5cAUdIfq1PtSY8/0o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZmFHd5EWd8hjiosHkwDGevhUOeoqVxmBl3+wtnLg8dvRh5sMgoIuQWT6YmM21bzoCZDXE9YB03Vri28AQVPlEHMDAScKUgZyx3Nm15ngqtq2Sc4BWB6wVYTDet3rQBZzQqp7fNkQqKUsLi734aas5rnhb6FTqfrbLo2RhxM7Hhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TKtB8jWs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711359894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BdmZcxTxaezoD4ADz7mbOH050D8bZAskNFuCnh+xicc=;
	b=TKtB8jWs2OhZ6FNfRWaFLKfu2LLgX0/Hkugz6DqNBFr7yGbZzw7QmYGHkoG94ef2+/At+W
	9gNCWnm2FUnwJ8KlH3NIcf5AtnsChHxVNA5s7ljS7mjwpkRKTWkzvC6zPsp8Lp1SGgAuEN
	dL7CJM+esachJOYaeQrrDT2ezY7AvTk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-4bwf4HvHONWvCeWH0UPaXQ-1; Mon,
 25 Mar 2024 05:44:51 -0400
X-MC-Unique: 4bwf4HvHONWvCeWH0UPaXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488B628B6AA2;
	Mon, 25 Mar 2024 09:44:50 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FD631C060A4;
	Mon, 25 Mar 2024 09:44:48 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David Hildenbrand
 <david@redhat.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
 <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH vhost v4 1/6] virtio_balloon: remove the dependence
 where names[] is null
In-Reply-To: <1711346901.0977402-2-xuanzhuo@linux.alibaba.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240321101532.59272-1-xuanzhuo@linux.alibaba.com>
 <20240321101532.59272-2-xuanzhuo@linux.alibaba.com>
 <CABVzXAkwcKMb7pC21aUDLEM=RoyOtGA2Vim+LF0oWQ7mjUx68g@mail.gmail.com>
 <b420a545-0a7a-431c-aa48-c5db3d221420@redhat.com>
 <1711346901.0977402-2-xuanzhuo@linux.alibaba.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 25 Mar 2024 10:44:47 +0100
Message-ID: <87zfum7ii8.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

On Mon, Mar 25 2024, Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:

> On Fri, 22 Mar 2024 22:02:27 +0100, David Hildenbrand <david@redhat.com> =
wrote:
>> On 22.03.24 20:16, Daniel Verkamp wrote:
>> > On Thu, Mar 21, 2024 at 3:16=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alib=
aba.com> wrote:
>> >>
>> >> Currently, the init_vqs function within the virtio_balloon driver rel=
ies
>> >> on the condition that certain names array entries are null in order to
>> >> skip the initialization of some virtual queues (vqs). This behavior is
>> >> unique to this part of the codebase. In an upcoming commit, we plan to
>> >> eliminate this dependency by removing the function entirely. Therefor=
e,
>> >> with this change, we are ensuring that the virtio_balloon no longer
>> >> depends on the aforementioned function.
>> >
>> > This is a behavior change, and I believe means that the driver no
>> > longer follows the spec [1].
>> >
>> > For example, the spec says that virtqueue 4 is reporting_vq, and
>> > reporting_vq only exists if VIRTIO_BALLOON_F_PAGE_REPORTING is set,
>> > but there is no mention of its virtqueue number changing if other
>> > features are not set. If a device/driver combination negotiates
>> > VIRTIO_BALLOON_F_PAGE_REPORTING but not VIRTIO_BALLOON_F_STATS_VQ or
>> > VIRTIO_BALLOON_F_FREE_PAGE_HINT, my reading of the specification is
>> > that reporting_vq should still be vq number 4, and vq 2 and 3 should
>> > be unused. This patch would make the reporting_vq use vq 2 instead in
>> > this case.
>> >
>> > If the new behavior is truly intended, then the spec does not match
>> > reality, and it would need to be changed first (IMO); however,
>> > changing the spec would mean that any devices implemented correctly
>> > per the previous spec would now be wrong, so some kind of mechanism
>> > for detecting the new behavior would be warranted, e.g. a new
>> > non-device-specific virtio feature flag.
>> >
>> > I have brought this up previously on the virtio-comment list [2], but
>> > it did not receive any satisfying answers at that time.

I had missed it back then, but now that I read it, I realize that we
really have a bit of a mess here :/

>>
>> Rings a bell, but staring at this patch, I thought that there would be
>> no behavioral change. Maybe I missed it :/
>>
>> I stared at virtio_ccw_find_vqs(), and it contains:
>>
>> 	for (i =3D 0; i < nvqs; ++i) {
>> 		if (!names[i]) {
>> 			vqs[i] =3D NULL;
>> 			continue;
>> 		}
>>
>> 		vqs[i] =3D virtio_ccw_setup_vq(vdev, queue_idx++, callbacks[i],
>> 					     names[i], ctx ? ctx[i] : false,
>> 					     ccw);
>> 		if (IS_ERR(vqs[i])) {
>> 			ret =3D PTR_ERR(vqs[i]);
>> 			vqs[i] =3D NULL;
>> 			goto out;
>> 		}
>> 	}
>>
>> We increment queue_idx only if an entry was not NULL. SO I thought no
>> behavioral change? (at least on s390x :) )

The code for pci behaves in the same way.

>>
>> It's late here in Germany, so maybe I'm missing something.
>
> I think we've encountered a tricky issue. Currently, all transports handl=
e queue
> id by incrementing them in order, without skipping any queue id. So, I'm =
quite
> surprised that my changes would affect the spec. The fact that the
> 'names' value is null is just a small trick in the Linux kernel implement=
ation
> and should not have an impact on the queue id.
>
> I believe that my recent modification will not affect the spec. So, let's
> consider the issues with this patch set separately for now. Regarding the=
 Memory
> Balloon Device, it has been operational for many years, and perhaps we sh=
ould
> add to the spec that if a certain vq does not exist, then subsequent vqs =
will
> take over its id.

The changes here do not really seem to affect the spec issue that Daniel
had noted, unless I'm reading the code wrong.

However, we should try to address the spec mess, where we have at least
some of the most popular/important implementations behaving differently
than the spec describes... I would suggest to discuss that on the virtio
lists -- but they are still dead, and at this point I'm just hoping
they'll come back eventually :/


