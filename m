Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4EB557688
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Jun 2022 11:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiFWJXN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Jun 2022 05:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbiFWJXM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Jun 2022 05:23:12 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C477C248E3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 02:23:11 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id w17so27010804wrg.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=JPOFwcL0GWY9q5L0pE/EgIWS3aartb3ez1LLPgm2liZiBHEsmLVr5PK28eKPqxyaR9
         nDB1Y1KeiqT9I/ehlq1I9tLKDBnFU4hD8E6+p/crha6FkWW1WAMxlzELCsGMXGuJsqBY
         GS+iSX1mbCdK1KS1PC6gnjXRneBORAIudnkBEeEqqeQJ9Bi9buayvZENF7mavBZKbdAx
         YZZ5GyeTo8Xmwz4FoB2aL9OdwCd4xurAaObIeU+49mTSoPUvj4CyUEqDpqNQBbuMv40Z
         U+f6Dq/ZT0sppQoNGhHDfT4lHu1AkZwqBKUm2Oo8XelhgyG2b5cAXgbfvroqZIuqqDkW
         Jeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=5VpmI2lZVRETVjKXNHD4saR2MYmESgUlULxQBETgKRF+kik8ED1aUWanl3bOoaEn/y
         9tTgregJQwxvCk8dHy/yndV36Vb3i314ZK/3preI8jChysxZRE25ChsLN2FEaoEs1E+T
         9fAeqpPAF2rV8DEU5Nx6hCzfBwqzldglsrAbjhC7dbWTdeu3RKfkqjkZwcMEvu0aw9qT
         aQkANNLSHJjW6PaItMhi/2DQItheakRnmdRSfv4vMSMbtlLBKLLrIgsETNC9fHVEf+ze
         ZIk/veo78BJeNFo74tg3TgZle/NzOYzH2M0hLJN0vNU2anCc2sqNFE+40NMFT9Ynr/Vb
         gGIQ==
X-Gm-Message-State: AJIora+UNVeXyqJMbPexKSNuxhaF4p1xVusES7cyc2shRM4huPDKv6af
        2hJNtNbG80b9qCrytA5M7vhQeDVu70r82yrk1S4=
X-Google-Smtp-Source: AGRyM1tRgGHAAbTOTyNuXFzAnJfT2f6IxHikjmFFHY5bfo3x/CEXboz9PAbZQqYvZuBljeDvHA+PRVZtVMliMjiGWnY=
X-Received: by 2002:a5d:4205:0:b0:21b:8ffa:fdb2 with SMTP id
 n5-20020a5d4205000000b0021b8ffafdb2mr7477276wrq.16.1655976190429; Thu, 23 Jun
 2022 02:23:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:600c:26c3:0:0:0:0 with HTTP; Thu, 23 Jun 2022 02:23:10
 -0700 (PDT)
Reply-To: josephkavin71@gmail.com
From:   Joseph Kavin <gildasetse21@gmail.com>
Date:   Thu, 23 Jun 2022 03:23:10 -0600
Message-ID: <CAExewP5Y5vQCWuyyDvm5vRDxRcUe+m4MN5kKB-2d8hHvmKatrA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

Hi   are you available to  speak now
Thanks
