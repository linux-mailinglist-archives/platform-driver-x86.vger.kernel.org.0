Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66F21151CB0
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Feb 2020 15:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbgBDO6D (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 4 Feb 2020 09:58:03 -0500
Received: from mga12.intel.com ([192.55.52.136]:20949 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727267AbgBDO6C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Feb 2020 09:58:02 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 06:58:02 -0800
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208,223";a="224315893"
Received: from dishasha-mobl.gar.corp.intel.com ([10.252.91.159])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 06:58:00 -0800
Message-ID: <7cae99aa52cd9dc164d09286ececa3e16d094492.camel@linux.intel.com>
Subject: Re: [bug report] platform/x86: Add support for Uncore frequency
 control
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Tue, 04 Feb 2020 06:58:00 -0800
In-Reply-To: <20200204074832.GN11068@kadam>
References: <20200204070009.pf4ejbj3iw3prs3z@kili.mountain>
         <20200204074832.GN11068@kadam>
Content-Type: multipart/mixed; boundary="=-r51ENl19dVnP38/IVWWZ"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--=-r51ENl19dVnP38/IVWWZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Dan,

On Tue, 2020-02-04 at 10:48 +0300, Dan Carpenter wrote:
> On Tue, Feb 04, 2020 at 10:00:09AM +0300, Dan Carpenter wrote:
> > Hello Srinivas Pandruvada,
> > 
> > The patch 49a474c7ba51: "platform/x86: Add support for Uncore
> > frequency control" from Jan 13, 2020, leads to the following static
> > checker warning:
> > 
> > 	drivers/platform/x86/intel-uncore-frequency.c:285
> > uncore_remove_die_entry()
> > 	error: dereferencing freed memory 'data'
> > 
> > drivers/platform/x86/intel-uncore-frequency.c
> >    276  /* Last CPU in this die is offline, so remove sysfs entries
> > */
> >    277  static void uncore_remove_die_entry(int cpu)
> >    278  {
> >    279          struct uncore_data *data;
> >    280  
> >    281          mutex_lock(&uncore_lock);
> >    282          data = uncore_get_instance(cpu);
> >    283          if (data) {
> >    284                  kobject_put(&data->kobj);
> >                         ^^^^^^^^^^^^^^^^^^^^^^^^
> > This leads to a slightly delayed free.
> 
> These static checker warnings are new and I'm still working out the
> kinks.  This doesn't actually free anything, but it's not right
> either
> it seems?  The uncore_ktype struct doesn't have a release function so
> won't kobject_cleanup() complain?
> 
> lib/kobject.c
>    664  static void kobject_cleanup(struct kobject *kobj)
>    665  {
>    666          struct kobj_type *t = get_ktype(kobj);
>    667          const char *name = kobj->name;
>    668  
>    669          pr_debug("kobject: '%s' (%p): %s, parent %p\n",
>    670                   kobject_name(kobj), kobj, __func__, kobj-
> >parent);
>    671  
>    672          if (t && !t->release)
>    673                  pr_debug("kobject: '%s' (%p): does not have a
> release() function, it is broken and must be fixed. See
> Documentation/kobject.txt.\n",
>                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>    674                           kobject_name(kobj), kobj);
> 
There are several usages in kernel without release callback. 
Does the attach patch fixes the warning?

Thanks,
Srinivas


> regards,
> dan carpenter
> 

--=-r51ENl19dVnP38/IVWWZ
Content-Disposition: attachment;
	filename*0=0001-platform-x86-intel-uncore-freq-Add-release-function.patc;
	filename*1=h
Content-Type: text/x-patch;
	name="0001-platform-x86-intel-uncore-freq-Add-release-function.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA5NTllZTlmZTc4NGQ2MjM5NjBkZjI1NjBmZDEzY2FlMjE1YjQ2NGQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTcmluaXZhcyBQYW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2
YWRhQGxpbnV4LmludGVsLmNvbT4KRGF0ZTogVHVlLCA0IEZlYiAyMDIwIDA2OjUwOjExIC0wODAw
ClN1YmplY3Q6IFtQQVRDSF0gcGxhdGZvcm0veDg2L2ludGVsLXVuY29yZS1mcmVxOiBBZGQgcmVs
ZWFzZSBmdW5jdGlvbgoKV2hlbiB1c2VyIG1vZGUgaXMgcmVmZXJlbmNlIHRvIHRoZSBrb2JqZWN0
LCB3YWl0IHRvIGZyZWUgdGhlIG1lbW9yeQpkdXJpbmcgbW9kdWxlIHVubG9hZCBieSBhZGRpbmcg
YSByZWxlYXNlIGNhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogU3Jpbml2YXMgUGFuZHJ1dmFkYSA8
c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9y
bS94ODYvaW50ZWwtdW5jb3JlLWZyZXF1ZW5jeS5jIHwgMTUgKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC11bmNvcmUtZnJlcXVlbmN5LmMgYi9kcml2ZXJz
L3BsYXRmb3JtL3g4Ni9pbnRlbC11bmNvcmUtZnJlcXVlbmN5LmMKaW5kZXggMmIxYTA3MzRjM2Y4
Li4zZWRhNjZkMDcxM2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsLXVu
Y29yZS1mcmVxdWVuY3kuYworKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC11bmNvcmUt
ZnJlcXVlbmN5LmMKQEAgLTIxNywxMiArMjE3LDIxIEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRl
ICp1bmNvcmVfYXR0cnNbXSA9IHsKIAlOVUxMCiB9OwogCisKK3N0YXRpYyB2b2lkIHVuY29yZV9z
eXNmc19lbnRyeV9yZWxlYXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKQoreworCWlmICghdW5jb3Jl
X21heF9lbnRyaWVzKQorCQlrZnJlZSh1bmNvcmVfaW5zdGFuY2VzKTsKK30KKwogc3RhdGljIHN0
cnVjdCBrb2JqX3R5cGUgdW5jb3JlX2t0eXBlID0geworCS5yZWxlYXNlID0gdW5jb3JlX3N5c2Zz
X2VudHJ5X3JlbGVhc2UsCiAJLnN5c2ZzX29wcyA9ICZrb2JqX3N5c2ZzX29wcywKIAkuZGVmYXVs
dF9hdHRycyA9IHVuY29yZV9hdHRycywKIH07CiAKIHN0YXRpYyBzdHJ1Y3Qga29ial90eXBlIHVu
Y29yZV9yb290X2t0eXBlID0geworCS5yZWxlYXNlID0gdW5jb3JlX3N5c2ZzX2VudHJ5X3JlbGVh
c2UsCiAJLnN5c2ZzX29wcyA9ICZrb2JqX3N5c2ZzX29wcywKIH07CiAKQEAgLTI4MSw5ICsyOTAs
OSBAQCBzdGF0aWMgdm9pZCB1bmNvcmVfcmVtb3ZlX2RpZV9lbnRyeShpbnQgY3B1KQogCW11dGV4
X2xvY2soJnVuY29yZV9sb2NrKTsKIAlkYXRhID0gdW5jb3JlX2dldF9pbnN0YW5jZShjcHUpOwog
CWlmIChkYXRhKSB7Ci0JCWtvYmplY3RfcHV0KCZkYXRhLT5rb2JqKTsKIAkJZGF0YS0+Y29udHJv
bF9jcHUgPSAtMTsKIAkJZGF0YS0+dmFsaWQgPSBmYWxzZTsKKwkJa29iamVjdF9wdXQoJmRhdGEt
PmtvYmopOwogCX0KIAltdXRleF91bmxvY2soJnVuY29yZV9sb2NrKTsKIH0KQEAgLTQyNCwxMiAr
NDMzLDE0IEBAIHN0YXRpYyB2b2lkIF9fZXhpdCBpbnRlbF91bmNvcmVfZXhpdCh2b2lkKQogCiAJ
dW5yZWdpc3Rlcl9wbV9ub3RpZmllcigmdW5jb3JlX3BtX25iKTsKIAljcHVocF9yZW1vdmVfc3Rh
dGUodW5jb3JlX2hwX3N0YXRlKTsKKwltdXRleF9sb2NrKCZ1bmNvcmVfbG9jayk7CiAJZm9yIChp
ID0gMDsgaSA8IHVuY29yZV9tYXhfZW50cmllczsgKytpKSB7CiAJCWlmICh1bmNvcmVfaW5zdGFu
Y2VzW2ldLnZhbGlkKQogCQkJa29iamVjdF9wdXQoJnVuY29yZV9pbnN0YW5jZXNbaV0ua29iaik7
CiAJfQorCXVuY29yZV9tYXhfZW50cmllcyA9IDA7CiAJa29iamVjdF9wdXQoJnVuY29yZV9yb290
X2tvYmopOwotCWtmcmVlKHVuY29yZV9pbnN0YW5jZXMpOworCW11dGV4X3VubG9jaygmdW5jb3Jl
X2xvY2spOwogfQogbW9kdWxlX2V4aXQoaW50ZWxfdW5jb3JlX2V4aXQpCiAKLS0gCjIuMjAuMQoK



--=-r51ENl19dVnP38/IVWWZ--

