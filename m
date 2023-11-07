Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF1D7E4C14
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 Nov 2023 23:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbjKGW4y (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 7 Nov 2023 17:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbjKGW4x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Nov 2023 17:56:53 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C7018C
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Nov 2023 14:56:51 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-45f0e332d6bso1502421137.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Nov 2023 14:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699397810; x=1700002610; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9aQpGnlHg5gEiLB2/yPrIgqrIEgRmUzLWSaf61mYkw=;
        b=g4MUCpDHPIJdXuFIahiUFhK+QhqshXutHpMEZ6eVsxjZZ1vrdX6WexTILtQA/SLzzr
         0F34uhY6d3NRjb/staxgbICGwqmyUAeIhKPG3E15rA8zgpazYjMT1Tzo7afpaNdb5WjJ
         OWPkPxqB8gNKG7GBge87UufOwHZ8LwbZBiEBk5C/4oVgygzSZkbathrkgAlQbc4pF5ur
         BLAe9aR05mrwUVwEZ7xRNlpqqtLb/My7Qlo7NRORoqn0OunIjeZFrma0N6FUrRgUKW45
         fp6UIBScTCSfihJ79g90zsc7KARqCowwMF2mvd78rbnryXUo4ibhUXRQYXmnzAIoomP+
         W0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699397810; x=1700002610;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9aQpGnlHg5gEiLB2/yPrIgqrIEgRmUzLWSaf61mYkw=;
        b=NoiYqkyKdG2uKLsUNC0pnkNO45qgUGEhbI0Mv2ePyqM+3IekVUngwZkW5WjCC8FMh0
         CftztPqcBK81ofM69d6vYFqAtvlFMnhK8nhtP8373YhxPa+QaqkDR8B9deDQs0ryeW0H
         7U84uXyZ/1RZlUPhXxZH4/edPsqMddrOvFWwAwD0C+iqw/teHB0m7xoEDua72kMHQMT/
         LP9YM9uOSzxRru3L5/ZxGpvj7euVBDgXo18CIBDgIStVBMhVZ++JqT35P1BkGkcwHi9U
         T9qw1NVB9Q/cYxgG393YpHR8sy7vq+Bm2B9MOew74reT3Iq0uih1C3rr/0OgKgesvC5N
         7pXw==
X-Gm-Message-State: AOJu0YwcYmq6GKDS7NK2+ceQ9neV4oE76VyUE3dKbFvcwWvYN7BVflr+
        xVGXaool2kKxVigESvZu5d5QeqoHOnymak/nmFY=
X-Google-Smtp-Source: AGHT+IGEd9upds8eC57I4hoXHgoZrOD40d9Sftp3y5r2Jeoy03SI8I3LEKwb73P57QjwL2kLFE4stE2bUPLVODH0UXg=
X-Received: by 2002:a67:b802:0:b0:45f:4acb:d50c with SMTP id
 i2-20020a67b802000000b0045f4acbd50cmr139444vsf.0.1699397810156; Tue, 07 Nov
 2023 14:56:50 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:b671:0:b0:415:12af:8b7a with HTTP; Tue, 7 Nov 2023
 14:56:49 -0800 (PST)
Reply-To: mrslittlebrunel888@gmail.com
From:   Brunel Brunel <bbrunel584@gmail.com>
Date:   Tue, 7 Nov 2023 14:56:49 -0800
Message-ID: <CADSsQCD80FkVXZ4Pq+MGhBeB_xH+8nz7SCsMm_1sxhPcnOm4og@mail.gmail.com>
Subject: DEAREST SIR /MADAM
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DEAREST IN CHRIST.








My name is Mrs. Marit A. Brunel I am a Norway Citizen who is living in
Burkina Faso, I am married to Mr. Brunel Patrice, a politician who
owns a small Gold company in Burkina Faso; He died of Leprosy and
Radesyge, in the year DECEMBER 2001, During his lifetime he deposited
the sum of =C2=A0$18.5 Million Dollars ) EIGHTEEN Million, Five hundred tho=
usand
Dollars in a bank in Ouagadougou the capital city of Burkina Faso in
West Africa. The money was from the sale of his company and death
benefits payment and entitlements of my deceased husband by his
company.

I am sending you this message with heavy tears in my eyes and great
sorrow in my heart, and also praying that it will reach you in good
health because I am not in good health, I sleep every night without
knowing if I may be alive to see the next day. I am suffering from
=C2=A0long time cancer and presently I am partially suffering from Leprosy,
which has become difficult for me to move around. I was married to my
=C2=A0late husband for more than 6 years without having a child and my
doctor confided that I have less chance to live, having to know when
the cup of death will come, I decided to contact you to claim the fund
=C2=A0since I don't have any relation I grew up from an orphanage home.

I have decided to donate this money for the support of helping
Motherless babies/Less privileged/Widows and churches also to build
the house of God because I am dying and diagnosed with cancer for
about 3 years ago. I have decided to donate from what I have inherited
from my late husband to you for the good work of Almighty God; I will
be going in for an operation surgery soon.

Now I want you to stand as my next of kin to claim the funds for
charity purposes. Because of this money remains unclaimed after my
death, the bank executives or the government will take the money as
unclaimed fund and maybe use it for selfishness and worthless
ventures, I need a very honest person who can claim this money and use
=C2=A0it for Charity works, for orphanages, widows and also build schools
and churches for less privilege that will be named after my late
husband and my name.

I need your urgent answer to know if you will be able to execute this
project, and I will give you more information on how the fund will be
transferred to your bank account or online banking.


Thanks
Mrs. Marit A. Brunel


Email Address >mrslittlebrunel888@gmail.com
