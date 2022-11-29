Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E96463C92D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 29 Nov 2022 21:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbiK2UTH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 29 Nov 2022 15:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235796AbiK2US7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Nov 2022 15:18:59 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6B05915A
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 12:18:59 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id d185so15214527vsd.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 12:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=MVb5a2CyuZqvQj6S5kO1rVKIaUjlh7WJ+cN8yJ+qKANwRzdLuilhSSDu/kgwI8lvZ4
         Hyal3dY5jsnIEDxs16+MBHyA6TJRJcZQwPDQa7Ihh5B54sat5p2jlJumcU4wB7HXhd2i
         MCljlH804cproWUKcGUUJWdrZmLZ5P0vawodlFmlI8yHZ34FtaTameu7is9uYoa2esZo
         GwrQK9ZFMO7Kz2XPMPf+xhrFakCAmxFU1B07gCSFwcyR5Kp1255DU1OWXV5AytqmZhb+
         VZ/NcDk/MCYO/j2fi3OHpWCfFPeELG4vdaCdtC5XjaOGJmmsRbB83j1a+tKSVSGR+eUH
         x8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=ue7UbOXfEYEj3PhGc+TbcgZMeDRJx1GmmvMjjqdASm+cJkLxY3dIkRLTqWmWcIEfAN
         /S4D5rTggqDDhjk3mK+q5jkkK3crl7ixTGisLFi0iPAUC5Vze+hWtShRV6IQa7RGxUNi
         PjSq4Xyd7SLs9xh4nPY5Z6f0gGDZSbxWXV3HHuQQymkgM7p57tuqsoQTaOw+CV0hsJuW
         rT90XmyaAstkRE53MUoZ+D+gkocQLk4Y7fGrAt5Ybx9xgmkWrKcqZb0Zqn8uSaGjshDU
         7JZwH2QQcEjDg4TCwX6qukG+VvjhOTVl/SU3E79iSHcQRqP9VlVGdGKJe7UW9paQoNcZ
         TUsA==
X-Gm-Message-State: ANoB5pkyXQnx7E6Hh5W0GwXo+NX+HTxuIVo/5vJ06F1Q2E86qvm+/Vlq
        1a2ABxZP2ZNpLvv709oFfNGqft+hDdiScD/RV28=
X-Google-Smtp-Source: AA0mqf41ZWcTVp6lpybjUZkZhEJqO63UHk4hszVdmgEGQEcHd9uc9+QsO25BUaBBStP58ZMZlP3fGT+AP7OsxP/ljyY=
X-Received: by 2002:a67:f88d:0:b0:3b0:8797:46d0 with SMTP id
 h13-20020a67f88d000000b003b0879746d0mr13764676vso.57.1669753138023; Tue, 29
 Nov 2022 12:18:58 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:dd17:0:b0:32b:c965:6e63 with HTTP; Tue, 29 Nov 2022
 12:18:57 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <chiogb001@gmail.com>
Date:   Tue, 29 Nov 2022 20:18:57 +0000
Message-ID: <CACHdXT3HKz_ab3F3c=TxF9kRrofEjva=++Kyqrvc7-hsDGhv+Q@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
