Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6C34C1C27
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Sep 2019 09:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfI3HhK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 30 Sep 2019 03:37:10 -0400
Received: from sonic310-23.consmr.mail.ne1.yahoo.com ([66.163.186.204]:46186
        "EHLO sonic310-23.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725940AbfI3HhJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Sep 2019 03:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1569829028; bh=YzWWG+/9RPY8U0VkmR6N5Gk17aLV6Gsybz6nO0noKaw=; h=Date:From:Reply-To:Subject:From:Subject; b=MJUV1l/8uK35xPDmqknkyIH5BDvhGyuOVASvhY70xHYjtTEoO2AOE0AuUl8N3T+kLKYAdESA6l3SXFGZm1R2kthPBsX7KMFz4KJKG+pxDDunBe5Tazoc5uNOOjQAMNqhfE71AresZq9omFYm5+b6y4qMcY3SoAEI4QqmuRAEmOuVoRmXopGwbnqAHSEYE2+Z7hZezod/tq5p6uLC93O4AKOwo0o5GZ8RDRAGLDzwB/tLHjnH+r+vNaK5eCmIv35N2HxXpOisN2A1g2Che5xN0kHByXJMtAi5lNFo9JPgW4azm2btAQLLgIlSNXxr4GHEVR+kgkQTbrK5FPWPTOVQIg==
X-YMail-OSG: 9mrlGnYVM1kRpfA06fs6.axKQdDTeaw27VBLhEbx0WacUN8UzGQhezfp8boJnk9
 LOD_1LMS3jMZvGXYjq8BM4X22x1wTd0IXwtdNvWqfo1h5IjcAIK3SSD3DparjHiPOMAyNTk96UdR
 kEz6fEJv9fTlQGVKXjxkw.ZKBnrb5n7vjHfp7gyfOZsOZEIqR6b8FzKB7Ymh_qpgqeBQBqxR4bPk
 HiHRuQRjZ19I9.E3itIg56EQKKSceGUWnAFylWu2ge0oJdnVAMe.F1xLQlvZjAbw0GAXpHhEwe1Q
 KLPg8EcA8ncDSVWsaXyMO4IjnKpUI.F48Civkk8fG3zhx_FfR21qQzERqnscyi_Ex_FnTEhIzcBj
 5nPPI4vFe0AyQ1VRSGTvT5mTXZ9hFyhMcDseuHB.Arnygwq3x1Q7mBH79Dc_Yrg9Ylf6q92lYkWF
 vE7ktX4m.nXQmVtkBaU0.xuz25SXFI9X__lCRLWQFYr8Ur5uCwaU77M6VRBmcyY8Uz49MVelGy.h
 AiwwwyxOG9P7Cvd9QgnCEKSUpqZyBJ2cXjq1zlO1V4TUIhfZ9pnKa_lowaEK5BC.pNCd0UlR5Oc3
 YEpzdD9fB1NXcPInVMEKqT7Yd70ESWYYT7L2a.aNGskM4beY8RQlbDhZodxZFt6l1LJgL.5wkt_2
 27NmxHi.r1zH9LSEf80Zm6qpDDr.yu083UkagTF1iKlwuY5m9fiuITOEtu4KW2ZvSvmCIZbQkVSX
 QtFgjyra9nY8fn49T4ia_7dR0UweVZggNNMZPEgdSh4nKYN50ognEc9RZLk62boC8anlfChH1RHA
 eKU3khq3vj5eqvwKWKTrp.6dxDO6xS6zwuWsbMCm8tohLGgACh_2KKdcIsSJQSg7HT9H27uAtzRd
 LyO2ngKegqFjGlLtcpvT0TR8LHg.xua3OUeagJ3DTtgm6fXqZmuMxQYNknIxSfVok0myUWyTMVHg
 4clXqFo_1MYrVRUwDGEKIzKH0VnLY2V4CJGnClYMkC.cfodR593HbqLtQHLbwigZGQRI7lCsfhtM
 r80eX.2FxnZoKC2RajLs_tJJYr2mLmZiTwihK5Z91Em.fpqOV9V9MyK8U2k3HsppOOuf.bkIAQjT
 LhVOrGl1B34kUP0Z9DV402QGZiUwu_jGCWW9NmBGDibbVbIoposbD_DVmEHnGrjJQPS0UYi.IpdU
 nn.MoVGiNbpw.HgS7KnadxcAT.OMgYvzeL3VIuGfPtiJrPUOhCDYXJvzNpf0nFKEVZy1IyoXaTWM
 Dd3inFHgfIvflyvFFoYMgU.89.YwjKvl6bW8pZngkGq1k0yE.Z5EAeq9nUQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Mon, 30 Sep 2019 07:37:08 +0000
Date:   Mon, 30 Sep 2019 07:37:04 +0000 (UTC)
From:   Clake <jude.clake23@gmail.com>
Reply-To: jude.clake23@gmail.com
Message-ID: <879968017.1286702.1569829024118@mail.yahoo.com>
Subject: Dear Friend,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Dear=C2=A0Friend,

I=C2=A0am=C2=A0Mr=C2=A0Jude=C2=A0Clacke,=C2=A0the=C2=A0director=C2=A0of=C2=
=A0the=C2=A0accounts=C2=A0&=C2=A0auditing=C2=A0dept=C2=A0.at=C2=A0the=C2=A0=
Bank=C2=A0OF=C2=A0Africa=C2=A0Ouagadougou-west=C2=A0Africa.=C2=A0(B=C2=A0O=
=C2=A0A)=C2=A0With=C2=A0due=C2=A0respect,=C2=A0I=C2=A0have=C2=A0decided=C2=
=A0to=C2=A0contact=C2=A0you=C2=A0on=C2=A0a=C2=A0business=C2=A0transaction=
=C2=A0that=C2=A0will=C2=A0be=C2=A0beneficial=C2=A0to=C2=A0both=C2=A0of=C2=
=A0us.

At=C2=A0the=C2=A0bank's=C2=A0last=C2=A0accounts/auditing=C2=A0evaluations,=
=C2=A0my=C2=A0staff=C2=A0came=C2=A0across=C2=A0an=C2=A0old=C2=A0account=C2=
=A0which=C2=A0was=C2=A0being=C2=A0maintained=C2=A0by=C2=A0a=C2=A0foreign=C2=
=A0client=C2=A0who=C2=A0we=C2=A0learnt=C2=A0was=C2=A0among=C2=A0the=C2=A0de=
ceased=C2=A0passengers=C2=A0of=C2=A0motor=C2=A0accident.

Since=C2=A0his=C2=A0death,=C2=A0even=C2=A0the=C2=A0members=C2=A0of=C2=A0his=
=C2=A0family=C2=A0haven't=C2=A0applied=C2=A0for=C2=A0claims=C2=A0over=C2=A0=
this=C2=A0fund=C2=A0and=C2=A0it=C2=A0has=C2=A0been=C2=A0in=C2=A0the=C2=A0sa=
fe=C2=A0deposit=C2=A0account=C2=A0until=C2=A0I=C2=A0discovered=C2=A0that=C2=
=A0it=C2=A0cannot=C2=A0be=C2=A0claimed=C2=A0since=C2=A0our=C2=A0client=C2=
=A0is=C2=A0a=C2=A0foreign=C2=A0national=C2=A0and=C2=A0we=C2=A0are=C2=A0sure=
=C2=A0that=C2=A0he=C2=A0has=C2=A0no=C2=A0next=C2=A0of=C2=A0kin=C2=A0here=C2=
=A0to=C2=A0file=C2=A0claims=C2=A0over=C2=A0the=C2=A0money.=C2=A0As=C2=A0the=
=C2=A0director=C2=A0of=C2=A0the=C2=A0department,=C2=A0this=C2=A0discovery=
=C2=A0was=C2=A0brought=C2=A0to=C2=A0my=C2=A0office=C2=A0so=C2=A0as=C2=A0to=
=C2=A0decide=C2=A0what=C2=A0is=C2=A0to=C2=A0be=C2=A0done.=C2=A0I=C2=A0decid=
ed=C2=A0to=C2=A0seek=C2=A0ways=C2=A0through=C2=A0which=C2=A0to=C2=A0transfe=
r=C2=A0this=C2=A0money=C2=A0out=C2=A0of=C2=A0the=C2=A0bank=C2=A0and=C2=A0ou=
t=C2=A0of=C2=A0the=C2=A0country=C2=A0too.

The=C2=A0total=C2=A0amount=C2=A0in=C2=A0the=C2=A0account=C2=A0is=C2=A0thirt=
y=C2=A0three=C2=A0million=C2=A0five=C2=A0hundred=C2=A0thousand=C2=A0dollars=
=C2=A0(USD=C2=A033,500,000.00).with=C2=A0my=C2=A0positions=C2=A0as=C2=A0sta=
ffs=C2=A0of=C2=A0the=C2=A0bank,=C2=A0I=C2=A0am=C2=A0handicapped=C2=A0becaus=
e=C2=A0I=C2=A0cannot=C2=A0operate=C2=A0foreign=C2=A0accounts=C2=A0and=C2=A0=
cannot=C2=A0lay=C2=A0bonafide=C2=A0claim=C2=A0over=C2=A0this=C2=A0money.=C2=
=A0The=C2=A0client=C2=A0was=C2=A0a=C2=A0foreign=C2=A0national=C2=A0and=C2=
=A0you=C2=A0will=C2=A0only=C2=A0be=C2=A0asked=C2=A0to=C2=A0act=C2=A0as=C2=
=A0his=C2=A0next=C2=A0of=C2=A0kin=C2=A0and=C2=A0I=C2=A0will=C2=A0supply=C2=
=A0you=C2=A0with=C2=A0all=C2=A0the=C2=A0necessary=C2=A0information=C2=A0and=
=C2=A0bank=C2=A0data=C2=A0to=C2=A0assist=C2=A0you=C2=A0in=C2=A0being=C2=A0a=
ble=C2=A0to=C2=A0transfer=C2=A0this=C2=A0money=C2=A0to=C2=A0any=C2=A0bank=
=C2=A0of=C2=A0your=C2=A0choice=C2=A0where=C2=A0this=C2=A0money=C2=A0could=
=C2=A0be=C2=A0transferred=C2=A0into.

I=C2=A0want=C2=A0to=C2=A0assure=C2=A0you=C2=A0that=C2=A0this=C2=A0transacti=
on=C2=A0is=C2=A0absolutely=C2=A0risk=C2=A0free=C2=A0since=C2=A0I=C2=A0work=
=C2=A0in=C2=A0this=C2=A0bank=C2=A0that=C2=A0is=C2=A0why=C2=A0you=C2=A0shoul=
d=C2=A0be=C2=A0confident=C2=A0in=C2=A0the=C2=A0success=C2=A0of=C2=A0this=C2=
=A0transaction=C2=A0because=C2=A0you=C2=A0will=C2=A0be=C2=A0updated=C2=A0wi=
th=C2=A0information=C2=A0as=C2=A0at=C2=A0when=C2=A0desired.

I=C2=A0will=C2=A0wish=C2=A0you=C2=A0to=C2=A0keep=C2=A0this=C2=A0transaction=
=C2=A0secret=C2=A0and=C2=A0confidential=C2=A0as=C2=A0I=C2=A0am=C2=A0hoping=
=C2=A0to=C2=A0retire=C2=A0with=C2=A0my=C2=A0share=C2=A0of=C2=A0this=C2=A0mo=
ney=C2=A0at=C2=A0the=C2=A0end=C2=A0of=C2=A0transaction=C2=A0which=C2=A0will=
=C2=A0be=C2=A0when=C2=A0this=C2=A0money=C2=A0is=C2=A0safety=C2=A0in=C2=A0yo=
ur=C2=A0account.=C2=A0I=C2=A0will=C2=A0then=C2=A0come=C2=A0over=C2=A0to=C2=
=A0your=C2=A0country=C2=A0for=C2=A0sharing=C2=A0according=C2=A0to=C2=A0the=
=C2=A0previously=C2=A0agreed=C2=A0percentages.=C2=A0You=C2=A0might=C2=A0eve=
n=C2=A0have=C2=A0to=C2=A0advise=C2=A0me=C2=A0on=C2=A0possibilities=C2=A0of=
=C2=A0investment=C2=A0in=C2=A0your=C2=A0country=C2=A0or=C2=A0elsewhere=C2=
=A0of=C2=A0our=C2=A0choice.=C2=A0May=C2=A0God=C2=A0help=C2=A0you=C2=A0to=C2=
=A0help=C2=A0me=C2=A0to=C2=A0a=C2=A0restive=C2=A0retirement,=C2=A0Amen.

Please=C2=A0for=C2=A0further=C2=A0information=C2=A0and=C2=A0enquiries=C2=A0=
feel=C2=A0free=C2=A0to=C2=A0contact=C2=A0me=C2=A0back=C2=A0immediately=C2=
=A0for=C2=A0more=C2=A0explanation=C2=A0and=C2=A0better=C2=A0understanding=
=C2=A0through=C2=A0this=C2=A0email=C2=A0address=C2=A0(jude.clake23@gmail.co=
m)

I=C2=A0am=C2=A0waiting=C2=A0for=C2=A0your=C2=A0urgent=C2=A0response!!!
Thanks=C2=A0and=C2=A0remain=C2=A0blessed.
Mr=C2=A0Jude=C2=A0Clacke
