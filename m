Return-Path: <platform-driver-x86+bounces-5825-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 789EA993B88
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Oct 2024 02:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 108E6281E84
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Oct 2024 00:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F4F10F2;
	Tue,  8 Oct 2024 00:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="TksOl07n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q4VOCa8X"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7E161;
	Tue,  8 Oct 2024 00:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728345808; cv=none; b=gxcyqvDUhhYGLZ5bMIBifmjCOvrLcV8dSu1KWxnNeYRVIjINNsrUj0WzN44VB9H7oCNZ8ymXL3AteqKRH0chS7RfgnpMuNyvvrwOyUXXft79qguKCL9/20blvCxC9SKqKohdz9sqZqqeXY1kQzy5+zbkNQvlG8fKNTyUp5Ig/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728345808; c=relaxed/simple;
	bh=Cu4+U/gMUXam8NpVoE1pV0ZCDtIx8CcL7ANq2dH81bw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=vAXTE37bBP9+PYkkHwA5MQ5tBZKwjsgnWfeV1210siDjljl3saaw8TjhAH2r7SqIS47SOs5vn3uKlMmXK4aoXO/hK48z0RRFu77YgWvMjjrnnRUDOQhGv3AsrXCLQAWaAjv7cVF7MFefAVrjiKV6iQVpB+Fh3O9J/I409wZjHiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=TksOl07n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q4VOCa8X; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 6544613805A0;
	Mon,  7 Oct 2024 20:03:24 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Mon, 07 Oct 2024 20:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1728345804;
	 x=1728432204; bh=1J18bIWQDPi6tzheZ/xJ6X1URWbY94iGyaG7rhPqMK4=; b=
	TksOl07nTcNhSHz8dHXSkkh9O469wCAqBvxFjsNDWEMt6/dD2/VoqVW/kSdHjayc
	E7LxcVxyqJXHoGOj8i3biP2Gt7MgB5M+cMdObZlLklVaCom48ydJpDM15FoNZz+Z
	vIEOmnIHNGKyNyhNTv/SXZ+4pDet6KmDXCKnvdS38PS2lG7xtdq3x5S5Ec1UI4aL
	h4dvt+Lj3OgME56oPmlZuMEhuj3NWneMnET7X3g9nQ6eQF9Tjn8JuhmU4kJurB/M
	Ftzxg2OROuPMScZ8Aj3xAFSujQh3TtMEOjLjeIi9tyM12uGcWqNziLxiP5pQeun8
	U1ipO8BevEcouvrUPYg7+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728345804; x=
	1728432204; bh=1J18bIWQDPi6tzheZ/xJ6X1URWbY94iGyaG7rhPqMK4=; b=Q
	4VOCa8XOMSeHlLcdY8/MgaMXKg/OqlWMEAlCTAqIQBcbkRpyO/JjaXZmo0lQu9P2
	tAyat7Jk07ogHx2KBUBAWX0cnQg/PrhfQDEix3Yd18k5GTvY/i8uoJXizXchC+Kw
	MN8tjipau7QYz6RNIKsU2+ZRnHDpZK2dVahLHsPT3JQDzAepEAV0+Di9VRQ5Fp2h
	OUQqo/Qa0YPlzSt7LCoKWutkv24G1G7aHp1wjvYmewcu+PWRVh6V38J8nFlUqGiJ
	bgjD7I5AvqORpJ9Q3L0Pv7TJCPK/b1Rx+kvInzMSPOlXWDRpA7GCGtfu632vsmne
	hqi63GpMx3tMZ3R0KWZLg==
X-ME-Sender: <xms:zHYEZ8H2ClWEFcp3W3Cc4OO6RFM7KRhnfF9lT3K8kTPIZY4jj40hPQ>
    <xme:zHYEZ1WSPi85JweBHzqwMYnljaqjj-WbRFdm5gFW6oUIukco-rMGbUlB-qCAnkI0V
    8WSAn_S_gbKignzfBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeftddgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeevteelkeefueeuleejveetueetvefggfeuledvhfdv
    gedvheelfeelkefhgfetheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhho
    nhgvshdruggvvhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrg
    hrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghho
    vgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhi
    vhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zHYEZ2IE2ei_QQhW95lk1NHvjojAYFdhfDqXQaRTQcu9aLTVea2QsA>
    <xmx:zHYEZ-FVkmnrZgFQGmZBq_4dT6Tz96Q_viPTwZAqTgbDiMxu66A2Nw>
    <xmx:zHYEZyV7JvKSeZjjbxlP0w6wedppydtE8FneU7-18F_8B4AhMsvgvg>
    <xmx:zHYEZxNJCMrhCVIZRJkHEi8v5lyyUs1oHv_86nIkhSu30mBLdKvWMA>
    <xmx:zHYEZwzmiyLoSdjtbZ_TH1NWzARF036SsPMdAKBoyVkidHpUN0F3FjAX>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E6BB83360077; Mon,  7 Oct 2024 20:03:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Oct 2024 13:03:03 +1300
