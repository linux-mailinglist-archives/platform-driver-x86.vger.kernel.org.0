Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAF822C97D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Jul 2020 17:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgGXPww (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 Jul 2020 11:52:52 -0400
Received: from sonic308-18.consmr.mail.ir2.yahoo.com ([77.238.178.146]:35115
        "EHLO sonic308-18.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726381AbgGXPww (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Jul 2020 11:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1595605970; bh=k6qD474V9VtXKDobcCBmjOJywgarZvgPlTt0r+34qBY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=bIFCtSWvSvBGFwdNR6yZvOuVWX984sJ9l5qw1mXj8UHhIyHBRBezA31XaXTc2DExF4gKyqUVIoDHR7Rnvnl0WnDTQN9wDz4JEcT9sRkySzg1/+qX26aBa3iulFyxEfwmZUw0NiHCcTtgDeo2R8mQxM7AzJ0+S/TEapwEokFlW/e9eGJnBv7Fmx28h4Sn1WqsHogk8QJrLEvsIcDxgnrHjsttymm9LlfKr2c/P5qfCXw/UYqIWLl7TJR1McmT/Sfob4Allpqp3aIUkSIOwItHAWbjJDfRZZRHdKgWx86ri0huUHnNDptp2qya/SJVMDqbAjB+dW5NbWjov6iMGPnmRw==
X-YMail-OSG: uy5a30AVM1l8kX7dKS3xC3Iiyed53jy_K5C_jyi8J0JBz6lbL90foNWPjw2Nwbx
 w0osrsA9bHf7MnZbe4qY89lh6ojKDLGHv09ZxV3zqJsyYZHSVWibOS14Gn8HQ0xxywq5tvABDmd2
 vHy3CYzdycDtcNPmkSXfyTrGxA4waYK7FZfXewjKZ_DY2NQJ14wSsxvY8L.VEXmWHQlh0wZOVuYi
 dAru9yMj.owRJs_Gs4bAHvUl1vsTiqa1_JA6T4QT_q8a092EkUtIMxpWC4ntoHL9ZES93j51Ln8w
 DTvby87a4o1CWdes_zKwt88ZkXIFOpwPyGuJIb0cfC_S2czhPhoreBHiEoVxhPtEoS8rWExhfIfx
 HGvMsheoAcMmWMpKtONGyEAgud_o1zjqV5E2uuDNbrqEX_Bc8m2bBhqs5A5eP1WL44zJWxKH2XOz
 c148l9lkuFIoZuMyf5ZPLvT16X5Gwz8xijerLqP3XU1PT0DvKB6VQv_cdIZM5nuCmowXcbGwNA.Y
 y5754z.9cWe8eKVceBMrQKpXGdSJtUqv.g7CGGR3GCs_PVXxupxXN18.FnZz3JYDtUA.0zl3K5tM
 FW7_dnl_MhidPrDSg9fUlWZXNauv6gOgW.WzGAnT48ZEaM65JO5l6pVnG9XUMDOaTIzMifMH_5GO
 .FbntpTZYlFLph4AGL9zN.5B1xE5ZIerTUfLxuyT0vhZF..nfO050.nkLxUDY7D47I9ip2IjJLhg
 ZsRA5FQzHImViZed.k6CfhYs6prHVWqm2ANgCdOQVgjMuOOOU3qqYMGq2343oXs4Yib3ENchAGqL
 3jfePYVk3NbYx1g_0XwHO4YDyJOUi.wEdH3rMdk4Fv0WKsZYoZ9g0HQfbDoN59bi_Pm2siyLqbFL
 yFWaASeQnEtq3kIl7R4PutcO8VdNVVixCgQClkMHhapcDtg7Q5XlRNbLS3hmDoHeICAGblHWx3q6
 Ao3IuH15DXPO4SzMsbBuY1LDuD4tUm1sps6ITflztNh.VXEN4h1ouw3sNBP0xikizluCnq7ZcwTb
 N72QGB6HZ64hjbw_GRl7EOImkVNahzB_2KFwpNWFyH4C7gZAk9FIsOybHUyMooG7HS8W2v76rAxh
 zCCBk2.d7TH_pBTMMYFVyldu6ulZoYFhI5DlLJAkCuvxOwWctTmmjtGDDr8.5o8DCnIkgd3_HUiX
 z5kd3Uu2idUdBd8zjzXt.l5T2am9n.LktIFwHioeTo5F2IlUViTkWwrPNYmzHnk6sUyyeJ55s_Xn
 .bnw3CaoG_Tnz5rweLYPJWtW.qMIRYxI2YelQPJTUIOyQ7rl4x3aBzq.hCFrHWd9hdiEZ49Gilw5
 48MtNLP4WjVUp6ght3..CiA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Fri, 24 Jul 2020 15:52:50 +0000
Date:   Fri, 24 Jul 2020 15:52:49 +0000 (UTC)
From:   MONICA BROWN <monicabrown4098@gmail.com>
Reply-To: monicabrown4098@gmail.com
Message-ID: <986124579.10052478.1595605969805@mail.yahoo.com>
Subject: FROM SERGEANT MONICA BROWN
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <986124579.10052478.1595605969805.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16271 YMailNodin Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I am Sergeant Monica Brown, originally from Lake Jackson Texas. I have 
personally conducted a special research on the internet and came across 
your information. I am writing you this mail from US Military Base Kabul 
Afghanistan. I have a secured business proposal for you. If you are 
interested in my private email (monicabrown4098@gmail.com), please contact me 
immediately for more information.
Thank you.

