Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4C7D815D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Oct 2019 22:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbfJOU6Y (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Oct 2019 16:58:24 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:45533 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728276AbfJOU6Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Oct 2019 16:58:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 9672B785
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2019 16:58:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute1.internal (MEProxy); Tue, 15 Oct 2019 16:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NswnsT
        XrPRTjBqGZtGkP+hKw2e6M8qyo16V1g08aXzM=; b=UVdPD8mRpY+7RPh2Awcvgq
        tr1h6fnPwsMCm+VofXqLG+emts+pY8XFeg8uEp7yuYQg4UoQ13u1U2c8owjFQc+5
        oB3+8RuEPtkWx7gGpPaiJFuZiammRHZ0YTjSQnayBpQF0yl2JmtrYeoX4OSLdnVG
        GJp0TSyWLOD7rN44EOPu0fFx2/ri21RwaOqRNLUYGAP8TpnvriQt3dy3Utl+DQ+k
        Cq3+R2WqUzGzHhPtQGBfjCJD8BTGGJE3Zi1cRnJBkpeTw0NBs0mli79BsUXjm6AL
        BArbRMCu4Hn1A+oFm+kmBzLU5p0fJgjlAjDhSNoBs+Lz0rYR2XF4q2VzHn4Mf6tA
        ==
X-ME-Sender: <xms:7jKmXXxWILGzhptFu22cVRKU8ypVsKQ6Di0OyfjzCj03afe6OHRIRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeefgdduheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedflfgvrhgvmhihucfuohhllhgvrhdfuceojhgvrhgvmhih
    sehshihsthgvmhejiedrtghomheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvg
    hmhiesshihshhtvghmjeeirdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:7jKmXfa7WcUwwcfoacR6t5jUAyR2wcIBYh_ZGSDBYW03qbfX_yJ-sA>
    <xmx:7jKmXZQVr653bMVHV7Dn6g6qK4sPgHKA7eYfGziHtKazLD_YwwY3-A>
    <xmx:7jKmXZzojU24nymutgQ1F2cKbX0hqshZnrwb2LPRp7hnonFCvCQ_Kw>
    <xmx:7zKmXeVmikjZiOxE3UHuiSnz9Y9hDlfl8Frn_R7j6qAazTQP1ME_yw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D997BE00A5; Tue, 15 Oct 2019 16:58:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <e06d6852-6e55-4c9c-8fe1-cc7bd28a8396@www.fastmail.com>
In-Reply-To: <6fda8773-8a22-4432-b0e7-4d2a006ae8f0@www.fastmail.com>
References: <6fda8773-8a22-4432-b0e7-4d2a006ae8f0@www.fastmail.com>
Date:   Tue, 15 Oct 2019 14:57:55 -0600
From:   "Jeremy Soller" <jeremy@system76.com>
To:     platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Add System76 ACPI driver
Content-Type: text/plain
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Please let me know if there is anything else needed or desired for this patch.
