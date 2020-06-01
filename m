Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D979F1E9EA3
	for <lists+platform-driver-x86@lfdr.de>; Mon,  1 Jun 2020 08:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgFAGyi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 1 Jun 2020 02:54:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36019 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgFAGyi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Jun 2020 02:54:38 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1jfeLD-0000NE-Ce
        for platform-driver-x86@vger.kernel.org; Mon, 01 Jun 2020 06:54:35 +0000
Received: by mail-wr1-f72.google.com with SMTP id h6so4534666wrx.4
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2020 23:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zk7YzHevxlD6DMgCXmKNMGZfY9sz9tyTReESo8dvIzk=;
        b=L9Iav7NDdm9exdv8uNc74Pr2WiU8DFbtK4qyNAipyEQFiuqY1CS113eInKjwuCWckG
         eV5ml4UgIu68OLrKiHB4Ulno4p1qIF+ih/7VHXTi1F9iBmg2JIZT37Kb0kFHZgfAvIL1
         gx6qhJUgYzrwmVL0qzMybe36XoOBBl6neL8vwFfTX+TqLXFUSZirmwJjysyBEA0gFIVx
         mPX1XbWWr4FGJFYof1dOGHrEX1NisQHNnVpZ2yOdOyEnS5zK8Djq1QhEglp5F9hqv3Fq
         SGZxRWrh9w/jPp7M/tSmKBz3HcKOFtr8YYQg2XHbZVkoQgH0mBVvaGUIT7mAS5b3+3O3
         p2bw==
X-Gm-Message-State: AOAM531InGqhGD4NyUnxJO5H+Z1PX4yY8yNz55cPX+qtOdq7vvXpg4C4
        bd7JXyduQzX26CkB+icwqlUJabR8q3K+YXzd/8g7xK/ZfQc7xvUua+bAbTwLd6HFoa8lprHjmcH
        zcxwoni6XNQGCyb/sBojq/lMABOPUXFbOtwvHPn7o7VxTaY9c/mcjRZiPYX6pTMh5ZvI=
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr19895237wrn.373.1590994474797;
        Sun, 31 May 2020 23:54:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwZneriHur0SOlXUOs16XH/9ZnAR+A6K2kdgWuMP47bg9lXtOID6S+RnX2DnClKEpb5twwHf7nwMoe+YpLU+Q=
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr19895215wrn.373.1590994474496;
 Sun, 31 May 2020 23:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR04MB31190E61EB32DF969D3CA894C48D0@VI1PR04MB3119.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB31190E61EB32DF969D3CA894C48D0@VI1PR04MB3119.eurprd04.prod.outlook.com>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Mon, 1 Jun 2020 14:54:23 +0800
Message-ID: <CAFv23QmB_hDJPYE+J_ureNGzQsDB8W3=os_V-orYdHL2fqcB0w@mail.gmail.com>
Subject: Re: Keyboard/touchpad break after resuming Dell Inspiron 13-5378
 (possibly related to gyro sensors).
To:     Harry - <vaaghoofdharry@hotmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000007e240705a7004441"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--0000000000007e240705a7004441
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Harry,

Thank you for letting me know the issue.
From the symptom you encountered, I guess the switch event is emitted
before the system is resumed,
so the desktop still thinks it's still under tablet mode, and keep
your keyboard/touchpad disabled.

I modified the driver to log the events to check if the switch event
has been sent out correctly, and try to fix it by
adding detect_tablet_mode() in resume function to see if it works.

Please do the following steps after you download the tarball
1. tar -zxvf intel-vbtn.tgz
2. cd intel-vbtn
3. make
4. sudo rmmod intel_vbtn
5. sudo insmod ./intel-vbtn.ko dyndbg=3D"+pt"
6. close and open the lid
7. dmesg > dmesg.log
And attach the dmesg.log for me to check.
Thanks.

Best regards,
AceLan Kao.

Harry - <vaaghoofdharry@hotmail.com> =E6=96=BC 2020=E5=B9=B45=E6=9C=8831=E6=
=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8811:39=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi Acelan,
>
> Following Hans de Goede's suggestion on this Fedora 30 bugtracker I creat=
ed some time ago, I'm e-mailing you directly to point out a bug I'm having =
on a Dell Inspiron 13-5378  (now on Fedora 32, kernel 5.6.12-300.fc32.x86_6=
4). When I suspend the laptop by closing the lid whilst pivoting the whole =
laptop (the laptop has gyro sensors), the touchpad and keyboard are broken =
on resume.
>
> I found out that reloading the intel_vbtn module from a different virtual=
 terminal than where Xorg is running restores keyboard and touchpad functio=
nality (I now have a script that does this that executes on resume, and in =
the last year haven't experienced the issue. I just tested without the scri=
pt and the issue still occurs).
>
> If there are any logs I can supply besides the dmesg on the bugtracker, I=
'm happy to help.
>
> Yours sincerely,
> Harry

--0000000000007e240705a7004441
Content-Type: application/x-compressed-tar; name="intel-vbtn.tgz"
Content-Disposition: attachment; filename="intel-vbtn.tgz"
Content-Transfer-Encoding: base64
Content-ID: <f_kaw4bodq0>
X-Attachment-Id: f_kaw4bodq0

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
qqiiiiqqqKKKKqqooooqquh/mv4LxTOVHgBQAAA=
--0000000000007e240705a7004441--
