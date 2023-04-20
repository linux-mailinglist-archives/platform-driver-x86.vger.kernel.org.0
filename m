Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB83A6E9400
	for <lists+platform-driver-x86@lfdr.de>; Thu, 20 Apr 2023 14:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbjDTMOx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 20 Apr 2023 08:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234878AbjDTMOi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Apr 2023 08:14:38 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FCC6A67
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Apr 2023 05:14:27 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94f109b1808so71034566b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Apr 2023 05:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681992865; x=1684584865;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etDsOsklTFhdv20/ihPgdxxbpxkX/HMYSlW+AO+gqjs=;
        b=OD7AscVundclvLYwy6ypnTA0VtKNMdQQruhyFyO7jTu5eVZinjENgApD2qjLX1qPiS
         6L8K6KBYJlea/vYGzIxR2W+GeB8JJAhjThrIYFhL6SXn1rSr59H1EZf7GplvnRBxu0qA
         5X2TUlxchVsGP45amp/tz8fhCwG7rD0Q9g7P5Fo4wjBTDWv6V6wv8MLHMhylKjMDu0KF
         qZWlKgn2func+8Lcp5xPN/IUUJpffvOYyrHvbWERvg8sXDUR+ayf8gtkerPslD/jT3rt
         6IgXPqpxrdyraPEGmxnezTczDdWmVJZFWQzsV7dnl59svJ2d/BjEryyESG4AQjBcyuVz
         KrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681992865; x=1684584865;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etDsOsklTFhdv20/ihPgdxxbpxkX/HMYSlW+AO+gqjs=;
        b=aDaRp3LHVCWFHV3Yb4MZFkICtF9bwW+7gurcfYPCF4s64ew7golg6cb2OtMTyplzJa
         fyH90Q6NGZWAWicTBqRvQh23kl+tfa30zZmZrsTG6LD9dsVMhsf5UACUyGhxU0ZFXR16
         54053+IgL/ASW5FhrlOxkZGI5qz0qnyjL+m4Uqis3g675tf5OKcL5QxbYDNTl0gdeDJp
         EG0SJjmGlivLeTAvKKlSdD6rrITlcS0bcQ1XQ2CHjAKdBo26MvOUQ7B8TV6klsmRLvDc
         IpEH6eQlLkhs5oL8fHu7cjqlD0cYacKfN5CcHlgH44oViK1L0capAmr6ahIo5YTxIULj
         MCsQ==
X-Gm-Message-State: AAQBX9e0L8NmTg1eR88BtWSEtBIKjPiaHbGzTI2ajeVOvDk7oXqJxfXq
        cyRRkuSo8ua6kW1njUK4w49w81PgWwbbuT6JyQs=
X-Google-Smtp-Source: AKy350a1W0DdVA7JycZmEzaaxHcNujiRZCbPc1AwGfSYZ/BnGOgnXwIoMDvqO6A8v/wByqo3a3L4FLNLB7FEm1eqQOI=
X-Received: by 2002:aa7:d4d0:0:b0:506:c2d7:503c with SMTP id
 t16-20020aa7d4d0000000b00506c2d7503cmr1403685edr.41.1681992865456; Thu, 20
 Apr 2023 05:14:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:3012:b0:67:c85f:4c76 with HTTP; Thu, 20 Apr 2023
 05:14:25 -0700 (PDT)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <arafaeloxford@gmail.com>
Date:   Thu, 20 Apr 2023 05:14:25 -0700
Message-ID: <CAM=40BJQneJj2WxCUNe9ei0NoZt7=G25NJDJf=JPEYF=TSmK3Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello did you see my message i send to you?
