Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3877C707D4B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 May 2023 11:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjERJxD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 18 May 2023 05:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjERJxD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 May 2023 05:53:03 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5741A4
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 May 2023 02:53:02 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af177f12a5so4745521fa.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 May 2023 02:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684403580; x=1686995580;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iLMYpmfb3z/2deYzUXPTLD8r7dOEl24VshhI2JWgLI=;
        b=pPi/g6HaR2eKpoAS3IWqXD/RsooZ3GUNNhoDpqNoUqXjOmZPBixzDNkYX19736wz9v
         /Jzuk0cu5SLVVAVwKcQKbSb5jK9wdCF1ziLjaxv9DsFZ3J5WJ+BwnK58PJOqVi1FNIGk
         bEljW6RXTOJA1FZ4vCcZaHoXARWW1D6ZFIzm6c56ZcIt8ZpEjkWne7Oa8cf6rhBhOMv3
         5gjlW6GKagwcG0mJrIpwE8SACkh/JfHbn3rq/Q18btKzK9PZjd1hwGOu+ld2uad4Ibrw
         U+OXyt7ya8aAESp+8jxaPCrsFxqVzRicylVFAnYsKA2EAxguA/qV6nqTtuUJS8P6cruz
         P6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684403580; x=1686995580;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4iLMYpmfb3z/2deYzUXPTLD8r7dOEl24VshhI2JWgLI=;
        b=Nc1AF7P1gEg3GzZSGJpjvssYKdbqEESEQOKnjrE3ypkvuq9dTDsv2pQlYRsh6HEvXi
         uUMKhJWbVhP0jkM9TshLMmaS8zMntdOpsuzn8yRXQzlwRC4tCZ7gheBFiolvzIfYUm/w
         7K2qBR4TNMzA9l94+ysSVXoKKWvIErfhb+axi8tN9CMJ+qG9LNK6cx0go1Sms7qtDluJ
         y5P/xeuQNgvD1Rm51G0JgVbWf2/PpARBuM1gPzU0CrRdT+zj8Kf7H3WoiXjc1zGxEZlo
         leRJcJXtVOE6A9zCRnyhMIcJO6VJQ/l9mIYzpPeP1Ek9pFg6KQeI/geh1tS7G19Kq3Ur
         P6bw==
X-Gm-Message-State: AC+VfDzRhmRNOAQqv7i28tXw3MJXglrfy4aI+JSlS+6oKylJ5Mk4ISIp
        Z742LU0rNw3wLvJ5+HrhlKAjSDeXLel+oN4wFao=
X-Google-Smtp-Source: ACHHUZ7AKXGTfQiaNLhPk/EpVDeYFUJZDoB9bvbD3AudAtkQpsgdNxrD+mhx6L953j4/ZurbNDSAvm5FuUs50vXD/kU=
X-Received: by 2002:a2e:875a:0:b0:2ad:996f:5d11 with SMTP id
 q26-20020a2e875a000000b002ad996f5d11mr11199611ljj.28.1684403580009; Thu, 18
 May 2023 02:53:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6022:499:b0:3b:c029:837b with HTTP; Thu, 18 May 2023
 02:52:59 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly021@gmail.com>
Date:   Thu, 18 May 2023 02:52:59 -0700
Message-ID: <CAJaQ5Hu-eDWQ23D+q=+sjY_tVpCPjgn3c=MC_Mo05uVGRfPxow@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear,

Please grant me the permission to share important discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Best Regards.

Mrs Nina Coulibaly
