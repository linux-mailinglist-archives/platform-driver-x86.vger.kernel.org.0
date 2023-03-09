Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9E126B190A
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Mar 2023 03:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjCICHJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Mar 2023 21:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCICHI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 21:07:08 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A002A54F5;
        Wed,  8 Mar 2023 18:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678327627; x=1709863627;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=D+byK3wSnN0GwIcYsfy9ToXXHMCjoFrBP4uf7MeCrGs=;
  b=Mk4d2fPyk2vbdX009Xi+AvMzqbgUHRqiJkMTEuIkVfqU53IQPY91q8ki
   2v6YEArVUwkdmNdSnWPYx4bzhz8cS3bGO9cup8miZAhcGbOTkkqb0FYBj
   RguB3kxPvlH+tWdjNsbuqmbbrPwgiEAzlFVyTKO8uIErrnlGrNiRdMqye
   /WVjUbl/BFwgqYwlLUTBzBapaPBo3V+RKbgPUVa313vQ/a8IdHu0kZ3Mx
   mywVUhbsNn2W1neGCnSD3CmZ/R64CX4yorh5nNqLadcVP+8OOt7pMQWAb
   Cbw0gvFrskZINh3SC8h8RTDbJrDQIIcUVErKGXYm6TH8B4Cj52RkrIlld
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316724696"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="316724696"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 18:07:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820441446"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="820441446"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2023 18:07:06 -0800
Received: from [10.54.75.144] (debox1-desk1.jf.intel.com [10.54.75.144])
        by linux.intel.com (Postfix) with ESMTP id C365D580377;
        Wed,  8 Mar 2023 18:07:06 -0800 (PST)
Message-ID: <680419d2fb3e9aade284e976cb39338d6c557487.camel@linux.intel.com>
Subject: Re: [PATCH v6] platform/x86/intel/pmc: core: Add support to show
 LTR-ignored components
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Rajat Khandelwal <rajat.khandelwal@linux.intel.com>,
        "Box, David E" <david.e.box@intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "irenic.rajneesh@gmail.com" <irenic.rajneesh@gmail.com>
Cc:     "Khandelwal, Rajat" <rajat.khandelwal@intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Wed, 08 Mar 2023 18:07:06 -0800
In-Reply-To: <b51504d4-8e7c-0dac-3684-c9b4dc2f1943@linux.intel.com>
References: <20230301155757.1293131-1-rajat.khandelwal@linux.intel.com>
         <4c01c9e7ef9455c791fdad9de13ce706b4c3e3e2.camel@intel.com>
         <b51504d4-8e7c-0dac-3684-c9b4dc2f1943@linux.intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SWYgeW91IGNhbiBkbyB0aGlzIG5vdyBwbGVhc2UgZ28gYWhlYWQuIEl0IHdvdWxkIGJlIGEgZmV3
