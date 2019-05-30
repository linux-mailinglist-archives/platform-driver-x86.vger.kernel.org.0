Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED3E2FEEA
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 May 2019 17:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbfE3PGy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 30 May 2019 11:06:54 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:50298 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727013AbfE3PGw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 May 2019 11:06:52 -0400
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4UF0165003762
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2019 11:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=bMBb6NZKD3LHHyfLZpvrMVx7I6/DhGclWDE0VMz7i5E=;
 b=B6aAkcX1w+bVybbNU00zNK3eOqXlDp5AzWNY5XciLnwUzLX2SnNVQNG/2uURbvkVSmPW
 lTic3iysA3klyVrKnC/vnlGeyYwlFZnYcLri4mTHmC5q21CZtwn/H2lj9k03qyQ+WxRv
 Z6un14XtNM4LcUAV5CBlz+XwYt6HkW8SYu6uAUVVb0jjyFT4t5dd2FtG/WrJjn7sxD8B
 ElJpIjKGDkyNJNehBfBkLrGGMjZW5qLwN6RyVJT3MWjcUjlwWsd6fZXC+B/9JQdNYjU9
 /HL9qG4cNrxSAJkbGltqT+Qm0zjHao0EoyY7FHkVxE/I1braDHIv2DFd1wgbGPLL7RGp Lg== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 2ssy2qm623-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2019 11:06:51 -0400
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4UF35jv011426
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2019 11:06:50 -0400
Received: from ausc60ps301.us.dell.com (ausc60ps301.us.dell.com [143.166.148.206])
        by mx0b-00154901.pphosted.com with ESMTP id 2sth4d8fgn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2019 11:06:49 -0400
X-LoopCount0: from 10.166.132.127
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; 
   d="scan'208";a="1302552336"
From:   <Mario.Limonciello@dell.com>
To:     <platform-driver-x86@vger.kernel.org>
Subject: Passing WMI events up to userspace
Thread-Topic: Passing WMI events up to userspace
Thread-Index: AdUW9tNAu6xUGXNcRuWeHvG6HFHYdw==
Date:   Thu, 30 May 2019 15:06:46 +0000
Message-ID: <e48e71ed243b4f4e8490ad1c00ea0db8@AUSX13MPC105.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-30_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905300107
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905300107
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I was recently talking to a colleague about how ACPI-WMI notification event=
s on Windows work relative to Linux.
On the Windows side a userspace application is able to directly capture all=
 ACPI WMI notification events.
On Linux right now the WMI drivers in the kernel will capture certain notif=
ications and convert them into keypresses.

There are various situations that events coming through are not actually ke=
ypresses but rather messages that should
be displayed directly to the user in userland.  They vary widely in critica=
lity, but let me give a few examples:

* You have attached a power adapter to a port that does not accept power.
* The docking station you have connected is not compatible with the current=
 port. If you have a Thunderbolt port, attach the docking station to that p=
ort.
* Your dock fan has failed. You may experience reduced performance until yo=
ur dock is serviced.
* Your docking station is not capable of providing enough power to meet the=
 minimum system requirements for normal operation. Please attach an additio=
nal supported power adapter with at least <value> watts to your system.

These messages can of course be output to the kernel syslog, but there are =
a few disadvantages:
1) Most users will not monitor syslog regularly.
2) Some messages are more severe and may require immediate attention
3) The messages can't be translated.

So I was thinking it's probably better to notify userspace and let usespace=
 parse the contents of the ACPI buffer to show
translated messages in UX somewhere.

Before going to far down that path I wanted to see what others thought of t=
his.
Furthermore the kernel supports a ton of userspace notification mechanisms =
- What is best suited for this purpose?

