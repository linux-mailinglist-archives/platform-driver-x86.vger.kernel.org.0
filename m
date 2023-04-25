Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9A86EDA74
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Apr 2023 05:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbjDYDIJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Apr 2023 23:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjDYDII (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2023 23:08:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE7F1BD0;
        Mon, 24 Apr 2023 20:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=nBFqtXx0vNABq18Vz8VpE1uoF7ruSN5UrVhGELTAEOo=; b=eeyOXc0wCK/NL3QlsDzJmcK9DV
        YYV/O8N5Np7CJUZAP5MdhzJouBrXeGudEdn841IqeFsRrbEQmLtO9YJjyH8B0OT8f8Pft2UOaKlQC
        rzWJ13vxm4u97Z3oVycq2YIRtKovICRrCppA+u5iZBp86FQBHtxILDQkjwvSKTNGL7dTQOY/ZfEP4
        MiwoXfgzAiyZnKwau3+XzNijp4CAUWpE9Xppj8pDdH0/XaN1yjt0Rrnl+vSizaH+S564FZI3bjZOV
        saMM+UbFg78oq7uUS9LKJdU9dfJ/on1xeo06kw+tkvdI+bUvUOrTop/WfWbmkl8FzCTn3iZ/G6rF1
        8Nmb/KZA==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pr929-0004jm-14;
        Tue, 25 Apr 2023 03:08:01 +0000
Message-ID: <fd333355-8059-4d7d-7a7e-be67006ad3fc@infradead.org>
Date:   Mon, 24 Apr 2023 20:07:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] platform/x86: wmi: Add documentation
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230424222939.208137-1-W_Armin@gmx.de>
 <20230424222939.208137-4-W_Armin@gmx.de>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230424222939.208137-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi--

On 4/24/23 15:29, Armin Wolf wrote:
> Add documentation for the WMI subsystem. The documentation describes
> both the ACPI WMI interface and the driver API for interacting with
> the WMI driver core. The information regarding the ACPI interface
> was retrieved from the Ubuntu kernel references and the Windows driver
> samples available on GitHub. The documentation is supposed to help
> driver developers writing WMI drivers, as many modern machines designed
> to run Windows provide an ACPI WMI interface.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  Documentation/driver-api/index.rst   |  1 +
>  Documentation/driver-api/wmi.rst     | 21 ++++++
>  Documentation/subsystem-apis.rst     |  1 +
>  Documentation/wmi/acpi-interface.rst | 96 ++++++++++++++++++++++++++++
>  Documentation/wmi/index.rst          | 18 ++++++
>  MAINTAINERS                          |  2 +
>  6 files changed, 139 insertions(+)
>  create mode 100644 Documentation/driver-api/wmi.rst
>  create mode 100644 Documentation/wmi/acpi-interface.rst
>  create mode 100644 Documentation/wmi/index.rst
> 

> diff --git a/Documentation/driver-api/wmi.rst b/Documentation/driver-api/wmi.rst
> new file mode 100644
> index 000000000000..6ca58c8249e5
> --- /dev/null
> +++ b/Documentation/driver-api/wmi.rst
> @@ -0,0 +1,21 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +==============
> +WMI Driver API
> +==============
> +
> +The WMI driver core supports a more modern bus-based interface for interacting
> +with WMI devices, and an older GUID-based interface. The latter interface is
> +considered to be deprecated, so new WMI drivers should generally avoid it since
> +it has some issues with multiple WMI devices and events sharing the same GUIDs
> +and/or notification IDs. The modern bus-based interface instead maps each
> +WMI device to a :c:type:`struct wmi_device <wmi_device>`, so it supports
> +WMI devices sharing GUIDs and/or notification IDs. Drivers can then register
> +a :c:type:`struct wmi_driver <wmi_driver>`, which will be bound to compatible
> +WMI devices by the driver core.
> +
> +.. kernel-doc:: include/linux/wmi.h
> +   :internal:

There are no kernel-doc comments in include/linux/wmi.h, so this
causes a kernel-doc warning:

../include/linux/wmi.h:1: warning: no structured comments found

Otherwise this all looks good.


Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
