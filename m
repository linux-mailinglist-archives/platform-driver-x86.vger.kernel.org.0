Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5E74315C5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Oct 2021 12:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhJRKTs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 18 Oct 2021 06:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhJRKTo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Oct 2021 06:19:44 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE92C061769
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 03:17:33 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id t11so10870985plq.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 03:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=q0hRaHpw+HZu1egpib2l5BAGSi6XUGnnLq98/RXTBEI=;
        b=YH1c7k8GbH8gWO+Y4rVnygwljOFeMRPe8q/iq/qOwWF69BmsoGdhtLRFSSS/KgydHR
         CCDoRPKhAq7Pmq6xmF0IrrL1v61Q3UUlMkKOD4HIzKbBN+1qooFc08zMbtxaU1QB8Ek8
         7u4mZUp/2+7m2Q0q7yKxEQOLcoYjYn552Vehv2TO/uOnFmZ4qapfbTMMOAWFExYZ5nTo
         VdjuM7ybQ8n5AW5BUsfA4PUR8vnnSkInhdUJaxNTpzbQ5B6kB4BiPZzfq1Ms7yzITAgp
         uNIJcz/GeteghPT+6Qy3PFH/4iQrvf2NhUu58p36rLuHfjeW7WaMAc9+XJ230Dlrs9tk
         swIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=q0hRaHpw+HZu1egpib2l5BAGSi6XUGnnLq98/RXTBEI=;
        b=qH4Rdi+Q6YNhh9ZQBEknzamsQLJglHuKSSZarYnx05OJNaJw8maM/y/VYZpOPZjblE
         8wjiUq4WsjadlDpdVTFeAcIDr8c+WCM7B1Uyf1dTEziox8atrx36+ePTvNEern/Y6sM1
         GI43tzxsVq4kwRxuB2mmuwLU1mKXsTpfnkOx2eaSeUSugyJXx0IQRNr05/1SoqnUgmTo
         VHZa2bf8juUMU76epztAzo6kt4oYy7heptY+BrUf2fjMaaoYdFi6DLIQPwVdUccdrEEL
         FTYDEm59i149pIQIQjvoFeRrPRnLyFuCo6bo+3VX6erLCX5i5npQ9PoPxcNXBzcTbawW
         p+jA==
X-Gm-Message-State: AOAM532qhKi4xA5P34qVV0/BvmQH/CIxpUD3KPoyooxRnFuT9Q9Svw2J
        tw58GQhPl7t2ruJ/WRyuKjp0j4MTt8jWDmCVT6o=
X-Google-Smtp-Source: ABdhPJw4vz5GZ1m1KPFLBSAX/lPJtA77zsylqcOjvswwcLxUzegmyk28yjrbxW02JmqlpBL4Eqwg0GpbOWGI5w+LB/8=
X-Received: by 2002:a17:902:7c8d:b0:13a:768b:d6c0 with SMTP id
 y13-20020a1709027c8d00b0013a768bd6c0mr26566843pll.83.1634552252844; Mon, 18
 Oct 2021 03:17:32 -0700 (PDT)
MIME-Version: 1.0
Sender: tomcrist290@gmail.com
Received: by 2002:a05:6a10:d10a:0:0:0:0 with HTTP; Mon, 18 Oct 2021 03:17:32
 -0700 (PDT)
From:   The Douglas Foundation <michael.douglasfoundations1964@gmail.com>
Date:   Mon, 18 Oct 2021 13:17:32 +0300
X-Google-Sender-Auth: OBUquTG45fnTL5kXWoI1ut9zq3U
Message-ID: <CAMZD9CF8aH_Ce0jON3frKHGGAKjTc8crxG2w03WJXx6mtbcEyg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hallo,

   Ich freue mich, Ihnen mitteilen zu k=C3=B6nnen, dass Ihnen von der
Douglas-Stiftung eine Spende zugegangen ist, um den Armen in Ihrer
Umgebung zu helfen. Kontaktieren Sie Michael Douglas f=C3=BCr weitere
Informationen =C3=BCber: michaeldouglas@douglasfoundations.com

Mit freundlichen Gr=C3=BC=C3=9Fen,

Joel Douglas.
(Familienmitglied)
