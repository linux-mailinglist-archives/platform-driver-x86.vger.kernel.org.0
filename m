Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01A1CA5BCD
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Sep 2019 19:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfIBRZV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 2 Sep 2019 13:25:21 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:38772 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfIBRZV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Sep 2019 13:25:21 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x82HOR9j088218;
        Mon, 2 Sep 2019 17:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=fmTa8ZJ+SpahbLpNUsoBShdI9z6YSJAcyCJtq9AvlCg=;
 b=R7NIOFxMI7LzSKrF2YaT7Ca1PFMA545bwN0lghCjyhDEG3+VNBFg4Jg2fNqqnY5BSHI+
 xBkysFYOeBxoBJsHDWKBZCBcbeFLHGWqAQ2WT+qSQs7o+CiRcchyd7t7Wr5yu0A8sq9L
 Jey36Wn7gQIMQ/51UOHhTiIiyuPXzi2QLv1p5+FNe2uZJfrg2Bk5cGztxcMCyzDymaUX
 PyTJC+cuZfesdYAxh/X/AZvhjyaWUl7Pj7usZWWhzGTECbB7gwz8nGfO4jYaWsrbxRFw
 RsQOV9ARQ6+QHihfYIk5y/FR4pU1F9tkUafAR1NNVTfB4XruX3Kb9fG0o5UAminDQdfK JA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2us70ar36m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Sep 2019 17:24:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x82HO5FQ086201;
        Mon, 2 Sep 2019 17:24:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2us4wcmhsp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Sep 2019 17:24:59 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x82HOvFD019686;
        Mon, 2 Sep 2019 17:24:57 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 02 Sep 2019 10:24:56 -0700
Date:   Mon, 2 Sep 2019 20:24:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix condition in
 charge_threshold_store()
Message-ID: <20190902172450.GA3093@kadam>
References: <20190902143850.GA607@mwanda>
 <CAHp75Vf=8L8fk0a=9auX5RboF8yCnfmz3JH9OGT7yAV3ZX1ybw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf=8L8fk0a=9auX5RboF8yCnfmz3JH9OGT7yAV3ZX1ybw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9368 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909020196
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9368 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909020196
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 02, 2019 at 06:12:07PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 2, 2019 at 5:41 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > This error handling is reversed so we return early.
> >
> 
> I will squash to the original commit since it's not yet upstream.
> 
> Are you okay with this?
> 

Sure.  That's fine.

regards,
dan carpenter

