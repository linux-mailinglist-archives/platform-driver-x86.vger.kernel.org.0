Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7562F17BE
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 Jan 2021 15:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbhAKOMk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 11 Jan 2021 09:12:40 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44241 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbhAKOMj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jan 2021 09:12:39 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kyxvG-0005j2-QT; Mon, 11 Jan 2021 14:11:54 +0000
Subject: Re: platform/surface: Add Surface Aggregator user-space interface
 (static analysis issues)
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <9e450370-7c5c-2e93-ac86-6f7c21652ab8@canonical.com>
 <cf5213f9-0863-eba6-0e74-2f15577dba9d@gmail.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <a2e05368-42bb-b7bb-8b13-dc654d56bcbc@canonical.com>
Date:   Mon, 11 Jan 2021 14:11:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cf5213f9-0863-eba6-0e74-2f15577dba9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 11/01/2021 13:55, Maximilian Luz wrote:
> On 1/11/21 1:12 PM, Colin Ian King wrote:
>> Hi Maximilian,
>>
>> Static analysis of linux-next with Coverity has found several issues
>> with the following commit:
>>
>> commit 178f6ab77e617c984d6520b92e747075a12676ff
>> Author: Maximilian Luz <luzmaximilian@gmail.com>
>> Date:   Mon Dec 21 19:39:58 2020 +0100
>>
>>      platform/surface: Add Surface Aggregator user-space interface
>>
>> The analysis is as follows:
>>
>> 65static long ssam_cdev_request(struct ssam_cdev *cdev, unsigned long
>> arg)
>>   66{
>>   67        struct ssam_cdev_request __user *r;
>>   68        struct ssam_cdev_request rqst;
>>
>>     1. var_decl: Declaring variable spec without initializer.
>>
>>   69        struct ssam_request spec;
>>   70        struct ssam_response rsp;
>>   71        const void __user *plddata;
>>   72        void __user *rspdata;
>>   73        int status = 0, ret = 0, tmp;
>>   74
>>   75        r = (struct ssam_cdev_request __user *)arg;
>>   76        ret = copy_struct_from_user(&rqst, sizeof(rqst), r,
>> sizeof(*r));
>>
>>     2. Condition ret, taking true branch.
>>
>>   77        if (ret)
>>
>>     3. Jumping to label out.
>>
>>   78                goto out;
>>
>>   79
>>   80        plddata = u64_to_user_ptr(rqst.payload.data);
>>   81        rspdata = u64_to_user_ptr(rqst.response.data);
>>   82
>>   83        /* Setup basic request fields. */
>>   84        spec.target_category = rqst.target_category;
>>   85        spec.target_id = rqst.target_id;
>>   86        spec.command_id = rqst.command_id;
>>   87        spec.instance_id = rqst.instance_id;
>>   88        spec.flags = 0;
>>   89        spec.length = rqst.payload.length;
>>   90        spec.payload = NULL;
>>   91
>>   92        if (rqst.flags & SSAM_CDEV_REQUEST_HAS_RESPONSE)
>>   93                spec.flags |= SSAM_REQUEST_HAS_RESPONSE;
>>   94
>>   95        if (rqst.flags & SSAM_CDEV_REQUEST_UNSEQUENCED)
>>   96                spec.flags |= SSAM_REQUEST_UNSEQUENCED;
>>   97
>>   98        rsp.capacity = rqst.response.length;
>>   99        rsp.length = 0;
>> 100        rsp.pointer = NULL;
>> 101
>> 102        /* Get request payload from user-space. */
>> 103        if (spec.length) {
>> 104                if (!plddata) {
>> 105                        ret = -EINVAL;
>> 106                        goto out;
>> 107                }
>> 108
>>
>> CID: Untrusted allocation size (TAINTED_SCALAR)
>>     8. tainted_data: Passing tainted expression spec.length to kzalloc,
>> which uses it as an allocation size
>>
>> 109                spec.payload = kzalloc(spec.length, GFP_KERNEL);
> 
> I assume a constraint on the maximum length will fix this?

I believe so, it's unsigned so just an upper size check will be required
to silence this static analysis warning. Mind you, you may want a size
that is the full u16 max of 65535, so in that case the check is not
required.


> 
>> 110                if (!spec.payload) {
>> 111                        ret = -ENOMEM;
>> 112                        goto out;
>> 113                }
>> 114
>> 115                if (copy_from_user((void *)spec.payload, plddata,
>> spec.length)) {
>> 116                        ret = -EFAULT;
>> 117                        goto out;
>> 118                }
>> 119        }
>> 120
>> 121        /* Allocate response buffer. */
>> 122        if (rsp.capacity) {
>> 123                if (!rspdata) {
>> 124                        ret = -EINVAL;
>> 125                        goto out;
>> 126                }
>> 127
>>
>> CID: Untrusted allocation size (TAINTED_SCALAR)
>>     12. tainted_data: Passing tainted expression rsp.capacity to kzalloc,
>> which uses it as an allocation size
>>
>> 128                rsp.pointer = kzalloc(rsp.capacity, GFP_KERNEL);
>> 129                if (!rsp.pointer) {
>> 130                        ret = -ENOMEM;
>> 131                        goto out;
>> 132                }
>> 133        }
>> 134
>> 135        /* Perform request. */
>> 136        status = ssam_request_sync(cdev->ctrl, &spec, &rsp);
>> 137        if (status)
>> 138                goto out;
>> 139
>> 140        /* Copy response to user-space. */
>> 141        if (rsp.length && copy_to_user(rspdata, rsp.pointer,
>> rsp.length))
>> 142                ret = -EFAULT;
>> 143
>> 144out:
>> 145        /* Always try to set response-length and status. */
>>
>>     CID: Uninitialized pointer read (UNINIT)
>>     Using uninitialized value rsp.length
>>
>> 146        tmp = put_user(rsp.length, &r->response.length);
>>
>>     4. Condition tmp, taking true branch.
>>
>> 147        if (tmp)
>> 148                ret = tmp;
>> 149
>> 150        tmp = put_user(status, &r->status);
>>
>>     5. Condition tmp, taking true branch.
>>
>> 151        if (tmp)
>> 152                ret = tmp;
>> 153
>> 154        /* Cleanup. */
>>
>>     CID: Uninitialized pointer read (UNINIT)
>>     6. uninit_use_in_call: Using uninitialized value spec.payload when
>> calling kfree.
>>
>> 155        kfree(spec.payload);
>>
>>     CID: Uninitialized pointer read (UNINIT)
>>     uninit_use_in_call: Using uninitialized value rsp.pointer when
>> calling kfree
>>
>> 156        kfree(rsp.pointer);
> 
> Right, taking the first jump to out leaves rsp and spec uninitialized.
> I'll fix that.
> 
>> 157
>> 158        return ret;
>>
>> Colin
>>
> 
> Thank you for the analysis. I'll draft up two patches to address these
> issues.
> 
> Regards,
> Max

