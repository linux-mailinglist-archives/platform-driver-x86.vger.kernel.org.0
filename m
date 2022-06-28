Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE73355D316
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Jun 2022 15:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236578AbiF1Bn5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jun 2022 21:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243306AbiF1Bnz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 21:43:55 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B751B79C
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 18:43:52 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3137316bb69so102117497b3.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 18:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=K5dPBEJ10ColbGKAEOYOe4pnX0h5pZej9snheAW5lQc=;
        b=K8ar9+i+9VNX786+e22m2GJrvSNwoG2l+ilgZJMNinzu+CzKDRx56BQC8m4MiBzPUS
         RUgsFpCLcUUkRn4PEHogtgX8Yf5ezQUB3fICdnOo2O+1XisA6S2z8oMXbqddG/FJRXhG
         vwRoGQtw9brQEIjrbVMDWVi8/FZQbYoiEXH9jr+4nlu839VwsPbX3g0kZZ97X6PkHlm3
         bIE1CHTqrA3cQaNOwxo0NCdEPqKsdborgE7Fdc0TkTIULaqMizF+NV9xY7x6Av2+i3mb
         xzXuLIz3tVYhQ7IMTjSUMHtdNqp0zYVZQYl8gEe0AC0XnNOwbDBKu/Kr8L3TnHzSVFxr
         NxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=K5dPBEJ10ColbGKAEOYOe4pnX0h5pZej9snheAW5lQc=;
        b=7y1fMcOvnwt2eUMwZ8O1fyKoQMycRJ/ZF5R6+fojqgLIf3kc/izoF5VbV2fnbfh+rv
         C5+lpmsNM0hbJcrxiWL9nhCb/sbNqL7tZ9QWSl0dA53FY/4qN1T3KElGk5l45iR3oB1X
         oVwT72J1nmhx4VuZL89RPtqCd1z/YdkOykiDHYv3CE0rByjECIdagYUbDsWxr5Mu+x/p
         rXgH+mPvFGBDjYTMir3wp20A4kEMwlVI90Oh0Ny/MiSxEa9bkavFhS1VsqKzqGr80Rvl
         C3nJH9yn57gbHRiYl6YtTU//UhbBDchi4vs+Bis3DNq0J07QRGX3HH5qrfIyJYwVDIwH
         eR2g==
X-Gm-Message-State: AJIora905UfXYhjzFKJu5z2KcaKUEs8GoEF5+0kx3o233STycYr04Be8
        JnO4njDHhS2YiDlI/9Z8VgTwJgmwT2pfHf6tm78=
X-Google-Smtp-Source: AGRyM1v/d86XUTfTUfRG5TbICzAKb2FFVUDSOWF6IiqWg6kW7XlJIT1sww3zxZit05xiIiMmBfI13YhkDOQyMd2Mhh8=
X-Received: by 2002:a81:c44b:0:b0:317:5a3b:3fc5 with SMTP id
 s11-20020a81c44b000000b003175a3b3fc5mr17970304ywj.39.1656380631353; Mon, 27
 Jun 2022 18:43:51 -0700 (PDT)
MIME-Version: 1.0
Sender: otorsimon1957@gmail.com
Received: by 2002:a05:7010:f003:b0:2e2:86c:95e with HTTP; Mon, 27 Jun 2022
 18:43:50 -0700 (PDT)
From:   mrs marie brigitte prouvost <mariebrigitteprouvost332@gmail.com>
Date:   Mon, 27 Jun 2022 18:43:50 -0700
X-Google-Sender-Auth: BrWRDPckXwH3-ph3mvGpV6AiRu4
Message-ID: <CAN1thtuA2cOu1A04DTv00zO-wu3YDc0K3pd=CCW6OnQ1sVxqwA@mail.gmail.com>
Subject: Dear Old Friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,HK_SCAM,LOTS_OF_MONEY,MONEY_FRAUD_3,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1130 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [otorsimon1957[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mariebrigitteprouvost332[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 HK_SCAM No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.9 MONEY_FRAUD_3 Lots of money and several fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
I know you may have forgotten me, I am very happy to inform you about
my success in getting the money transferred under the co-operation of
a new partner from Venezuela.

Presently I am in Venezuela with my partner for a better treatment; I
told you that I rather die than to miss this opportunity. Meanwhile, I
didn't forget your past efforts and attempts to assist me in
transferring the funds despite that it failed us somehow.

Before my living Burkina Faso I left a complete sum of Nine Hundred
THousand Dollars,
with the western union money transfer to transfer to you as your
compensation.

Now you are to contact the western union for them to commence on your
payments, Ask them to send you the (U$900.000.00) which I kept for
your compensation for all the past efforts and attempts to assist me
in this transfer.

Here is the Western Union money Transfer section

Email. westernunionmoneytransfer.WU@financier.com

Remember I have already forward this instruction to them and they will
be expecting you to contact them to commence on your transfers.


Bye and stay bless.

But never forget to inform me whenever you received all your money
because I have paid for the transfer fee.

Thanks and God bless you

Sincerely
mrs marie brigitte prouvost
