Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82808142903
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Jan 2020 12:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgATLOh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Jan 2020 06:14:37 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39574 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgATLOh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jan 2020 06:14:37 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so29099161wrt.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2020 03:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MLTZFPkjIVTzjTUJPG0GQ7JUAyMN3WoGalm3BKLJ7uU=;
        b=PU4f5YGvwhz9nKHkxC9h0SOSEtjVAayEf3i28kxO+eSOizCINzkqdUBipr/DlZ+Tat
         z+H1ny4xJDEr7U4BMT66LsDt95kihsc8Lzkjd9euZ7aucT/10xyQ/HgiAEmqPB9Wi4zN
         fV+fUEMJ+G+oeA5coQUKM5dY0AT8qZcOEaIejUw1B5gCA8OCzAn4KAQ1YLRmYzcN9/4r
         q55sf6Aes/LjqXvbFLqzV7ap8oEXfHhzEerWGT4n+ae1m5pMZJnRUOHvLjm3JeKhP51b
         XaAJxSO2o2mt+IPrjzAEc2XfHRRN84Ql645KlEG4PiW/DRdKqJUrDekrGc7o09fR8CTh
         zCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=MLTZFPkjIVTzjTUJPG0GQ7JUAyMN3WoGalm3BKLJ7uU=;
        b=cgbots6KU6QieKfV+yv2B/W3N6QQiNGuzGXoDNTy5/3n9ZrcNwql8LM7shLEfOa3ES
         ZqSwnvSvxcDwL++qHXOupwz7cgMpUxEgdjz8MDUiUz1uodgvI0QiB4k1UaZQCIoBRi0V
         ebtFreIDhGIZ3aWeGph/hP2QFs5p0l2HZ1K4tme0rwx8xVguoAOeiHh5iKP82JWTHfv0
         fkGNuBtIJglbx8hcqxmZK1IWkztm1rghHkxmXgpF4YMvhEfEwYlS1kFe0IlhigbZvumP
         xDYUzSzA/6SnMxNeIkVN9pFy+8pFTFGY2S3dI3wvd8tivAJ+oaWyGIeRkz/D1ZG4vW73
         Jc8g==
X-Gm-Message-State: APjAAAWMle9xUNdvgkX14Tu3LczL1yPwu2XwdrugIO/zTzA4YxD8Ok68
        Uw4IJ3JMipV7ezOUK6HTedYuYQ==
X-Google-Smtp-Source: APXvYqytziXSBvUudozXjrvT1+OyixIcrmWxfebeA0//fm/82uAbuWMv0hmjSOZymA7vF9JeJ01GNA==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr17246479wrs.369.1579518875038;
        Mon, 20 Jan 2020 03:14:35 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id j12sm47914128wrt.55.2020.01.20.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 03:14:34 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:14:50 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Zha Qipeng <qipeng.zha@intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 35/36] platform/x86: intel_pmc_ipc: Convert to MFD
Message-ID: <20200120111450.GE15507@dell>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
 <20200113135623.56286-36-mika.westerberg@linux.intel.com>
 <20200116132108.GH325@dell>
 <20200116143730.GE2838@lahna.fi.intel.com>
 <20200117113202.GH15507@dell>
 <20200117142750.GP2838@lahna.fi.intel.com>
 <20200120081246.GS15507@dell>
 <20200120091258.GH2665@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200120091258.GH2665@lahna.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 20 Jan 2020, Mika Westerberg wrote:

> On Mon, Jan 20, 2020 at 08:12:46AM +0000, Lee Jones wrote:
> > > Well, by "library" I mean that the SCU IPC itself does not bind to
> > > anything but instead it gets called by different drivers such as this
> > > one passing the device pointer that is the SCU IPC device. Here for
> > > example it is the platfrom device created from an ACPI description.
> > 
> > Not keen on that at all.  Why can it not be a platform device?
> 
> We also call the same library from a PCI driver (intel_scu_pcidrv.c in
> this series) where the device is of type struct pci_dev.

Not sure I understand the issue.

What does the device do?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
