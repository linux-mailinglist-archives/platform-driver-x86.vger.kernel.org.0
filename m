Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D052034E5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jun 2020 12:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgFVKdA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 22 Jun 2020 06:33:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29703 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726710AbgFVKdA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jun 2020 06:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592821978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Hbf6bzasXV7iok78UyW9hFhq6LTz/wEypJw4FzF7j8=;
        b=ZRTWl9sEEv1IHz45SG4PAwIFVWu8f/Cx53AjnXkSM/ljXencJwIDUFr/vcut06KmDujhjh
        NasG+Z3gHfc95P+RpzElGwaNXkFFGHhJ5EM4uMoMuyBGF37858lN+JcMfKvyYI2k+CGUNm
        jMq/1DZ0xNO+ECuyUCFdaaw2Mzqw2Uk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-Fgp_mR5xOsmovVF5hrsUFA-1; Mon, 22 Jun 2020 06:32:56 -0400
X-MC-Unique: Fgp_mR5xOsmovVF5hrsUFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 228168018AD;
        Mon, 22 Jun 2020 10:32:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 196A55BADC;
        Mon, 22 Jun 2020 10:32:55 +0000 (UTC)
Received: from zmail20.collab.prod.int.phx2.redhat.com (zmail20.collab.prod.int.phx2.redhat.com [10.5.83.23])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4D081809547;
        Mon, 22 Jun 2020 10:32:54 +0000 (UTC)
Date:   Mon, 22 Jun 2020 06:32:54 -0400 (EDT)
From:   Bastien Nocera <bnocera@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
Message-ID: <4493424.24738639.1592821974039.JavaMail.zimbra@redhat.com>
In-Reply-To: <89c38303-9463-d671-1f86-e0c6a433748c@lenovo.com>
References: <markpearson@lenovo.com> <20200617180937.14949-1-markpearson@lenovo.com> <1905013469.24563660.1592574774373.JavaMail.zimbra@redhat.com> <89c38303-9463-d671-1f86-e0c6a433748c@lenovo.com>
Subject: Re: [External] Re: [RESEND PATCH v2] platform/x86: thinkpad_acpi:
 lap or desk mode interface
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.36.115.129, 10.4.195.16]
Thread-Topic: platform/x86: thinkpad_acpi: lap or desk mode interface
Thread-Index: RQe/kjp3lLj8LS7KIWz6C7tRpdLINg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



----- Original Message -----
> Hi Bastien
> 
> On 6/19/2020 9:52 AM, Bastien Nocera wrote:
> > Hey Mark,
> > 
> > ----- Original Message -----
> <snip>
> >>   
> >> +/*************************************************************************
> >> + * DYTC subdriver, for the Lenovo performace mode feature
> >> + */
> > 
> > I don't think this should mention the performance mode, as it's a lap/table
> > detection mode. Do we need to call that "DYTC"? "lapmode"? "lap_detection"?
> > Or does the DYTC interface offer more functionality that we'd export in the
> > future?
> > 
> I've just noticed that I can't spell performance either which is
> embarrassing :)
> 
> Originally I developed this code for a thermal modes feature - but
> this portion of it is also needed for WWAN so we pulled out just this
> piece as the first bit to get in. Having WWAN available for users is
> more important than the thermal mode interface (there are a lot of users
> who want WWAN working properly on our laptops).
> 
> So...yes, DYTC does offer more functionality and I'm planning on
> proposing the thermal patch as soon as this one makes it through, but I
> agree that in the context of this patch the comment is misleading. I
> will clean that up for this version.

If you can only propose this patch right now, maybe change the label, and change
it again when the functionality is expanded? I'm just thinking that we want to avoid
a case where the comments mention a performance mode, but we're looking at
a lap detection instead.

> >> +
> >> +#define DYTC_CMD_GET      2 /*To get current IC function and mode*/
> > 
> > For this comment and all the ones below, space after "/*" and before "*/"
> > 
> Ack
> 
> >> +#define DYTC_GET_ENABLE_MASK  0x1 /*0 = disabled, 1 = enabled*/
> > 
> > Is that necessary?
> > 
> Another hangover in that the other fields used for the thermal mode have
> more interesting masks and this fitted in with that. I can remove for
> now if it's really a problem.
> 
> >> +#define DYTC_GET_LAPMODE_SHIFT 17
> > 
> > You'd probably want to call this "bit" rather than shift. We shift it to
> > read
> > the value, but 17 is the bit's position. (See BIT() usage in the driver)
> > 
> Ack
> > Do you want to add a comment here? Is there anything else that could be
> > documented (the other bits, which versions of firmware would have that, if
> > there's a publicly available version, or which hardware if publicly
> > available)
> > 
> So what is the preference normally? More pieces will definitely be made
> public when I release the thermal mode updates but I assumed we kept
> things related only to the code used. I can add more detail here if that
> helps. Not trying to hide anything :)

A comment with an explanation of what all the bits correspond to would be
very useful, it would allow the community to extend the driver, if the
functionality offered is deemed useful.

> >> +static int  dytc_lapmode;
> >> +static void dytc_lapmode_notify_change(void)
> >> +{
> >> +	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> >> +			"dytc_lapmode");
> >> +}
> >> +
> >> +static int dytc_command(int command)
> >> +{
> >> +	acpi_handle dytc_handle;
> >> +	int output;
> >> +
> >> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
> >> +		/*Platform doesn't support DYTC*/
> >> +		return -ENODEV;
> >> +	}
> >> +	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", command))
> >> +		return -EIO;
> >> +	return output;
> >> +}
> >> +
> >> +static int dytc_lapmode_get(void)
> >> +{
> >> +	int output;
> >> +
> >> +	output = dytc_command(DYTC_CMD_GET);
> >> +	if ((output == -ENODEV) || (output == -EIO))
> >> +		return output;
> >> +
> >> +	return ((output >> DYTC_GET_LAPMODE_SHIFT) &
> >> +				DYTC_GET_ENABLE_MASK);
> > 
> > Use BIT() instead? eg.
> > return (output & BIT(DYTC_GET_LAPMODE_SHIFT));
> > 
> Ack
> >> +}
> >> +
> >> +static void dytc_lapmode_refresh(void)
> >> +{
> >> +	int new_state;
> >> +
> >> +	new_state = dytc_lapmode_get();
> >> +	if ((new_state == -ENODEV) || (new_state == -EIO))
> >> +		return;
> > 
> > You could also return early if "dytc_lapmode == new_state".
> > 
> Good point.
> 
> > Rest looks good to me.
> > 
> Great - thanks for the review. I'll prepare the updates and if there's
> any feedback on the questions above please let me know
> 
> Mark
> 
> 

