Return-Path: <platform-driver-x86+bounces-14020-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C92B48532
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Sep 2025 09:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6273317BAE8
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Sep 2025 07:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F62C2E975E;
	Mon,  8 Sep 2025 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eozoCN0Q"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19282E7BCC
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Sep 2025 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316500; cv=none; b=a3XI8v5w0qYOJ/GAKllORuokRjDpHl//ZTR8EPLG8YMB963J1F1vrTUKENtfc9r8Sy3J6NhzWLHCUFnQENLYzB3juwkBYx7SKwL14aZUZs6Rx9RXKmyZC9DE+r/Q7grJpGmUnsh3WXOLhpGwA4HEM8QVTw+j8corOCEL7b/733g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316500; c=relaxed/simple;
	bh=qbzdEVIeV69/mmAKbuz9lop8NzAL+wErgvl0Fl2CZ2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o40MOCIIQbx+k5ffzEZ8Ca4dJIxiqcPtW+5B43D/KVDKTKzOVRzBppsjxAEBRTa7SqPfnq3ACGS7qisfnDi/nWC9RU3mp2PQsBA+2RUJBw61z09g59wWPQFpu7hk7ciVyJbKaxidNpHcrMHvPPEiT1vM8cSFum0XPfcmgk5syFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eozoCN0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LiXKd011604
	for <platform-driver-x86@vger.kernel.org>; Mon, 8 Sep 2025 07:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERLf/ncv7o04qbtewCDq3K9ys9j1usVy2WEVFXE0/HM=; b=eozoCN0QzM4MqTN0
	oAUlUWFjDBGVTzSNld5ige4n+UtQK7ecqJS+f11o3jTUqtOliXC2DwWmNpKIjfoj
	nn+mRfGiqv3B9bekNuzLXtV4EU3a+FwNIXL8dK8EFjjSYnXmYZWDBZdTkqOvZWE+
	ObfJ5P0AXapQxq4fkh2QvRYFQAp+Ipwh/dtyhDXVxCZil9c/TYr19Zq8xD15D84B
	CffZ7ZSl/PzaUgugo+CDWZ9aE4VfrzK7XHa7E0yHz/jxtIufe0janLjiZ6Xql5Vq
	lUVFRkqU2LqX0lvKGCrGPcNeA/tD0HJUmcjz9WVaJUICgWPVOqpSd+gPicvFhR8Q
	OCvmWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws3q41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 08 Sep 2025 07:28:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f92a6936so8519931cf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Sep 2025 00:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316497; x=1757921297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERLf/ncv7o04qbtewCDq3K9ys9j1usVy2WEVFXE0/HM=;
        b=OVlDNdQ56P7P+fsGWHZWvdgtLfwJ9jTJ7l5A2Qam/72okl4vzRvSZ4WKxMnEzick5w
         2v/54RoFkElZtobQGk4945cSVNtJ3OoOaJJjCrmplchcacE/Dn3pifxwYZxrJkl67621
         UbfDHkBml5Qw8D5yLuAo7kawo32bZt8gtHm2aNDPA1A4j+/I1ZZEB1OFQGtApINwXJ2S
         25W8AgKnubLCZFR2QV9xx7ChJvgbXpwT89fdiGFFeOLjByeaDiqLzs0O+AAtr2JBHJKH
         ZWRQRGbUqh2iM6Ilsd+iQfrWU+OS/W+4jmtJek/gKYIU0+P8ZumffwJ4HCxfXQ5jxS7O
         tRmg==
X-Forwarded-Encrypted: i=1; AJvYcCUFGGgCdjvjYqaddYRHxBZmmyZ/m0580tKkXEdOj2KWNpJakXfgyZc8sra8eimF29ZV89bLgfwl6niJjypiJqZDEEGt@vger.kernel.org
X-Gm-Message-State: AOJu0YyClvxC3LKI3pdkcv8Y8NmeGgMwrCFNnQCDxnitoIuRviUlvEjh
	H5h7w2HvoKbW4MZxBV2TwEJ9yT+jIEChsv+VMShgKc3K9wA3L42wY3KVxDZduK+kXDpEFLSh+SK
	O4l1rWdo8mkMuiAFZA+8qNlt/KA0QDvGo0ezjxi85HHIWGbK0vo93i/Ni4wpiwe7RLTykoFp8kT
	3N
X-Gm-Gg: ASbGncspbSrgYwaWrQJkReIIKF5pCDclQR20IVmi5JoGFVa0fT4Bd2JVtotWZEuQjD1
	oVOamTPJjuLbKfJ+KSv69tS/CmRERHdSIf46i157jBTtblvNXVD0XOPt1GG+VF7iR76P2udB7oO
	bhHY3svY4Nf2Ord0W7nf2f0idaLPtYd2rKptccYO0WfIEqPl7kNbjspLvDcO/VxbFRMihnJnzK7
	i7CCuSAPFfdpLf0KtzU6BFPAXZytsvcOGwSYW9qqR8+qK8Kt0YIWybP8B6aDj3vUFxSDSvDdeGn
	s7iEohx7zz9wk9iyHLleHX6nfjY19UO/4UjkblOvZU1fIGm/DSPPwJHEAfgCMtUEcnHaC1VsdpE
	O8StWpfzC6KVduYLPQJ1Ylg==
X-Received: by 2002:ac8:5e09:0:b0:4b5:f68b:86a0 with SMTP id d75a77b69052e-4b5f83aa98fmr49543321cf.5.1757316496581;
        Mon, 08 Sep 2025 00:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGAgl00GaYehU+zuRCAg7V4DAYv8tb/FWR4y4Uvtjs+MAr65Vw5x+XLudGsUA/GY92sb/oiQ==
