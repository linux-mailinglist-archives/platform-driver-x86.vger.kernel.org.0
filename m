Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAE455879C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Jun 2022 20:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233048AbiFWSeW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Jun 2022 14:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234533AbiFWScU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Jun 2022 14:32:20 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 487128AC35
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 10:33:52 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id l24so72348ion.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=U/J7z9OVS3gtGadxdTf6r3xqpzpgRwX7yoVQ/m4SeED/dgw3O517Pd8heJCXavb1h8
         2Ai7rTxV+EZcnzjbgVBnsVukVyoNhYmLHi4E5upMUz9J0VhEfEy3NL8S3uHSOaYIxUwH
         07xJCqPb3NOobYPpviG+03CTOKmEjElQ/cEuW10ZPQ3L2D3RbkaNJUVzsczf1nEIXiwy
         UpAoJUp2q5Tbw09AEb+4+DJ5tF5Gm5Ju0UBRX3C86zYkBsDuxLtQ6akL4mV4wrDoOFxc
         r++kx+acnRLEaGY6ebf0CNHOUf54LSB36ryS5Dyq3tFE4xb+Im0iCelYvEhWHJvv91Y6
         +2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=OccW5hyYl/dOFOGMxhuAAQc5V9cP6RwKTWLDJ3EYpcz+bs57IIljr5yBff/VRnELPE
         tVBnRIoRwt6ybJ59LvQrmoWMtU1Keu1HVkvW1rN36U8sE9htmru3NHpVfI1JgS3J3z5T
         PIUzEXx0VOkPSD3tPYaW6mMjnzopc6NnwwZltPGp3qIy+0ASJmECYseeTgpXfsaRNMyz
         UIgTRUEczfEHzPjID7B9im7/feTYfNQjR9ecRitBw4f1HSckDZ64wM1r2zNXnAczZWJr
         9tZAN2S8tXUIgxFJVMf/NJOdiA2i3GFfEAqWrdKrNMPnA2Uuh0vOp0RhGj7Nye960bTf
         SRTQ==
X-Gm-Message-State: AJIora/uYpXbOTg/6Mj532qE8AD7rouTe9Z95vBdgmv1htFsmDzPaH0H
        m5T0hhQr4TzVyDGLR/jLYmA+k6/AHUqc8GTOWyE=
X-Google-Smtp-Source: AGRyM1tXTqM8WU1uj7xzOFNsaxZR/BKOGGJcwnX64CAgUs0BpwuixmSdMKgZ8AVQWGDremwJsV7kUz4DUeZR13VW+OQ=
X-Received: by 2002:a02:95e7:0:b0:331:5fd2:396c with SMTP id
 b94-20020a0295e7000000b003315fd2396cmr6103743jai.78.1656005631160; Thu, 23
 Jun 2022 10:33:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:349e:b0:331:fcfd:adf4 with HTTP; Thu, 23 Jun 2022
 10:33:50 -0700 (PDT)
Reply-To: info_citiuk@yahoo.com
From:   =?UTF-8?B?7ZWE66a9?= <alfredkammer23@gmail.com>
Date:   Thu, 23 Jun 2022 18:33:50 +0100
Message-ID: <CA+Bp8-KYE50thZf2uCpGKqnxqLvboC28D91Rn3T6AEHpPpFmCw@mail.gmail.com>
Subject: =?UTF-8?B?VklTQSDsubTrk5wg7ZmV7J24?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


