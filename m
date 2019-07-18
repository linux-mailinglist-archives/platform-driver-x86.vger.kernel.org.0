Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 371586D10A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Jul 2019 17:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbfGRPYz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 18 Jul 2019 11:24:55 -0400
Received: from sonic314-20.consmr.mail.ne1.yahoo.com ([66.163.189.146]:40364
        "EHLO sonic314-20.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727623AbfGRPYy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Jul 2019 11:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1563463493; bh=09HtrnZ2OgwPAyHgjdE4MANxe9VnkLUPuZ+9ieVJihY=; h=Date:From:Reply-To:Subject:From:Subject; b=Te1KjoMCkJXT/NQ/mC/0xiGuZ8WvBATK78ung77D5PaGXOtWZ8yC6T/jc0DseRu+IF4SfHXCfKNq51AFxQwYMLSAnAV+ciQLk9u6ftbFEb1reflrH4UPZMzYRzEbyxdghIatyK/A2e/bN4N/V03NfllrWLo4se/tL8taCR6XV5ROkK4RbZ+AkyoSsMdSa8WZnmOKzFTrUhyurN8jPK19zGvO1e1SAdTenuh7xIX+xm/pIl5qZ/VL9kHvebN/DrC4qLJgEEX9YE/UTk/tFAYFYo+MXOej67Bmk3BP2gzzECSF+t65Bk4a32GXGJFlbN7i6pOLAS3H3to0w12VIbncZw==
X-YMail-OSG: hGj14bAVM1mCg.feHvn_1WcOhBWyOyTKkd8ruGmRWIc2PiAvb185gVlEphHeJYA
 .KtdN_kcpXZCD05ea6IxBxVfFv3.EmrYkRjy_wI2n._VdO8rHv99hQV3NnhUUbzPQWlTvYOWK0AD
 ClM1adj_NgFwZ57Ix3W9RHFVCZ.QHf1ptpeSyvOUJuGmCHhkAhNtY0q5J5f7WRLlyscuKlvuWdOv
 Q7b2cAXPFxbf29CWh30QN5REOeHqM6UIxiRmTorZAWNMdGE8VWW4yYvKXqqExdQBSjVOxSoysZHq
 ErHoNzts3wcBqPjP9eyttFj3wewDDQgoU_XG2HnSEo_gyTVTWaDnaTdO.GtRrNdVhRaghkMJ30QO
 MthsgRUusMD9g5ADvYRmCxteYJDY1Hh30zLFLZUmimh54J0FButNpkyWnxKP5VvQyCSFngqjkQeY
 UfTY2deeBiXRghSAPnxDGZpq01PkraOObp5ZHdvUepJr2IOVXC37Cx5gfbq.ciG4VflNZEB29sx1
 Wap390OfBaTKdsWYHhBDaBiFRWVOy80x_WGG3H1xg2j0rCyHjgwxF.YfIgTyHFWcbELt.VnXR.IS
 ZIoeXr64MAwMslnQQ3sLqiriJLoD4gJBSoX_LCFijb7Mr1KXH8gRseJm2HPy5ySbmB34aBHrwyP6
 mmmmnOm1PGVXug4.c2g5cNayITYWi2CeaHrvLjscJZwiyXd0dcsnzxhuex.7qUxqnRd7mkVtOprI
 p2FdpWozenSxJ7eL8n2xFHoiKlNuv3qpaDgVSjqvtAt6cCjrdH8DVcFdG0d7oxF0SENTA3K2HT3E
 rQfjJgp_ydlVl7rws0tTFfTwuA9dclQ4X26RUHWLCTp7WRMnR82vE2OJ8Wk0e6uh46hdfoBG0VgV
 p.MxZOEgQBv6CchW7J73RY3Yv21LedtwxRq0ZristeF7uN2Ay1mf.1sckl0tldBPe5Izg9uTqsPZ
 vQfz83SZcR9PpyBGub6tOqM3lMNATTTxi90MKzkDk6Zr.KAu2kVQ.xoiVaFBlYB1ucm9ky6canRP
 pM41AK.gbsuhsvlyP5131bEvNomczg6fNWjlyoSyA8C3Y4jk_l7jkPPZzHU9aw4JhZsQqrnA8Viz
 An5SKySA_qxDWeSnvIppvK_DSC9mpBGVwaQhT92jlfcjwgqW_MPrbnmo5_CzYZOJyaXnqkrwmqLW
 Oos5lBVnh_DO_PB7SsNAt5Bv3lbKwPnyiBd6i_ENsfkSQmYhEA.2aSG6U6I9UXFjXyWrp0QNEd1D
 OPDCQTIo-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Thu, 18 Jul 2019 15:24:52 +0000
Date:   Thu, 18 Jul 2019 15:24:48 +0000 (UTC)
From:   "Mrs. Nicoles Maoris" <mrsmimnicolas02@gmx.com>
Reply-To: mrs.nicolesaaoris@gmail.com
Message-ID: <96426742.3834977.1563463488261@mail.yahoo.com>
Subject: Hello Dear.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Dear.
I=E2=80=99m Mrs. Nicole Marois a manger in  HSBC  bank  of  Spain Madrid, I=
 am sending
this brief letter  to seek for  your partnership and long term relationship=
, I have an important and urgent  issue I want to discuss with you privatel=
y about transaction fund  worth the sum of $9.5m America dollars left by mo=
st of the greedy Asia Kuwait politician in our bank here in Spain Madrid.

If you know that you can invest this fund into profitable business in your =
country by the end we shall have 50%50 share each,  kindly get back to me f=
or more detail and procedures .

Your urgent respond will be highly appreciated
Awaiting to hear from you asap.
My Regard.
Mrs. Nicole Maoris
Email: mmiminicolas20@gmail.com
Email: mrs.nicolesaaoris@gmail.com
Phone Number:  +34(62) 768 5146
