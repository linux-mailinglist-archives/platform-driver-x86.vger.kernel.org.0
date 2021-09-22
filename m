Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913B7414A7A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Sep 2021 15:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhIVNZK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Sep 2021 09:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbhIVNZJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Sep 2021 09:25:09 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114C5C061756
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Sep 2021 06:23:40 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso4433337pjh.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Sep 2021 06:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=YJWiKB3rNyxA5v/2yYY3f+UjYiIF1h8gcM1Tq8PJfZE=;
        b=UYV4dHKwAyuwXTrTyj52EiMD3vvTE9MWJ/JuaDbDel5QEH5OA9MzmWz1x/DHiA2Xzy
         tFyRWJAmOgvXw7Qg079Lh+eRkaY508/m8QFG9GDAIi9Uv2YoX9sDHiHFilPR6+8wktvb
         yBbMN8/CjIqwSsDZChJDGKJOpRYN8O1D+DugpvB3n0eW/e68SZagoGZm1FOhnKIZn3zG
         XKV4qaFFXbeNC+fxmAnSa7mAbxd8gT/JDd2/wbdqh289cwEEoYl1iLUAANhM/J/NjVC4
         sg9AOsTPlstrAzEfa0X2tFa/fuzXndftiZbvsRcbLyberw++uKrV41JfKzQXFZN7LAXv
         irSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=YJWiKB3rNyxA5v/2yYY3f+UjYiIF1h8gcM1Tq8PJfZE=;
        b=NU5O+N2qBQyyf/tn2g+YcEywURYR/fCCOx1XjrVnfd0si4QxBR91t/u+lDrgUOAoUV
         Qo8pW0N/QqtcuV3SdhU5778yQGskDWEnXiT3FdgLxZLX5p/RpyHqE/RTkGkA+6ORC9Dy
         RfAbOX4JajGU69jKjGuIPliyWNSJzsSvGDJ5QHxrtccQEnwBK4xC3HxcD72OSr/HFSu+
         aXhI73CY+1n7BB55TCCoksrJHu2d0N7SarcDYwThCcnqzWH5MZ3gCjYPnh/yoxyesuHu
         UfVGO2G68fR9Gq7kBqD2WALBwD5LjMAzCAKebUZwg61k8WhDDlapwczXKnx9d8pSP797
         hWGQ==
X-Gm-Message-State: AOAM533I99EagluTOrEvdEJK2fYaoxxRy8zILaZzUJyYwzvTWjy5PhcW
        njzksK0JQcnuKndX1PtZGeNb5ZweJDNsWVCp2j4=
X-Google-Smtp-Source: ABdhPJwEZr0GE/Hp6WNUiUHMdK47ENB2lhWoxqVNr9kFhBXo3f4HT6syUU7HG3xWUmLd8IT7s7ZKURlfLDiQNSyIXb4=
X-Received: by 2002:a17:90b:4b8f:: with SMTP id lr15mr11288136pjb.163.1632317019650;
 Wed, 22 Sep 2021 06:23:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f48e:0:0:0:0 with HTTP; Wed, 22 Sep 2021 06:23:39
 -0700 (PDT)
Reply-To: manfranco@zohomail.com
From:   Manuel Franco <martinsteinlendings@gmail.com>
Date:   Wed, 22 Sep 2021 14:23:39 +0100
Message-ID: <CAAY96TZMPF58AJ9yTkCB1uG_0CifR+GWeAng6WB=Bxw_bfcp3g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
Manuel Franco lahjoitti sinulle kaksi miljoonaa euroa, joka voitti 768
miljoonan dollarin Powerball -j=C3=A4ttipotin 23. huhtikuuta 2019. Ota
yhteytt=C3=A4 h=C3=A4neen s=C3=A4hk=C3=B6postitse saadaksesi lis=C3=A4tieto=
ja:
manfranco32@gmail.com
