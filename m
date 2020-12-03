Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63FF2CDEAA
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Dec 2020 20:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgLCTTp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Dec 2020 14:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgLCTTp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Dec 2020 14:19:45 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26140C061A4E
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Dec 2020 11:19:05 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id l200so3361740oig.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Dec 2020 11:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=lTfx3Ov0Wmsj8tR0NT/QpcZwiArs4DzszKRjr4Szd/Q=;
        b=JHmCJBT+ZeOf6PO/tP/W/SFRQu/j14bUpvAFIz92H1ERPcry14gYndX2fzUwY1iDmE
         XAT/Spc9R+YFhzeAmmuOZgfL7FWg7OO5PhB5QLFifDDQq9eV8yxweM7LdvOj1cfk4tYg
         nVW6Dwu15MeNBFW14leFEnkqCjR4aHiSD0Rr1j52J/0BXOjekMLxEEr+dOX3yYfU+KBK
         iSiFw2nBjQO9EFoX7htKBlSFcPoHhz1nOtPVHTNyjDsFjkGSU23neitP5qhQdfsc2g7o
         ZkQYsad6sGuTh8qedTJ/0q46s46mJDYqVfxmQXoD20/fYx5RbY5Zctpk3xXGP7N+pFuX
         KYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=lTfx3Ov0Wmsj8tR0NT/QpcZwiArs4DzszKRjr4Szd/Q=;
        b=iFKkmx/2qNRUuHVvT5+1evTETMrMsvfpUQtAHNqFED9fwuGKaZXZW5nwgZnJmRsAKJ
         mSze+s5ngrwkraSp0DH+nZzJDpLCM1OULiORPp8FdWJwTsU7Z5lorA2YxoCXqI8dxm2t
         JRSxMVSgXpBCK3Hw3GRYCq9soIvUA0lurF+O6HpIQydJBFGEkP2DdpH1Lgz5C7g58BcZ
         q1sInipi450jUQKaVjScdQ5TBFiNGByRsBAevA+FYvwa6tBjwfW17Aecw5ZG4QaJzgjO
         0j0sDU1Ww8/Ei5VqJsW3PIsK92yn7UsGwvHlhit7VhRyirSuMhaiJUkTJFAMemsvj0RL
         oh/w==
X-Gm-Message-State: AOAM532Ph2+wcsSuW2rfEIVEVs2ERBrTTO6lk4ffteB7m0Yz5siuRt+7
        Iss1TplzMrv/KH6U6c37Z1ZbocF3aVdGCERAjsI=
X-Google-Smtp-Source: ABdhPJwBPmgYhMIJipt2ZNuCNmMp1kHcTgIa9x47HiHGYRI3quMwaiJoN5gG2H9UP7Dvfdgqyq8XXz4zvoPO3g4vfAo=
X-Received: by 2002:a05:6808:a87:: with SMTP id q7mr367590oij.81.1607023144524;
 Thu, 03 Dec 2020 11:19:04 -0800 (PST)
MIME-Version: 1.0
Reply-To: abderazackzebdani22@gmail.com
Sender: mrabdullahibrahim1@gmail.com
Received: by 2002:a9d:3285:0:0:0:0:0 with HTTP; Thu, 3 Dec 2020 11:19:04 -0800 (PST)
From:   ABDERAZACK ZEBDANI <abderazackzebdani11@gmail.com>
Date:   Thu, 3 Dec 2020 11:19:04 -0800
X-Google-Sender-Auth: kIIEx4biSaEWZPlP0TsxS9LL2iw
Message-ID: <CAL7stqxpcz9P+RasvBXFmhJkX0CuFVp3Ewi72pxanuevGo9bZA@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Greetings My Dear Friend,

Before I introduce myself, I wish to inform you that this letter is
not a hoax mail and I urge you to treat it serious.This letter must
come to you as a big surprise, but I believe it is only a day that
people meet and become great friends and business partners. Please I
want you to read this letter very carefully and I must apologize for
barging this message into your mail box without any formal
introduction due to the urgency and confidentiality of this business
and I know that this message will come to you as a surprise. Please
this is not a joke and I will not like you to joke with it ok,With due
respect to your person and much sincerity of purpose, I make this
contact with you as I believe that you can be of great assistance to
me. My name is Mr.Abderazack zebdani, from Burkina Faso, West Africa.
I work in Bank Of Africa (BOA) as telex manager, please see this as a
confidential message and do not reveal it to another person and let me
know whether you can be of assistance regarding my proposal below
because it is top secret.

I am about to retire from active Banking service to start a new life
but I am skeptical to reveal this particular secret to a stranger. You
must assure me that everything will be handled confidentially because
we are not going to suffer again in life. It has been 10 years now
that most of the greedy African Politicians used our bank to launder
money overseas through the help of their Political advisers. Most of
the funds which they transferred out of the shores of Africa were gold
and oil money that was supposed to have been used to develop the
continent. Their Political advisers always inflated the amounts before
transferring to foreign accounts, so I also used the opportunity to
divert part of the funds hence I am aware that there is no official
trace of how much was transferred as all the accounts used for such
transfers were being closed after transfer. I acted as the Bank
Officer to most of the politicians and when I discovered that they
were using me to succeed in their greedy act; I also cleaned some of
their banking records from the Bank files and no one cared to ask me
because the money was too much for them to control. They laundered
over $5billion Dollars during the process.

Before I send this message to you, I have already diverted
($10.5million Dollars) to an escrow account belonging to no one in the
bank. The bank is anxious now to know who the beneficiary to the funds
is because they have made a lot of profits with the funds. It is more
than Eight years now and most of the politicians are no longer using
our bank to transfer funds overseas. The ($10.5million Dollars) has
been laying waste in our bank and I don=E2=80=99t want to retire from the b=
ank
without transferring the funds to a foreign account to enable me share
the proceeds with the receiver (a foreigner). The money will be shared
60% for me and 40% for you. There is no one coming to ask you about
the funds because I secured everything. I only want you to assist me
by providing a reliable bank account where the funds can be
transferred.

You are not to face any difficulties or legal implications as I am
going to handle the transfer personally. If you are capable of
receiving the funds, do let me know immediately to enable me give you
a detailed information on what to do. For me, I have not stolen the
money from anyone because the other people that took the whole money
did not face any problems. This is my chance to grab my own life
opportunity but you must keep the details of the funds secret to avoid
any leakages as no one in the bank knows about my plans.Please get
back to me if you are interested and capable to handle this project, I
shall intimate you on what to do when I hear from your confirmation
and acceptance.If you are capable of being my trusted associate, do
declare your consent to me I am looking forward to hear from you
immediately for further information. Kindly reply this email (
abderazackzebdani22@gmail.com )
Thanks with my best regards.
Mr.Abderazack zebdani.
Telex Manager
Bank Of Africa (BOA)
Burkina Faso.
