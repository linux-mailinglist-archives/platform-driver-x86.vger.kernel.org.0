Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0021923AA54
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 18:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgHCQQD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 12:16:03 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.5]:53361 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725945AbgHCQQC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 12:16:02 -0400
Received: from [100.112.2.140] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-east-1.aws.symcld.net id 19/F3-31766-048382F5; Mon, 03 Aug 2020 16:16:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleJIrShJLcpLzFFi42JJl3vFrutgoRF
  vsLBZ1eLlhMOMFg/mplsc/zaT3WL2YRuLOc/WMlqs3vOC2YHNY+esu+wevw8weuxe8JnJ4/2+
  q2wenzfJBbBGsWbmJeVXJLBm3HyyjbHgPk/FxtV+DYyruLoYuTiEBP4zSnR+msEG4TxglFh2Z
  T+Qw8khLFAgceXZJqYuRg4OEQF1ic1dKSA1zAI/GCU+zjwK1dDPJLFr3QdmkAY2AW2JLVt+gT
  XzCthKtEx+wQRiswioSCx9d5QRxBYViJVYPvUPK0SNoMTJmU9YQGxOgUCJCytngcWZBSwkZs4
  /zwhhi0vcejKfCcKWl9j+dg7YLgkBBYmWvg2sEHaCxLKXd5gnMArOQjJ2FpJRs5CMmoVk1AJG
  llWMZklFmekZJbmJmTm6hgYGuoaGRrpAaGqsl1ilm6RXWqybmlhcomuol1herFdcmZuck6KXl
  1qyiREYPykFTH93MJ57/UHvEKMkB5OSKO9RDY14Ib6k/JTKjMTijPii0pzU4kOMMhwcShK8Ta
  ZAOcGi1PTUirTMHGAsw6QlOHiURHgTzIHSvMUFibnFmekQqVOMilLivKFmQAkBkERGaR5cGyx
  9XGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCsKMp4nM68EbvoroMVMQIttNqiCLC5JREhJ
  NTBZ6+4q7pI7eT94aVtwTHDKz5iTXz5vlPv3y7XkiHjyCyd1af61tX2XGScfnirrs+X57CfHb
  4p/8OtLcFq1N0860421VFaFyWt6pcWdTPUjp0rPBaistTRhTd9Xtz4t0b9XcVsAD/fLmYVBDo
  zWXVr2qw7U/5krpjs1fs1Phe25E886HH7N8ugNK+eThJW2P4OnBx2QWLDulMYGnrkHWvV/Tjh
  W5n5gxot0yQvT2CLmTL+8RTtaqunXk/B9XdMPNrQteNOrfeuzguB6/6TijUVuGT+/aPy/bKvo
  dzWBc9YXpvmt/HbOR969unws2LWd+XNn+OMJRYFsy5fpV22dOP/I0Y/X+l8/W3N4FsOFFs54J
  ZbijERDLeai4kQAaKBF7JoDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-11.tower-386.messagelabs.com!1596471358!584236!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11260 invoked from network); 3 Aug 2020 16:16:00 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-11.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Aug 2020 16:16:00 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 92669A6FF62A25DCF2C8;
        Tue,  4 Aug 2020 00:15:56 +0800 (CST)
Received: from [10.38.102.51] (10.38.102.51) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Mon, 3 Aug 2020
 09:15:53 -0700
Subject: Re: [External] Re: [ibm-acpi-devel] [PATCH v5] platform/x86:
 thinkpad_acpi: lap or desk mode interface
To:     Elvis Stansvik <elvstone@gmail.com>
CC:     <ibm-acpi@hmh.eng.br>, <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>, <andy.shevchenko@gmail.com>,
        "Nitin Joshi" <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        "Bastien Nocera" <bnocera@redhat.com>
References: <CAHms=eZm3LY-Z4p+TkfZ+vyxGd_7XKPBsSEM_Mvnx2s-GO2c9w@mail.gmail.com>
 <CAHms=eYpcy__Km_9O4MUtLxpasH1sAgQEmcapOhV79j01twhow@mail.gmail.com>
 <0e462361-a3bc-a7b8-bacd-85f32b575bac@lenovo.com>
 <CAHms=eZ4YVAvmUsjcZTsPOf15sxK_vELbK6fvCs=Bbm3gxFGeQ@mail.gmail.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <4481e959-7e13-fb11-0628-9509380d38ee@lenovo.com>
Date:   Mon, 3 Aug 2020 12:15:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHms=eZ4YVAvmUsjcZTsPOf15sxK_vELbK6fvCs=Bbm3gxFGeQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.102.51]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/3/2020 10:46 AM, Elvis Stansvik wrote:

> 
> Thanks Mark. I know the X1C6 firmware did not get the new thermal
> mode implementation, but thought that I would still be able to query
> its lap mode.
> 
> The reason I wanted query the lap mode is actually because I'm
> trying to help Matthew Garrett out in adding support for the adaptive
> DPTF performance policy on the thermald side, instead of on the
> firmware side like Lenovo decided to do for more recent models. See
> that effort here https://github.com/mjg59/thermal_daemon/issues/7).
> We were surprised to find that all of the OEM conditions in the APCT
> table remained unchanged when the laptop was taken between lap and
> desk. So I started suspecting that perhaps the X1C6 and its firmware
> simply does not have the ability to detect lap vs desk. That's why I
> wanted to use this patch to query the lap mode, as a debugging aid.
> 
> If X1C6 does not have the ability to detect lap mode, then that
> would obviously explain why the firmware does not change any APCT
> condition when put on/off lap, and any effort to get adaptive
> performance policy working on the thermald side is probably doomed
> :(
> 
Just as a follow-up for this mailing list - I responded to the X1C6 
issues on the thermal_daemon thread mentioned above - I will track those 
there.

Anything related to the thinkpad_acpi driver and improvements needed to 
my previous patch will come here. I have a question in to the firmware 
team to understand the limitations of when the lapmode variable should 
be made available or not. Looks like I have some work to do there....

Thanks!
Mark
