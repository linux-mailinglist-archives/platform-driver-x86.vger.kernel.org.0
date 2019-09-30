Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065B0C20A6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Sep 2019 14:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbfI3Mcm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 30 Sep 2019 08:32:42 -0400
Received: from sonic316-11.consmr.mail.bf2.yahoo.com ([74.6.130.121]:43437
        "EHLO sonic316-11.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729603AbfI3Mcm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Sep 2019 08:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1569846760; bh=euy9S2/4+kZy++A4IfrNsNY0nG5tpX3oraAf8XcNLZo=; h=Date:From:Reply-To:Subject:From:Subject; b=ZkSlUHq/qK/yrMqJ23/wQW7qd75MR4GrWdPu4g5AHd/lkOWwrJsbz4gAXLlzij3yI5r/GknpA46sr7UV6agEvYHURZz4sBXgbWBhaNHBUdA76Bmj8IgBgkRD7DC/Z41UteZmvKH8KSNSdFdVyWRNG3aAw+cRylrvjgcegtLwmopgEnJ4Nff5oPb6nikTMNbpWebTu/5FroLHh5+mkeMjOsQVMC1PpAINdIXt7L8ctP9gHcjySWGQKzmc/M0+7e0p6YZp2lTG5vTQ6yFkfkpGLgWnTCyM0J5nTermL3N3XdQamMKZxnEfunKXxCaM2hG7Dm7d8XrUXupu2FK3b3E2eg==
X-YMail-OSG: wCWQ.jwVM1l.HIF5q5tLlfBUWEZz6gQcpy95W8OGNeuFCyfOaUnINhIrpKYb0gN
 5JfCEpl3uHmtqlexbnaPOxmgh7xAKu6ff5pUa68hK2S4YlSn1wRmwqmzL66g_CmwayDqqSmnpak2
 NH9wk8i1h07.Sj_FDGHukTeqMq3HvlL6bjMAhIbD198LMAPEiTw4.82BGcne89BLfCPsdc6YX4Y4
 ABehkFsf49xFsP3JZzlJjUTAvwrJsW6Pf2UFuFWNkvGx40f6_IaYMvolXAMrmmhF3.qNyj7mCmkI
 .U044HXcUri0upI8Pt1_LP0qLwSUAq.ec5GNFlqfOkp9MYTlOtFfvQKA830xDzCtH.2cNrvYDOb3
 8H.Z5xaCeOMe4cQ5Q01GzJQtOHkjTrl_AprBKztr3H9uDDEiu4Gim6xfs81_UmxvaWv9k2TvSOwZ
 yam2GDtF2Y.Ynlw3rChhji4m7nO8SZ7BGljP5xI7QzyOCoPF6kTv4W2F9oobzCDu7RIehTS4rptw
 1FvlMetBwXSkDDx40FefxLipUiPMWWlz4Z3G_W9EJxhRdAtUmXkqka3VTO2iG2EyF3Ry2z7mmUJT
 .RqmmhaRAPNlUx3FxiIExUJcXEfWLuunBerIzlj9JsGJylYkGJVueqYoSzTfRCzxNeXHoVSW_2X9
 vEZ1EQDwiBnfdHYfdg8bJNHktPX_Wbzqa82VKqsrCERJ2UhNpu0qsyH4TdjBBXZU9guXeWZBE1.A
 gOtpeV69E8i3O5mWl5BnX5vgvNPS1dIIGmjPNSaavfX969ob84bNp3rd7G4gAo4o_PwTU8AqaB.f
 A82slQeoEUf_vMYuNKH3ZJHEbnv2VkOpGLlZsBsP8HN1kSxSJ0K_siRsUtUfkLmjzaAB_vdTzAdJ
 0YHRTtmp5NCmoj2986fkTjetTy2O6WYtHUFwGGmZq4e12N_2b9EgCOWQ6nsPjtb1LFZZRkyjAe1_
 z9XODi6hfYGjG0eqzPv6vr4mfVrX1isBfWxiGpR.SnFppxY.F01mMUneHhF9kuGr841_FNO8nnU4
 A0BGGyjEamkO7RwlwvOhpCaMrZ5W5fjB6KnUl0_Z3W8amTiQIFBOcLyDGpayDN3Arzijqsi0P2VS
 6fnfY5LmEQoNGh9oxXg.zqG6PPth5rFkGTV5onSAsHjBr3A4xzA5t46O9dDnE.iZqu1VR5rMTZER
 1o7S10LH.DbRROnJnAZASurXmtASgcecEw4aUAyM5NAkJFKvWma_pzZaEaDnHuucY0okiLSLDsAA
 zKonbXB8SJICCctvacWr5gfciEe_fMtxn1GF.EHNMclXirRenbecMmnA24R4F620-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.bf2.yahoo.com with HTTP; Mon, 30 Sep 2019 12:32:40 +0000
Date:   Mon, 30 Sep 2019 12:32:36 +0000 (UTC)
From:   "Mrs. Caroline Mark" <goshtholy7@gmail.com>
Reply-To: mrs.carolinemark@gmail.com
Message-ID: <1340113063.857082.1569846756850@mail.yahoo.com>
Subject: Hello Dear.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Dear.

My name is  Mrs.carolinemark,I am 30years old  from USA united state of
American medical doctor, starting from today, I was just going through
the Internet search when your profile which i like it, all i need is
good honest  and trustworthy friend, i have an important somethings to
discus with you , which i know that is going to benefit you and i in
future.

If you are honest and trustworthy person please get back to me by  email me at

Mrs.carolinemark@gmail.com

I will be happy to see your reply for us to know each other better and
give you my pictures and details about me.

Yours
Mrs.carolinemark




