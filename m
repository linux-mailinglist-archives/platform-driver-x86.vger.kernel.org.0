Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187F4545B5B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Jun 2022 06:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240094AbiFJEwS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Jun 2022 00:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbiFJEwR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 00:52:17 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698F9317504
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jun 2022 21:52:16 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gd1so23118207pjb.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jun 2022 21:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=1RyHqCxoLsTpmMsHtqy/wdC2TroVDxtcrh2h0YEDbOs=;
        b=emOn0HVZ+/CbHAVrkFbyfFAjRnjTL9t83sGdsiy+CztuNpBqkV0d9jU5QWei3/N86d
         EWRDiW7cuaIkmEAwO4//CnBocUjwWkmisJFAuwO+KQfMiN3iChw6wJcssbdUzqb9iRY7
         8dDUdFq4mgWcMUyed/n1ACXQ8VCzMcvbU5aCZpAd2CpgbPDQQhJxmGDogF2f35o8CdIl
         R9XvETy4IdejeXdeZkzmDiNoHhGVCsaO0rqBzd5Qdq0q19ro0MedqDJT8KPzf2iorswO
         iOPQgwGhS7ZyGvAbqGsQnhPqs0oYGDyQEAh3mg8N4o9OLH8cNn1xwaWiPCtWk6AgMqVN
         Sj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=1RyHqCxoLsTpmMsHtqy/wdC2TroVDxtcrh2h0YEDbOs=;
        b=1qcEPJbjWddYEt3razkyr+lTbuBmCrEj+Gtno8uEJQuf0rTQqn/lYZ+2XOV+zhLOEa
         TV2fHvzXaZsC+jEEY/z3Ip+rz+TDYlDcYOYgL0xbO9J4Ec2QtXoT2aSyVZ7GF64BhBmd
         4mK5PsGaD99qmNuxyM9Yil/Evh0Uosd/PPjc9TLjD0xOAb+YMo/zJ8c6fljal3rv3t8i
         zr1EYdgEhTHDFSWhuHaLJfgTd2cgfeH1GEJglEy/mCGC+HRumitI1jhuwsa4racWUDMX
         6QPqzIpUjaMVlflwimADDpZricgctrFhTQhFUc/lM5HmpLkuAEKYGhp14v84D47Essze
         5OTg==
X-Gm-Message-State: AOAM530ijkOPNIbtfEpEic9K7e2BRD1yKBzi1WufZhAswpym3FZEkK2N
        gf6IbUxtOA8G4sYRQsHZi6D78CJ+IXfNNgo5NQI=
X-Google-Smtp-Source: ABdhPJy9tyEjk3xzdcLRHoU/03QIXy1pdQ1lHnET/kenM682mHYKQ98e78PCPfRvZV+VKicFJwVr9/wC1dght6wHkTY=
X-Received: by 2002:a17:902:ccd0:b0:156:7ac2:5600 with SMTP id
 z16-20020a170902ccd000b001567ac25600mr42527926ple.156.1654836735870; Thu, 09
 Jun 2022 21:52:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:7b83:b0:67:f675:929 with HTTP; Thu, 9 Jun 2022
 21:52:15 -0700 (PDT)
Reply-To: sophiaernest566@gmail.com
From:   Sophia Ernest <maryfury204@gmail.com>
Date:   Thu, 9 Jun 2022 21:52:15 -0700
Message-ID: <CAKLzTuDoxUWitoUNYYV7KLy2GbbAN+wU2dzYbau6kqK6wuJObQ@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Greetings,

I wonder why you continue neglecting my emails. Please, acknowledge
the receipt of this message in reference to the subject above as I
intend to send to you the details of the mail. Sometimes, try to check
your spam box because most of these correspondences fall out sometimes
in SPAM folder.

Best regards,
Sophia Ernest
