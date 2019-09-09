Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 971EDADE10
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Sep 2019 19:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbfIIReY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Sep 2019 13:34:24 -0400
Received: from mail.klausen.dk ([174.138.9.187]:46468 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726836AbfIIReY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Sep 2019 13:34:24 -0400
Subject: Re: [PATCH v3] platform/x86: asus-wmi: Support setting a maximum
 charging percentage
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1568050462;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vv8muC/JqlI8QHFeIdPbhXmdROgxvRw3ReC2dOP5YMY=;
        b=dJ3VTEQ4fqL9pkkTrKPVQFEqvyxjcNmLUmJWgz/WqHnFDV5ZobHWIVJRt4Uqnv3yyKGX40
        3dmQ1UN20Qa6TBDDFKzTMBU+S15g419ySkrpwcMc5mz50jAm+9kDGQg6uAADt+w15gYUF/
        CwBg5LhLTTx2DmJHq/aejCp8yKn4FQM=
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Drake <drake@endlessm.com>,
        =?UTF-8?Q?Ognjen_Gali=c4=87?= <smclt30p@gmail.com>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20190813003023.6748-1-kristian@klausen.dk>
 <CAD8Lp47pSr-0VWqSBTAAJe3Ny5gW2XMXXYxmiH5-EOk42MhvHw@mail.gmail.com>
 <a5f6bd92-076b-57be-75d8-7509b86b5fea@klausen.dk>
 <CAHp75Vek0Ti1jB8J+M09w2LxKpfq9SH8KZkzPwrtXzZr5Krr3w@mail.gmail.com>
 <20190909113016.GW2680@smile.fi.intel.com>
From:   Kristian Klausen <kristian@klausen.dk>
Message-ID: <0107e8e5-0c4d-7e5b-fcd5-b96ae9b71c22@klausen.dk>
Date:   Mon, 9 Sep 2019 19:34:20 +0200
MIME-Version: 1.0
In-Reply-To: <20190909113016.GW2680@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 09.09.2019 13.30, Andy Shevchenko wrote:
> On Sat, Sep 07, 2019 at 08:49:27PM +0300, Andy Shevchenko wrote:
>> On Mon, Aug 26, 2019 at 10:09 PM Kristian Klausen <kristian@klausen.dk> wrote:
>>> On 15.08.2019 05.28, Daniel Drake wrote:
>>> I did notice that V1 of this patch has been merged into the for-next
>>> branch by Andy[1].
>>> Was that a mistake Andy? and how do you want me to proceed? Should I
>>> create a refactoring patch? V1 really isn't the proper way to do this.
>> Oh, I see. Can it be fixed quickly? Then refactoring patch on top of
>> the branch is preferred.
>> Otherwise I will remove the original from the tree. Just tell me which
>> one is more solid.
> Okay, there are a lot of patches on top right now. And we are at last week
> before merge window. So, send me a followup fix on top of our for-next branch.
>
> Sorry for inconvenience.
I just sent a refactoring patch series, feel free to change whatever is 
needed.
