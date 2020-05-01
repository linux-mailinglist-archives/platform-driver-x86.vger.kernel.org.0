Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98601C1D61
	for <lists+platform-driver-x86@lfdr.de>; Fri,  1 May 2020 20:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729767AbgEASs4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 1 May 2020 14:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729721AbgEASs4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 May 2020 14:48:56 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC04C061A0C
        for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2020 11:48:54 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b20so4282644lff.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 01 May 2020 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8M1Q3wXVNZhCutNZoEQPBZn1UCdn63FvS5PvntPrz7o=;
        b=t4PKSptgnAcqegiukRZox+fRni+KHbpHHK8KdrDQ9YzBljH2rvUWchCBGfzWJfxpuD
         5s2gh1IJXR4NR5TC8jsSX8w/IwRorMVgzBJG8j+5BVSn7CgpQ1j9MWQ4nYUblYHpu3C3
         2A9gnZV558kNtNwcAmYMJYubc/wnN7LpRvXudZ8Ooa25sQCW11fzJC6yUwy3Fo0k6Tz7
         u0M5UK4XoBzCTMoA7xT/yhMPzyJ3zoqHtDzXfUwAPZCuIGYzKDWAND2W8j5keoSGq1g8
         urRsWWfhGXjxJS46UfTcv9g7cs9NAIM0BzyMeCddkpSacxukzmP8iWXpN3AiAZWJcHAP
         qy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8M1Q3wXVNZhCutNZoEQPBZn1UCdn63FvS5PvntPrz7o=;
        b=jkuUFwmNvgXvvApmCaYuA/1ZAIltZGRY8gOkF6+MjQ2R7Wh+qXnj5BvbNYJwp/u/2d
         3ixWlP5jGNQd2TXyksRAKrpUAUMALu0VwYHMsO0yftVq2zjHQu7koBHWnJEKbTmDNDwS
         PxGWP/DZLrRJBg1CKNavsU2eFCavPaZYjhtfCdw5yTAOxVIdVuQWQH5bfBAjlmZkmRAO
         vo9VD039m4rq1oaTWbiupvklkeqys+TSERKDwv7QLF5O+48jp5zUCke32d9/rYvuyZeJ
         WgLimJuXYJwwsqaV8B1FaVzWnNthO0nVrL16iv3veL8oTBclXwi8dsC8wqLkYnW6pfkv
         kYHA==
X-Gm-Message-State: AGi0Pua+GMUgU58LTDZRV5BQN9jYMdx4BX9Ob7H4HMMxYvpTt+iWsOr7
        TT8C/Xj9ZKi6C/pMnY/D4z75Ob8rVggPOSAmEw==
X-Google-Smtp-Source: APiQypJgpxsWsL1/rqxS8jShx8LvhL/HNRMwdmIziND/imA2egScVz6XVl7uFdi+dGT815fGyFrOS+dYbkEOVYCLwbE=
X-Received: by 2002:ac2:4554:: with SMTP id j20mr3396435lfm.91.1588358933133;
 Fri, 01 May 2020 11:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org>
 <11041815.WYjWQN8m1R@lenovodario> <CAM_y6qhV6r9BVE6Uibn=xpDZRYuhZDBBgfHT8fMECNS1DyaQwQ@mail.gmail.com>
 <1605997626.1278142.1588119634625@mail.yahoo.com>
In-Reply-To: <1605997626.1278142.1588119634625@mail.yahoo.com>
From:   civic9 <civic9@gmail.com>
Date:   Fri, 1 May 2020 20:48:41 +0200
Message-ID: <CAM_y6qidfABBaxpctfFOrN1KaEcXOYw9tww6LWfp-P+RB2hFbA@mail.gmail.com>
Subject: Re: [ibm-acpi-devel] [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
To:     "larsh@apache.org" <larsh@apache.org>
Cc:     Dario Messina <nanodario@gmail.com>, agk@godking.net,
        kjslag@gmail.com, bastidoerner@gmail.com,
        ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br,
        platform-driver-x86@vger.kernel.org, sassmann@kpanic.de,
        arc@osknowledge.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

=C5=9Br., 29 kwi 2020 o 02:21 larsh@apache.org <larsh@apache.org> napisa=C5=
=82(a):
>
> Do you have a use case for that behavior?

I work very often with just one fan enabled at the lowest level. It is
inaudible for me and it does its job for not too heavy usage. If the
second one is also enabled I can hear them. We love Linux for such
small extra features too.
