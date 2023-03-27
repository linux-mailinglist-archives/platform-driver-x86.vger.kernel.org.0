Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6656CA159
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Mar 2023 12:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbjC0K06 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Mar 2023 06:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbjC0K0n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 06:26:43 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3055264
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 03:26:42 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id a16so7223180pjs.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 03:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679912802;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE0Q22t9nDUcBAUVsmYKmeg+5EtHh5OHc8AXl8b80GM=;
        b=Xp7VmVz0QLSDm70t2ZFw+w/NoDh3HdKLWIsScFBMH/7bbgqLV7DSlOcv5+3ursSC8d
         U8b4m94LTXan8uI4zEEd0LpZA1DXZU2h3ptWKRux3rHLVzsZdUMGy0JoYCEh7u+gF/LC
         nXbA89QLR+pZDa944WGk6q7ZxSNKOZiJbCbXs079owQIX+c18qDi7ZQAFRyurPnxm4IT
         5clRA5hEapkip3U83gKRiQrnn3l9DBVkVLDsf+M438R1ID/6friY5nr332ZwpZWa+ZS2
         BX+931OatP6nWGTMdc2uwdUC41r89lNEl6iHuMvnl9Jp0RLlXDlylcEwUsko3kf+AQKy
         tMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912802;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IE0Q22t9nDUcBAUVsmYKmeg+5EtHh5OHc8AXl8b80GM=;
        b=LVM37lJZwZbwxhcMkmf+pn2iGfXAptO7LtiYKrTQPXFulyiIKMiFLcgS+97I9Gl3mZ
         mXfvvgXiYtMjBpw0My1a/AlC4Yg2PLrubdx6Xl4hErZDpOjDRbfrdzcoSLlPqbcJuNlN
         bBwQw85yvnOmX4JGAZfYKnVJCPmRDbgbSgDgciDaRN9DyorkWMxhCzbv1YxwyQlSq/ql
         pFt+sSpTzha9L8QEeQUjW98qz/+CrBpXaI/SuReBUWAfh3XJkRlX/OTsilUWsFDgt7H8
         +pkAYLMAyf8j7gKGseDTDRUFrGbZLmdcniucHImB8JkqpysqqD8FuwFPZ+HnuU9ed1PW
         RnHQ==
X-Gm-Message-State: AAQBX9fYpqRM9P5X8OVlsAx/n+5EvROJZ6uDRY7RoS+okMa5/pX+duHx
        EvcHzA1LfArdtua2CDOzcMhmuK9Ypw2Mi+wqboU=
X-Google-Smtp-Source: AKy350aIa6H2+TClcLiYbSR8QdAEv++fXr0fZS/TEGoNRI6GyE+KT0HTZT4BL7vVuO4eSrUJyStHo8Wt2/an3/LCnFQ=
X-Received: by 2002:a17:90a:b881:b0:23d:2f4:af49 with SMTP id
 o1-20020a17090ab88100b0023d02f4af49mr3203868pjr.4.1679912802383; Mon, 27 Mar
 2023 03:26:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:3008:b0:db:53ac:9412 with HTTP; Mon, 27 Mar 2023
 03:26:41 -0700 (PDT)
Reply-To: annamalgorzata587@gmail.com
From:   "Leszczynska Anna Malgorzata." <theresazakora@gmail.com>
Date:   Mon, 27 Mar 2023 03:26:41 -0700
Message-ID: <CADe9SQ-5gEqpdbXcB8MBSP1hF3QWp-qaMtw5ZjXs-C6o2pR80A@mail.gmail.com>
Subject: Mrs. Leszczynska Anna Malgorzata.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_5_NEW,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1034 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [theresazakora[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [annamalgorzata587[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.8 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
I am Mrs. Leszczynska Anna Malgorzatafrom  from Germany Presently
admitted  in one of the hospitals here in Ivory Coast.

I and my late husband do not have any child that is why I am donating
this money to you having known my condition that I will join my late
husband soonest.

I wish to donate towards education and the less privileged I ask for
your assistance. I am suffering from colon cancer I have some few
weeks to live according to my doctor.

The money should be used for this purpose.
Motherless babies
Children orphaned by aids.
Destitute children
Widows and Widowers.
Children who cannot afford education.

My husband stressed the importance of education and the less
privileged I feel that this is what he would have wanted me to do with
the money that he left for charity.

These services bring so much joy to the kids. Together we are
transforming lives and building brighter futures - but without you, it
just would not be possible.

Sincerely,

Mrs. Leszczynska Anna Malgorzata.
