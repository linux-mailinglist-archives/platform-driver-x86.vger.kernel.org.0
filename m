Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61AE66F91AB
	for <lists+platform-driver-x86@lfdr.de>; Sat,  6 May 2023 13:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbjEFLp2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 6 May 2023 07:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjEFLpY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 6 May 2023 07:45:24 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DDF8A53
        for <platform-driver-x86@vger.kernel.org>; Sat,  6 May 2023 04:45:20 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id 006d021491bc7-54a009bf95bso826131eaf.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 May 2023 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683373520; x=1685965520;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oYidZLIIeufrqimC75alngwweIfSpHMuZMsiKxxUjU=;
        b=MtEyRNSXoPs9HF6fD52EAxpCv0VFQx78meATgRfU1EtQ0ctzSXg5kORte1cdowJogb
         uhYzYSk+YlaObP6KA6FV4SrudXvm5u9liCXtdh3pMKm4F7xTtH9l3gZl5LW/QlmK6mjt
         kmctDS3xH3VII7ahANHhBjfqp8iPQCr9FDfhYNUIV5H7sXaOLM1seI7fHblV2lp305ab
         WTxVu8TsNcyrAM7uczIZ1dp852xlksPhhWOXBmIgwp8adR6hNMJ5NPjx2pNuJM2K+51p
         WadT9cIHTzXORJlUA+rui9DfmkTkw9Koxwha5AbiDxQcFSyAaVTWj0fW+NNMxQ1aCb03
         HZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683373520; x=1685965520;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oYidZLIIeufrqimC75alngwweIfSpHMuZMsiKxxUjU=;
        b=G0R6GWtBDYS3FDEwJV1YQzXZkP9IcDSgcrSH4Y+x/ZNBDmhTAsNwTB9ysQP+mt26YO
         mOzIh6621UZdm4Pe3mrXsnGK+WcPgMpmUWfgkbwxqRDC9Zb/zmhO1MNQhbUnBCm5SMU1
         telI9KyGPg5FagBj12fDWAxU1EFrEbXBoK7vp4TBCbOW14+Ur+p9i5MkeUFQYOv82ANv
         CNGz/IWjC+xA6FxjaIvsk01jDLHOFIuSirqAJsFqesupaA2fOhLnPyzDFJ6TXbTnR4+b
         8+Ogk4U+SXefnU7i0zVYEC+lT/q7OJK8W1NUKHxGjr02bG6d79ZFDpsm/jvL5W4Sb0D3
         +5QQ==
X-Gm-Message-State: AC+VfDzofHfsr9QZ3L9OD7h2P2toGy+7K0CWnKlXCejIafVhmFd5U/o5
        rHnuz9Hn/AmkqACTm8WFkL4dljccwrWk0B95SCM=
X-Google-Smtp-Source: ACHHUZ5xokuztzUJDOm6INN0GQ8QQ6CzIJ5pbOaKlozK2ImZXKtY1gYY1zz52PCSMGoDRJsj0MCYM1g1ks7ne+MZ/xE=
X-Received: by 2002:a4a:7252:0:b0:546:bf26:49c7 with SMTP id
 r18-20020a4a7252000000b00546bf2649c7mr1702725ooe.8.1683373519745; Sat, 06 May
 2023 04:45:19 -0700 (PDT)
MIME-Version: 1.0
Sender: musaabdullahi8398@gmail.com
Received: by 2002:a05:6358:341a:b0:104:6e10:5c80 with HTTP; Sat, 6 May 2023
 04:45:19 -0700 (PDT)
From:   "Mrs. Margaret Christopher" <mrsmargaretchristopher001@gmail.com>
Date:   Sat, 6 May 2023 05:45:19 -0600
X-Google-Sender-Auth: _fLWt1J6jW-6YCmd9wOUf_cCgpk
Message-ID: <CAADp7K8ssEGMeVc+OOen_T5mpSH+z4X7efQ4BoZYbx1oRKzCTQ@mail.gmail.com>
Subject: Humanitarian Project For Less Privileged.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello Dear

  Am a dying woman here in the hospital, i was diagnose as a
Coronavirus patient over 2 months ago. I am A business woman who is
dealing with Gold Exportation, I Am 59 year old from USA California i
have a charitable and unfufilling  project that am about to handover
to you, if you are interested to know more about this project please reply me.

 Hope to hear from you

Best Regard

Margaret Christopher
