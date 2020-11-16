Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F8E2B416F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 16 Nov 2020 11:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgKPKmg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 16 Nov 2020 05:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbgKPKmg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Nov 2020 05:42:36 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0BCC0613D1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2020 02:42:36 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id o11so16832028ioo.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2020 02:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=CseN3BiBpJYn6k+hUUx2TxuA3gS6VM1QHXLDLxQNUzc=;
        b=oV6N8JVJhKU7DFb0cLyD/hhbYROvn06XlQ9mMWWjR9VPrkxgkdcmX9Dp5bDL9xm5qW
         GnTVatOqs5J5O5mTs5d23hCU7/0TL5YG438M2U6IUZn44Ru4AnmzopZhiDy6+B2Y9/ZH
         Uz8VRpdDgqgnhfCbacOEckVu+ZTyl00XoVCVTlPMIxcsh5WXdk6L7l3y+TJAOh8Bgm8Q
         HSOc7OdrH8XA9gJ/fYOFl1f0LDcMOu2LuXJSx+K28+pLUaKk3jKfED5rwC/6ZYrLMPFY
         bu6ONQp0QaDMVVDTrJLu1tspaewFAYQ3wYa8l44t1ePUXItlV4fpuEn51FLdXI+jv3Uh
         iFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=CseN3BiBpJYn6k+hUUx2TxuA3gS6VM1QHXLDLxQNUzc=;
        b=Qk6+x6i7AZppsyCSg7S1GAL0Z5vpS1Qr8vqETNt0/iJ9PDDuP/Q3sdHlxJt7xpJsFJ
         vCNZX84mt0AzDYd4zzmhnNEpB/fMUeBEoijNQ1ZqSIVX8UFVKiPl2ArOnl0Yx9fl/cis
         5eQ9oqTPadOWIA0QfaPP9hlX4hpDU/Moonn7Li8uDXuIxaXB3T3eO5DvsgWqWIxfnJQV
         EqnPDpDg3DVd37R447ij1JPVEruZ6bmpwE/7+A6izY8N3M/Xc9yCg2EqTjE5fXTwiUjW
         I6E+jVevjAjNrrqnTfcdIIupJQsA+vHR+yUU7Q6n/kFYka1p5eQFwnGAUKLxieZxUPjd
         iSUg==
X-Gm-Message-State: AOAM532ufCkX/uqbYOJO0CgKwUQ+ZSk1B1GLmyFf95QePHEDkBtTXOrf
        IlT9gS5+MKZaJIO4ZbmZVehEMc4MmhG5rykAcok=
X-Google-Smtp-Source: ABdhPJwyjzlDitMGBLERRXv4RRR7Rru4zAOV6qxfdOpSXCTFWDFdFSi7w6pH6r5pJ4H6CqEI+wnI7BhlcfT3Z4VW9PM=
X-Received: by 2002:a05:6602:2d93:: with SMTP id k19mr7281300iow.51.1605523355743;
 Mon, 16 Nov 2020 02:42:35 -0800 (PST)
MIME-Version: 1.0
Reply-To: paulwagne7@gmail.com
Sender: secretary.interpolice@gmail.com
Received: by 2002:a05:6602:24d3:0:0:0:0 with HTTP; Mon, 16 Nov 2020 02:42:35
 -0800 (PST)
From:   Paul Wagner <pw9076424@gmail.com>
Date:   Mon, 16 Nov 2020 11:42:35 +0100
X-Google-Sender-Auth: 7x2t-7dkW2IEIGOv7sAdGkhdpz4
Message-ID: <CALy0fi0q451uOcOv=iYHu_1=pXgei3ziBHmf_ECO1S2q8afrdw@mail.gmail.com>
Subject: =?UTF-8?B?U2Now7ZuZW4gVGFn?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hallo,

Mein Name ist Paul Wagner, ein Familienanwalt des verstorbenen Herrn
Thomas. Ich habe einen Vorschlag f=C3=BCr Sie bez=C3=BCglich meines verstor=
benen
Mandanten Thomas . Bitte schreiben Sie mir f=C3=BCr weitere Einzelheiten
zur=C3=BCck.

Gr=C3=BC=C3=9Fe
Paul Wagner
