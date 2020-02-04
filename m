Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 266CA15169B
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Feb 2020 08:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgBDHsn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 4 Feb 2020 02:48:43 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:45832 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgBDHsn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Feb 2020 02:48:43 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0147iRRF017044;
        Tue, 4 Feb 2020 07:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=EARmh3cmzMRaH5XkZGrjd8EQGejAsSNbZsv4oBkQb0U=;
 b=PJORnirOWiHbw+MUnux/yawSM0137+EqQvlAobhalnJGuJ8bB7aRJGoQxBQxxbzO0f4r
 2RYSR5d9jCOZ4SjXbj5BjozImf0I86cnJP7HRIJO4WyH+WGU57zDrpH57WsUxznP1v/P
 VytUD1XcvpsbF74eCFpw4BUsiONgh730k7nm3F/A1VM4gE4QbBmBDcyIxZuX3/5/RmgE
 DHGtZ3PT8oqj/Lmry+a05ZH6mESLuPdgWEPdRXgxshfQJ/tjxVhLIH0woOxLZT29FsF5
 WeNruut3WbtvBS2XYw05ztGZ4rbN5e6ZTaVZVrKlBtRgcXtViSA9M0kVq2pErAqeebTu Tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2xw19qcs6n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 07:48:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0147imbg149498;
        Tue, 4 Feb 2020 07:48:40 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2xxsbmr3vj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 07:48:40 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0147mdJF003241;
        Tue, 4 Feb 2020 07:48:39 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 Feb 2020 23:48:38 -0800
Date:   Tue, 4 Feb 2020 10:48:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     srinivas.pandruvada@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: Re: [bug report] platform/x86: Add support for Uncore frequency
 control
Message-ID: <20200204074832.GN11068@kadam>
References: <20200204070009.pf4ejbj3iw3prs3z@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204070009.pf4ejbj3iw3prs3z@kili.mountain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002040057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002040057
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Feb 04, 2020 at 10:00:09AM +0300, Dan Carpenter wrote:
> Hello Srinivas Pandruvada,
> 
> The patch 49a474c7ba51: "platform/x86: Add support for Uncore
> frequency control" from Jan 13, 2020, leads to the following static
> checker warning:
> 
> 	drivers/platform/x86/intel-uncore-frequency.c:285 uncore_remove_die_entry()
> 	error: dereferencing freed memory 'data'
> 
> drivers/platform/x86/intel-uncore-frequency.c
>    276  /* Last CPU in this die is offline, so remove sysfs entries */
>    277  static void uncore_remove_die_entry(int cpu)
>    278  {
>    279          struct uncore_data *data;
>    280  
>    281          mutex_lock(&uncore_lock);
>    282          data = uncore_get_instance(cpu);
>    283          if (data) {
>    284                  kobject_put(&data->kobj);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^
> This leads to a slightly delayed free.

These static checker warnings are new and I'm still working out the
kinks.  This doesn't actually free anything, but it's not right either
it seems?  The uncore_ktype struct doesn't have a release function so
won't kobject_cleanup() complain?

lib/kobject.c
   664  static void kobject_cleanup(struct kobject *kobj)
   665  {
   666          struct kobj_type *t = get_ktype(kobj);
   667          const char *name = kobj->name;
   668  
   669          pr_debug("kobject: '%s' (%p): %s, parent %p\n",
   670                   kobject_name(kobj), kobj, __func__, kobj->parent);
   671  
   672          if (t && !t->release)
   673                  pr_debug("kobject: '%s' (%p): does not have a release() function, it is broken and must be fixed. See Documentation/kobject.txt.\n",
                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   674                           kobject_name(kobj), kobj);

regards,
dan carpenter

