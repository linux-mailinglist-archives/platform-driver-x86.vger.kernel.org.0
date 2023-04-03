Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBC36D5210
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Apr 2023 22:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjDCUSx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Apr 2023 16:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDCUSw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2023 16:18:52 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6668530F2
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Apr 2023 13:18:51 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id q16so39593735lfe.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Apr 2023 13:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680553129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vfJf6PlIVs0mx0aUMJoKbEsaFh9Y7hHn9wHE/gp/GJM=;
        b=cD+28QH78qipxWaYl62mVm14w1DHRtRBXd9/HpoK4xK7o4TVSo+GVk8C20NX9zjJim
         2d/bDx/7jICPk7gf8qtxS+kTUrgPj92LcLvz76DWu0R7zb8Q0tquncOFQJIJ3V6iXJ/L
         gRVf7BMqiWh1FHzCv226KX1N1U1uXMn2Ud0NTmV5oKiTkjmx3eiMx9oLRPgVyA7PsZ7l
         n5OPmUDBsWjJM1BO92Lv2xC6D2WBpfO4t25WTdw3+byS+QTWG7zGIhZW3Db3BHFria1y
         c6Bp2p5z1De4yu2Ef5pCatHIDoGV92joOybLfk3u+hSzaTIp4OEnPcSetfLX7DjxXOed
         9pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680553129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfJf6PlIVs0mx0aUMJoKbEsaFh9Y7hHn9wHE/gp/GJM=;
        b=R8OVAoKxM25wXtPp0xiKBLfSkUK7cj2jxDTuKWyqMIhcMLbq1ug432ewZy49IAKTnY
         KZocJ+aKrhCHaFngYp3pxOhiSSUAFAVZJDMTY0XZM5NRRarkUNXo4MTPiMy7EEM5rW0Y
         vv31GftHE7GkWpVkuwAuAQvy7rrDSY+oGucMMsgnEKdQk0YerJ9JAA8VHmONGK051f7f
         iQgsjDeDYsc/I4f7b3Zksczb/jfOuv4Wec1+zXmaZMM3K2u0KPTY4ueX/58f50dKncTI
         7M9C3+BOUWtjGIL7rH1H+YoPjy5p/vzughHk7rcqMgNwqUa2RI5QExar5LK5bq8TQBvd
         /6IA==
X-Gm-Message-State: AAQBX9cOxUcrx3bhFXESNW7g4t1ZJdYojD1mKvEJ7iT46XHLaKNrTuz4
        2nt78CDuHAYWTESdUirKcNVMwsy05Qb0Pu/wro8o+Vcd
X-Google-Smtp-Source: AKy350bxt9kI/vQ9wPTvoOkCTgZzl2MDpUL0/ulthIdyi/ghDOSuxwb+muZ/atw+DAs7k0ZD/Yflj6gBIfOLKb33Pts=
X-Received: by 2002:ac2:4146:0:b0:4d5:ca32:9bd6 with SMTP id
 c6-20020ac24146000000b004d5ca329bd6mr11128032lfi.2.1680553129585; Mon, 03 Apr
 2023 13:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230309201022.9502-1-jorge.lopez2@hp.com> <20230309201022.9502-4-jorge.lopez2@hp.com>
 <ef741af7-caf4-4f30-a02d-a939fa9cc48f@t-8ch.de>
In-Reply-To: <ef741af7-caf4-4f30-a02d-a939fa9cc48f@t-8ch.de>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Mon, 3 Apr 2023 15:18:31 -0500
Message-ID: <CAOOmCE_cV+n5Wn1MW13zOw69SqbSzsyg35RjR18Ed8+Wmwz5TQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] Introduction of HP-BIOSCFG driver [3]
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Thomas,


>
> Currently the driver stores all its state in driver-global static data.
> The kobjects are stored without any state.
> Inside the kobject attribute operations is some fiddly logic that tries
> to figure out the corresponding state with a fiddly mechansims.
>
> The more correct way would be to attach the corresponding state
> directly to the kobject.
>
> Let me know if you want to give this a shot and I'll give an example.

Yes.  I would  like to give it a shot.  I can take a look at the code
and determine when we can implement it.
No promises.

Jorge.
