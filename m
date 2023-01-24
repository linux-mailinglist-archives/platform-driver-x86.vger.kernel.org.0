Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 159386793B2
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Jan 2023 10:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbjAXJLZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 24 Jan 2023 04:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbjAXJLY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Jan 2023 04:11:24 -0500
X-Greylist: delayed 584 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 24 Jan 2023 01:11:21 PST
Received: from mail.crawnon.pl (mail.crawnon.pl [51.68.198.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9D13E087
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 01:11:21 -0800 (PST)
Received: by mail.crawnon.pl (Postfix, from userid 1002)
        id 1C566A3331; Tue, 24 Jan 2023 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crawnon.pl; s=mail;
        t=1674550885; bh=C5hX24svv/9/TME4wPCHfYjl17BCtmuxEd1i9B4zdYs=;
        h=Date:From:To:Subject:From;
        b=ur/ASzrDBce7asf1Wly0ieCQzoaO877vP5s1vGV+I0UbfR1a6g8m6mrhOXFf2vpgr
         qV+J873AIx6xYTMvc+xWni8lN/u4jjECFy/nob1W7rjEMbSdGl3McIrboy+twpv6Fx
         lDl+vwynKgn0+xf1+iYWGI/wV4oMqAoUXnQxezU4I9sp/5d2lDQgzc7kwQLyshwTwr
         Ym6FrIK7i6/X7yQnAHIEQxLgRalSi7kRJigsYEAtytnmNz4sFwLwBUFQy/LEcEtR5H
         q2FcCBHbe2hmrslRZIkQj6BMJugI6AygJqCuPZd/bODYCnO1Yoeyd3yF84BhJq/qNm
         WQYhIyU0JbSTQ==
Received: by mail.crawnon.pl for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 09:00:48 GMT
Message-ID: <20230124074500-0.1.8q.e414.0.2lo63vg34p@crawnon.pl>
Date:   Tue, 24 Jan 2023 09:00:48 GMT
From:   =?UTF-8?Q? "Miko=C5=82aj_Fiodorczyk" ?= 
        <mikolaj.fiodorczyk@crawnon.pl>
To:     <platform-driver-x86@vger.kernel.org>
Subject: Fotowoltaika - nowe warunki
X-Mailer: mail.crawnon.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: crawnon.pl]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4726]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [51.68.198.42 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: crawnon.pl]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dzie=C5=84 dobry,

chcia=C5=82bym poinformowa=C4=87, i=C5=BC mog=C4=85 Pa=C5=84stwo uzyska=C4=
=87 dofinansowanie na systemy fotowoltaiczne w ramach nowej edycji progra=
mu M=C3=B3j Pr=C4=85d.

Program zapewnia 6000 z=C5=82 dofinansowania na instalacj=C4=99 paneli i =
16 000 z=C5=82 na magazyn energii, ni=C5=BCsze cen pr=C4=85du i mo=C5=BCl=
iwo=C5=9B=C4=87 odliczenia koszt=C3=B3w zwi=C4=85zanych z instalacj=C4=85=
 fotowoltaiki w ramach rozliczenia PIT (tzw. ulga termomodernizacyjna).

Czy s=C4=85 Pa=C5=84stwo otwarci na wst=C4=99pn=C4=85 rozmow=C4=99 w tym =
temacie?


Pozdrawiam,
Miko=C5=82aj Fiodorczyk
