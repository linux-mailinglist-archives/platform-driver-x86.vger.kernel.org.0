Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58A6E5E2A8
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Jul 2019 13:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfGCLNO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Jul 2019 07:13:14 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53023 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbfGCLNN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Jul 2019 07:13:13 -0400
Received: from [192.168.1.110] ([95.114.150.241]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MxUfn-1iT2cd0OQj-00xrnU; Wed, 03 Jul 2019 13:13:06 +0200
Subject: Re: [PATCH] x86: apuv2: Fix softdep statement
To:     Jean Delvare <jdelvare@suse.de>,
        platform-driver-x86@vger.kernel.org
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
References: <20190629114136.45e90292@endymion>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <d3d8daee-d54d-8724-56f6-9ee900de7faa@metux.net>
Date:   Wed, 3 Jul 2019 13:13:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190629114136.45e90292@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:A+xvB5gtsXT9sOdqM33Kk4DUMXibmGXRbX0zB3kZMTSjfQtWkFG
 fxE3OJt+OLd6q/wKrAIuTD22G8JEVsj/deoBL8dZLL4b3f9zjXgPGsMmB/RsFapHIzLw2TR
 uxJiDXPm34PgcCpLh6U5FvG8nIIargx7EmTv0g9jBImqbuzHJkVf+Q8XZAAtZoEvnZCGLQH
 Bf66Doehu9jbDqXVWHf3w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9MIEHJZzhhI=:j8YbBCMKVJGrtt6wbeOAKe
 zuDy+0ZJGBTe1oOY5zeBspfiNhrgroyhD70HR7AP+91wvXm5zzjdAgHCFlJjM8CqZUpQHsjN1
 XAD7eri9WiOadDSuG3SY17r2QyDkfwYVa0Vxd+LBwmvqRbV1QBl/3XT9fDLZS7uRJ5PaoWmvs
 sJbPpWhu/cqXrTRa6eYKf1sD6hTyc2uwTIqQCn1MIS6qvv7t9X+d2uAI93/cWFRE8cQe4cBfC
 hMxeqty5sxyQjpVTMRIUBH6WjRV/U39uCCpA+YiOGymrGcRVjz6k7a/4M+vt3JhNIlKZICtw3
 J2VH6hfK6mEoSrRKeOEB4eXfNYjPTHjwx3ik/TrkWuOTpyPGGoE1Hgf5STlBYsoHmJxXx15FO
 A+74DvleQPepUMAOyZrgN7+kHMXXlCl+8jrDX7S9XW4HdhCwiCWhmKka228HgRUec4ZTZ5h5Z
 1VXNhPBS4KbuGjtKJKNTlK4lqAzVPXTkQ1Nk2KwM3RlUZKqtEHe1tgfPdmzbXaAreqkEGLQhu
 1XnkA6sEwm54ec1hpvXGqPCnT0HWHxzIgtBgq/HFohU9yzyA8EtiO4FqT9iO4jrfBDxxR/nm3
 TI8Ju/AlgclO8mrgDpcT28Tzz4fTPdfBlB7il52oyCvd7N9V7DaeoiTfMhzYihFYacy1D5Ob9
 stXEcShGt8eIx1lMlmNMl8QZtwmH9LKSYtOIFMG3bckXC/Al7ILbSVwdeouOplFAwl3CbmavU
 X7Usxap4dAx8B9N1JX2eOln3kFxCFbL6qwLDTH9FRT+GmyoQ8RiDPwssMWI=
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 29.06.19 11:41, Jean Delvare wrote:
> Only one MODULE_SOFTDEP statement is allowed per module. Multiple
> dependencies must be expressed in a single statement.

Thanks for the report. I'll give it a test on actual target, when I'm
back from travel.

I recall some strange problems w/ module load order, maybe that's
exactly the missing piece.

BTW: just curious whether you happen to be located in Nuremberg ?
(maybe we could have a coffee some day ;-)).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
