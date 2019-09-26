Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48587BF4C2
	for <lists+platform-driver-x86@lfdr.de>; Thu, 26 Sep 2019 16:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfIZOMK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 26 Sep 2019 10:12:10 -0400
Received: from sonic306-21.consmr.mail.ne1.yahoo.com ([66.163.189.83]:38203
        "EHLO sonic306-21.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726996AbfIZOMK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Sep 2019 10:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1569507127; bh=euy9S2/4+kZy++A4IfrNsNY0nG5tpX3oraAf8XcNLZo=; h=Date:From:Reply-To:Subject:From:Subject; b=fAV7oa0qZ6MTYGebCdXEdFCkvKM3TQ3ioSN6vNYOzN+FvLkc4Oumpsp4vGz/l3JpAHkrgPFV97VEwbxcxDd8SovQjP6h4qnWfqpPghrkSGnUjjurDN65Wr1Qvn1X7sp6bbNZLtEJvzbG0dXoNnxZentzitsRf7RrXNkjLOQGWTFaOtID13Tnpm6YdlC9iSa7I+FLNlRPQtLIF47R+5Hkkaj1J+WgnfIarg5gkJyWVPSKbz4yMtUVabMKM3bsR+F2xKowi5bfnM+CzyFKeLT2QwFyNf+5JPOJMxelUYj+dRx6ACqZ/ezTto36xfJHDwrNQcngFXAutnNHmGliXrGoPw==
X-YMail-OSG: SnH.NaYVM1lC4ODoDIZys1wQQv3Tmswd6iawdgjFJJx7qi_UHlPm0JeLoma7Qdr
 oCAXaW1hPro.rY2ziYqEwqK5R7JdQ0g4HBFXjL3IJIBLGHZReNLpI.KzKfiQ7MwntH5.awvXk9fr
 jwL99YlFkHXHDDF2Wu71kPf9VeJFrkB5QXNPC6OMSw1RDQylFEdpM7aJAOYx6hG6TSiC1twgIDFR
 dzvba8Wd3QdUXn3gbZeL9KMOeMEtwcti7m7_KSUsO8v7moXo4yh679SvFYhveJ1s2HD1hYHrvqU5
 xuUeWXZD2mMfdV1YoF6WbsxWk7M2g76SL3DTZR37f5Xurl6A4dvMD_V3q1dq5Lzm7cBdsd20rbwI
 YLR6_tMMo5F16YkWqdXotPIcaRhGPWL0yq5e61sSee7VqD6nBKux4NBSqSnBWhTopVuTtcYgaSah
 58sb4ucPF20sji7DW_J99Fw3eFkcpYQ9kngBSSMjbvJWiXBaEb2nx4z8Oe4PHzuHHigFUgnyfuoo
 PSf0J7tPkpQPHzQEDcR6JTgNViTkYDSNYtF8sdgzEseJ0YSx90uvHLKn2Xq4O5RzXV0In9OwZoJb
 uSF6Fv.1XN_TTOjqryWKG86VaapgOg.wapMeWrqqnEMgzYA..GPcEejEy1.zloKnYp.TnPZuauXz
 3.VOXBCRYZktCOyK2wOJps1G87uOO5nLwJ48cgFr8XsiE_dBv0x_zukyBg84NVDSndhB_tmVVZTh
 FMNtKLR0iwFB5RhA1qg.rJ6NgqX8GgiJG9syMCRkaA51FAm9.dEeR0.wl.iFlUZoAIOMTTz8XLpf
 LHhLwjaJCWoWOJd9eCqwzuSss.6IqYEImAEp3GSbLbX0bP9jBoDv_pYOgyBh9QOva_avgWA.LE6t
 b0k0MueVgM4WMYIsvd5SQqWVN8E_i9cErsDW9XpShG6IRW6z9EBBbxGrYLxkF_YXcRot2zx_x5FE
 zJTU2BDlHFpiYM.OQmfbe6JF0P8DmuMtbyxtc1Xs060bWP6DPIErn8ipTUxQuIXFQsEMPOhiCHj6
 5kOW0llpv2GjeWvRHAUqhSE2RlQ5rMmvxiBUIQ8JFH0Jl0xSmbgODFMLvbPgViyhXFx5JA7i1xBn
 JZ99vxZcwJHcD6eJrWgJM8PkP6l8Lyvmiq.b.W4X8Hb0bLhBsMGnZr1ceYOZj1kaFTtEFcAc6GQR
 23XPyH88OsLvnX1Cr5fVQnAx6HP6xbAqRNchCBsdf1y3jp1L1b8XmRFIZIEsC7Sprp0Xgjt0jWSG
 daFOi0bCgpkgImPK.GZ0pLIunw.HYnq6n39iOpIGDh_EadUXyNlBwxD9toXQ-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Thu, 26 Sep 2019 14:12:07 +0000
Date:   Thu, 26 Sep 2019 14:12:05 +0000 (UTC)
From:   "Mrs. Caroline Mark" <goshtholy7@gmail.com>
Reply-To: mrs.carolinemark@gmail.com
Message-ID: <1743483321.7090241.1569507125523@mail.yahoo.com>
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




