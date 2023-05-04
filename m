Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963AA6F6753
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 May 2023 10:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjEDI2A (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 May 2023 04:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjEDI1b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 May 2023 04:27:31 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE685BBF
        for <platform-driver-x86@vger.kernel.org>; Thu,  4 May 2023 01:20:22 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3311691ebd0so446375ab.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 May 2023 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683188421; x=1685780421;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21T2ruoV7Hb2byNjXRrKdStLSJ9N1tOpZrLYkVqWI4g=;
        b=FaiP5wWrywwzd4YeEUl3otRuGeCL+KX1UqNXOUpjk62xfANA7AwY3AXuR3buegRZez
         NWA1qu+zD7SViq4F12zZkKX/NQpDUrBZb2BjHhBwsgt5ZmXgDqTOAZJPYWdBXRTKTAAT
         NApnbdLhOeB1whsfHdXGqN+ewe31/qsVcfu0l3LNAOBjzQra+cvCqJ0G6FdYS+f58Hy/
         axWZu/IY5olm+h3+WCuQDAZHwxjEYbpmmq8fTyDHlMwzRfMmm1E2usLotv+ukOGIxyBT
         j22wy6QJRoli3rhhpU4Jn5z1M5gJYZ5lnViIp9z7+KTyQq9Yth2jljRX+ApJb3NDxjIp
         4lOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188421; x=1685780421;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=21T2ruoV7Hb2byNjXRrKdStLSJ9N1tOpZrLYkVqWI4g=;
        b=aFjZpmRmbKMTvXdLY8GNGtJKpCixtFCQVd2Fm1Q6V6t5CyO6nsHL4DfMA+rP/QAzO+
         dlKVefcOTxQevTs8C0aLxvwNQzB0A/3dU5EO+SuYkEkG7QitMztFqFixc46P2za/zJxQ
         wqUCcFdf/DcJQdFT+Dem9/5Q1mkFxY6JyhaITcX2BcvcUDkXGtFSvwBdDaDJQ1riJNZG
         khj+qDOrpDCigSo28e08NBKXRjeZjZuL0Smb+x1ESOvi07YwfF6vtj2wND9cw+Qz0P0U
         Td1qae8IOQtHDSEBxTO7+nRtQXeJyTCHPBT3NJBvdxtIANyHU4GrsQpoUl1mlTOX+FgA
         YhNA==
X-Gm-Message-State: AC+VfDwkCLCtmiuFskbDkk63DoN5jRTjhvPNLreGhX9/otLQaMp4SmdR
        zN1VBCtzxI3fSxZxHQTkOpHXNjECdzNALHZDC9U=
X-Google-Smtp-Source: ACHHUZ5HKde+k5Dt5RvV3e1wq9ZPnlQ6YWoAEdv4RoJgrhSmMVe4HVPcUmyFescZWoI4m3ihPXHXjx68xfYYcChBWNE=
X-Received: by 2002:a92:c102:0:b0:331:122c:2788 with SMTP id
 p2-20020a92c102000000b00331122c2788mr6986198ile.20.1683188421229; Thu, 04 May
 2023 01:20:21 -0700 (PDT)
MIME-Version: 1.0
Sender: 53e59t26@gmail.com
Received: by 2002:a92:d442:0:b0:326:4581:50a0 with HTTP; Thu, 4 May 2023
 01:20:20 -0700 (PDT)
From:   Mrs Suzara Maling Wan <mrssuzaramailingwan12@gmail.com>
Date:   Thu, 4 May 2023 09:20:20 +0100
X-Google-Sender-Auth: l4AwGH5tKNtofM7Bte52UV44Yg8
Message-ID: <CANcxMs54ifN5KO5MdqbRXR4BftwbEcSFx2H8dBb+9pDTi42Axg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I am Mrs Suzara Maling Wan, I have a desire to build an orphanage home
in your country and also support the poor and less privilege in your
society, I want you to handle this project on my behalf, I have $4.5
Million Dollars with Ecobank to execute this project .

If you are in a good position to handle this project, reply for
further details of the project

Regards
Mrs Suzara Maling Wan