X-Received: by 2002:ac8:5e09:0:b0:4b5:f68b:86a0 with SMTP id d75a77b69052e-4b5f83aa98fmr49543111cf.5.1757316496019;
        Mon, 08 Sep 2025 00:28:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2167090466b.12.2025.09.08.00.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:28:15 -0700 (PDT)
Message-ID: <f16a858d-fb41-4cc9-a138-7bfe5ee2800f@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 09:28:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] platform: arm64: thinkpad-t14s-ec: new driver
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250906-thinkpad-t14s-ec-v3-0-3ce6ec21ae89@collabora.com>
 <20250906-thinkpad-t14s-ec-v3-2-3ce6ec21ae89@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250906-thinkpad-t14s-ec-v3-2-3ce6ec21ae89@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ztMUGvtlGc3bBkT6W4p6t7wIJXairZJB
X-Proofpoint-GUID: ztMUGvtlGc3bBkT6W4p6t7wIJXairZJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX7Htb8PVL2Qgh
 VJlXrty3ENmmnP3MiqYWgj3rQQpolMiTIUNY7O42z5C0Tu7k00Hdw4rcyjt2GNxXkgI6sTNLgSz
 S90HVdWiqieBgs2rV9an5ogB5hp9+JNWIw0HoDegcLF3oANblo1eCHY6UxWlHN1SCpXguD96i+K
 h7qeuv4mvVSBYcPQMFliQ4X+jQCL6h8GD5lgIcCJzXdcpV/ns0R8PrAavkm5ECAzPWsLzFBViDG
 yOUdfhXiKpsABwxVuRuWvE5gkFYXW/kUXxnJ4PkixQc+UmILZe6J0MbWfHLWjfHDk+ZJjtPdhhF
 mTTMVVSQMfTnjs8aAWGwjRlYnyQet8KcKBgQ7PK7RqpZlTz5bjT7dwww4EgkteJ2IMPOB/cZ3n1
 T7XhcGiY
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68be8592 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=l0D_vPNz536yW1AJoQEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/6/25 3:12 AM, Sebastian Reichel wrote:
> Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which is in
> theory compatible with ThinkPad ACPI. On Linux the system is booted with
> device tree, which is not supported by the ThinkPad ACPI driver
> (drivers/platform/x86/lenovo/thinkpad_acpi.c). Also most of the hardware
> compatibility is handled via ACPI tables, which are obviously not used
> when booting via device tree. Thus adding DT compatibility to the
> existing driver is not worth it as there is almost no code sharing.

[...]


couple nits, feel free to ignore

> +#define T14S_EC_EVT_NONE			0x00
> +#define T14S_EC_EVT_KEY_FN_4			0x13
> +#define T14S_EC_EVT_KEY_FN_F7			0x16
> +#define T14S_EC_EVT_KEY_FN_SPACE		0x1F
> +#define T14S_EC_EVT_KEY_TP_DOUBLE_TAP		0x20
> +#define T14S_EC_EVT_AC_CONNECTED		0x26
> +#define T14S_EC_EVT_AC_DISCONNECTED		0x27
> +#define T14S_EC_EVT_KEY_POWER			0x28
> +#define T14S_EC_EVT_LID_OPEN			0x2A
> +#define T14S_EC_EVT_LID_CLOSED			0x2B
> +#define T14S_EC_EVT_KEY_FN_F12			0x62
> +#define T14S_EC_EVT_KEY_FN_TAB			0x63
> +#define T14S_EC_EVT_KEY_FN_F8			0x64
> +#define T14S_EC_EVT_KEY_FN_F10			0x65
> +#define T14S_EC_EVT_KEY_FN_F4			0x6A
> +#define T14S_EC_EVT_KEY_FN_D			0x6B
> +#define T14S_EC_EVT_KEY_FN_T			0x6C
> +#define T14S_EC_EVT_KEY_FN_H			0x6D
> +#define T14S_EC_EVT_KEY_FN_M			0x6E
> +#define T14S_EC_EVT_KEY_FN_L			0x6F
> +#define T14S_EC_EVT_KEY_FN_RIGHT_SHIFT		0x71
> +#define T14S_EC_EVT_KEY_FN_ESC			0x74
> +#define T14S_EC_EVT_KEY_FN_N			0x79
> +#define T14S_EC_EVT_KEY_FN_F11			0x7A
> +#define T14S_EC_EVT_KEY_FN_G			0x7E

Please use lowercase hex consistently across the file

[...]

> +enum thinkpad_t14s_ec_led_status_t {
> +	T14S_EC_LED_OFF =	0x00,
> +	T14S_EC_LED_ON =	0x80,
> +	T14S_EC_LED_BLINK =	0xc0,

These conveniently translate to: BIT(7) and BIT(6)|BIT(7), meaning
BIT(7) could mean "ON" and BIT(6) could mean "pulse" (can you pulse
a disabled LED? arcane secrets..)

[...]

> +	if (brightness == LED_OFF)
> +		new_state = T14S_EC_LED_OFF;
> +	else if (led->cache != T14S_EC_LED_BLINK)

==s are easier to logically follow than !=, but this is totally
potayto/potahto

[...]

> +static int thinkpad_t14s_led_blink_set(struct led_classdev *led_cdev,
> +				       unsigned long *delay_on,
> +				       unsigned long *delay_off)
> +{
> +	struct thinkpad_t14s_ec_led_classdev *led = container_of(led_cdev,
> +			struct thinkpad_t14s_ec_led_classdev, led_classdev);
> +
> +	if (*delay_on == 0 && *delay_off == 0) {
> +		/* We can choose the blink rate */

"can't"?

Needless to say, amazing work on piecing all this together, Sebastian!

Konrad

