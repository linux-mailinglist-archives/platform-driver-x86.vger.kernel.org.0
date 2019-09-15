Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1EFB31E8
	for <lists+platform-driver-x86@lfdr.de>; Sun, 15 Sep 2019 22:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbfIOUCo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 15 Sep 2019 16:02:44 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36535 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIOUCo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 Sep 2019 16:02:44 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so4161063ljj.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Sep 2019 13:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MvlfYmBmAGj/AVsiMO6I5buTa7Wq9f4smKRcBbJBnK8=;
        b=WkCnml+8Dqy8VrkJBx2FCexuCP4MNGrBgcmI3Xqodl/Av1h2P6PpptE3YtFWLmyxlv
         rNJK90gKtM6C9Ei1nltMl17Yxu868OrKwlyHAdRGcDEx37o33HrxBAMRg8ZEsiAVq/7r
         WK50Hi00nlGwelnanZuvusNHfrJiZUA4QhcxOReRNs8uue0UOg0svZA318IrB5vCJu8a
         cj5N2Gykt8EaQ0ZvQsWElsCOBJdlezpTnYdaeV98gwxyFcz8AufJaNPiwCV9Lun+GymF
         K54+EdiDQC5eza4ftWxPDdf2RTZSRrK5MExS3Om+D6I32MLBuZUsKGfHG79NJFqy08xB
         CBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MvlfYmBmAGj/AVsiMO6I5buTa7Wq9f4smKRcBbJBnK8=;
        b=Ny5cra5nmIesZ053fXaYa5BYJHYz1ZtE1CUJuQAjf/FFrlIpihMw88uFazRvfe8NHg
         P64MmFyEBGBkZHIi3cEHra2RcdVtzcXVUQY4cIiuvlSPrMNdYrDqf3CZ/2VqkBt2bONn
         Nf27IdnhEugntBqXpdRf2j4X3oqwVUYwidGfToqa2yDlhnKp+JlAUcI/MnBpURALW39V
         p7Bb9I08xLhn9c3hkWqTq73wCpaqvBxIMs+OlZUzHAqe22mCu12N16IGOAHDoa++0Ezp
         s7fZLkbs6A1PoKy0A43jd4IODGt7YtoHgMVT6cFmJVuPkpm0O0qDaZaqOrUJsoXvGbju
         nDxA==
X-Gm-Message-State: APjAAAUj6qKHR7MxzYxtVFGjZrUcq/lvhV9GBDQR4W4CU6yZufUaB/c9
        tkuVXbCZ3Y1qmYUdnee8DvId5h/RbCM=
X-Google-Smtp-Source: APXvYqzN/NoTU6/pcxxxkjmSfYicAUmClJrh/XgYmQq5k5rXwZzfxiKUJDVrKV2T4bT9FkHBRfKX9Q==
X-Received: by 2002:a2e:551:: with SMTP id 78mr36052796ljf.48.1568577762248;
        Sun, 15 Sep 2019 13:02:42 -0700 (PDT)
Received: from localhost.localdomain ([46.216.138.44])
        by smtp.gmail.com with ESMTPSA id y204sm3206460lfa.64.2019.09.15.13.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 13:02:41 -0700 (PDT)
Received: from [127.0.0.1] (helo=jeknote.loshitsa1.net)
        by localhost.localdomain with esmtp (Exim 4.92.1)
        (envelope-from <jekhor@gmail.com>)
        id 1i9ajH-0003qc-Oh; Sun, 15 Sep 2019 23:02:39 +0300
Date:   Sun, 15 Sep 2019 23:02:39 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to
 microUSB and TypeC variants
Message-ID: <20190915200239.GB14558@jeknote.loshitsa1.net>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
 <73b283c9-bbfc-2c43-1cb0-ca0a245593c4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73b283c9-bbfc-2c43-1cb0-ca0a245593c4@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 12, 2019 at 07:07:32PM +0200, Hans de Goede wrote:
> Hi,
> 
> One more remark inline.
> 
> On 8/8/19 11:55 PM, Yauhen Kharuzhy wrote:
> > Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> > hardware has TypeC connector and register related devices described as
> > I2C connections in the _CRS resource.
> > 
> > There at least one hardware (Lenovo Yoga Book YB1-91L/F) with microUSB
> > connector exists. It has INT33FE device in the DSDT table but there are
> > only two I2C connection described: PMIC and BQ27452 battery fuel gauge.
> > 
> > Splitting existing INT33FE driver allow to maintain code for microUSB
> > variant separately and make it simpler.
> > 
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > ---
> 
> <snip>
> > +	memset(&board_info, 0, sizeof(board_info));
> > +	stracpy(board_info.type, "bq27542");
> 
> stracpy ? that does not compile for me, normally you would use:
> 
>         strlcpy(board_info.type, "bq27542", I2C_NAME_SIZE);
> 
> here, I've used this for my testing.

Yes, stracpy() is new function found in linux-next, is used to copy
string to array. It is wrapper around of strscpy()

str*cpy() mess :)

I use strscpy(board_info.type, "bq27542", ARRAY_SIZE(board_info.type))
now for compiling with linus master branch.

> 
> > +	board_info.dev_name = "bq27542";
> > +	board_info.properties = bq27xxx_props;
> > +	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
> > +
> > +	if (IS_ERR(data->battery_fg)) {
> > +		dev_err(dev, "Failed to register battery fuel gauge: %ld\n",
> > +			PTR_ERR(data->battery_fg));
> > +		return PTR_ERR(data->battery_fg);
> > +	}
> > +
> > +	platform_set_drvdata(pdev, data);
> > +
> > +	return 0;
> > +}
> 
> <snip>
> 
> With that fixed, I can confirm that everything still works as it should on a
> device which uses this driver combined with a Type-C connector.

Thanks!

-- 
Yauhen Kharuzhy
