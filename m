Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAD714B16
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 15:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfEFNn5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 09:43:57 -0400
Received: from sonic305-21.consmr.mail.ne1.yahoo.com ([66.163.185.147]:46267
        "EHLO sonic305-21.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725852AbfEFNn5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 09:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1557150235; bh=M+2BQM2x3GSy/dmtDG0o07y3ZYWK28QOQCLRz1DcS2Q=; h=Date:From:Reply-To:Subject:References:From:Subject; b=YEvZQzwLmM5hir1orfyujUyb/DnQpK5/NsrRjYOPzMlY54j9ykZjkpnLqGkCQIDYWbxosE5wQpjb9eb6YbfELNOC19tp34Gvu/cOGHDTuG9Rx+2pqHNB7JjdlAqn6Vlu6z++Y2sEOA/ru2/6rOKfJr0DsAfcisVcoFZAP5HvLJxyR/N5IjjVlRUAM/yOQlKToBGEMQGUCJg5P7N55Pshz+yM5fcVtS+KMmZUwDYtgoKlN2InQ83KSmO9tLlHSpVZR02VDCyXoe/1IDDqoZcRDcB53jfQFm43FXVI26iDGxZ6/UlrcNB4lt0otxtPD/oAxHKzJtG8iIG4AK1RfckCZA==
X-YMail-OSG: ZhKv.aMVM1mLDAicwTt9_f51WHfuYpwo3NWrzvGMKhAikwhkKucXFoLUjgDek9u
 N50iLlV3t3LLgaIlO0eDJZjvsuVR.U.y4G_SZrOIJBjjQYUncSOszN6svnaSvkuXsrWgQfe8NBZL
 WPjgAPAVIa7qM52ExZyHlCT0NfulYxbYz4SQq9y4iJNjgUwh.vaUc.aNlvetvTI2OH25Q81ihYn0
 Y.ofVsrdlH_lhp_fczphSEWETFGY7sj_kpXZkr1wU7reknCItCaDwVdzU_8JHllYfP0y92LKIfAN
 A5DqF_6DnkUQATaS3w4PFzXwLGDNxVWwQW_odajfmWTuy1nMLdvrWLbgbeydVj44iIiMbJbCQgtS
 gtbJokWZ2B3bA1ho0ipBfnA67OOk0P35XHvJd_3_he7xhPJZjT8TpDPXmV0OGps5r2ZvRbyakoB4
 VanW05LrXjyp_xwvmnrgkAN3BssVr1Q1ubbRzvwIkg771HZIQ8ZmVmaj59MHeK_LXtiB0URv_Gt3
 E70DqLD80DtzC.dy8lnxi270frF.efRrS8.l2oWJoYtXdi3vF9jOf6A7JRjt3wrGbOpBrwHvdL_n
 GBN9_WooJYJUVgoFenyxxpQuH55KtcqKs7RHwcoDKfMbM4b4giTrNKzRCRPDhKOJfWQR1c9FcaC2
 M47GLSlWComu4KtJvSf6YJ_iDJYJ2lgA9Amd_2x3hTilOgwD.xFnwM9qxa2PoJqv0AjZKevnqos7
 NmRK2Ilj3LynRDSECHx8pch1aRHIm4yWrc0_A.FxPGJSBWjEA8eOzJIWIqpLG1E.eSsVQqNcxwMO
 KxXBxZmx_UxCYgF9ojcTw.b6uLxFUz7YQVzKTLtF7R.AcUPd_SuaCWYsqxUYnjCkD6h3_Ojz4yHx
 ltrFN4gYM1tbOtHYq4OLb.WaFaqJ2QXuHajMU8PDkxWM6VDZsQcdo66IWguT_qq34cEyCrhYIexK
 ISQw9xPetIEl_5LpdwK9Jl5NuRGCLvM4GjPOqh2mdBGw6nC_BR_KVAOiK6OQqQtflQwBoslpF8Y9
 p3snDs4Yv8XRthLuc5A1Xc4ScANdzE4lqiszJ8LUcJxCxs5dBvs1fbDZlF0aoW5TwZmsCpRWnhJM
 jHsKIKr23CL9Jvjg_nmSGQw9Bg7CrL5dd5AE_GpMavoY42XtFXSC9aPOTEmDxn1KQrhQ9jvXzeg-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Mon, 6 May 2019 13:43:55 +0000
Date:   Mon, 6 May 2019 13:43:53 +0000 (UTC)
From:   Aisha Gaddafi <aishagaddafi721@aol.com>
Reply-To: Aisha Gaddafi <gaisha983@gmail.com>
Message-ID: <819440062.1969805.1557150233971@mail.yahoo.com>
Subject: Hello My Beloved One, i need your assistance
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <819440062.1969805.1557150233971.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13583 YahooMailBasic Mozilla/5.0 (Windows NT 6.1; rv:66.0) Gecko/20100101 Firefox/66.0
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear Friend,

I came across your e-mail contact prior a private search while in need of 
your assistance. My name is Aisha  Gaddafi a single Mother and a Widow with 
three Children. I am the only biological Daughter of late Libyan President 
(Late Colonel Muammar Gaddafi).

I have investment funds worth Twenty Seven Million Five Hundred Thousand 
United State Dollar ($27.500.000.00 ) and i need a trusted investment 
Manager/Partner because of my current refugee status, however, I am 
interested in you for investment project assistance in your country, may be 
from there, we can build business relationship in the nearest future.

I am willing to negotiate investment/business profit sharing ratio with you 
base on the future investment earning profits.

If you are willing to handle this project on my behalf kindly reply urgent 
to enable me provide you more information about the investment funds.

Your Urgent Reply Will Be Appreciated.

Best Regards
Mrs Aisha Gaddafi
