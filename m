Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9172F469324
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 Dec 2021 11:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241637AbhLFKEk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Dec 2021 05:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235610AbhLFKEk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Dec 2021 05:04:40 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9DEC061746
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 02:01:12 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id k6-20020a17090a7f0600b001ad9d73b20bso5547542pjl.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Dec 2021 02:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=esxAadU3+UzyTWgJKT1bUwFTK6KpmX9nIkgAaCqEFJ8=;
        b=CB9YrGA22JN5ZyeYydruSzhql86xH3kYrnFrKGq0qEvwNpX1VfCCXTK3SmIuYXz4PZ
         j7HtZRX6pU7lFpPXEUeyWrgZCTtwr4EldByTKDfLklw5UQ7Oc+YkEsKuTvaMaLQjtT1I
         WIoKFi92GaoKdZhS7LHwTVZ0i+C48STUGx0vX+zxoIsXvgGCla8CxvKfFGeXcmtFX6uv
         QjxHHln2bs5fu/pdQXmqETJLTCmHwlx6b5wV8iN41Mz4S4Dc93/0FwIXSKLZaa1kICtL
         X6I9V323pzhtYap6AkV+zGX2sDvFTUP3tInBZFephbmWqGlLcXhkQ0umYrjblldMof9s
         vnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=esxAadU3+UzyTWgJKT1bUwFTK6KpmX9nIkgAaCqEFJ8=;
        b=1gVAxjLWEoIKyyizMn/gX3R582vJO5EdKy/4egUBUikZdmLgJET9AWKgzmAo/T5NNm
         1+cNiepkhu3xTxiPuMpuCIy/Dcnx3YnDQwp4u0f0OAnbOqt7zQyL948gTn/Fngdjzqmn
         9tzPNKhQndNvZ22/7SRRgrAv/JIQH3pMwQYWGZqlAK1TAxbt2lSQXOZS9BN4++VHnsC+
         Mosg8fPb/UesUGuRvO0xxHR+gsJWNtwARBPjQKxRzAYUG7M3FnRH0Fl49M03pFJPE3V6
         dLQOIgVBNwioNYJbXqdva15FJEPpfMMj74c/OdwvotImPk4bJy4Ac8dQ4/pYZ3IpLmsi
         lCHg==
X-Gm-Message-State: AOAM530CLAo/gEkBIGNGeHvIcwG4Pjv3hfmJDp19oQh4iMRHxAurqsB3
        qWEPKkd2KUfmk6+78H1l6adRRR8eA18E2xjcnEU=
X-Google-Smtp-Source: ABdhPJxkzHD/O/7CnhCDyGGJyBHK8POHhxZ2zVDJ7xD3+SkkBl2OvJ6GBe+ZEmmjtepOHenpTg/ZXOyEeSyc9M2Yrl4=
X-Received: by 2002:a17:902:f24a:b0:141:c6fc:2e18 with SMTP id
 j10-20020a170902f24a00b00141c6fc2e18mr42831174plc.55.1638784871694; Mon, 06
 Dec 2021 02:01:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:6d05:0:0:0:0 with HTTP; Mon, 6 Dec 2021 02:01:11
 -0800 (PST)
Reply-To: jp2888322@gmail.com
From:   Maria-Elisabeth_Schaeffler <johnmunenemutugi@gmail.com>
Date:   Mon, 6 Dec 2021 13:01:11 +0300
Message-ID: <CAARS=ZFWkwqrPipVWe02G+5M682=yAvAVXt2b1x5ECghk+dwfg@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
Ich bin Maria Elisabeth Schaeffler, ich habe eine Spende f=C3=BCr Sie,
E-Mail f=C3=BCr weitere Informationen.

Gr=C3=BC=C3=9Fe
Maria-Elisabeth_Schaeffler
