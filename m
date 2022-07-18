Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC18578AB2
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Jul 2022 21:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235916AbiGRT2X (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 18 Jul 2022 15:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235541AbiGRT2V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jul 2022 15:28:21 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315032F67D
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jul 2022 12:28:20 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id x125so11366886vsb.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jul 2022 12:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=q4N+U2wWwZMrh3OQvQVYQsPS16Kt7nmi1l0Y18vNkKciPV9ecpFALGlPWG7UmC+Uex
         2Jeo6Q5jUSR7vFEEliQpFWV6FuJ3wBGt6PVD3Dxl9PNeD1hGstVI+6VZXALLUB5tPS8C
         3s6VqItKDOCqGoABSKU1puX5U9BeZ9HnSfhB/MIuWq12Jj5aMoaL5ZCSgGJJyYbYnnmT
         YWodorRwiQyl++yFH/RWBdqoIhhRNWkcUZKqgEnKZ2+C4BsXhz8xfGK5SeY3QF4eJ3JC
         HEptxDCelgaB95OI6ngP0vsL5MXV9J5w1SoX6XKeiFA/V3IiCLJymdp1C1RhXphXdiWo
         WWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=qZEgNMVe2uoLm603trYW2aeNpJJh/Mg/1MoqaPv7ybiMYQz8pPT8z07a7UnKyxjQtU
         buZf63LlbNgCBsgTAOrEjCAFeyhpudoPO1nTvT/7Hi5CQYNGGosfkO9l842Gu3Vujfsu
         +3xNgGZCOVHR3Y8m+LwouStba1w3p088qqYgcKaAkALFYtuowt6niftuZaFINhpIkgjk
         N3T7FD6iCBAMY1TZLq/N6tmSRJVowtb3zZhPejxPDcKRCJpoCzek96vAlXEffHLFisHN
         1247a6THYKCoALYXK9BCPVMSmHpNvz3LmfG+q6Pcp+ZnS6FgBawFIL5yj6NN1Wk5cE0I
         hG5w==
X-Gm-Message-State: AJIora9eDSBBLcVz8vmBWJLj+H3GdmbNhmAVqDzhRRrIbG3j7Reo5N7q
        9L+OtK2ndVStsU7l9H/pqrncsVB0v+wabxxOGWVGl1OA3cMHZA==
X-Google-Smtp-Source: AGRyM1vn6n8Lw8/IXS4U/BzqYfI64etJXnh3KyubVop4i36XEIIICr1bH2XwPqY9QzE6/PnTDu79bmvyBTVzc6G+b58=
X-Received: by 2002:a05:6102:667:b0:357:6577:a994 with SMTP id
 z7-20020a056102066700b003576577a994mr9876646vsf.77.1658172498974; Mon, 18 Jul
 2022 12:28:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:b12a:0:b0:2d3:5030:bb10 with HTTP; Mon, 18 Jul 2022
 12:28:18 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <blessingiyore3@gmail.com>
Date:   Mon, 18 Jul 2022 11:28:18 -0800
Message-ID: <CAKQJGJbusHdnT0buX1Suhq8uuTxd=8HLefF-3tn0QBX4gXKKSA@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [blessingiyore3[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [blessingiyore3[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
