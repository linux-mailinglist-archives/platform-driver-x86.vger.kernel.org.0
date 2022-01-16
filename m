Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE02348FA60
	for <lists+platform-driver-x86@lfdr.de>; Sun, 16 Jan 2022 03:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbiAPCwO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 15 Jan 2022 21:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233348AbiAPCwO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Jan 2022 21:52:14 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1000C061574
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jan 2022 18:52:13 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id ie23-20020a17090b401700b001b38a5318easo17910774pjb.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jan 2022 18:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=qKO3ohsBWGUhAlloy+4N6XU+uE9FlkRAAJDovVxUKqw=;
        b=SyEluj4zx1XivrmtxB7lG7EyNrw1G7aqWufMfIGiLrCNI+sEvDQz4bj2YI4Rnx4y0O
         MBlcZlVSNAMdJb1LNctFTDLGvLOonbxiFie1Io3y7SAwCLxnbjlGF2Q/Hco6P9jyNRoQ
         K1lMaP/a9YQ1+1kXqSIuzKYG8uW+zm4Wbg9iUHYCzycmC711wIdefCZnhMrp1d1wMkqg
         QZ/HZffBlQ4kbi5j+5KJMfwjTXPP/3Z+f5n2DZ3FV3y45UFqdOWuuVqeHVBG/6qRaN/H
         UYofTFOepDnlr3anISsN8aDk4066sZLicWwQ/0ccZzvWQjeInnQ53PSp9n4SdH+D/6TJ
         YU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=qKO3ohsBWGUhAlloy+4N6XU+uE9FlkRAAJDovVxUKqw=;
        b=7llw+1aaAb0a0PTw8FXi8/9A70n363NHLwTSSSq9WI4y6fvy8FHNpX7Bw9DNndQMYQ
         ry0jgKEZtxgnpHzSRXgjLR8NMmz7/yQkWj7pezYx+fvnI7SaxPAFmHuD6Kc6o+7ou5ha
         Vyb1YSQ45otBlN5nbLf3VcodwuwC9Gm6dBE8WELMZFX3R16JVIeMWRIoBhkBiFjoUTFd
         cXTLrvSU1hxnrdc/DDdAZSTQFw1uw9nB+Ex3iXNMEgipHMNSc1QWQ+TCQfsCqaXDN42p
         gZbZgPwd2suRsQloua1mPz9xqKNIwqUSnkUsN7ARN1c/3qUHgWcMeJpZnaMGGRO0CuOH
         qYTA==
X-Gm-Message-State: AOAM532NV8IEwF7rceMj+8bhgurZjmYgJ0jULPjQ+V/i470xGwXOp7rG
        10f0QrXg90eiHlmCJofuWvG7R6sOvznqFCIlWcQ=
X-Google-Smtp-Source: ABdhPJwrIcPF3yL+Sp6Wch2vVZBIk1LkEEwHGUskcz8BvOM0yDf2PNpJ6kbathjbU1GfTxW7JIUE7HFoZT2NeZMwCQc=
X-Received: by 2002:a17:903:22c8:b0:14a:8def:dc4f with SMTP id
 y8-20020a17090322c800b0014a8defdc4fmr10264886plg.101.1642301533395; Sat, 15
 Jan 2022 18:52:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a11:4a4:0:0:0:0 with HTTP; Sat, 15 Jan 2022 18:52:12
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <tonyelumelu67@gmail.com>
Date:   Sat, 15 Jan 2022 18:52:12 -0800
Message-ID: <CAAVnhxLvV7pc4oKVtM9YFLQyhYGZjZyEZcEoVrFVg5_3g0Gkfw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 

Hello how are you doing? I want to know the situation of things over
there did  you receive my message?
