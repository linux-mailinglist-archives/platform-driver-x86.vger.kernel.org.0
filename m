Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01EE37A9EE3
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Sep 2023 22:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbjIUUOP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 21 Sep 2023 16:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbjIUUNx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Sep 2023 16:13:53 -0400
X-Greylist: delayed 4199 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 Sep 2023 11:55:35 PDT
Received: from mail.craftedscape.pl (mail.craftedscape.pl [92.222.190.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C246E448
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Sep 2023 11:55:34 -0700 (PDT)
Received: by mail.craftedscape.pl (Postfix, from userid 1002)
        id 0CBD524092; Thu, 21 Sep 2023 07:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=craftedscape.pl;
        s=mail; t=1695282118;
        bh=exbvoVxelzsX70n1HucpAkYMO+cUzf6L5FuH2oDKoIo=;
        h=Date:From:To:Subject:From;
        b=VLobjR580YTtE0VeVVRruEbQNbDlXEZ835rN/13vNzSVOEl7wd2qYZMUkufog3eQD
         qWM9YirwUN9LzLNE70w3X2wVPA9EppUEYd7S289mKLzN+YOlf8/bmszWB/dC0TZQtO
         e7lV2FWhEB8TJjdvKFPxHfO8a8C3DCuRbq7GH/JsTDyVShxNS83JZh7p27FcQdo4qG
         liMlK9OLTUL6VNp9Dgo70itzrgX0gpiUjSRnohR6AY4n0J1Bzs9EKsU7tAelsSI1bH
         pCW99e5K09ZVdZ8L4U9XMwBIjncyYfdfkv3evLYdLsHmbyeRPq2oyf8fps0pasklPL
         nW66J4LIEaRdw==
Received: by mail.craftedscape.pl for <platform-driver-x86@vger.kernel.org>; Thu, 21 Sep 2023 07:41:02 GMT
Message-ID: <20230921064501-0.1.71.qazm.0.bbrej40i30@craftedscape.pl>
Date:   Thu, 21 Sep 2023 07:41:02 GMT
From:   =?UTF-8?Q? "Igor_Czerwi=C5=84ski" ?= 
        <igor.czerwinski@craftedscape.pl>
To:     <platform-driver-x86@vger.kernel.org>
Subject: =?UTF-8?Q?Pracownik_na_produkcj=C4=99?=
X-Mailer: mail.craftedscape.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_TVD_FUZZY_SECTOR,
        URIBL_BLOCKED,URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4884]
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: craftedscape.pl]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: craftedscape.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [92.222.190.29 listed in zen.spamhaus.org]
        *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [92.222.190.29 listed in list.dnswl.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: craftedscape.pl]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 T_TVD_FUZZY_SECTOR BODY: No description available.
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dzie=C5=84 dobry,

czy potrzebuj=C4=85 Pa=C5=84stwo dodatkowych pracownik=C3=B3w?

Obs=C5=82ugujemy wiele firm z sektora produkcyjnego, kt=C3=B3re obecnie m=
aj=C4=85 wzmo=C5=BCone zapotrzebowanie na dodatkowy personel.

Tygodniowo zatrudniamy =C5=9Brednio 250 os=C3=B3b, a w naszej bazie znajd=
uje si=C4=99 tysi=C4=85ce pracownik=C3=B3w z Ukrainy gotowych wesprze=C4=87=
 Pa=C5=84stwa dzia=C5=82ania.=20

Je=C5=9Bli potrzebuj=C4=85 Pa=C5=84stwo ludzi gotowych do pracy od zaraz,=
 prosz=C4=99 o odpowied=C5=BA.


Z pozdrowieniami
Igor Czerwi=C5=84ski
