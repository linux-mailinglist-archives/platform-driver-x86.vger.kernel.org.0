Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A5567B398
	for <lists+platform-driver-x86@lfdr.de>; Wed, 25 Jan 2023 14:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjAYNnV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 25 Jan 2023 08:43:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbjAYNnQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 08:43:16 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E62196B2
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 05:43:12 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id e19so10867250qvw.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 05:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EB7oeKmxwR1iKo7BSx5stZtGcYcmflQ//loc3ce08o=;
        b=Rxdo96WMjfR7xbSAKcds6ttagkGsRXsbKnvX9iD+htjzealJP7zN9MEeL9nSicF2Eb
         B+t0OMNiZwGs+GZtF/zMY61RL/axIrOo/y7j739qX283HKFiu4a2qDycUrxFx/P7UcqM
         3txnj+g77Zd1v1BAs6hKQXT4pz+gnDFQYdIJJo0b0ExL28kNA06XQ9iW7zprYJ3Kl2cV
         FmqMMO2fHIWQYrLbC0eRj7Bfluvz17bzaLFBgsEwvVeuN7XHVhlPoOtGXViW0SKRvTrm
         gHHJBjlr/p51bJVda5ziHtzQEusoDjOUnk3v0bziL4GpjPmCGLmB9mM0xm+a82bNAuf1
         rohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3EB7oeKmxwR1iKo7BSx5stZtGcYcmflQ//loc3ce08o=;
        b=v20oScjKn1XO3dwUqR6XysJGFDEP622n9lGISqOcZBCw6w3q+xQdvJKrNazqPL9oMj
         zREHzXBBNVIwol+QvQZVZ65WF5l1l+OgPnTqnqsFCfuvyIaKPsIKwB4mx2X8rEeawbTh
         VEEFZVQh/O5isIFWKq4tCBadAE6+YXCO6IcsoNJHRzNCk6le6ZDfT6n+KeN+96tKXG7u
         FSXO1dqyt2IMRbmneUPcddd4S0HNrPcaAvNhl863tEN9FSRkmIER0BcpG/KWAGhRX8nk
         mFWdT5Z27YT3am1Bc+Sswh3Pb2N3qe0JzviLzl5haeXhTR1a0iwsMeEYbaOB8D9/qPEW
         vu8Q==
X-Gm-Message-State: AFqh2kp1s8jywBSg1riVX8rmvRj9B3S91B4f89j6CZnrYlfnYBI7ml5G
        ItsccDCYnPDiaFSa265QHgsQ2b8SWihmWHq6fnU=
X-Google-Smtp-Source: AMrXdXsxhwAbIaUFHOr7EBx5qmNkuTRhmOHods3toRSvqE0xzBIFsDB07TaMRWv+ELsVe3h39+GM7AeigFgeHIjV5+I=
X-Received: by 2002:a05:6214:5c9:b0:534:7db7:d0f1 with SMTP id
 t9-20020a05621405c900b005347db7d0f1mr375204qvz.89.1674654191497; Wed, 25 Jan
 2023 05:43:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0c:d804:0:b0:531:d916:d713 with HTTP; Wed, 25 Jan 2023
 05:43:10 -0800 (PST)
Reply-To: innfooinfoo@vipmail.hu
From:   "MR. CHRIST" <rayrayrayinffoo243@gmail.com>
Date:   Wed, 25 Jan 2023 14:43:10 +0100
Message-ID: <CAKSrD9WeUxYwTQ_DYL7K1bYBGW_O4eUv14gx1XND52khtJvupQ@mail.gmail.com>
Subject: RE: Faithfully Yours.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_80,DEAR_BENEFICIARY,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FBI_SPOOF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:f41 listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8881]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [rayrayrayinffoo243[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [rayrayrayinffoo243[at]gmail.com]
        *  0.2 DEAR_BENEFICIARY BODY: Dear Beneficiary:
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  1.0 FBI_SPOOF Claims to be FBI, but not from FBI domain
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 



Anti-Terrorist and Monetary Crimes Division.
Federal Bureau of Investigation
J. Edgar Hoover Building
935 Pennsylvania Avenue,
NW Washington, DC 20535-0001, USA

FEDERAL BUREAU OF INVESTIGATION MONITORING DEPARTMENT


ATTENTION: Beneficiary,


This is the information reaching my desk from the Office of the
Accountant General that you are Dead and therefore your fund will be
used for another beneficiary that is still alive with a new account
information.

 Based on this information, we want to confirm from you if its true or
not and that is why we need an urgent responds from you including your
full contact details so that we can direct you on what to do next.

Faithfully Yours

CHRISTOPHER A WRAY

Federal Office of Investigation
J. Edgar Hoover Building
935 Pennsylvania Avenue,
NW Washington, DC 20535-0001, USA
