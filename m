Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7415E385
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Jul 2019 14:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfGCMKB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Jul 2019 08:10:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:43862 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726305AbfGCMKB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Jul 2019 08:10:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DB066ABCD;
        Wed,  3 Jul 2019 12:09:59 +0000 (UTC)
Date:   Wed, 3 Jul 2019 14:09:58 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: Re: [PATCH] x86: apuv2: Fix softdep statement
Message-ID: <20190703140958.26dfde2b@endymion>
In-Reply-To: <d3d8daee-d54d-8724-56f6-9ee900de7faa@metux.net>
References: <20190629114136.45e90292@endymion>
        <d3d8daee-d54d-8724-56f6-9ee900de7faa@metux.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 3 Jul 2019 13:13:03 +0200, Enrico Weigelt, metux IT consult wrote:
> On 29.06.19 11:41, Jean Delvare wrote:
> > Only one MODULE_SOFTDEP statement is allowed per module. Multiple
> > dependencies must be expressed in a single statement.  
> 
> Thanks for the report. I'll give it a test on actual target, when I'm
> back from travel.
> 
> I recall some strange problems w/ module load order, maybe that's
> exactly the missing piece.

Thanks.

> BTW: just curious whether you happen to be located in Nuremberg ?
> (maybe we could have a coffee some day ;-)).

Nope, I work from France. I have not been in Nuremberg for many years
now, as most of my team is in Prague now so that's where I meet them.

-- 
Jean Delvare
SUSE L3 Support
