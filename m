Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73157268C59
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Sep 2020 15:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgINNjJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Sep 2020 09:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgINNiy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Sep 2020 09:38:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43135C06174A
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2020 06:38:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x123so12659608pfc.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2020 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=MKwy9hHlTDO6VOu4wicGuHjTlan5Hjulz65vfnn2CIM=;
        b=mxb3fUulOWM8wHu/VWTJYhf1VcZ5/VhxkvzLXJHW5DqMD89lDKuF3FECU2OuYUlcuF
         0Jw7ZCcJO1e03Eg9CCABDC/x41s5fE8/qMNgwpedW0aq4GKB6XDEK8uZUl842yOfqVQM
         aydtav8C4L0LoKn3ZtmCWiGLD7PtL8V2x8zLzgmIYKEocBEqGmAG0KVTob5ijznMAA+0
         ZvFTHhHYfyPP4u5yqOGeCn1grcQI3gtY+6UaTfFzJQpjXnndBvF53IEykU69ewU2JAL8
         qS+Cuf+bFyPugZQwKmHlpR4dm1WKZXc2cCfFaNu6uu0owP3HIW7OpduievywwyiIxkXF
         kR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=MKwy9hHlTDO6VOu4wicGuHjTlan5Hjulz65vfnn2CIM=;
        b=a5kGWnRW5Zm4fM+YDT9lxvtzdzfgPmEjPWTnEvEt1+oFr0xYiul9bSxD4EKSGVZTvB
         acqiAiircdV9u0vLNryGcq/qIPK1ahUd9sbGOWtmkyTLF9WxiwDR4ljkruEBKoGYTHWd
         3kZG9oTzMp6eVVCpUzurCKIpaf2z5VS7P2G+30c0SWG23cs8FJX7XllYtKINcci/akp1
         56SYHygIR1ZbVWzFdWkjHRSAmaesKS6He1ZIMHA/EjjZpBUIPpCAR8CRY4JFkR5JG/W6
         fhxmpaKATM5MclHSm82wa9s+nX9WGg6L0T8dqVkXHo7CVZ5E9QuaWVCCK8e9dhsfp5ss
         4Iuw==
X-Gm-Message-State: AOAM530vm8fEK8r2CUrJjJenqTSmOGXSjueZzRN1C8c7VQmvAZCqaXlp
        rr4MdtjDw0yKL33n2uPxRNRoAvkqj966/LqBDqM=
X-Google-Smtp-Source: ABdhPJzLlD3TcZLCQIqQpSLjdvateyKEhWWKhuWjkgbsrtgCSGJLDjzWsNmWJfG1oV1rzdwgaJnb0tkJxoTocG1fvGM=
X-Received: by 2002:a17:902:b218:: with SMTP id t24mr14387304plr.113.1600090733864;
 Mon, 14 Sep 2020 06:38:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:198d:0:0:0:0 with HTTP; Mon, 14 Sep 2020 06:38:53
 -0700 (PDT)
From:   Liz Johnson <lizj6718@gmail.com>
Date:   Mon, 14 Sep 2020 06:38:53 -0700
X-Google-Sender-Auth: N34S48TqqyumHgJRyrsZ-mfs-po
Message-ID: <CABTkuS4EPjDT7S1t=F0AM-MN5Aky6su8vGgjDgED9dJb=Yx4zg@mail.gmail.com>
Subject: =?UTF-8?B?5L2g5aW9?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

5L2g5aW9DQoNCuS9oOWlveWQl++8nyDmiJHmmK8yNOWygeeahOiOieWFueOAgiDmiJHnnIvliLDk
uobmgqjnmoTnlLXlrZDpgq7ku7bogZTns7vkurrvvIzmiJHlhrPlrprkuI7mgqjogZTns7vvvIzm
iJHorqTkuLrmgqjmmK/kuIDkuKrlpb3kurrvvIzlpoLmnpzlj6/ku6XvvIzmiJHmg7PmiJDkuLrm
gqjnmoTmnIvlj4vjgIINCuW9k+aIkeaUtuWIsOaCqOeahOW9leWPlumAmuefpeaXtu+8jOaIkeS8
muWRiuivieaCqOabtOWkmuWFs+S6juaIkeeahOS/oeaBrw0KDQrliqDmiJHkuLrkvaDnmoTlvq7k
v6HvvIgrMjI2NzkzODY4NDTvvIkNCg0K6LCi6LCi77yBDQoNCuaDs+imgeaIkOS4uuS9oOeahOac
i+WPi+OAgg0KDQrpl67lgJnjgIINCg0K5Li95YW5DQoNCg0KSG93IGFyZSB5b3U/IEnigJltIExp
eiwgMjQgeWVhcnMgb2xkLiBJIHNhdyB5b3VyIGVtYWlsIGNvbnRhY3QgYW5kIGkNCmRlY2lkZWQg
dG8gY29udGFjdCB5b3UsIEkgdGhpbmsgeW91IGFyZSBhIGtpbmQgcGVyc29uLCBJZiB5b3UgbWF5
LCBJDQp3b3VsZCBsaWtlIHRvIGJlIHlvdXIgZnJpZW5kLiBJIHdpbGwgdGVsbCB5b3UgbW9yZSBh
Ym91dCBtZSwgd2hlbiBpDQpyZWNlaXZlIHlvdXIgYWNjZXB0YW5jZQ0KDQpBZGQgbWUgb24geW91
ciBXZWNoYXQgKCsyMjY3OTM4Njg0NCkNCg0KVGhhbmtzIQ0KDQpXYW50aW5nIHRvIGJlIHlvdXIg
ZnJpZW5kLg0KDQpSZWdhcmRzLg0KDQpMaXouDQo=
