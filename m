Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6E42F8EF5
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Jan 2021 20:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAPTuv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 16 Jan 2021 14:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbhAPTuv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 14:50:51 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD44C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:50:10 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id cq1so6957156pjb.4
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IjaQZN38vN2bQ1lj+qu3jBMJ4M9TX4Emk9wzPMx/sEg=;
        b=lZW9D8NjGkjptZd7QSLdFkP2vEH5Xrt/jQkz8MV8EnbXdLaGzm+agasE2d6FUc7ldv
         1mu1tBJzTP5314L1J+ahrD9IthVkRWt10pSd5dO1bHOc83PmMNSyPEbMfa/S+qXZp1dl
         z6w5980tcYCmHjvEyRxjY4w0GsZyGdll8wKrtSQRPMMcW+pyjXDnfsS+45lBdSU9wIVn
         PW7kDxXKXoA787zdFWe6eCq/FLqzF1T5RdQItQ3Ou71o7h/YBh2EDBkbx1uX7g10Ugl8
         PgUnHeJW1jhNKWAlLZWdY+83HT/AdEOao+eT+ma/jDQC7cn2j/FjVo89z3F5G7Hm5G00
         nFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IjaQZN38vN2bQ1lj+qu3jBMJ4M9TX4Emk9wzPMx/sEg=;
        b=pVd+2yC0qDKHmIiHgaFhR6LQdjSs7yyrSVjkXFaZuwji1xHQpkFEQjt0OFGeOFEopx
         kSDQwAE4B4CW5HUj8QoPRfKaRkPKiXXlX/iHGNAK37TjM2V4jPKeSQhgjfUOICgs8Z+R
         4VxBJsRbtvsChHlwcJrXN9IS9r1uuF0Z9k3XgOd4PF1XybGdIZV6Q3VV8i5nNhI4YDk6
         K0x9aBK0qqsYBQ4E16RAg98uHl6UqyZD6muX8hQpqeICGRVGTatDwlxkeBPQN27SD1ls
         ei4WHeGzC06XYARHXkIvBmlRDhoyux1Yzl5jaI8oJoEbh76T+pDAX61GHaZNuP1ages7
         CIuQ==
X-Gm-Message-State: AOAM532ALKUIku0cQpWi/YifMh0VdrbAr3p/aBKmg1dMA35xGlOd61AL
        2b2OkqZ4rOsHKY0U97v/eDSQNBg43Rgs5PvVxmY=
X-Google-Smtp-Source: ABdhPJy2yQuPIVgqBJpVN8GcDdJhRs2bDKaFZUuFBtRWWXQ625pXHeG50LvbffQdjdQqq+9sjbqjR5MaQgw2UyzhGUU=
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr17641115pjd.181.1610826610295;
 Sat, 16 Jan 2021 11:50:10 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-10-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-10-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 21:49:54 +0200
Message-ID: <CAHp75VfJBvG6ma0UxOjb4Wudeqpf9qrE3AtQ+nwwtsGhZ6fRpQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/24] platform/x86: ideapad-laptop: always propagate
 error codes from device attributes' show() callback
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Consumers can differentiate an error from a successful read much more
> easily if the read() call fails with the appropriate errno instead of
> returning a magic string like "-1".

Is user space ready for this (for the record, it seems an ABI breakage)?

--=20
With Best Regards,
Andy Shevchenko
