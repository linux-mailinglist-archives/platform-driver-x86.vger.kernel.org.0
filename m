Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1F1438CAB
	for <lists+platform-driver-x86@lfdr.de>; Mon, 25 Oct 2021 01:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhJXX7J (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 24 Oct 2021 19:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhJXX7J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 24 Oct 2021 19:59:09 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19160C061745
        for <platform-driver-x86@vger.kernel.org>; Sun, 24 Oct 2021 16:56:48 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id o12so17313840ybk.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 24 Oct 2021 16:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=F26I+cBcpyIkdxRfcHLvmvj+TTSmfbBclURHJNpWXCA=;
        b=AWzq2pI3+oSB4KddU6sUXXqgOpL5M7iSUVL3xwsOjjGZ7XA/86sPD6iPi4AecibnKe
         7UCx7qKOvgajEG9TI7tgcj0SVa+ls/biSmgl351rlcKENIfui0FfBJfJ55Jn4Q0Wac6Q
         CDSeahQgKPU4RaHSmRBuYWb/0QDuZl2az0AmzfbLxuR9h7e8tSBU4GzFpYRq/hwyw57H
         n2AIe/Bvy0LVB3D4dCI3SnQ9hg5wXfG0OnlkRIsh9vbawIduRZ9kGQZSB+bqJXAXDwTR
         ijgliUoC88URAHS9m9fR4kVVcr7dQo4oOEFJ5G3uOinIxntpuSKofqDvqnPI4fjBZjXH
         APtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=F26I+cBcpyIkdxRfcHLvmvj+TTSmfbBclURHJNpWXCA=;
        b=KdVyCoalW2EQBK+D7Eg2rM/f4h1L5pOVeTEqKCSogdVdK/PsvGNm501q32NTFouoZW
         dYvzy/IY/eM2dnaxqpQASLJ/+T4RHHt8ByrEcP/eN3GxIHSV0xv+UkZXe8TMjPNm9dml
         jCqQ8oU69/J1/vDRs38+iwgM1Ykhc1mjzoowPulOEAE/yg3HRSQWwF23tn8ZkvgHsYXA
         PA4OtFOvSSwHW0LMXLAOELytGej4SbNn/JPMdxI2C2zFZXhXJS7jUDz+p+I6y65lPuJE
         /qFifX4XRa2wjMaCLX+pZS3Pa9xl+YfS8vRpjdeAUOFSY8U9UpI09Y3I6fOrGDG2ieqJ
         Sb1g==
X-Gm-Message-State: AOAM5332Q5Rucs+DmROtUxm8ds1S5b9RlP4eJAsBqC/V/nNwHDsp9FlP
        wTOU39AEJ2cUHPlJ/7wZRS0ZzZUftcNhQhfXeck=
X-Google-Smtp-Source: ABdhPJy0eizDGPaRhFE6/fCwl0kQo7PMxF74jMDGtWhT0ks3pmA8a+/z0vrMeXhqtsrXrnuY6BkC9PfjOmtvmAOknT0=
X-Received: by 2002:a25:4dd6:: with SMTP id a205mr13291299ybb.422.1635119806700;
 Sun, 24 Oct 2021 16:56:46 -0700 (PDT)
MIME-Version: 1.0
Reply-To: martinafrancis022@gmail.com
Sender: amoureux.tendre2019@gmail.com
Received: by 2002:a05:7108:5113:0:0:0:0 with HTTP; Sun, 24 Oct 2021 16:56:46
 -0700 (PDT)
From:   Martina Francis <martinafrancis655@gmail.com>
Date:   Sun, 24 Oct 2021 16:56:46 -0700
X-Google-Sender-Auth: tLW7eKuJvr5hMrZ591gZRlW5MGU
Message-ID: <CA+rKhx8hDQsGQuZzsf2jw6hB+bKBz5LdoPh5b=wxcisn8FJYCQ@mail.gmail.com>
Subject: =?UTF-8?Q?Dobry_dzie=C5=84_moja_droga?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
Dobry dzie=C5=84 moja droga
Jak si=C4=99 masz i twoja rodzina.
Jestem pani Martina Francis, chora wdowa pisz=C4=85ca ze szpitalnego =C5=82=
=C3=B3=C5=BCka
bez dziecka. Kontaktuj=C4=99 si=C4=99 z Pa=C5=84stwem, aby=C5=9Bcie dowiedz=
ieli si=C4=99 o moim
pragnieniu przekazania sumy (2 700 000,00 USD MILION=C3=93W USD), kt=C3=B3r=
=C4=85
odziedziczy=C5=82am po moim zmar=C5=82ym m=C4=99=C5=BCu na cele charytatywn=
e, obecnie
fundusz jest nadal w banku. Niedawno m=C3=B3j lekarz powiedzia=C5=82 mi, =
=C5=BCe mam
powa=C5=BCn=C4=85 chorob=C4=99 nowotworow=C4=85 i moje =C5=BCycie nie jest =
ju=C5=BC gwarantowane,
dlatego podejmuj=C4=99 t=C4=99 decyzj=C4=99..

Chc=C4=99, aby=C5=9Bcie skorzystali z tego funduszu dla ludzi ubogich,
maltretowanych dzieci, mniej uprzywilejowanych, ko=C5=9Bcio=C5=82=C3=B3w, s=
ieroci=C5=84c=C3=B3w
i cierpi=C4=85cych wd=C3=B3w w spo=C5=82ecze=C5=84stwie.

Prosz=C4=99, wr=C3=B3=C4=87 do mnie natychmiast po przeczytaniu tej wiadomo=
=C5=9Bci, aby
uzyska=C4=87 wi=C4=99cej szczeg=C3=B3=C5=82=C3=B3w dotycz=C4=85cych tej age=
ndy humanitarnej.

Niech B=C3=B3g ci=C4=99 b=C5=82ogos=C5=82awi, kiedy czekam na twoj=C4=85 od=
powied=C5=BA.

Twoja siostra.
Pani Martina Francis.