From: "Luke Jones" <luke@ljones.dev>
To: "Hans de Goede" <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 corentin.chary@gmail.com, "Mario Limonciello" <superm1@kernel.org>
Message-Id: <d7e2a19c-f65f-4064-b945-62173075f5cc@app.fastmail.com>
In-Reply-To: <e8107624-cb9c-4eaf-9760-073424b38b3c@app.fastmail.com>
References: <20240926095344.1291013-1-luke@ljones.dev>
 <5c21455c-c688-4287-a4ad-d047efa180eb@redhat.com>
 <e8107624-cb9c-4eaf-9760-073424b38b3c@app.fastmail.com>
Subject: Re: [PATCH 0/3] platfom/x86: asus-wmi: revert ROG Ally quirks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sun, 6 Oct 2024, at 8:48 AM, Luke Jones wrote:
> Hi Hans,
>
> On Sun, 6 Oct 2024, at 3:37 AM, Hans de Goede wrote:
>> Hi Luke,
>>
>> On 26-Sep-24 11:53 AM, Luke D. Jones wrote:
>>> The ASUS ROG Ally (and Ally X) quirks that I added over the last year
>>> are not required. I worked with ASUS to pinpoint the exact cause of
>>> the original issue (MCU USB dev missing every second resume) and the
>>> result is a new MCU firmware which will be released on approx 16/10/24.
>>
>> First of all let me say that it is great that you have gotten Asus
>> to come up with a fixed firmware, thank you.
>>
>> With that said I believe that it is way too early to revert these quirks,
>> users are usually not great at installing BIOS updates and that assumes
>> this will be handled as part of a BIOS update, if it requires running
>> a separate tool then the chances of users not installing the update
>> will likely be even worse.
>>
>> So IMHO for now we should keep these quirks around to avoid regressions
>> for users who don't have the MCU update.
>
> I wasn't sure how best to handle it, mostly the intention was to 
> publicise things. In any case the quirks don't affect the new FW update 
> at all and most folks won't ever notice.
>
>> Related, have you seen this series:
>>
>> https://lore.kernel.org/platform-driver-x86/20240922172258.48435-1-lkml@antheas.dev/
>>
>> that seems to fix the same issue ?
>
> The history of that is here 
> https://lore.kernel.org/linux-pm/20240919171952.403745-1-lkml@antheas.dev/#t
>
>> And it does so in another, arguably better way.
>
> It is a variation of the many many things I've tried while building a 
> comprehensive set of data for ASUS to work with. You can achieve a 
> similar thing with only s2idle_pm callbacks and Mario's patches to 
> export the DSM screen-off as an external symbol. Better is subjective 
> since it still fails to fix the initial reason this work ever started - 
> fixing the Ally - unless delays are added.
>
>> Although unfortunately as patch 3/5 shows just calling the global
>> "display off" callback before suspending devices is not enough
>> fixing things still requires inserting a sleep using a DMI quirk :|
>
> This is because the issue can only be fully fixed in FW. What is 
> happening here is just another variation of the quirk and the things I 
> mentioned above. It gets worse with different compiler such as clang, 
> or different kernel config, or even distro. The cause of issues is that 
> a particular signal the MCU is waiting on may not occur and that 
> becomes wildly unpredictable depending on kernel config, compiler etc.
>
> Even Windows can have the issue we have here.
>
>> Still that series including the DMI quirk might be a cleaner way
>> to deal with this and if that is merged then dropping the quirks
>> from asus-wmi makes sense.
>
> All of this is fully negated by the coming firmware. Having said that, 
> *if* there are any issues with these patches then those issues will 
> never come to light with the new MCU FW either as it fixes the root 
> cause of the issues seen.
>
> The mentioned patches achieve a similar result to using Mario's s2idle 
> callback patches and using those in s2idle_pm_ops. But as seen above, 
> the timing issue becomes apparent - and this is fixed only by using 
> fixed FW.

Hi Mario,

I am now wondering if there is some merit still in upstreaming your original series plus the asus-wmi patch based on those. The benefit for asus-wmi is that it is cleaned up a lot, and the delay can be reduced.

I can likely achieve the same thing using the CSEE calls manually but shifting to the s2idle_pm callback for suspend since the main thing is just ensuring device recovery with no regard for powersave.

The main reason for this consideration now is due to requiring some form of it to remain for a while as Hans requests. I already know from testing that there is zero negative effect on the coming MCU update and most users won't notice at all, but I would very much like to improve the current hack.

One other consideration though is that I've found it pretty difficult to get some kind of safe HID request done through asus-wmi to fetch the MCU FW version and disable this quirk based on that, but I could possibly go in the other direction and have the hid-asus-* drivers find the asus-ally driver data and flip a switch to on/off these quirks. That would apply only for suspend/resume and not the reboot fix though.


> Kind regards,
> Luke.
>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> All users should update to MCU FW as soon as released to:
>>> - Ally 1: v319
>>> - Ally X: v313
>>> 
>>> Luke D. Jones (3):
>>>   Revert "platform/x86: asus-wmi: ROG Ally increase wait time, allow MCU
>>>     powersave"
>>>   Revert "platform/x86: asus-wmi: disable USB0 hub on ROG Ally before
>>>     suspend"
>>>   platfom/x86: asus-wmi: cleanup after Ally quirk reverts
>>> 
>>>  drivers/platform/x86/asus-wmi.c | 39 +--------------------------------
>>>  1 file changed, 1 insertion(+), 38 deletions(-)
>>>

