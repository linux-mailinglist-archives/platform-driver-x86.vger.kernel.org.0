Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 776016EA6B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 19 Jul 2019 19:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbfGSR5c (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 19 Jul 2019 13:57:32 -0400
Received: from proxy03.fsdata.se ([89.221.252.213]:10521 "EHLO
        mail-gw01.fsdata.se" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727497AbfGSR5c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jul 2019 13:57:32 -0400
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Jul 2019 13:57:32 EDT
Received: from localhost (94.234.55.24) by DAG01.HMC.local (192.168.46.11)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jul 2019 19:57:28
 +0200
Date:   Fri, 19 Jul 2019 19:57:27 +0200
From:   Mattias Jacobsson <2pi@mok.nu>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Platform Driver <platform-driver-x86@vger.kernel.org>, <2pi@mok.nu>
Subject: Re: WMI driver extension
Message-ID: <20190719175726.qum5owpztasntlal@mok.nu>
References: <CAHp75VcYZZFutOHntdXYni3TLi4qNmo=XLmvFiMYn49-U-gGOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75VcYZZFutOHntdXYni3TLi4qNmo=XLmvFiMYn49-U-gGOQ@mail.gmail.com>
X-Originating-IP: [94.234.55.24]
X-ClientProxiedBy: PROXY05.HMC.local (192.168.46.55) To DAG01.HMC.local
 (192.168.46.11)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2019-07-17, Andy Shevchenko wrote:
> I have got a report from kbuild bot
> 
> >> include/linux/mod_devicetable.h:803: warning: Function parameter or member 'context' not described in 'wmi_device_id'
> 
> Care to fix it as follow up?

Definitely, see patch "platform/x86: wmi: add missing struct parameter description".

> 
> -- 
> With Best Regards,
> Andy Shevchenko

Thanks,
Mattias
