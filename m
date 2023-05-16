Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC4870593F
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 May 2023 23:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjEPVCh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 16 May 2023 17:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbjEPVCe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2023 17:02:34 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10057A91
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 14:02:30 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-5617d793160so22322567b3.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684270949; x=1686862949;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/2kSPjs4lrshG3mnxArnPWo04GDps+mwQUIW9ldmT8=;
        b=SyBrvpZrnk3IoI8hCS2WEkls0J8X4Jfi+rMmdv9UNSV/R7tSJ4K74h41swgiLclIW+
         /OBs93TNGarGKFg4eneLJhKdmCj1MrO2cpWYH4TBlhkbWjXf5QoEUYBh/6D6sTCMPl+R
         Se7QamxZoPQDD8Eb8jvzzLukNkTG09jr/vDZQsGPdc1iSWqv4ksxM2lc33hM2+E4OA71
         Dcz7/GFvuSUUtDSf6Y59B1zu2nxrf0jeWK9kdB9BhDyjJjVpL5mKDFTe0x45wDQcoTGq
         Mx7djybQB66kKZxz5Ph3qmCsnB0MzPRBCNxpRa0Yx9txIXtFFbAK/mJlS+fNiqQfiVRE
         GgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684270949; x=1686862949;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/2kSPjs4lrshG3mnxArnPWo04GDps+mwQUIW9ldmT8=;
        b=B0EnMBLwtnNS/JDU45hJzEU2w21FD+R6fw2Qcc6SrEVxk+1DRcOZ4rYpW2Z/ynGqwP
         KUivNmFiiNygpQLNuZv+2dcRvjWOrFSSLwntdUefxM/bCO5qUfxBq1nhQxKun3j05H1+
         Sqsgso20/U3hPSuvMvUe1qJnW0KE+uBxZrGkw8ADaRfzErV+QnpgusGBKZqwRukz95gI
         ak1atp5wZ6XtKppHXc0yYQ7PZRWf9neQ26AoG8mO0T5f1E4EdcZZ+bbeM0/D8F44qIjk
         HEk24CaCy4VsnaxPedie5cunIErgpGsAeW/k9WqdXI6dnSBruYPYSpyYiyCxNmGOaXY4
         d3hw==
X-Gm-Message-State: AC+VfDxQawU4nF6Q/nkSNDjZb/FFkNv6eqX07DfyMZsS0cuM+n4j2u6n
        mJ2cbDIFUUhZ6rS51Q7+yTcccqz2ic+/yapjdS4=
X-Google-Smtp-Source: ACHHUZ7E/wIUW4i7nR8YTQpq2nuypH/LZo3ls9AQzz9tGKUHI94Pkurf+/FhoeigJAbwr1oC9hlDhfRhNYV4aYl1BSA=
X-Received: by 2002:a0d:ca06:0:b0:54f:c2ee:54a8 with SMTP id
 m6-20020a0dca06000000b0054fc2ee54a8mr38464217ywd.41.1684270949598; Tue, 16
 May 2023 14:02:29 -0700 (PDT)
MIME-Version: 1.0
Sender: miraclechidinma2222@gmail.com
Received: by 2002:a05:7108:8087:b0:301:fd34:a019 with HTTP; Tue, 16 May 2023
 14:02:29 -0700 (PDT)
From:   "Mrs. Margaret Christopher" <mrsmargaretchristopher001@gmail.com>
Date:   Tue, 16 May 2023 15:02:29 -0600
X-Google-Sender-Auth: Duek8RkQZBYmn0TqdgpyyGZPUtA
Message-ID: <CA+_ZsQncgP=aMcaJ5Tc+R8h55jLEK4bk87ZscC=9n_RG-8JYQA@mail.gmail.com>
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

Regards
