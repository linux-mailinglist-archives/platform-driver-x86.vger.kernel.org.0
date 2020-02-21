Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECB3167DAB
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Feb 2020 13:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgBUMp7 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 21 Feb 2020 07:45:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31874 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727787AbgBUMp7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Feb 2020 07:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582289158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pBLVBUs542X1Vq8pAdGQmP+xNdNH0Q/EkNS8GTw8+pk=;
        b=Mzz797SWC2S3tBoONw3G+xn6WMWNPNCAl6KTS9neesuvAhs88tUMd0nxK+vHUcD71v95GV
        +jYPkddKAvztRwPU6ZZ2NlCfUa30Q817Cs8/cXc0O5r8Dx3RdfYukCUIOuqwd/HQry/U9G
        jBY06j/woogjsXQGb3ib6XIu66/9bhw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-ivuche2WPzigOVPtwMSpFQ-1; Fri, 21 Feb 2020 07:45:56 -0500
X-MC-Unique: ivuche2WPzigOVPtwMSpFQ-1
Received: by mail-wr1-f70.google.com with SMTP id u18so963638wrn.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Feb 2020 04:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pBLVBUs542X1Vq8pAdGQmP+xNdNH0Q/EkNS8GTw8+pk=;
        b=mezPxjDiSYV6Q/Tg9ydOxkwfhS/w7+hmmZGA0oWv3M0F4n1iYQKdjQ7ddvB5RI0AQZ
         PSUdkf9j/BVPD/Dq4ua8PSuURGP/oNooX9eCJGLBWmEJ9Jd997O56PsWu+tC6OQUgqM0
         JK8VsP9ujp3lFuww+Hlfd/ap2LtDZVrBzmrXs9Wo1Ks+X10RFHOGyZs5dCRVHGX6K64W
         hiY3zNcZU11rQdPeZfnThNerq02pW3KHjQYf+4YW4uHZVn+YBIVVrq+PcJdpsZ0MQcDC
         gQ/3Gg9IEprIQ9wh7r+DVbSQPXZ/DHKKwCpjUQFlmKTRRCkkPl784b6odtxZyMoaoDPN
         GELg==
X-Gm-Message-State: APjAAAWw+50bQzCS6ye5RTb/LKf5Q5Sm9nDKtufg1iBKxQtQENTMUL0x
        CiMD+kJ/arFC8QBIXuqgtMaKa9ynOJN3P8sPJfQGQ+a7zvqt+aDdB5q3dr97W7PjmXeEht1Fn/d
        sroFgJRokdQWLXFcb2SegInTn1xwU/hmOiA==
X-Received: by 2002:adf:f084:: with SMTP id n4mr48240482wro.200.1582289155137;
        Fri, 21 Feb 2020 04:45:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtiGq5NOrdy9I6IUtNFUV96T4BBoSP5U202t66huPoYfCrAk+zdHN+jraDhS1vrqNKI/yqCw==
X-Received: by 2002:adf:f084:: with SMTP id n4mr48240462wro.200.1582289154929;
        Fri, 21 Feb 2020 04:45:54 -0800 (PST)
Received: from dhcp-64-37.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id r6sm3972501wrq.92.2020.02.21.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 04:45:54 -0800 (PST)
Message-ID: <eea7179c93b5a5f3766c169f71567e1d75dda304.camel@redhat.com>
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
From:   Benjamin Berg <bberg@redhat.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Rajat Jain <rajatja@google.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nitin Joshi <nitjoshi@gmail.com>,
        Mat King <mathewk@google.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pekka Paalanen <ppaalanen@gmail.com>
Date:   Fri, 21 Feb 2020 13:45:53 +0100
In-Reply-To: <87tv3kxgyx.fsf@intel.com>
References: <20200220074637.7578-1-njoshi1@lenovo.com>
         <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
         <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
         <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
         <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
         <CACK8Z6HWkafL4EzOndRyiA3k-VyUg8bQ=2diw_wJSxSTyqsE+w@mail.gmail.com>
         <87tv3kxgyx.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On Fri, 2020-02-21 at 14:28 +0200, Jani Nikula wrote:
> In general I think it's preferrable if the hotkey sends the key event to
> userspace that then makes the policy decision of what, if anything, to
> do with it. Everything is much easier if the policy is in userspace
> control. For example, you could define content based policies for
> enabling privacy screen, something that is definitely not possible with
> firmware.
> 
> I emphatize with the desire to just bypass everything at the
> hardware/firmware level, because that is totally in your control (as an
> OEM), and requires no interaction with the operating system
> initially. Exposing the read-only state of the privacy screen is
> helpful, but prevents the OS from building more advanced features on
> top, failing to reach the full potential of the nice hardware feature.

There seems to be a slight misunderstanding here. On the Lenovo laptops
the feature is automatically adjusted by the Firmware. However, the
setting itself is read/write and it can also be controlled from
userspace.

In principle, I agree that it makes sense to control these things from
software and have a toggle key event that is send around. It has the
unfortunate disadvantage though that it requires updating the entire
userspace. Including the ugly side effect that we continue to have
trouble to support these things on X11 due protocol restrictions with
"high" key codes (>= 248).

Benjamin

