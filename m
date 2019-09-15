Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C086B31E5
	for <lists+platform-driver-x86@lfdr.de>; Sun, 15 Sep 2019 21:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfIOTzd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 15 Sep 2019 15:55:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44612 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfIOTzd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 Sep 2019 15:55:33 -0400
Received: by mail-lf1-f65.google.com with SMTP id q11so10850662lfc.11
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Sep 2019 12:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ch8NIQvWrdcTXBZrioUUHP8XojoYZq3h+rAdREVo/uQ=;
        b=BL/sotLdSfC9Q0bP9I6ezadhYpy6xpTD3xT4Mbl2tv44Og7RltEezgwZlUTzeTIT+/
         Y/LX2mWKLrhLEVBMlyxXTEMZvvfCqf6+rEgv03N/EY1ZwE217i80FPT6oAOt2HRTYowW
         BEFDplXbsP2DJ+7P7128cUL6FrTf4YOY0XpSfjG1Jy6ygqBwnG8srsXc7h6akhSU7Iys
         MwSW3En0BDfzJDcjXk0pwowNlDWnsR0nSlLJEs01T3+ajngGpJGrEncOAubH0VrZ0Mry
         YQ/K23HYaKoPZyzAA4QVeheyZujutmkgiHN+F7illGDUiIIptCaSooPO+TfYroCHVsQB
         Miiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ch8NIQvWrdcTXBZrioUUHP8XojoYZq3h+rAdREVo/uQ=;
        b=KZ0APf6eEywN9ulvWYdlE5vJDmOrXpOM/0x6qvgNZkK5Lnd0ptNt9cIQuNfN/1NI07
         wipz6jSE//ZudYow6kXqfmfmx6c0G8K0oICrtqzlwBXB312+ao9gd+U8mN/AtqqcuGKy
         +r4Kj2Kjmg/YfMRJ3LoP+ZDCm8Zx8FJ3VYZG6MPZphtkEbl9syDUq/cwdBxTtp/wWiNb
         jAgMAP3otDlqhg7VrFgemBKc+HwvzpHf9QEKLnSFNoanf4D9kwy8VfytEXcAmC0u6sYA
         2Ddbigw/H8FFX6m96uFCM+J1NPh6LsC2Py+R+/0F18l9IIFF0mTXpcDtRzAxw1KdvHXc
         Deqg==
X-Gm-Message-State: APjAAAVDi58vHTs399yCtIVnpKdpN/vqW+RGKc3fvJvYMVx4ieXo0Y4Z
        PQ4NuhqKN+be3Ba58+r0nTo=
X-Google-Smtp-Source: APXvYqwD1a4rdy7l2ylUdOJ5lVsP3LnoaCMOE7VpAXdNlZFMCBbxto/7/kbQXlWreUBJA1TXNj1uAg==
X-Received: by 2002:a19:c017:: with SMTP id q23mr12527347lff.174.1568577329464;
        Sun, 15 Sep 2019 12:55:29 -0700 (PDT)
Received: from localhost.localdomain ([46.216.138.44])
        by smtp.gmail.com with ESMTPSA id 196sm4570973ljj.76.2019.09.15.12.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 12:55:28 -0700 (PDT)
Received: from [127.0.0.1] (helo=jeknote.loshitsa1.net)
        by localhost.localdomain with esmtp (Exim 4.92.1)
        (envelope-from <jekhor@gmail.com>)
        id 1i9acI-0003p9-Bb; Sun, 15 Sep 2019 22:55:26 +0300
Date:   Sun, 15 Sep 2019 22:55:26 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to
 microUSB and TypeC variants
Message-ID: <20190915195526.GA14558@jeknote.loshitsa1.net>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
 <e7913031-4a0a-bcd9-2149-8e718b876a0e@redhat.com>
 <20190809145135.GC30248@jeknote.loshitsa1.net>
 <13391bf6-b8d2-83ce-2bca-1c359829938f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13391bf6-b8d2-83ce-2bca-1c359829938f@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Sorry for last answer, I didn't notice your answers. I have returned to
this project now for some time.

On Mon, Aug 12, 2019 at 07:11:07PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 09-08-19 16:51, Yauhen Kharuzhy wrote:
> > On Fri, Aug 09, 2019 at 12:49:27PM +0200, Hans de Goede wrote:
> > > Hi,
> > > 
> > > Overall this looks good, thank you for your work on this.
> > > 
> > > I have some small remarks inline / below:
> > > > +EXPORT_SYMBOL_GPL(cht_int33fe_check_hw_compatible);
> > > > +
> > > > +MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device driver (common part)");
> > > > +MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
> > > > +MODULE_LICENSE("GPL v2");
> > > 
> > > I see from the Makefile changes that you are linking the common code
> > > into both intel_cht_int33fe_typec.ko and into intel_cht_int33fe_musb.ko, that is fine
> > > since it is tiny and not worth the trouble of creating its own .ko file for.
> > 
> > No, this Makefile fragment adds two targets for every config variables,
> > and intel_cht_int33fe_common.c compiles into one .ko file even if it was
> > added twice
> 
> Ah right, I misread it. But adding a new ko file just for the one helper function
> seems like massive overkill, the overhead will be quite big and on most systems
> all 3 .ko files will end up getting loaded anyways, so we should probably try to
> reduce the number of ko files here.

Sounds reasonable.

> 
> > > I do wonder what happens if you set the Kconfig value for both modules to Y,
> > > since that will like put the common code twice in the builtin.a file, I guess / hope
> > > ar is smart enough to only add it once, but I'm not sure... can you please give
> > > this a try?
> > 
> > For both Y it should be OK, but for one M and one Y... OK, it need to be
> > corrected.
> 
> How about moving the entire helper function into intel_cht_int33fe_common.h as
> static inline ... then both remaining .ko files get a private copy but since it is
> small that is fine. This nicely solves the need for a third .ko file and also
> problems with one of the Kconfig options being builtin and the other being modular.

Yes, but this header file will contain relative big piece of code which
will be included to modules and compiled twice.

I think that I will use this approach and will move to separate module
only when other common functions will be added.


-- 
Yauhen Kharuzhy
