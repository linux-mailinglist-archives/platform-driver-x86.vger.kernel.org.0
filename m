Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73274E6490
	for <lists+platform-driver-x86@lfdr.de>; Thu, 24 Mar 2022 15:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243097AbiCXOCE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 24 Mar 2022 10:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbiCXOCD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Mar 2022 10:02:03 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6F554FAF
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 07:00:32 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-de48295467so5008856fac.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=IUnL6ln8exsM4hWiAxtpulKBeCtQHqHEQ9R4tjpD9N8=;
        b=FSD3bBSK0wAIxL0UB4OdnB6/asoNHS/Mgk+jQcvaMaDV3T46/bMFM3AMACCg/XGAR7
         +BoLFkT88qOxYsYZYTZ7hm4KqBHV7ls3bVpNee6vrlDYpsrJAGQZkpqbPXhyO8ZeXlG3
         eErWFZXqTeN3IMhOejj5aMRe7J/2sEfVT/c0BPWKjLlmOwvuwu43JBA/Wn5DIRtHzN1U
         r4HzJcUHhwbx01K0pb8wrCmOJZIV59jQy063S6swXl2Chz06ooV/C5cSGAcjDIq1h2vC
         VVUikrYS0DA8Mz35Xi75pzJANR5Weko8/MVZj31zPDC2cTmMqZr+1ZF5ptQv7dEnEKWf
         JBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=IUnL6ln8exsM4hWiAxtpulKBeCtQHqHEQ9R4tjpD9N8=;
        b=U2vbUm/ced9L8NldBXBQcBRTI3+ytIP4wS9Q43594Gw360d+eW/ehml5DXYpO6I5dn
         /M2RdLs1T5OyJlQFYD2ssvlwN1lcofnbyGpCy/A90P6/prrOxuOGF5IlES+sxx9u02g6
         /uqB++wflNIvhDTLEUvwH4M/ZpK7TIs/eVu8QgRkD6ZkRzHciYBveqXy2g9CxzJEYlvP
         cXKKjird80ST2r13Ro1kZmmrVn+w8DOhOA3MnBmEsNjWh2T+P+UmaSUpM8PCYgVAV6OY
         SlUxw1WUr1F9RSeesHkvyFKVO800TBFZPuAWYqCijFvTtZkqhq0kRB+h0JDFMTqqvboQ
         qBDg==
X-Gm-Message-State: AOAM533/QKXw7Ig6tWwjgaj3uV59lc3fLy0C4AP/0qWPoKcp7Kp9+UaP
        +tPhKPNAdBl/7WEQDK9OT0LwFiNe4q9fzku+lI0=
X-Google-Smtp-Source: ABdhPJyKC7tn7HR93GD3DFcDahqvdsx5x3fO227I2c+E8GpTeWJytDjUJDsxU6f/rRf3690gl+Bebxjs37nxPjOiUNo=
X-Received: by 2002:a05:6871:82a:b0:de:33ac:8105 with SMTP id
 q42-20020a056871082a00b000de33ac8105mr2588272oap.189.1648130431458; Thu, 24
 Mar 2022 07:00:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:5802:0:0:0:0:0 with HTTP; Thu, 24 Mar 2022 07:00:31
 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Mr. Ali Moses" <alimoses07@gmail.com>
Date:   Thu, 24 Mar 2022 07:00:31 -0700
Message-ID: <CADWzZe7KaLSGsLUveyLuE-XAZGd0U_5R9uF4voCMFnVw4a2DHw@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4451]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [alimoses07[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [alimoses07[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Greetings,
I'm Mr. Ali Moses, how are you doing hope you are in good health, the
Board director try to reach you on phone several times Meanwhile, your
number was not connecting. before he ask me to send you an email to
hear from you if you are fine. hoping to hear from you soonest.

Thanks
Mr. Ali Moses

Sincerely.
Dr. Irene Lam.
