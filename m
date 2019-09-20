Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC15B8B77
	for <lists+platform-driver-x86@lfdr.de>; Fri, 20 Sep 2019 09:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394989AbfITHYO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 20 Sep 2019 03:24:14 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22964 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2394987AbfITHYO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Sep 2019 03:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568964252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KVGyEzIpXZFt2w1fAetDgSLPM6b5VQq1fUVZtxklqxg=;
        b=T/K/G+uQ6WqR2i7HpRgvIGCexUT7RafBucgWZq5muDIu9Zz/bGjVkZU4bHVxHnwQzMddhp
        m+pFU/boGarSDQwwEAsVKo7wyALBlPQgXXYgN4h7yytRL0Xc/VgGU73kjz5RAuVN2flmzw
        ScpMerlcpK4VxyjtJ0yAaUkIfGraTQo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-CMrzk_bQOQ6nhkBC71eVHw-1; Fri, 20 Sep 2019 03:24:11 -0400
Received: by mail-ed1-f71.google.com with SMTP id c23so3612510edb.14
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Sep 2019 00:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p6OkBuWjoxWL/pIuhPJa4NpzgSq8YM2TDi8732wO4HI=;
        b=ACFoLVfrD1JjWMV4NdaV/D9/pL3bF5h6w2Lg5KA8PWKq7YHSXTgLGu/W/McDKh96TQ
         y2XjDXT+fsZiSaMxjcZBTwmweKoNxdcF4kxG0orZj86rVzysJRCJ60z3e/lClC5npZdX
         35rrpOwjmTZr1QPl8T7SHOp9sZCByGtERaysLfAcYXiAczGbbDw/VKGU2lxoc9kLoJ9u
         DNuBWTEzQprc3NP7cDzsCAGSYu979CLp/NVpAnzHYIYf8LplGVx6jZpYcNHdXlITZG5x
         AbEi1SzhLEQZhxDgkRC1qDB66DIx/TrUZIjzwwwoQV9XrEiDbclBA/9BUA/SmKUy6gqJ
         xJtA==
X-Gm-Message-State: APjAAAV8t8n+uFaYVEaw2DZBALmbLVXFBDlbFlVV6Us0OsNgHTVbdg2p
        +c8xB/BA9V2LQfpvDs28sFysI+VCS10bhv1QdjQuIkwkvWlRkinLQtX5q07jd3leRyJ/loa9Gww
        njfwcJjD5mRwRFBrUspKQ+PXRUQtMvA/vQA==
X-Received: by 2002:a17:906:405b:: with SMTP id y27mr18324916ejj.18.1568964250626;
        Fri, 20 Sep 2019 00:24:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBUYNM3WgAtUt0AspuhWHpC/wlZM4YwF+Ndz/2pXA/cE34PTfQGrvd+x1+P7EUBu4MGo19Ag==
X-Received: by 2002:a17:906:405b:: with SMTP id y27mr18324896ejj.18.1568964250445;
        Fri, 20 Sep 2019 00:24:10 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id ha2sm131428ejb.63.2019.09.20.00.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2019 00:24:09 -0700 (PDT)
Subject: Re: [PATCH v3 2/6] platform/x86: huawei-wmi: Add quirks and module
 parameters
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sinan Kaya <okaya@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Takashi Iwai <tiwai@suse.de>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Matan Ziv-Av <matan@svgalib.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Peng Hao <peng.hao2@zte.com.cn>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mattias Jacobsson <2pi@mok.nu>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920003938.21617-1-ayman.bagabas@gmail.com>
 <20190920003938.21617-3-ayman.bagabas@gmail.com>
 <20190920060812.GB473898@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <30a363e5-5691-e008-e1e5-55936fa3cd92@redhat.com>
Date:   Fri, 20 Sep 2019 09:24:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190920060812.GB473898@kroah.com>
Content-Language: en-US
X-MC-Unique: CMrzk_bQOQ6nhkBC71eVHw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 20-09-2019 08:08, Greg Kroah-Hartman wrote:
> On Thu, Sep 19, 2019 at 08:39:07PM -0400, Ayman Bagabas wrote:
>> Introduce quirks and module parameters. 3 quirks are added:
>> 1. Fixes reporting brightness keys twice since it's already handled by
>>     acpi-video.
>> 2. Some models need a short delay when setting battery thresholds to
>>     prevent a race condition when two processes read/write. (will be use=
d later)
>> 3. Matebook X (2017) handles micmute led through the "legacy" interface
>>     which is not currently implemented. Use ACPI EC method to control
>>     this led. (will be used later)
>>
>> 2 module parameters are added to enable this short delay and/or report
>>    brightness keys through this driver.
>=20
> module parameters are a pain to manage and handle over time.  Is there
> any way you can "automatically" figure this out, or use a sysfs file
> instead?

The patch also adds dmi matches to set the quirks, so the module params
are there to override those and/or to easily test which are the right optio=
ns
with new modules. The normal / expected use-case for everything to be set
automatically based on the DMI table.

With that said, the module-params should really always override the dmi val=
ues,
so I would like to suggest to make the module-params int-s instead of bool-=
s
and to do something like this:

static int battery_reset =3D -1;
static int report_brightness =3D -1;

=09quirks =3D &quirk_unknown;
=09dmi_check_system(huawei_quirks);
=09/* If set the module options override the vale from the DMI table */
=09if (battery_reset !=3D -1)
=09=09quirks->battery_reset =3D battery_reset;
=09if (report_brightness !=3D -1)
=09=09quirks->report_brightness =3D report_brightness;

Regards,

Hans


