Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF7616B94F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 17 Jul 2019 11:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfGQJcR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 17 Jul 2019 05:32:17 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:36352 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbfGQJcR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Jul 2019 05:32:17 -0400
Received: by mail-pl1-f177.google.com with SMTP id k8so11677472plt.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Jul 2019 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=L1AYgDJvIIsqaf9PI76MEPIWcZw4ACqkXrleZgk8GbI=;
        b=NjuGL7cczYt6O+DFcg26N9B95Swvj9SrlfhGgyvSael34TBAdzp/Dx17vugLIYRk3F
         EPCkn39SYKapyvOnbBAtW1GDW0/V0vzoKdE58FkM0hUrrbc9qBpkgfLV8bA6jlhFS6um
         4ZHkdPXYH2LRfSM3mvUCYP0ugiNJp5tjjHZgg8gzlc86fhNBzWTTfexr0QBYRAIFdN6y
         hyuvIPoTy1r14QvCCTKiDKwJax99ChRasSKpqsVlylaWy6j+ebZf6nN3/BnJON8xCCIh
         XL2NVlpSLckzxzsx1K9LLSGW5KL+X0LXyfo63NsJOmr0XuTxus3BenHP3h8U6EjUqmCQ
         x4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=L1AYgDJvIIsqaf9PI76MEPIWcZw4ACqkXrleZgk8GbI=;
        b=iRFR9/siAec4TnU8vyXUxFnJM824JZM82YDKOiSxNB9eRLPkPXn2u6i4aU4VHPPprG
         h+wTbDGQ1+dLtI7CD2PW9p5cD4aJJSsSlciWSx0fYhdh0u33FgEBgNPjYPn+aD5AJujr
         2rTOLMAFiYdokR5XVvL06k7am2sjW8+OmKwRw2v0TkiZyQIyZPSPZY5PZY+SJivTBXKL
         VJNqWWj5mzUmn27QGzcvdv222XEO+LOZKmUnIsT4xKGRESFuN5Mu5egN9Ul3Mjit4CJw
         AfuXFVmNPLor+1wHrQWsGNiZuIi1+L6ZGd7OS3FtE5l4QvTO+GN+XranBxvNEffiGFrN
         nPIQ==
X-Gm-Message-State: APjAAAUjomj6RtjEjri4eUPUDFo/4k8WvjBXY3AxQoW/amJgCaa3CGek
        XEI20GaRFWQDtZWZ4uUSlkIV16TDuRCHLFtl6AMBf0pJDexN2w==
X-Google-Smtp-Source: APXvYqwmWlCSQlL5scpWDP++eixHNMQViH3uiz5Q3YrdTw/j3L91UAzdg2N6r4BMCRD/F6Y41WvuSmev/Zatpzu3ALg=
X-Received: by 2002:a17:902:694a:: with SMTP id k10mr41571495plt.255.1563355936596;
 Wed, 17 Jul 2019 02:32:16 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Jul 2019 12:32:05 +0300
Message-ID: <CAHp75VcYZZFutOHntdXYni3TLi4qNmo=XLmvFiMYn49-U-gGOQ@mail.gmail.com>
Subject: WMI driver extension
To:     Mattias Jacobsson <2pi@mok.nu>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I have got a report from kbuild bot

>> include/linux/mod_devicetable.h:803: warning: Function parameter or member 'context' not described in 'wmi_device_id'

Care to fix it as follow up?

-- 
With Best Regards,
Andy Shevchenko
