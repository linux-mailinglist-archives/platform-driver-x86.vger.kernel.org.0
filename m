Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3665EB566A
	for <lists+platform-driver-x86@lfdr.de>; Tue, 17 Sep 2019 21:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfIQTrJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 17 Sep 2019 15:47:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35066 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfIQTrJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Sep 2019 15:47:09 -0400
Received: by mail-lf1-f68.google.com with SMTP id w6so3861762lfl.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Sep 2019 12:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=suysQPGVA6HN7FGSXrPgPN5SJ6XCy36OTPjABw8KIjM=;
        b=hkr5Z2BUlIvNoa0QEPY0L1Vurzh834Z/ow35vvrbo+jnNbAn5LqDIqNQYEtYHQkfvh
         A9f+4GyxRrohuTPkOAroJLL89VQAEqg58YUOVRnMGK+hIkYOGppplILGcG28QEEVGxig
         87zgeaDXxhiqBgXtoTaTZBjsiGmxW5M0zGaWUtovmPIhZ25iOHCZvvL3B7wazCNo1VSb
         UVhM7zk2X+qIwQdLxWqvfmhj8d8lrlr2CxryNigm049/46x/pbrvQhgpSk9IGbfQK/ta
         /RBw30YNWgXd+zjEou7Cd+YW8oT/iubUwolcq4e+14lq89vZMmnMkstWhxa6J757fWe0
         6kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=suysQPGVA6HN7FGSXrPgPN5SJ6XCy36OTPjABw8KIjM=;
        b=EjABzkFFVD7Cknb/N1cINfvwdGV9if39hgZHmjkhwUGuLkSEnceGen8vak7zVoKU/n
         RpnHMpszy5wcfXcGOkJwwFtIX0y9x9Z/nnhacVscxvayOlBSqlhygG4qijpNzm/veymO
         9KOBWl6IN7ys15xRcEtdajfW3Du+vtLjO15HxvAYzzwUJ6RkzLa86k9+hUtR3H37vCmk
         M3W6exCmxJjGOjlt8/yxLeXXsnnlYXkbl9a/p6fEiOx8B3ErV4avo6ckHP++yF78bFNc
         G761aaUzwaQPKAEmXdCiI+kX/G0EQBtm/1asM7jibGXnC/KKdpnC+krON+RcC/Q5ajpx
         NxyQ==
X-Gm-Message-State: APjAAAUt1EPsJ3shTCrv00F+GJLuPAJOC4N7qzk1hA44RD4asHI/ODq8
        F2IieJXt6sWZ5bv0qpwZEPI=
X-Google-Smtp-Source: APXvYqzKUImRtmlYb07r12oYpK6/b22fAZ4WnMDYnvP8Dp36XVzYSP+GGjdXwqHpWLh1gfEAXUJEcg==
X-Received: by 2002:ac2:46f8:: with SMTP id q24mr8201lfo.51.1568749627118;
        Tue, 17 Sep 2019 12:47:07 -0700 (PDT)
Received: from localhost.localdomain ([46.216.138.44])
        by smtp.gmail.com with ESMTPSA id t3sm595953lfd.92.2019.09.17.12.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 12:47:06 -0700 (PDT)
Received: from [127.0.0.1] (helo=jeknote.loshitsa1.net)
        by localhost.localdomain with esmtp (Exim 4.92.1)
        (envelope-from <jekhor@gmail.com>)
        id 1iAJRK-0003sH-Oi; Tue, 17 Sep 2019 22:47:06 +0300
Date:   Tue, 17 Sep 2019 22:47:06 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to
 microUSB and TypeC variants
Message-ID: <20190917194706.GA7292@jeknote.loshitsa1.net>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
 <e7913031-4a0a-bcd9-2149-8e718b876a0e@redhat.com>
 <20190809145135.GC30248@jeknote.loshitsa1.net>
 <13391bf6-b8d2-83ce-2bca-1c359829938f@redhat.com>
 <20190915195526.GA14558@jeknote.loshitsa1.net>
 <32e4f7cc-df65-dcc5-adaa-5dcd63b3bfde@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e4f7cc-df65-dcc5-adaa-5dcd63b3bfde@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 16, 2019 at 10:45:13AM +0200, Hans de Goede wrote:
> 
> thinking more about this, since both modules will have the same
> acpi_device_id table they will both get auto-loaded anyways.
> 
> So how about the following:
> 
> 1) We put a single struct platform_driver in the common bits
> 2) We create a new shared struct cht_int33fe_data in intel_cht_int33fe_common.h
>    which has all the data members needed by both variants, e.g. just put the
>    intel_cht_int33fe_typec.c struct cht_int33fe_data definition in the common
>    header and rename max17047 to the  more generic battery_fg used by the musb code.
>    And add an enum int33fe_hw_type hw_type field to this struct
> 3) Have the typec and musb .c files export their probe + remove function
>    (make them non-static add prototypes to common.h)
> 4) Add a new probe to the common.c file which does the usual checks and
>    figures out hw_type. It then devm_kzalloc-s the struct, sets hw_type in the
>    struct and calls the right actual probe function depending on the board.
> 5) Add a new remove function to the common.c file which calls the right remove
>    function based on the hw_type in the data struct.
> 
> And we build all 3 .c files into a single module (since if we have multiple
> modules they will all get loaded anyways). I think this is the cleanest / best
> approach and it also answers the question of what to name the Kconfig options,
> since if we do as I suggest above we just stick with the single Kconfig option
> we already have.

Yes, maybe this is best approach. I sent v2 patch changed accordingly
your proposal.


-- 
Yauhen Kharuzhy
