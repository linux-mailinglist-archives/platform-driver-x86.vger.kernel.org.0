Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DD526345F
	for <lists+platform-driver-x86@lfdr.de>; Wed,  9 Sep 2020 19:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgIIRTu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 9 Sep 2020 13:19:50 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60795 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729741AbgIIP1X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Sep 2020 11:27:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 74F075C0145;
        Wed,  9 Sep 2020 11:01:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 09 Sep 2020 11:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=8/Lfdi273m/EOA2MGnU07ACJh1UHUJ88KANNuv+D/
        p0=; b=SKvkneplwFNy+xfoHTNbj3WLGlTSSAHEeQSPwpbezYymeaoNpt6eeaJrb
        wO2YhEjwDFj0zZLyBkk7sMAlulyZFyi+MitvCqvRtIh8hyRnbcWVe9vMuVZpzps5
        +wY+8v5hI+3mgdPrFbQGoFaFkc90kxZPTaVoItiN3txmpqpgvo46yDBW+9kXi1SQ
        8KcZO+2mWVZ8sC1nXnYphvpVSF9wTydoiotK37/U81QIENZjH9QSixvCjUrUBr8x
        Z/z3rFhLLSUD7+FdLxlRgm6uY3WjmpMCQQDpE3Yedlb1QNEUqF0qlus2leJMJHLD
        z6yNrItE1x9FFCx59xJILk68aNLmQ==
X-ME-Sender: <xms:Y-5YX3LwNQw_g50XmdPLs5IAfmNu9mkq-lSfdMQp40mMrOe_mse3bA>
    <xme:Y-5YX7LoC3ZM3Grn4rwnt9TQMI8Zkij_X13-pB_F12Nkhl0XxPn804pca0Xbh6NZA
    TglLcsZJLqHeU_8PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfgv
    rhgvmhihucfuohhllhgvrhdfuceojhgvrhgvmhihsehshihsthgvmhejiedrtghomheqne
    cuggftrfgrthhtvghrnheptdehvdffgfegvdeiueffleffkeegledtteffleevueduleej
    ueeffefhkeevhffgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhgvrhgvmhihsehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:Y-5YX_tXms1dBOHBd7J5suT_tcGHDarosmZpKrmpzLF3z0kLd13NWA>
    <xmx:Y-5YXwZkCkA5qFEo-1iBMFtxU3bl72jWOJAb42B5fHBPv1KgPIvQZQ>
    <xmx:Y-5YX-a-FUDFkMWIdrgk33if7e3qljGdR-vHtK3sxmdLLC1OdZooVw>
    <xmx:Ze5YXxyqq__pg73TbDexRqvoyC4ChdzLcNhDXPwYFJZFSUuy0RoWAw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 99344E00A9; Wed,  9 Sep 2020 11:01:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <d188cbc6-6fb0-494d-beba-a925a2b55ae8@www.fastmail.com>
In-Reply-To: <348b0ff2-b1e2-4c9a-5ebe-cc467e8df81c@redhat.com>
References: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
 <179d3595-dda8-4c50-84e3-5f447ef5e34b@www.fastmail.com>
 <BAH8gRbpLk_cHH1yK9d7JrKitwVru-ZNmQ2D_wvEOr4SavRgSBRAsnLBlf1mq6r89xYcZhUk3bEAYNCeBq464tUO85CfK6A20rGWtwVHjVg=@protonmail.com>
 <05e95ba0-3d39-1df6-62d4-901f8d43ed05@redhat.com>
 <Eb7GE4vQo_kiCbFqDdX4Hxv_i8g5MQmW1zVjb47lgYCZy3g5J7AywqGCtDKtr1xWTaufDHI0uIUAHSbv8n_hTr6dr-vGv1rAbdEVMwzQJ4g=@protonmail.com>
 <348b0ff2-b1e2-4c9a-5ebe-cc467e8df81c@redhat.com>
Date:   Wed, 09 Sep 2020 09:01:25 -0600
From:   "Jeremy Soller" <jeremy@system76.com>
To:     "Hans de Goede" <hdegoede@redhat.com>,
        =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>
