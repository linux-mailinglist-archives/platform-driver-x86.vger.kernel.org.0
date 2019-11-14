Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660AFFC528
	for <lists+platform-driver-x86@lfdr.de>; Thu, 14 Nov 2019 12:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKNLQP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 14 Nov 2019 06:16:15 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60509 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726142AbfKNLQO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Nov 2019 06:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573730173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F40K3Dox6f4nYqgz/+HQOkTb9CcnDZVMJ/KY97drq1A=;
        b=g9qX8HVn67S0Prpux0a0Z5j0WwZhU2TLD2lvTNkoRi1/dufB5vrzov5i+UxiGQlCKzsRgO
        Gsc80o6Yf19VWLXbZDb46nFROfhirfSLh1tXRnKZHnma1qbhClpzDxnAX43zBpv/i3Gjw1
        pBL3kYti2et6xjaF1usqjWHjYOgxXYA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-XcZWuiZFPY24KT4_KtENxA-1; Thu, 14 Nov 2019 06:16:12 -0500
Received: by mail-wr1-f70.google.com with SMTP id y3so4178778wrm.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2019 03:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JQ6k37wyHWFobguUyNeb2ucWLK7BLzU9wGKmeknDgXo=;
        b=LWQm353QKmOboPhzfefT06k6k/9Br/iSXMOZh5LJwQE62e/AzEkvGQQYxJM6XvyOk+
         K6aPBX4KgfoYDo6kbNGL6z3gAOoJFccMb267CGvkFZmJXlInwrNASDAiku4tjS6L0dpk
         g4BtGiXcCjPwEkpdtNmlYKOeUY9Yh92yOGyO1tiBAD/NzE4UmcrJmodskPcRH8IEmC8a
         /Qz4P7+eVdRjd5FQWh/K/LkfgJCP+ENuvuhv5fTATo0aovwg4Jqtpz+cCiJqeWkRcWYc
         mzTUjyODUQrcmgH1a66lVXNw5MxpxgicM/qmXpkLdQwqyDKaQHTHgRZEvZRkvA2mHAxq
         vCEA==
X-Gm-Message-State: APjAAAXBOr8F7C6tj/NZQjLGm13CqJX+UE9a1T4o6hwnVi7n5ghgQh8v
        f9O6xXTlsRB7gXLJFVkvO9QMXNhybxc/I0TYbxnvuCr/s3ACo7dERQY8qrXaf37sB6HfdJfW59a
        xYCvpzwUF2URCK4OjNkqjUyvz2IlNECcRIg==
X-Received: by 2002:a1c:9c54:: with SMTP id f81mr7457519wme.89.1573730171055;
        Thu, 14 Nov 2019 03:16:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqx8yzq3/68IetRMqwOGoep4Iq1BU9cQjndVLISwMb8BnNeJ/tD11D2+UmTbC80Ocv+JBKVcaQ==
X-Received: by 2002:a1c:9c54:: with SMTP id f81mr7457488wme.89.1573730170756;
        Thu, 14 Nov 2019 03:16:10 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id t187sm1484486wma.16.2019.11.14.03.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 03:16:10 -0800 (PST)
Subject: Re: [PATCH 2/3] usb: typec: tcpm: Add support for configuring DP
 altmode through device-properties
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20191018195719.94634-1-hdegoede@redhat.com>
 <20191018195719.94634-2-hdegoede@redhat.com>
 <20191021065549.GA28049@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5a42617c-12f9-64af-7ea5-8cf6754843aa@redhat.com>
Date:   Thu, 14 Nov 2019 12:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191021065549.GA28049@kuha.fi.intel.com>
Content-Language: en-US
X-MC-Unique: XcZWuiZFPY24KT4_KtENxA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hi,

On 21-10-2019 08:55, Heikki Krogerus wrote:
> Hi Hans,
>=20
> On Fri, Oct 18, 2019 at 09:57:18PM +0200, Hans de Goede wrote:
>> Add support for configuring display-port altmode through device-properti=
es.
>>
>> We could try to add a generic mechanism for describing altmodes in
>> device-properties, but various altmodes will likely need altmode specifi=
c
>> configuration. E.g. the display-port altmode needs some way to describe
>> which set of DP pins on the GPU is connected to the USB Type-C connector=
.
>>
>> As such it is better to have a separate set of altmode specific properti=
es
>> per altmode and this commit adds a property for basic display-port altmo=
de
>> support.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   .../bindings/connector/usb-connector.txt      |  3 ++
>>   drivers/usb/typec/tcpm/tcpm.c                 | 33 +++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.t=
xt b/Documentation/devicetree/bindings/connector/usb-connector.txt
>> index d357987181ee..7bae3cc9c76a 100644
>> --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
>> @@ -38,6 +38,9 @@ Optional properties for usb-c-connector:
>>     or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
>>   - data-role: should be one of "host", "device", "dual"(DRD) if typec
>>     connector supports USB data.
>> +- displayport-vdo: The presenence of this property indicates that the
>> +  usb-connector supports displayport-altmode (svid 0xff01), the value o=
f
>> +  this property is an u32 with the vdo value for the displayport-altmod=
e,
>=20
> No, let's not take this approach.
>=20
> Every alternate mode a connector supports will need to have its own
> "sub-fwnode" under the connector fwnode. I thought we agreed this
> earlier?
>=20
> In any case, those sub-nodes will have default device properties named
> "svid" and "vdo". If the alternate mode still needs some other
> details, it can have other device properties that are specific to it,
> but note that displayport alt mode does not need anything extra. The
> "vdo" will already tells which pin configurations the connector
> supports and that is all that the driver needs to know.
>=20
> After we have the sub-nodes, it's not a big deal to walk through the
> child-nodes the port has during port registration and register the
> port alternate modes at the same time. That we can do in
> typec_register_port(), so we do not need to do it in every driver
> separately.

Yes we did agree to do the sub-fwnode thingie. But since this is a hobby
project I do not have a whole lot of time to work on this.

So when I started working on this, I though that the approach from this
patch-set would be more KISS and IMHO it works out well. But the sub-fwnode
approach is probably more future proof.

Anyways as said I do not have a whole lot of time to work on this,
if you want to go the sub-fwnode route, perhaps you can do a PoC
patch series for this? I would be happy to test this and if necessary
work it into something which works for the DP case.

Doing the port alternate modes registration from typec_register_port()
does sound like a good idea.

The first patch in this series is independent of this and IMHO it
would be good to get that upstream regardless of this alt-mode
registration stuff, so I will resend that as a standalone patch.

Regards,

Hans

