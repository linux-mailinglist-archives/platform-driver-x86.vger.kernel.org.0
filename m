Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D28475DD83
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Jul 2023 18:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjGVQun (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 22 Jul 2023 12:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjGVQun (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Jul 2023 12:50:43 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0F010FA
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jul 2023 09:50:42 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-55b1238cab4so1579618a12.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jul 2023 09:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690044642; x=1690649442;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XwQ9KTk0AvNg4YEGpLO6Mzd1tQ0NGTk2GH4qBYSzWYc=;
        b=dz9MnwuaAkdK+DrzQy91dutBLwRZowgml6TlJeh0uf+lX2NKvReeYfdLeOgf2q3UmR
         gkzEdVZQwAyqWBA53I+3lgOrzL1tDrzQBhTNPwylJXGd8aTHdB/qOsSST3ICcBOt9eKG
         4EUkl+C6OnEmLgnS+wlz0NQhUL6+tHni07iiJCCe78TWTNi4kofhN7/L0PNxdd5BbQAY
         jCiZxQ7JhDF5a/9ia/jFTVnvO77+evyILBdlTGcubZkwJbJ4+ZygJ2UCOjPYasnA8rXT
         7tWyREwwiC0Xhz5oT8/FiPu6Oz8dtGr/XsCIy0WxgMVAEsVFEVCZg3nJShU/owf83tcR
         /6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690044642; x=1690649442;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwQ9KTk0AvNg4YEGpLO6Mzd1tQ0NGTk2GH4qBYSzWYc=;
        b=YL3k13+usxWaJnHP7OFXGCgQIOgQ4l4aHjNnzriXaY8h7YUM2lDJocf1E0Tfknb/3j
         aIpTCp+gdjb5Tba0rvQBVScCm9yr0jnfRylL4BrtWJOTUXb7KZeU62kdVRj87UaMZQcl
         R0LqyDx5keVSzoZxNhPXejGAV/f2iRohrrQJtIsopV5fNYNSrVd1AHsT2x3EEGmpIGFZ
         o6NO42Rywy6rFyUBMKe/6RekuY4K/WteO3pwAcsbX6u2SuxPdCwPK7Kf9XAHwfkQQv+7
         XCa2v/Qmuz/B+rtHBxX/jStzTa08GWxYphpJWEAOKWCMN6aC/wlVy3K0iApiEieUBm7e
         nA6A==
X-Gm-Message-State: ABy/qLYFs0Mts9GDLNSNxjpP5CWZzm13ssTM+FnNT7Qn7J31v1OP1KZM
        g12/kmH7hmZ9UGdi5lGqCKne/kdS4MnmI3uppKM=
X-Google-Smtp-Source: APBJJlFmGVjNvOwlpyZapsHnI+aqfbALIPV10y8bFw55nPJrgepqFdeo3Nfxdqq7eiwfgvQ9CDHTCgdDPbVeGRr2i3w=
X-Received: by 2002:a17:90b:30c2:b0:263:9e9b:5586 with SMTP id
 hi2-20020a17090b30c200b002639e9b5586mr4279916pjb.44.1690044642062; Sat, 22
 Jul 2023 09:50:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:d1e:b0:d5:25c7:90d9 with HTTP; Sat, 22 Jul 2023
 09:50:41 -0700 (PDT)
Reply-To: mrsvl06@gmail.com
From:   Veronica Lee <och4412@gmail.com>
Date:   Sat, 22 Jul 2023 18:50:41 +0200
Message-ID: <CAD9sPJHYbhe0Acp+nTrOJSYXBAoNZ2MzWauf6xxdu8BQZMt-Fg@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

16nXnNeV150g15nXp9eZ16jXmSwg15DXoNeZINek15XXoNeUINeQ15zXmdeaINec157XmdeT16Ig
16nXkdeo16bXldeg15kg15zXl9ec15XXpyDXkNeZ16rXmiDXkNecINeq15TXodehINec15TXqdeZ
15Eg15zXpNeo15jXmdedDQo=