Subject: Re: [PATCH 2/2] platform/x86: system76_acpi: Add input driver
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> Hi,
>=20
> On 9/7/20 5:49 PM, Barnab=C3=A1s P=C5=91cze wrote:
> > Hi,
> >=20
> > thanks for the feedback.
> >=20
> >> [...]
> >>>> +static void input_key(struct system76_data *data, unsigned int c=
ode)
> >>>> +{
> >>>> +	input_report_key(data->input, code, 1);
> >>>> +	input_sync(data->input);
> >>>> +
> >>>> +	input_report_key(data->input, code, 0);
> >>>> +	input_sync(data->input);
> >>>> +}
> >>>> +
> >>>>    // Handle ACPI notification
> >>>>    static void system76_notify(struct acpi_device *acpi_dev, u32 =
event)
> >>>>    {
> >>>> @@ -459,6 +470,9 @@ static void system76_notify(struct acpi_devic=
e *acpi_dev, u32 event)
> >>>>    	case 0x84:
> >>>>    		kb_led_hotkey_color(data);
> >>>>    		break;
> >>>> +	case 0x85:
> >>>> +		input_key(data, KEY_SCREENLOCK);
> >>>> +		break;
> >>>>    	}
> >>>>    }
> >>>>
> >>>> @@ -524,6 +538,21 @@ static int system76_add(struct acpi_device *=
acpi_dev)
> >>>>    	if (IS_ERR(data->therm))
> >>>>    		return PTR_ERR(data->therm);
> >>>>
> >>>> +	data->input =3D devm_input_allocate_device(&acpi_dev->dev);
> >>>> +	if (!data->input)
> >>>> +		return -ENOMEM;
> >>>> +	data->input->name =3D "System76 ACPI Hotkeys";
> >>>> +	data->input->phys =3D "system76_acpi/input0";
> >>>> +	data->input->id.bustype =3D BUS_HOST;
> >>>> +	data->input->dev.parent =3D &acpi_dev->dev;
> >>>> +	set_bit(EV_KEY, data->input->evbit);
> >>>> +	set_bit(KEY_SCREENLOCK, data->input->keybit);
> >>>> +	err =3D input_register_device(data->input);
> >>>> +	if (err) {
> >>>> +		input_free_device(data->input);
> >>>> +		return err;
> >>>> +	}
> >>>> +
> >>>>    	return 0;
> >>>>    }
> >>>
> >>> Hi,
> >>>
> >>> wouldn't sparse_keymap be a better choice here?
> >>
> >> Since none of the notify events are actually keys;
> >=20
> > I'm not sure I understand what you mean, could you please clarify?
>=20
> What I meant to say (but didn't) is:
>=20
> "Since none of the notify events are _currently_ actually keys"
>=20
> Currently, as in before this patch:
>=20
> static void system76_notify(struct acpi_device *acpi_dev, u32 event)
> {
>          struct system76_data *data;
>=20
>          data =3D acpi_driver_data(acpi_dev);
>          switch (event) {
>          case 0x80:
>                  kb_led_hotkey_hardware(data);
>                  break;
>          case 0x81:
>                  kb_led_hotkey_toggle(data);
>                  break;
>          case 0x82:
>                  kb_led_hotkey_down(data);
>                  break;
>          case 0x83:
>                  kb_led_hotkey_up(data);
>                  break;
>          case 0x84:
>                  kb_led_hotkey_color(data);
>                  break;
>          }
> }
>=20
> So we cannot just take the event code and feed it to the
> sparse_keymap code since events 0x80-0x84 are not
> key events (they are related to the LEDs on the kbd).
>=20
> >> and since there is only one keycode involved atm, that
> >> seems like a bit of overkill to me.
> >=20
> > Indeed, it might be an overkill, but I'd still vote for that since
> >   - it is an =CE=B5 effort investment to convert the current code, a=
nd
> >   - the number of keys is expected to grow (at least that's my assum=
ption), and
> >   - it avoids code duplication, the resulting code is simple and sho=
rt.
>=20
> If Jeremy is ok with adding sparse_keymap support to the next version,=
 that
> is fine with me. But IMHO it is not really necessary for adding just t=
his
> single key.
We don't really have a plan for any more keycodes. The intel-hid driver =
does most of
what we need, but for some reason omits the screenlock key. So we have a=
dded it
here.

If there is a keycode we want to add, I would not mind looking into any =
alternative,
provided it is less code to maintain.
> Regards,
>=20
> Hans
>=20
>
