Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E3A2F72E5
	for <lists+platform-driver-x86@lfdr.de>; Fri, 15 Jan 2021 07:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbhAOGaM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 15 Jan 2021 01:30:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbhAOGaK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Jan 2021 01:30:10 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874B5C061757
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jan 2021 22:29:29 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id g10so6648242wmh.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jan 2021 22:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:sender:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=WwwZ5INxbChgA54D8alL+8opcbTX2Y/SEfcezGICCQg=;
        b=Dz49OeoHs9JJrF4FAy2M2r3eZKk6cBijdku5y/oeNzD68+JeP0jqum46O6mKOzgppM
         ulX2zfGeQs8bayDz9wdHyZNjPaaZS3fD9SElx9zLDJbpS2dqcseojvbG4c7in5S5hCTK
         hFxDAeafjd2fOdcaj52kZtqVMpD2qAcEkjvEi+/DS/cLJdFOZ5KBc39X37cj13uBuAVi
         BP3wcPB5m1DbhvmmDDXLbNiEXDbB6xxKaAAotGNqpHssNYPguVLuARetAy/GBM7omnL0
         El7AoXereOEQAiIPyOVpc0bQoThuLx4QrpgrhETPAy4iRQbY0WWNICOCATymM1CbNwND
         2pbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:sender:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=WwwZ5INxbChgA54D8alL+8opcbTX2Y/SEfcezGICCQg=;
        b=hnGeG4J6M5yU4zJ9ihffA0AqtQDQdf+hRx8pJF7bF84UHtwtnrLwteJHvIwCYhEbnL
         JMDHa6b1pLPmTvXECcAkr9eWv+FCr5RqMffpBzL5ixl9Hwjtw4zKV2GOWN7jJ2XIKidt
         7qEw1bxBfltYq9v5uTwJidsyN8OQc9PWy91DoHm43XW0kF446ABr/loZSsFyHIr4u5jv
         ZaD8di98sSyKSVjU2y/dUtdY9x0sTR2ihKDzryC0syiIFDVgaSyrZT61jtH5WyHXTHtw
         1UgxOZPmAoraQENjXOKveGlfUpJi67o/DWproeXQUx+1mCJoI9sjgl2+K+LKxfQh3nzE
         +meQ==
X-Gm-Message-State: AOAM531zxIUhoIavwf6/JWcQpT2iNH1INQ3wCy7W7M8kr+UwEuFRgsPR
        tsWtbuAahvHiWFiCIO0vwMXjw46+r6Y=
X-Google-Smtp-Source: ABdhPJwiK19+pAzVzQ1WBEZKsYRlQIYg6f55QTDhbJDuYKg5Y/eUco4hI9ANx6fiLwgVahlmxEEUtw==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr7267592wmk.31.1610692168120;
        Thu, 14 Jan 2021 22:29:28 -0800 (PST)
Received: from [192.168.1.8] ([154.124.154.14])
        by smtp.gmail.com with ESMTPSA id k18sm14895219wrd.45.2021.01.14.22.29.25
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2021 22:29:27 -0800 (PST)
Message-ID: <60013647.1c69fb81.cc687.8021@mx.google.com>
Sender: Skylar Anderson <talldemba196@gmail.com>
From:   Skylar Anderson <sgt.andersonskylar0@gmail.com>
X-Google-Original-From: Skylar Anderson
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: hy
To:     Recipients <Skylar@vger.kernel.org>
Date:   Fri, 15 Jan 2021 06:29:22 +0000
Reply-To: sgt.skylar.andersin@gmail.com
X-Mailer: cdcaafe51be8cdb99a1c85906066cad3d0e60e273541515a58395093a7c4e1f0eefb01d7fc4e6278706e9fb8c4dad093c3263345202970888b6b4d817f9e998c032e7d59
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I'M Skylar I Need To Tell U This
