Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B32974F59B
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jul 2023 18:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbjGKQfI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jul 2023 12:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233041AbjGKQey (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 12:34:54 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63022123
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 09:34:33 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98e39784a85so1413984766b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 09:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689093244; x=1691685244;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VWtpptzPuOCoLkyZBw7yYHV5FeI36rJVjotbONsdA94=;
        b=RRMnF2Aa8hdgTNFwmmQCQkW/lh3HSd8QLoHAhhz8SochmaIuTIkyR1nycURYKgn1jm
         P1MTMmvVWxzlrl/2bVxX6YG9moRm6nictWM4XnB8UIwJ4fURwvgE4j1pI3XQi6io40r7
         Pl6BF4UrvWfC6bHh5Lx71e9esA3CElmXCn7mx2/+S9eKGqGqeoDWBVxIOjej5eXAiG+w
         kDLWZE/DYePL9CCH2kDOOqkV/ssnrcI4E6uc9TSQQSPTy6csJgPMx+KNsQhxEqMSz1RT
         JAwoXhw/tBFkcX5++C/U5ZkLJrSX07ohZl+o8PwlDnnpr7Ka2Pi2whebyEd4BZ/X85cu
         S3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689093244; x=1691685244;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWtpptzPuOCoLkyZBw7yYHV5FeI36rJVjotbONsdA94=;
        b=Ul54eeQb8qRKlbMWquct3EX9W+LNp2HpqrSZ2NcgzqcQ/glI7qoCL3ImdXEqGrzgf9
         Edd8+VdwKfbXM0AUQUbO6eYfJvJ80TLUntUW0rAUsBHSq35tR+20Hdde1EirP/DjCLNT
         byBhKoCN23UZcs8hml8YiHN6wanohH3RInvMr8WUufpG/yrdmxz6g2VGbSWAzT2xvx61
         y9WueUGcQYMgJ6PBzruTZjU2p5CZzXvEgEweOc612kK7png1OoR3nTKUjebCzzD8P3N9
         cKif8OC0+lSzWr/ayZMimbYKko9txKDr7NBhh3MwwiF1bskDXIPl0lrrdhuqRJ3GCcLZ
         uwrQ==
X-Gm-Message-State: ABy/qLbx4xsz2OuWZ/kB+NIT/+dqsQA8B7kwmh8AKOJVWp9xLlPzPg+V
        ojwT1TvJw+1nh56p1FOhENk2QfD1/qrB5b0COKI=
X-Google-Smtp-Source: APBJJlEztqBTNfn/ky2Cn/Nk1DDLTYaTjz4spYzg+zztrzjJ6zZVFd5BiwRWpsO8UV2TcuqJVv1isOagYcI4EROpJLk=
X-Received: by 2002:a17:906:1041:b0:992:8d96:4de3 with SMTP id
 j1-20020a170906104100b009928d964de3mr23293653ejj.24.1689093244113; Tue, 11
 Jul 2023 09:34:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:1c16:b0:986:7a95:9cc0 with HTTP; Tue, 11 Jul 2023
 09:34:03 -0700 (PDT)
Reply-To: mrsvl06@gmail.com
From:   Veronica Lee <nd4846496@gmail.com>
Date:   Tue, 11 Jul 2023 18:34:03 +0200
Message-ID: <CAPadVRxZVZm73j8Qx3WKDjmMjzTOwx2by6y9GyexuQpn7uwFYg@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

16nXnNeV150g15nXp9eZ16jXqteZINep157Xl9eUINec15TXkteZ16Ig15DXnNeZ15og16nXldeR
INeZ16kg15zXmSDXnteZ15nXnCDXkdei15HXqCDXnNec15Ag16rXkteV15HXlCDXkNeg15kg157X
lteb15nXqA0K15zXkteR15kg15fXldeW15Qg16nXkNeg15kg16jXldem15Qg15zXqdeq16Mg15DX
ldeq15og15fXlteV16gg15DXnNeZ15kg15zXpNeo15jXmdedINeg15XXodek15nXnSDXkNeg15kg
157Xl9eb15QNCteQ16DXkA0K
