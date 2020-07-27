Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EC022EA22
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 12:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgG0KfM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 06:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgG0KfM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 06:35:12 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848D0C061794
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 03:35:12 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x9so7796408plr.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ClZe5PyyqO8gDxm5fRF6b2O9arzEr9QE+Mo0TcPbnY=;
        b=XFi1D7DejrCr2IMpjku14NxRw8NvwxNdluaTsV9MQzldT1GskNkBMUg/ex5cDiOP4a
         j+9cwHe/lbmd6nXkk1lxUT2hs3Mni9Qtdf2HiYon2fZfqKvzP1VzVYzsdu35HLxrSNJu
         L+WbZp3ly1heSrjIJpVgmrwxJneMkNm3/9iMNw/vibPJvMysOcLXeT0LgLRQumj5Er4J
         tpraXw43afXlKF1hEQUjswS1ZY62M4o/jHKd8MX+GPzA0JG8wplF1F6NFZVx2oDVbM4n
         H/JDwAzbj/uBUBEHQ3V+d+wXR7pGPy0zvVn0EEO3UZcmW7Nb6ZF2rgMql2OopdtbymMi
         DNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ClZe5PyyqO8gDxm5fRF6b2O9arzEr9QE+Mo0TcPbnY=;
        b=jc+sLI0oUNjqiQZxPbrnB5GU7zvnAS6MbSncUHX+NhMYCFbD3SeS+Ig87n8Q/j64nF
         GCmY7p3EqgWpB39CjHI5JemjASH/suST1rf8VTfRfEcY0FpKQAfnOknXf/og+1rCdhOp
         YD7ioRRcDvVnhuZJCm6L/H9BdKUjtmeLncxwZv84z3Ht6ysPT1GaVjKzFMf1Dsgyy/tT
         LAHwSrNNWLkgPbipoNRGMkM0ffOXlMruzNr6iEgtrE+c9483omAXgPYGPDTHjKB1/G4I
         9N/F8b0uVIx/xbhoXZ8cmTWPBEffsLol08mlc06yI2qchxrbs/l9TE/pmol/T6i4EIBp
         U+dA==
X-Gm-Message-State: AOAM5306gWXN2/YhV+Qf7V40aWyWXdqEDxK667zQYHG2X+mrynLmW8TH
        lxe28CDkrRlYacWEwZvVwIjsOoFuEobnOqjc6fc=
X-Google-Smtp-Source: ABdhPJwY6JiBKTnjB1Mb3q/1E6CYRRiWTnEvPCmdRa9/0HuAKakkYIMZqh3mSd2xjpNn/Iz+qZvw2o/v9XgdvVDD00k=
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr18162635plo.262.1595846112090;
 Mon, 27 Jul 2020 03:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20200715235242.4934-1-markpearson@lenovo.com>
In-Reply-To: <20200715235242.4934-1-markpearson@lenovo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Jul 2020 13:34:57 +0300
Message-ID: <CAHp75Vcwg9aEpybYwEFvhYH4gpy7952i+zMs-2TKGPzkzuhO=g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: psensor interface
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Nitin Joshi <njoshi1@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 16, 2020 at 2:53 AM Mark Pearson <markpearson@lenovo.com> wrote:
>
> Some Lenovo Thinkpad platforms are equipped with a 'palm sensor' so as
> to be able to determine if a user is physically proximate to the device.
>
> This patch provides the ability to retrieve the psensor state via sysfs
> entrypoints and will be used by userspace for WWAN functionality to
> control the transmission level safely

...


>         case TP_HKEY_EV_PALM_DETECTED:
>         case TP_HKEY_EV_PALM_UNDETECTED:
> -               /* palm detected hovering the keyboard, forward to user-space
> -                * via netlink for consumption */
> +               /* palm detected - pass on to event handler */
> +               tpacpi_driver_event(hkey);
>                 return true;

Comment here tells something about the netlink interface to user
space. Can you elaborate why we need sysfs now and how it's all
supposed to work?

...

> +static int psensor_get(bool *state)
> +{
> +       acpi_handle psensor_handle;
> +       int output;
> +
> +       if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS", &psensor_handle)))
> +               return -ENODEV;
> +
> +       if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
> +               return -EIO;
> +
> +       /* Check if sensor has a Psensor */
> +       if (!(output & BIT(PSENSOR_PRESENT_BIT)))
> +               return -ENODEV;
> +
> +       /* Return if psensor is set or not */
> +       *state = output & BIT(PSENSOR_ON_BIT) ? true : false;
> +       return 0;
> +}

It reminds me of a function you created in one of the previous
changes. Can you rather create a parameterized helper which will serve
for both?

...

> +/* sysfs psensor entry */
> +static ssize_t psensor_state_show(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       char *buf)
> +{

> +       return snprintf(buf, PAGE_SIZE, "%d\n", psensor_state);

We know that %d takes much less than PAGE_SIZE, use sprintf().

> +}

> +

No blank line here.

> +static DEVICE_ATTR_RO(psensor_state);

...

> +static struct attribute *psensor_attributes[] = {
> +       &dev_attr_psensor_state.attr,

> +       NULL,

No comma for terminator line(s).

> +};

...

> +       /* If support isn't available (ENODEV) then don't return an error
> +        * but just don't create the sysfs group
> +        */

/*
 * Consider to use a proper multi-line comment style.
 * Like here. (It's applicable to the entire patch)
 */

...

> +       err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &psensor_attr_group);
> +       return err;

return sysfs...

-- 
With Best Regards,
Andy Shevchenko