IHdlZWtzIGJlZm9yZSB3ZSBjb3VsZApnZXQgdG8gaXQuCgpEYXZpZAoKT24gVHVlLCAyMDIzLTAz
LTA3IGF0IDE4OjU4ICswNTMwLCBSYWphdCBLaGFuZGVsd2FsIHdyb3RlOgo+IEhpIERhdmlkLAo+
IAo+IE9uIDMvNi8yMDIzIDExOjI5IFBNLCBCb3gsIERhdmlkIEUgd3JvdGU6Cj4gPiBIaSBSYWph
dCwKPiA+IAo+ID4gV2UgaGF2ZSBzb21lIGNoYW5nZXMgY29taW5nIGZvciB0aGlzIGRyaXZlciBp
biBvcmRlciB0byBzdXBwb3J0IG11bHRpcGxlIFBNQwo+ID4gZGV2aWNlcyBvbiB0aGUgc2FtZSBT
b0MuIEFzIHBhcnQgb2YgdGhpcyB3ZSBhcmUgbW9kaWZ5aW5nIHRoZSBvdXRwdXQgb2YKPiA+IGx0
cl9zaG93Cj4gPiB0byBwcmVmaXggdGhlIElQIHdpdGggbnVtYmVyIG9mIHRoZSBtYW5hZ2luZyBQ
TUMuIEZvciBleGFtcGxlOgo+ID4gCj4gPiBQTUNbMF06U09VVEhQT1JUX0HCoMKgwqDCoMKgwqBM
VFI6IFJBVzogMHgwwqDCoMKgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqBTbm9vcChu
cyk6IDAKPiA+IFBNQ1swXTpTT1VUSFBPUlRfQsKgwqDCoMKgwqDCoExUUjogUkFXOiAweDDCoMKg
wqBOb24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoFNub29wKG5zKTogMAo+ID4gLi4uCj4g
PiBQTUNbMV06U09VVEhQT1JUX0HCoMKgwqDCoMKgwqBMVFI6IFJBVzogMHgwwqDCoMKgTm9uLVNu
b29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqBTbm9vcChucyk6IDAKPiA+IFBNQ1sxXTpTT1VUSFBP
UlRfQsKgwqDCoMKgwqDCoExUUjogUkFXOiAweDDCoMKgwqBOb24tU25vb3AobnMpOiAwwqDCoMKg
wqDCoMKgwqDCoFNub29wKG5zKTogMAo+ID4gCj4gPiBXZSdyZSB0aGlua2luZyB0aGF0IGl0IHdv
dWxkIGJlIGJldHRlciB0byBoYXZlIGEgY29sdW1uIGluIGx0cl9zaG93IGZvciB0aGUKPiA+IGln
bm9yZSBzdGF0dXMuIFRoaXMgd291bGQgbWFrZSBldmVyeXRoaW5nIHZpZXdhYmxlIGluIG9uZSBk
aXNwbGF5LiBBIGxpc3QKPiA+IHdvdWxkCj4gPiBub3QgYmUgbmVlZGVkLiBUaGUgc3RhdHVzIGNh
biBiZSByZWFkIGJhY2sgZnJvbSB0aGUgbHRyX2lnbm9yZSByZWdpc3Rlci4KPiA+IFdvdWxkCj4g
PiB0aGF0IHdvcmsgZm9yIHlvdT8gVGhhbmtzLgo+IAo+IEFhaCwgb2suIFRoYXQgaXMgZG9hYmxl
Lgo+IElzIHRoZSBwbGFuIHRvIGluY29ycG9yYXRlIHRoZSBpZ25vcmUgY29sdW1uIGNlcnRhaW4/
IEZ1cnRoZXIsIGlzIHRoZXJlIGFuIEVUQQo+IGZvciB0aGUKPiBzYWlkIGNoYW5nZXMgaW4gdGhl
IHVwc3RyZWFtPwo+IAo+IFRoYW5rcwo+IFJhamF0Cj4gCj4gPiAKPiA+IERhdmlkCj4gPiAKPiA+
IE9uIFdlZCwgMjAyMy0wMy0wMSBhdCAyMToyNyArMDUzMCwgUmFqYXQgS2hhbmRlbHdhbCB3cm90
ZToKPiA+ID4gQ3VycmVudGx5LCAnbHRyX2lnbm9yZScgc3lzZnMgYXR0cmlidXRlLCB3aGVuIHJl
YWQsIHJldHVybnMgbm90aGluZywgZXZlbgo+ID4gPiBpZiB0aGVyZSBhcmUgY29tcG9uZW50cyB3
aG9zZSBMVFIgdmFsdWVzIGhhdmUgYmVlbiBpZ25vcmVkLgo+ID4gPiAKPiA+ID4gTWFrZSB0aGUg
c3lzZnMgYXR0cmlidXRlIHByaW50IG91dCBzdWNoIGNvbXBvbmVudHMsIGlmIHRoZXkgZXhpc3Qs
IGFuZAo+ID4gPiByZXR1cm4gRUVYSVNULCBpZiB0cmllZCB0byBzZXQgYW4gYWxyZWFkeSBpZ25v
cmVkIGNvbXBvbmVudC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJhamF0IEtoYW5kZWx3
YWwgPHJhamF0LmtoYW5kZWx3YWxAbGludXguaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gCj4g
PiA+IHY2OiBEZXNjcmlwdGlvbiB3cml0dGVuIGluIGltcGVyYXRpdmUgc2Vuc2UKPiA+ID4gCj4g
PiA+IHY1Ogo+ID4gPiAxLiBJZ25vcmUgdGhlIExUUiBvZiB0aGUgcmVzcGVjdGl2ZSBjb21wb25l
bnQgYWZ0ZXIgdW5sb2NraW5nIHRoZSBtdXRleAo+ID4gPiBsb2NrCj4gPiA+IDIuIEFkZGluZyBl
cnJvciBjb2RlIGRldGFpbHMgdG8gdGhlIGNvbW1pdCBtZXNzYWdlCj4gPiA+IAo+ID4gPiB2NDog
TXV0ZXggdW5sb2NrIGR1cmluZyBlcnJvciBjb25kaXRpb25zCj4gPiA+IAo+ID4gPiB2MzogSW5j
b3Jwb3JhdGVkIGEgbXV0ZXggbG9jayBmb3IgYWNjZXNzaW5nICdsdHJfaWdub3JlX2xpc3QnCj4g
PiA+IAo+ID4gPiB2Mjoga21hbGxvYyAtPiBkZXZtX2ttYWxsb2MKPiA+ID4gCj4gPiA+IMKgwqBk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbWMvY29yZS5jIHwgNjQgKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tCj4gPiA+IMKgwqBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbWMvY29y
ZS5oIHzCoCAyICstCj4gPiA+IMKgwqAyIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyks
IDEzIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZv
cm0veDg2L2ludGVsL3BtYy9jb3JlLmMKPiA+ID4gYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRl
bC9wbWMvY29yZS5jCj4gPiA+IGluZGV4IDNhMTVkMzJkNzY0NC4uMTZjZjZjNjM0ZGI4IDEwMDY0
NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbWMvY29yZS5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9jb3JlLmMKPiA+ID4gQEAgLTUz
LDYgKzUzLDE3IEBAIGNvbnN0IHN0cnVjdCBwbWNfYml0X21hcCBtc3JfbWFwW10gPSB7Cj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoHt9Cj4gPiA+IMKgwqB9Owo+ID4gPiDCoCAKPiA+ID4gKy8qIE11
dHVhbCBleGNsdXNpb24gdG8gYWNjZXNzIHRoZSBsaXN0IG9mIExUUi1pZ25vcmVkIGNvbXBvbmVu
dHMgKi8KPiA+ID4gK3N0YXRpYyBERUZJTkVfTVVURVgobHRyX2VudHJ5X211dGV4KTsKPiA+ID4g
Kwo+ID4gPiArc3RydWN0IGx0cl9lbnRyeSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHUzMiBjb21w
X2luZGV4Owo+ID4gPiArwqDCoMKgwqDCoMKgwqBjb25zdCBjaGFyICpjb21wX25hbWU7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBsaXN0X2hlYWQgbm9kZTsKPiA+ID4gK307Cj4gPiA+ICsK
PiA+ID4gK3N0YXRpYyBMSVNUX0hFQUQobHRyX2lnbm9yZV9saXN0KTsKPiA+ID4gKwo+ID4gPiDC
oMKgc3RhdGljIGlubGluZSB1MzIgcG1jX2NvcmVfcmVnX3JlYWQoc3RydWN0IHBtY19kZXYgKnBt
Y2RldiwgaW50Cj4gPiA+IHJlZ19vZmZzZXQpCj4gPiA+IMKgwqB7Cj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiByZWFkbChwbWNkZXYtPnJlZ2Jhc2UgKyByZWdfb2Zmc2V0KTsKPiA+ID4g
QEAgLTQzNSwyNyArNDQ2LDE4IEBAIHN0YXRpYyBpbnQgcG1jX2NvcmVfcGxsX3Nob3coc3RydWN0
IHNlcV9maWxlICpzLAo+ID4gPiB2b2lkCj4gPiA+ICp1bnVzZWQpCj4gPiA+IMKgwqB9Cj4gPiA+
IMKgwqBERUZJTkVfU0hPV19BVFRSSUJVVEUocG1jX2NvcmVfcGxsKTsKPiA+ID4gwqAgCj4gPiA+
IC1pbnQgcG1jX2NvcmVfc2VuZF9sdHJfaWdub3JlKHN0cnVjdCBwbWNfZGV2ICpwbWNkZXYsIHUz
MiB2YWx1ZSkKPiA+ID4gK3ZvaWQgcG1jX2NvcmVfc2VuZF9sdHJfaWdub3JlKHN0cnVjdCBwbWNf
ZGV2ICpwbWNkZXYsIHUzMiB2YWx1ZSkKPiA+ID4gwqDCoHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgY29uc3Qgc3RydWN0IHBtY19yZWdfbWFwICptYXAgPSBwbWNkZXYtPm1hcDsKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgdTMyIHJlZzsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgaW50IGVyciA9IDA7
Cj4gPiA+IMKgIAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZwbWNkZXYtPmxv
Y2spOwo+ID4gPiDCoCAKPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKHZhbHVlID4gbWFwLT5sdHJf
aWdub3JlX21heCkgewo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0g
LUVJTlZBTDsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0X3Vu
bG9jazsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgfQo+ID4gPiAtCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoHJlZyA9IHBtY19jb3JlX3JlZ19yZWFkKHBtY2RldiwgbWFwLT5sdHJfaWdub3JlX29mZnNl
dCk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHJlZyB8PSBCSVQodmFsdWUpOwo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqBwbWNfY29yZV9yZWdfd3JpdGUocG1jZGV2LCBtYXAtPmx0cl9pZ25vcmVf
b2Zmc2V0LCByZWcpOwo+ID4gPiDCoCAKPiA+ID4gLW91dF91bmxvY2s6Cj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoG11dGV4X3VubG9jaygmcG1jZGV2LT5sb2NrKTsKPiA+ID4gLQo+ID4gPiAtwqDC
oMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+ID4gPiDCoMKgfQo+ID4gPiDCoCAKPiA+ID4gwqDCoHN0
YXRpYyBzc2l6ZV90IHBtY19jb3JlX2x0cl9pZ25vcmVfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUs
Cj4gPiA+IEBAIC00NjQsNiArNDY2LDggQEAgc3RhdGljIHNzaXplX3QgcG1jX2NvcmVfbHRyX2ln
bm9yZV93cml0ZShzdHJ1Y3QgZmlsZQo+ID4gPiAqZmlsZSwKPiA+ID4gwqDCoHsKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IHNlcV9maWxlICpzID0gZmlsZS0+cHJpdmF0ZV9kYXRhOwo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcG1jX2RldiAqcG1jZGV2ID0gcy0+cHJpdmF0
ZTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IHBtY19yZWdfbWFwICptYXAgPSBw
bWNkZXYtPm1hcDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGx0cl9lbnRyeSAqZW50cnk7
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBidWZfc2l6ZSwgdmFsdWU7Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoGludCBlcnI7Cj4gPiA+IMKgIAo+ID4gPiBAQCAtNDczLDEzICs0NzcsNDkg
QEAgc3RhdGljIHNzaXplX3QgcG1jX2NvcmVfbHRyX2lnbm9yZV93cml0ZShzdHJ1Y3QgZmlsZQo+
ID4gPiAqZmlsZSwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gPiA+IMKgIAo+ID4gPiAt
wqDCoMKgwqDCoMKgwqBlcnIgPSBwbWNfY29yZV9zZW5kX2x0cl9pZ25vcmUocG1jZGV2LCB2YWx1
ZSk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICh2YWx1ZSA+IG1hcC0+bHRyX2lnbm9yZV9tYXgp
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiA+
ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZsdHJfZW50cnlfbXV0ZXgpOwo+
ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGxpc3RfZm9yX2VhY2hfZW50cnkoZW50cnksICZs
dHJfaWdub3JlX2xpc3QsIG5vZGUpIHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmIChlbnRyeS0+Y29tcF9pbmRleCA9PSB2YWx1ZSkgewo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IC1FRVhJU1Q7Cj4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXRfdW5s
b2NrOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiArwqDCoMKg
wqDCoMKgwqB9Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgZW50cnkgPSBkZXZtX2ttYWxs
b2MoJnBtY2Rldi0+cGRldi0+ZGV2LCBzaXplb2YoKmVudHJ5KSwKPiA+ID4gR0ZQX0tFUk5FTCk7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghZW50cnkpIHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGVyciA9IC1FTk9NRU07Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBnb3RvIG91dF91bmxvY2s7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4g
Kwo+ID4gPiArwqDCoMKgwqDCoMKgwqBlbnRyeS0+Y29tcF9uYW1lID0gbWFwLT5sdHJfc2hvd19z
dHNbdmFsdWVdLm5hbWU7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGVudHJ5LT5jb21wX2luZGV4ID0g
dmFsdWU7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGxpc3RfYWRkX3RhaWwoJmVudHJ5LT5ub2RlLCAm
bHRyX2lnbm9yZV9saXN0KTsKPiA+ID4gKwo+ID4gPiArb3V0X3VubG9jazoKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZsdHJfZW50cnlfbXV0ZXgpOwo+ID4gPiArCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoGlmIChlcnIpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gZXJyOwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHBtY19jb3JlX3NlbmRf
bHRyX2lnbm9yZShwbWNkZXYsIHZhbHVlKTsKPiA+ID4gwqAgCj4gPiA+IC3CoMKgwqDCoMKgwqDC
oHJldHVybiBlcnIgPT0gMCA/IGNvdW50IDogZXJyOwo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1
cm4gY291bnQ7Cj4gPiA+IMKgwqB9Cj4gPiA+IMKgIAo+ID4gPiDCoMKgc3RhdGljIGludCBwbWNf
Y29yZV9sdHJfaWdub3JlX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVzZWQpCj4g
PiA+IMKgwqB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBsdHJfZW50cnkgKmVudHJ5Owo+
ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmx0cl9lbnRyeV9tdXRleCk7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGxpc3RfZm9yX2VhY2hfZW50cnkoZW50cnksICZsdHJfaWdu
b3JlX2xpc3QsIG5vZGUpIHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNl
cV9wcmludGYocywgIiVzXG4iLCBlbnRyeS0+Y29tcF9uYW1lKTsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgfQo+ID4gPiArwqDCoMKgwqDCoMKgwqBtdXRleF91bmxvY2soJmx0cl9lbnRyeV9tdXRleCk7
Cj4gPiA+ICsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiA+IMKgwqB9Cj4g
PiA+IMKgIAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG1j
L2NvcmUuaAo+ID4gPiBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9jb3JlLmgKPiA+
ID4gaW5kZXggODEwMjA0ZDc1OGFiLi5kYTM1YjBmY2JlNmUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9jb3JlLmgKPiA+ID4gKysrIGIvZHJpdmVycy9w
bGF0Zm9ybS94ODYvaW50ZWwvcG1jL2NvcmUuaAo+ID4gPiBAQCAtMzk2LDcgKzM5Niw3IEBAIGV4
dGVybiBjb25zdCBzdHJ1Y3QgcG1jX3JlZ19tYXAgYWRsX3JlZ19tYXA7Cj4gPiA+IMKgwqBleHRl
cm4gY29uc3Qgc3RydWN0IHBtY19yZWdfbWFwIG10bF9yZWdfbWFwOwo+ID4gPiDCoCAKPiA+ID4g
wqDCoGV4dGVybiB2b2lkIHBtY19jb3JlX2dldF90Z2xfbHBtX3JlcXMoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldik7Cj4gPiA+IC1leHRlcm4gaW50IHBtY19jb3JlX3NlbmRfbHRyX2lnbm9y
ZShzdHJ1Y3QgcG1jX2RldiAqcG1jZGV2LCB1MzIgdmFsdWUpOwo+ID4gPiArZXh0ZXJuIHZvaWQg
cG1jX2NvcmVfc2VuZF9sdHJfaWdub3JlKHN0cnVjdCBwbWNfZGV2ICpwbWNkZXYsIHUzMiB2YWx1
ZSk7Cj4gPiA+IMKgIAo+ID4gPiDCoMKgdm9pZCBzcHRfY29yZV9pbml0KHN0cnVjdCBwbWNfZGV2
ICpwbWNkZXYpOwo+ID4gPiDCoMKgdm9pZCBjbnBfY29yZV9pbml0KHN0cnVjdCBwbWNfZGV2ICpw
bWNkZXYpOwoK

