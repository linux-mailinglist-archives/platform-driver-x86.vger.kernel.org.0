Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AB3264F5B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 10 Sep 2020 21:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgIJTkc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 10 Sep 2020 15:40:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55933 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731363AbgIJPjL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Sep 2020 11:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599752350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=NS3/w5CMrq/HDZKg/+rZVhwIZrYh7X8nJzWWcH2m5qA=;
        b=HW55FJjpH/rRH87UQF4q3iXnhAylCTkUb8eR7Zl39dMkYCPJNsfvbhQmKRUTKvOVmkXfok
        Exfpsk9uBmqs+vivTVGDA6AXsTRjMoXdDBaD13/22QmzS7lmdr5eHwsnQUVAgkj8mRCYQn
        fJRNIHkS8O4L5LtWmflMDHTabVjChew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-vy0yGtYWN8mTXoaBjGZbrg-1; Thu, 10 Sep 2020 11:08:55 -0400
X-MC-Unique: vy0yGtYWN8mTXoaBjGZbrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FEF0CC19A;
        Thu, 10 Sep 2020 15:06:52 +0000 (UTC)
Received: from x1.nl (ovpn-112-105.ams2.redhat.com [10.36.112.105])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 906FF1002D66;
        Thu, 10 Sep 2020 15:06:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/1] platform/x86: asus-nb-wmi: Revert "Do not load on Asus T100TA and T200TA"
Date:   Thu, 10 Sep 2020 17:06:49 +0200
Message-Id: <20200910150650.36764-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

I just found out that this revert, which was commited before did not stick,
I send out the revert pretty quickly after the patch which it reverts and
looking at git history it seems the original patch accidentally got
re-applied after the revert, so now we have:

b5f7311d3a2e ("platform/x86: asus-nb-wmi: Do not load on Asus T100TA and T200TA")
aab9e7896ec9 ("platform/x86: asus-nb-wmi: Revert "Do not load on Asus T100TA and T200TA"")
3bd12da7f50b ("platform/x86: asus-nb-wmi: Do not load on Asus T100TA and T200TA")

With the last 2 commits negating each-other. So here is, in essence a resend
of the revert (I did at a note about this to the commit msg), so that we end
up with the original patch reverted, as was the intention when the first
revert got submitted.

Regards,

Hans

