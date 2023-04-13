Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2F06E057D
	for <lists+platform-driver-x86@lfdr.de>; Thu, 13 Apr 2023 05:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjDMDyR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Apr 2023 23:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjDMDyQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 23:54:16 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86FFE4EE5
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 20:54:15 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so6150231a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 20:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681358054;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLnE1viA2YkFQlIS735wdkGePat6D3JreXDWC7/8f9c=;
        b=jkUZO5mWveuLbsHVil2ApVsc0mPZp1nZd6u+wWD2e0PrdfjseA7o563gXRzKHthvPl
         NIPk2WSdb6IBgDuLwLyesh7BtseNAg5OfiwTiqkCjOf6RCiCOQY+Cs4Ci+PC+K5YkvQ8
         USgxtxKodrTZK0AKfUMbCIUtiLLbSRS0ET2VKW9HVIizZ67z4rqlzYeim5KJcoeYoDoT
         /WObsxiQEFPm+HPKrJ/a2G+CV6iUHo7gV4Kw2wrAuzcDZQeMl1GwcLU+9VfQoqRaldkz
         hZ9Nf+i/3km5LtwPVZzoOBfeD88VA2SbbbnlWKdm27Hjzm33HNoZME/2GEDJLnRspZuw
         4z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681358054;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLnE1viA2YkFQlIS735wdkGePat6D3JreXDWC7/8f9c=;
        b=lAzX1+umGEfr2a1mF/YPyQNUeX7qKH1XUASaD/OskiHOvZ6HvIU3/PKw2ClvjU1UCP
         Vw9OTE9YUaWvbrEkBnnka+6RYGZxMMO8HxEii95uHDzPnyLv2fpn90Kk/QIA3WOlOOmZ
         BBmmmg4d3+yZ9vOBhoptytJdwXAbEDzUhEcM0fKQLQjquURtCctTSG0QBZ1Zb/pc1luG
         AmQYmSy2AzT5qZwKCAlWL4PE9jzUcshn+/iuCK1lViIgk4HcvHQEvcWcTojrdlnXT3p0
         o844VUmTSrZNW/ZC76Y3kReJPgLrXQ62sIj4MxSl7Q0C1DfjsMrWgII3KJVgUS0h0GOA
         HIkQ==
X-Gm-Message-State: AAQBX9cJpbsq450N3grnHZmAMGJxuNnRK7Inpbm4AePIaZ8kJq5zz49B
        0s0JD8+qLvenX3NrPgtC3R7BKHZ7QdfXQC6BQ0o=
X-Google-Smtp-Source: AKy350aghV9LjDOnRkNWn9t0P8W/GBNNmZrFpWC35PF74b9qObJf7HN+E+kkxlStchm2mlgO+P97hxoBBSgPfXLlAvs=
X-Received: by 2002:a05:6402:3483:b0:504:b71d:74d7 with SMTP id
 v3-20020a056402348300b00504b71d74d7mr3126196edc.4.1681358053644; Wed, 12 Apr
 2023 20:54:13 -0700 (PDT)
MIME-Version: 1.0
Sender: bussingoo234@gmail.com
Received: by 2002:a05:7208:82a9:b0:67:2a42:540b with HTTP; Wed, 12 Apr 2023
 20:54:13 -0700 (PDT)
From:   "Mrs. Sayouba Athelah" <sayoubaathelah@gmail.com>
Date:   Wed, 12 Apr 2023 20:54:13 -0700
X-Google-Sender-Auth: rH7jM7DXELU3KjpTzPLSaSoK0Is
Message-ID: <CAJzhy=GtxyXo_4aupLEvZE0xAc=-KREXZn7tEp+3gN+s=J=Z2Q@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_00,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,
        MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_MONEY_PERCENT,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:543 listed in]
        [list.dnswl.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [bussingoo234[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [bussingoo234[at]gmail.com]
        *  1.1 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear God's Select

I am writing this mail to you with heavy tears In my eyes and great sorrow
in my heart, My Name is Mrs Athelah Sayouba, I am from Tunisia and I am
contacting you from a hospital in Burkina Faso. I want to tell you this
because I don't have any other option than to tell you as I was touched to
open up to you. I married Mr. Sayouba Brown who worked with the Tunisia
Ambassador in Burkina Faso for fifteen years before he died in 2016. We
were married for eleven years without a child.

He died after a brief illness that lasted for only three days. Since his
death I decided not to remarry. When my late husband was alive he deposited
the sum of US$ 8.500.000 million. (Eight Million Five hundred Thousand
Dollars) in a bank in Ouagadougou the capital city of Burkina Faso in west
Africa. Presently this money is still in the bank. He made this money
available for exportation of Gold from Burkina Faso mining.

Recently, my doctor told me that I would not last for the period of seven
months due to blood cancer and hemorrhagic stroke. Having known my
condition I decided to hand this money over to you to take care of the
less-privileged people, you will utilize this money the way I am going to
instruct herein. I want you to take 30 Percent of the total money for your
personal use. While 70% of the money you will use to build an orphanage
home in my late husband's name. And help the poor people in the street. I
grew up as an Orphan and I don't have anybody as my family member, just to
endeavor that the house of God is maintained. I am doing this In regards to
my late husband's wish. This illness has affected me so much. I am just
like a living death.

As soon as I receive your reply. I will give you the contact of the bank in
Burkina Faso and I will also instruct the Bank Manager to issue you an
authority letter that will prove you the present beneficiary of the money
in the bank, that is if you assure me that you will act accordingly as I
Stated herein.

From Mrs. Athelah Sayouba.
