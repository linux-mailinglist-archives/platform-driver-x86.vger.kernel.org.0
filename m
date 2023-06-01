Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDA57194CA
	for <lists+platform-driver-x86@lfdr.de>; Thu,  1 Jun 2023 09:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjFAH4w (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 1 Jun 2023 03:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbjFAHyo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Jun 2023 03:54:44 -0400
X-Greylist: delayed 490 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Jun 2023 00:48:45 PDT
Received: from mail.liffey.pl (mail.liffey.pl [89.116.26.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668A5188
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Jun 2023 00:48:45 -0700 (PDT)
Received: by mail.liffey.pl (Postfix, from userid 1001)
        id 642BB7E2DCE; Thu,  1 Jun 2023 09:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=liffey.pl; s=mail;
        t=1685605233; bh=OqM4+o/moYKNduuI5gw1YnFOqNP/S23znQJb9V+pDlE=;
        h=Date:From:To:Subject:From;
        b=KGRXqVqXnShPEzW8gi0nl0kEogETgo+x0sBiJBBgAvQyzJ0v7Rx/4iREjFb3xAaFo
         OBWQOMQvMmQh8eOAZF1FywyH6zJJmDru80LzHr6sv6nuq/AwiO50X2fsp5ZvzA/+Le
         yx3ZJkHSSfoiqpjppEizZE2PG5rRhDi/wnPfY7livm6WIHhHR7L4SlDizuBnfjnsT2
         SG8gjloABfnWUYjYVJ3pRvSUdSuMRFxIO+o4Pux48QZf4af32292O5IR31BZz6A0nE
         hYwvQ13wEbt6r+WPcmQl33+PuLrZ2ZyzrwbE2PXOtakAbZrt6akMy3FOf3hKXjVbW8
         EMneihv0NfBhg==
Received: by mail.liffey.pl for <platform-driver-x86@vger.kernel.org>; Thu,  1 Jun 2023 07:40:31 GMT
Message-ID: <20230601084500-0.1.1w.24mr.0.2dhq0eturm@liffey.pl>
Date:   Thu,  1 Jun 2023 07:40:31 GMT
From:   =?UTF-8?Q? "Micha=C5=82_Rodziewicz" ?= 
        <michal.rodziewicz@liffey.pl>
To:     <platform-driver-x86@vger.kernel.org>
Subject: =?UTF-8?Q?Bezp=C5=82atna_konsultacja?=
X-Mailer: mail.liffey.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,
        RCVD_IN_SORBS_DUL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
        *      [score: 0.1533]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: liffey.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [89.116.26.218 listed in zen.spamhaus.org]
        *  0.0 RCVD_IN_SORBS_DUL RBL: SORBS: sent directly from dynamic IP
        *      address
        *      [89.116.26.218 listed in dnsbl.sorbs.net]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: liffey.pl]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dzie=C5=84 dobry,

por=C3=B3wnujemy oferty r=C3=B3=C5=BCnych produkt=C3=B3w finansowych w sp=
os=C3=B3b niezale=C5=BCny i obiektywny, dopasowuj=C4=85c ofert=C4=99 do P=
a=C5=84stwa potrzeb.=20

=C5=9Awiadczymy tak=C5=BCe us=C5=82ugi serwisowania um=C3=B3w, pomagamy z=
abezpieczy=C4=87 rodziny os=C3=B3b prowadz=C4=85cych firm=C4=99, zapewnia=
my tak=C5=BCe sta=C5=82=C4=85 dyspozycyjno=C5=9B=C4=87 naszych doradc=C3=B3=
w.

Koncentrujemy si=C4=99 na zabezpieczeniu p=C5=82ynno=C5=9Bci finansowej K=
lient=C3=B3w, pomagamy zbiera=C4=87 kapita=C5=82 i korzystnie go lokowa=C4=
=87.=20

Je=C5=BCeli potrzebuj=C4=85 Pa=C5=84stwa doradztwa finansowego, jeste=C5=9B=
my do dyspozycji.


Pozdrawiam
Micha=C5=82 Rodziewicz
