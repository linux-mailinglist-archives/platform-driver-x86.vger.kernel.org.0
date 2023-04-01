Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 740536D2C1B
	for <lists+platform-driver-x86@lfdr.de>; Sat,  1 Apr 2023 02:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbjDAAem (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Mar 2023 20:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbjDAAel (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Mar 2023 20:34:41 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE7FE3B7
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 17:34:40 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 185so3261029pgc.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 17:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680309280;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BxjR5EZmuC29QlRdpiIjXzhP04dUpDFF5Q5K7tpxa7E=;
        b=Zb0S/HK/g4LOB3u43J0wHCZwCtyjQ/g0FjRvx9kGVOqNRxxGPX23mQfWuqp6eKlalx
         jqL3eriZaPs3vxmJg+JW/i+oYElUfVNTQQ7suUvxt9x8rYlNPov9WaR4tdGmlb/JoW4D
         BDNZU0qknATlhLeoETw1Cjn1zXeA5kZDp6+v1b1HvfuRjfNI9ybXoWslVX+eNdR7ils9
         E+nNKUl/sh7fryhTiuVts8zgchm2R/mEgc//brmGQUPUJZ+TsdMCtAOYRm4Iryoyc6UQ
         zpoKhPQ7j91TPWe3iMQQ4R46T9s0tEFw3q1oQtAI1GlPbfZbf5U/7samlRr9fb4SU7iK
         94eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680309280;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxjR5EZmuC29QlRdpiIjXzhP04dUpDFF5Q5K7tpxa7E=;
        b=dfrnBk/zXphcAIlVvvuax7h8zZpawRlM6IInf0/vpat7pc9D62yp0hsYtgD08W3q1I
         clWWVAskRRCx2rzjkkmKjnLJ9mJ+wMRjVzied5Pmc9speolKAMjUJxBBwYG5tI58zcuv
         /3PUyQy2+yNcFieoCbFQvP2uitc/rOf6S0ZusdXfq8MviBRgn1/UhXwq6BOlATsBGPF2
         edVl64fsuceULX1HTpaaCfS/cAPxr5YbtQmaRCBHG3Kp639Iz4p6TCoBxwOCOWdVBLjH
         OlZmbCLpoMAyDkpT4/BfFI6Ea8TJA4enq81truk6s+6uefUtcjBtHvtBjL5/PZAYX4ZN
         1tZg==
X-Gm-Message-State: AAQBX9cq7BcCsG971WeZEt6Ir2guFsmmXI/sUdcqiqSv9E5SXNi2z0AK
        sYJFs6SBcGtM5/F6OObi+vL1D4n17dlgjcvJ5+w=
X-Google-Smtp-Source: AKy350YgZ1wvMKispqOS/myCgSv5KubGVoOHG5CwXi0t5ueeucNkr6OTihZkTrpJ1/eCjzacNxgrhr4CkJdJ7q03FBg=
X-Received: by 2002:a63:2157:0:b0:50b:e80f:caff with SMTP id
 s23-20020a632157000000b0050be80fcaffmr3352027pgm.0.1680309279827; Fri, 31 Mar
 2023 17:34:39 -0700 (PDT)
MIME-Version: 1.0
Sender: diallomamdou957@gmail.com
Received: by 2002:a05:6a10:4414:b0:474:d6e6:8b6c with HTTP; Fri, 31 Mar 2023
 17:34:39 -0700 (PDT)
From:   Miss Sherri <sherrigallagher409@gmail.com>
Date:   Sat, 1 Apr 2023 00:34:39 +0000
X-Google-Sender-Auth: JsJo4GJe4pgN8_AsOnWzWt0h3Yk
Message-ID: <CAF0C8JxAE0f4NVBqRdP9yTKz6uPNrvZWL8-MEyvOfzTSxvRw_A@mail.gmail.com>
Subject: Re: Hello Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hej,

Modtog du min tidligere besked? Jeg kontaktede dig f=C3=B8r, men beskeden
kom ikke tilbage, s=C3=A5 jeg besluttede at skrive igen. Bekr=C3=A6ft venli=
gst,
om du modtager dette, s=C3=A5 jeg kan forts=C3=A6tte,

venter p=C3=A5 dit svar.

Med venlig hilsen
Fr=C3=B8ken Sherri
