Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC235BEADD
	for <lists+platform-driver-x86@lfdr.de>; Tue, 20 Sep 2022 18:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiITQK4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 20 Sep 2022 12:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiITQKz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Sep 2022 12:10:55 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B927665546
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Sep 2022 09:10:50 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id u69so3131092pgd.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Sep 2022 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=Q0buYiQ31v13H9F8z2eHRrWk1+Ty74VvYlzr1Gj3uksgdY6vCuss6ebw5CqbwC0Qc+
         XhycklIJa7j5gksmxBHymYRxy9gw6slbahYRNwdAw2e/4E4EFIFfaxblAdPznAgGnSjX
         RzXg+EopXMmdifRB/6/b45gABhRtt257cGNXlDiG2+GygUqXoDawbP6HEMzgPOzM1a+z
         4T3SuAFkJ3224JQ7CR2zTq776qCE9WFM34ijl3FWb5KDktsWHhMSsue6x4Sm2cpMy8Z+
         TEGxvJDqLD7bh5EtdpAmLTQlgWLY3xRyFb0UgyETd3fXgOehe8iyv2F8ngI0IdBwS/pf
         VInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=am24Co7wq+KO1dcvTpMQkd6/7TCPFcTovj3ZhN/pCgN9Xgrqx6y55SyIhsrvFX9Td5
         c/6r8MGcWylO4+w6u1KANk5XVRUz96/Sbze3lsFkh3Keqr/TOHb9ZUoFb/D+1lB+J1DY
         Ealcl1UlHJQQlkFH8wNvdNTNBtcLWgayvVV38+bvJJGENNRCP5W9pw4eV3PHKKyUVJTp
         acqJd20p2Vmwjh7hw4Q9wK9F6WT3ThqNn9fPo5Uqis9o/HzOw1O1kela6LTdMY+8YFMM
         ryvNq37wEmmoxAUUQGKOaRk6J9awUPtlR9kUi6qkXGv7RsH9e3s01CQiKPexztZvVxgr
         LGhA==
X-Gm-Message-State: ACrzQf0HAftc39zjZxIdZOY4/ziFcSdtD4ojP8Isg06Xrwj5ArcVyVSP
        LYJimDwf6cA7CZFwVX0JLPHFFbon2y364mdg
X-Google-Smtp-Source: AMsMyM4ydyVjKs+2Ug7VCGWDkKE28WvcrzYR3k9+4Wcvewp8unz3hLYp/5CxRbZe/WV2pWVx0WAaGzaIjay031HEzls=
X-Received: by 2002:a05:6a00:1a08:b0:545:362c:b219 with SMTP id
 g8-20020a056a001a0800b00545362cb219mr24905083pfv.27.1663690250343; Tue, 20
 Sep 2022 09:10:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:e896:b0:2f4:3ded:66bc with HTTP; Tue, 20 Sep 2022
 09:10:49 -0700 (PDT)
Reply-To: linadavid0089@gmail.com
From:   Lina David <tinaeevan@gmail.com>
Date:   Tue, 20 Sep 2022 17:10:49 +0100
Message-ID: <CADEuEs_sFOmHVmwFbE6_69XxY7hqJAnt9AjPhps5Z_RjAug+zg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello,
how are you?
