Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8403686CBF
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Aug 2019 23:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbfHHVyz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 8 Aug 2019 17:54:55 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:33288 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727649AbfHHVyy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Aug 2019 17:54:54 -0400
Received: by mail-lf1-f48.google.com with SMTP id x3so68077973lfc.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Aug 2019 14:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XOTs4bhYCRwigv2OGd5OfjTtT7fDZAifi3m06MCBST0=;
        b=lIfYLFEZ9egoSjrBJ+T33tdLADiSiyIwo5x+m/J9SV7sSeETaybUXkd5luG63Ne90f
         OlGhX7dCjrsqItKr7csZYjBQdD+CrBm7/sESonO6zL47iW3HPusnplPq5lnCVXaoIVOa
         6z6D1QtIOJO2hM0q1tGaNcVadvI690/n9h8hSwYYn6NPekpulln85A+PeKpGs2NYLjzg
         lr7ST6PijunR4T35/6xc3JxQBe6FO1wBHeMS+4VII8Hspi9mRyEg+fqZBRDnITZHLJTb
         Vtnxjn34dHVxSTeFO3gZRygdyBlWxGYdlRdpgT71mEmEaOjBx+CxS9DihZhhlUtMPlH4
         9sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XOTs4bhYCRwigv2OGd5OfjTtT7fDZAifi3m06MCBST0=;
        b=T781oiYksW2Wg68TFvjF4fVRuCFv10hlFVgGFFdeFID1oHkO/fW8vvTn8NxhKmeWif
         0J5uTawMvvN7/CNiTds1SpuHyx+VGzEwypLoXxnWUMNlJSWg6jVhtZmx06Mtg8BNG8ox
         ozrCBGd0aMg5BsqapCpvgQirEKYStaoVWHopgFGnPjFaJA1SuZkcURUWmAWY1U1EKO9t
         spFQgsB+vo/EAjnlgiAz48c8s/SV+CmBqBhAGVge5Qau7Ts/u5WyiuzTYELVhzEYJK0j
         6r0SKy7vcTKqYddoopKfLQC6pLgz1DQ3KjhYWs71CRzAzgV07vSsMf3MQbZEd8YXL34N
         F/1A==
X-Gm-Message-State: APjAAAXAwhSHkjZqEVlT+5I+UCmg92XQJtYNcDf7Ra1XZDtUWYAvGLUH
        5C2FoXx1p5LRYR7ElReBg2QbYAyS
X-Google-Smtp-Source: APXvYqx1C3VEDVlQX9ZEQKPUrNkw+jXuOGObIf5c6gN1O4ux3Zn1zH6SQMrXQp6NGjZE8E/FgG1rzQ==
X-Received: by 2002:ac2:44cb:: with SMTP id d11mr10061395lfm.59.1565301292664;
        Thu, 08 Aug 2019 14:54:52 -0700 (PDT)
Received: from localhost.localdomain ([46.216.207.166])
        by smtp.gmail.com with ESMTPSA id q17sm4197354lfa.82.2019.08.08.14.54.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 14:54:52 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.92)
        (envelope-from <jekhor@gmail.com>)
        id 1hvqOD-0000YN-Kv; Fri, 09 Aug 2019 00:56:05 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: platform/x86/intel_cht_int33fe: Split code to microUSB and TypeC parts
Date:   Fri,  9 Aug 2019 00:55:58 +0300
Message-Id: <20190808215559.2029-1-jekhor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Split intel_cht_int33fe to two hardware variants: microUSB and TypeC

v2: Fix typo in the Makefile


