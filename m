Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBD91BB1BA
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Apr 2020 00:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgD0Wzs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Apr 2020 18:55:48 -0400
Received: from sonic307-3.consmr.mail.bf2.yahoo.com ([74.6.134.42]:40007 "EHLO
        sonic307-3.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726204AbgD0Wzs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Apr 2020 18:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1588028147; bh=6SGlaVl4TB4LtxpIBKOQN5h0z/LKQ/4ntybi5DPYq44=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=eiTZG22HlNoWs/SOw3z8L7ChJa1wtTPaj5qGngHdtdJFqZ6vMxHvYia3ISPcC71KOSg5vVRw9+rC2GZU8kTtKGlISyzK3gIhqnXPjc0YPZtJ0DReJxZwetq3LBuQGsNbHJ/GaJgX5sRrVbO6uqlvBp1hlXKdK+DeuAwsUwnyMwGiEXZM8DC/BC8CWFJsbGGI+osy+sPmD5JFDvSKyCGB/0E/W67wU6JFU0qIKdzNCgnyBSR2wrYVBxra6OQ4jfODJ9kkVsdNA9zLq5mc93gr1E8Niv8T+HmE5l6obgJ2+xA37neA5PBK3UoRGt64Kwla+JsQscVl1Qvorl39SSL+hw==
X-YMail-OSG: KEif2BIVM1lVrQ1zzYT_zJfDKauXC3Vpl0yxsKn0dNMEydoFNXcFy_ik.73hHCk
 tXTOSxU_zEzMj0xGqj1IKO81LzSXdm_ym47fi2oK8izBVlCUDba5f2warspO_8Z4AsQQtF0YigMX
 R83i2gqiHIHBDY2pOa.v27desTaNpSuLwhF_QCsbllZJpPiVZirdVX0XzQmPkvGi73ix9Q1rvD3J
 HU0d5un5bXyukXFRAqS9XqoXvb43X.rFdIvy95SkwNl2pj0f.Q0MuNdOTfLd7K2w6NZNXQwBeo1c
 SF90k8EuOL2oft.BaNlP36GznjVMtCoaJzomqaT6.HXyF5Ow5vzZzWcRQBuuhJBzG02TgYuKFuCG
 zFLXdnKi90Gh_bW_nocoYZaqmosxkVYnSIlyqhUl_JPcJZpwSvpivFeFLPQfOcL5OB.cXt5K_sJy
 Jj7_92VVzjLbqwIxVjYo7xrkExU7zuuqRmVWHpsgAm5_LiWpW8dFbYO1qDIy1XEd45CQGBO.8GqV
 8tAeXkXZfSPCi6msrG.RLxaiKj7UzZtsLwjIg3Kh8oTQTULZMcVyf0Qt2CPPcC3ZFThTupSo9aKs
 IHTQmpg6b9cGv20nPfiAFpeEMLIamGViTHHXfEYLiMVDTTlsSQYymaFQjFaGwuyHzLTpuLG749j8
 z9MuSyPe.991FGecaRw7riAbn2NC1K2HGEL0kNEoqkFuJku9yvW2s0FEtWT4NdhCG2LNKfFxI7l4
 H1BO0AuSQUQCPCz9Z78iWRzQUAsCMPwGWYGOcEQOv5fsEG5pKAXWpPIXvnG3cBr0gWuJXp5dmNPR
 akI29JaVQIo_E7KwQ1yasuk0l0j.v_AEND..6NMt13xEGgZPUIn2Zd7kFwzYP19WOVIWuCo7abbG
 DCac9wPlBqfNUl1rIqhD5QzcQ7tKtWv2w_PXpDtYT7bPoL5jwkQ1ZTe5Crbvdplz97vze2eXxZP4
 orRUhDooyHf6iaN6Hmc4C8xsZONm7wlT9ORnmv063BhZwBLY0RDf6GmLMrOu5sx5ziG_bgmQcAgK
 hogmSDGSCJ5OX3N_KH7YomB_MQ9R.Be6wZp706crrZtiJmHM_o8KJfnau8UNrXNRzvEx_mkRoYVS
 9f6o_pQ7DJEghl0MLwQQPva7swPGkV0kD_kAhSM414YCv9nVsG71G9Vjkh1yufL.3r0ULKHOQstQ
 Q54KqITFkzHU9Qyc1qL8G5zqQ7lXyddeSttw30QTW.1tJZBkvEioPTK4gNbhTYk3i3MOhyBCQeg6
 x13j5YiIXNJrT6lcgNVcy_sSntOfOxvbK5uATQCELLxByGo5.dRfxfNuXIY01GFm33xyo9L7xyOf
 BKuelvRHPn8_K7u7YPX4Vx9yePfN4tg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.bf2.yahoo.com with HTTP; Mon, 27 Apr 2020 22:55:47 +0000
Date:   Mon, 27 Apr 2020 22:55:43 +0000 (UTC)
From:   "larsh@apache.org" <larsh@apache.org>
To:     Dario Messina <nanodario@gmail.com>
Cc:     ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, kjslag@gmail.com,
        bastidoerner@gmail.com, sassmann@kpanic.de, agk@godking.net,
        arc@osknowledge.org
Message-ID: <280883536.837294.1588028143542@mail.yahoo.com>
In-Reply-To: <11041815.WYjWQN8m1R@lenovodario>
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org> <11041815.WYjWQN8m1R@lenovodario>
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual fan control on
 select models
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.15756 YMailNorrin Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dario,

it just seemed an unnecessary complication for the user. This way existing tools (like thinkfan) would just continue to work.
I could not think of any use case on these laptops where you actually want to control the fan independently.

It would also be hard to expose this through the /proc/acpi/ibm/fan interface.


-- Lars

On Monday, April 27, 2020, 11:41:22 AM PDT, Dario Messina <nanodario@gmail.com> wrote: 





On Thu, Apr 23, 2020 at 23:57:59 CEST, Lars <larsh@apache.org> wrote:

> This adds dual fan control for the following models:
> P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
> 
> Both fans are controlled together as if they were a single fan.
> [...]
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always
> changed together. So rather than adding controls for each fan, this controls
> both fans together as the BIOS would do.

Hi Lars, why have you chosen to control multiple fans in this way?
I know that BIOS controls both fans together, but the EC has the capabilities 
to control both fans independently, so maybe it can be convenient to expose 
this feature.


Distinti saluti/Best regards,
Dario Messina



