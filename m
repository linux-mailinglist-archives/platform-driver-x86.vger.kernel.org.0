Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F6644FE95
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Nov 2021 07:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhKOGKP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Nov 2021 01:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhKOGKO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Nov 2021 01:10:14 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D77C061746
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Nov 2021 22:07:18 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id e71so4295866ybh.10
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Nov 2021 22:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Djpr1AS9BhRB0i84aUYk51L5QfT0/KDcZHhY+64EDVg=;
        b=hoBEUnEzMiw8uEDWJUhEILNQnxGMSHgTieBh6xBlkMUkBI7UrSnNVptb5YaZ02/VeX
         6Nouqtx2IxeMgl7slHTvv6ZNGMITpKTbuvNbxr97hsW8+Kvdm4pe2sZyLaBWp+579vQO
         RbrTkf7jjiCVM575DhGYtPRLIIeeURdos0yEXjVFRW3MnrqL3CamaEtbnbNYg3rAhGES
         B+nQTEVOIOCO+Idy7SZVysiY/oZNKKlSxkJvC820yMGrt5uFieB8xsD5pxkyX7srEqhz
         Lqtt9EoCREbmN00WivYhS0xneSlNG+zbwFfwNG61FFozJK5QnBv3Rcp0H0zpqE9kKxsH
         OgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Djpr1AS9BhRB0i84aUYk51L5QfT0/KDcZHhY+64EDVg=;
        b=XudIU2ppMayfni/We32fuztwjJDRZ0CzI3/L+7I1LNphYt7UkkNp1a4KEb0LWBwJiY
         gOJHGiN1fH8WfH16/6Mvdl1gzhy1HFYQBqRHLrNuxRycacgeb8/wHpVRPwmfU+TIqvv0
         Y2sFA7hf/Z+hnJ1QiNKOTalbvHKcDICyXr5C4jFRNZGHO0qMc6jUr6wQOCw6jpAyU3oN
         uKwJMQjWjENNc6O/BqEA43Cx4vojr4YLXGrsXOQ8si/kC2EhAUVcEdVWf0kWraWXZADc
         W85Sd8NyNloJpcNleeK2kvdeJsPBnemLonUaQhxrScucXxXZUoNARw5F27ZwNFU+vzqO
         khkg==
X-Gm-Message-State: AOAM533MviCmgnIZ9WRD3X3BtiNExXyB6AhOL9b7G3pFg9E7stbzhKqo
        PtBkMTYFWmRWFl1Uqqjsn4zU8xDjE/RevCoWaCs=
X-Google-Smtp-Source: ABdhPJyJgrnDpT3ZSdAxAAzN4y8Uf8MXRWmq4IROUpye8W/qgOJxJf8icTtbustzjhXyGz1YR363KTEiNobzukF11ls=
X-Received: by 2002:a05:6902:1081:: with SMTP id v1mr39187443ybu.397.1636956437875;
 Sun, 14 Nov 2021 22:07:17 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6918:1143:b0:64:7aba:6ba3 with HTTP; Sun, 14 Nov 2021
 22:07:17 -0800 (PST)
Reply-To: lerynne_west51@zohomail.eu
From:   Lerynne West <benzr9002@gmail.com>
Date:   Sun, 14 Nov 2021 22:07:17 -0800
Message-ID: <CANoGuzBh3P0xupQUe6kkOArjv_cT9UfTM7Ku=+_AuSHF_7-9ng@mail.gmail.com>
Subject: =?UTF-8?Q?Ich_spende_Ihnen_diesen_Betrag=2C_um_den_von_COVID_19_?=
        =?UTF-8?Q?betroffenen_H=C3=A4usern_zu_helfen?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20




*Beachtung,Sie wurden autorisiert, eine Gesamtspende von 500.000,00 USD aus
dem Covid-19-Unterst=C3=BCtzungsprogramm des Lerynne West Emergency Fund zu
erhalten. Um diese Spende einzufordern, kontaktieren Sie sie mit Ihrer
EMF-ID: COV-0043034. Ihre Spende in H=C3=B6he von 500.000 USD wird Ihnen ge=
m=C3=A4=C3=9F
unserer Richtlinie und Mission innerhalb von 78 Stunden von einer
akkreditierten Gesch=C3=A4ftsbank zugestellt. Siehe den Link unten:*
https://www.youtube.com/watch?v=3DhtEHuyOHUsc

*Antworten Sie mit EMF-ID: (COV-0043034) auf diese E-Mail*:
lerynne_west51@zohomail.eu



*Peggy Rock,CEOEMF-UNTERST=C3=9CTZUNGSPROGRAMM*
