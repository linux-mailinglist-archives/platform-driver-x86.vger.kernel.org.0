Return-Path: <platform-driver-x86+bounces-8133-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E769FE74F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Dec 2024 15:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F04FC161FA4
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Dec 2024 14:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D18C1AA1CC;
	Mon, 30 Dec 2024 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z09LjtPP"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D17175D29
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Dec 2024 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735570424; cv=none; b=JNMI2C3H1rhJQuzqAoonw9b6d4FliLnqJ0x57v89C7fZxvzzqveDfrrjPikRMnnzhcN+sUwayvK53XBN0AtA6iVC8rb86FLB2HB84yqJ4aa8z65yL59ytzd2Vjb6AX+MNbSWHUrFeyNJQEnIlXgarOBzUoex0u82kmTQn48H6Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735570424; c=relaxed/simple;
	bh=W37Lggz8imHGjBpI1SsAzsmQYeUl9jWSz5Pe4mJlq50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOJqGMSSKvZq06/yozQeeBNpzKhlu+hMYFw8GnWs6aLeOTAw1b1j4+luII5a6R69ZiigaoQsEMWmzjw9R5UHlfSUZiIy49X2pWqdjXzR7YkEV+EX/XJ8fKj/w+GHgcXKLTuqaAPcxX0eVNuWpHDq8XFyDxEpqYeZl8hGyvL0lIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z09LjtPP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU80Ywq011491
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Dec 2024 14:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgEekmYFMDshwcgT3oguYiDPpkM+o65LrsTzQwmC+ug=; b=Z09LjtPP5pKCXVBe
	oQS02eXPGSiZ/+TXG/vjhs9aVb3te1IPTiY3D+Qsw74PFgUwjD+HuqxJocQcJ/Bc
	IuuqDMTqN4iqC8N6e3sdzRGPQHBTFzJrk8pex26kKUoCC2uPs/Qvj7Rt3QPiPpAH
	7oyl5ImWsfGlSRUr2zzaakNeDrPOtWgDiyUMqYZKtV0/UFfdREj0HQhP39zz6KbZ
	lxOPULHlwj95CaTpZHR8diJiH11Ossa/XBl+PtZzvZi2HS33zjinMeKJ5fKLIBBL
	Q3AO8+E/WQMeih64p/enj7BZyujDVT0aDkTlwstIt2DEjr+6TqyKSFQ10gPyjRZB
	ThOTPg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uqmqguhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Dec 2024 14:53:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6da2abe1720so14224196d6.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Dec 2024 06:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735570420; x=1736175220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JgEekmYFMDshwcgT3oguYiDPpkM+o65LrsTzQwmC+ug=;
        b=GOmPUWDLunUajmah8By0vMaUxmu7wmEJkf/nEH2qXZmDs1gKS3PgI3kKy8uOrO+wnn
         zlG9qk99BnoR3CMkXRlCk/yiQAxg70+WKJ8WmMVKTqp8UXtG7O0wQNzH+0ULI5OkWVjk
         c1Q8smYmXYfJslG7uB+9N3bzRro+KhCkfjryu5s8nRgXKDTzrZlE9XnfIfBmQb0QHnXX
         Kbyt61VkUE8Ujzucm2jTq8QHMgQVPovQrtbFnPnCb3vpceWPqCBosHY+m+zeIH/vEZNr
         Ao8fAZPbbGWkohaUJ6H7du5/elHOuN0uwUNWfkkgpA7+SK4mXnQgMuhVZrln0AHIwhb/
         gt7w==
X-Forwarded-Encrypted: i=1; AJvYcCVdrospc3hm/mWDbGEGM8OXFvUhqSpJjY/VX57g9+RGILFkPv63uzYZX4+nTKb2ZV1Vc+KB/39GEfR+CXpMFi+ViKYR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2oLu65InNlpB2EqUlY+TnCOP96thRDspYQgpL8L6v89HzJV/r
	4JW7NMY4yWQkJqGGp0Ah/iUhDPxkkYGVD2MoIZUjstMOpao3n2Nh2KmKCmSnrpK70UhOTRNxSzB
	/AXi9Y+WnKg7+EWtA70c+trmHopSLibCvnaLt9cxtXx/7UJKQ89DnjtDLdzUMaF4VfR8gSE9V
X-Gm-Gg: ASbGncv6fyw3LTlDckocZbLE3wL7IP4DKMhyPRBdt08BaXg4zoFywV/Pxf2n32tFA1o
	vvORkv5RI0+7v4XTsWZ8r4x2HZG7AoqOhJjSWS2Y+9prrB+e1Opt52b/uQkhWobnIBMRH8I6bNE
	P1EzUKryRDe0fPzaPVtsLb3rXqNwXW9PQIFi1yjwUh6IXZdWYsCSOdtYVdPFcR62A8l+FqndsXt
	tm11sR/KsXFSQuCQRXb4nwp/f7obeleJUxjdYsAZHUo1tOQz3n5LGJlkDf72oJ+ucVdFdCwkc6v
	un0/Fg2IQASrS7Ucd4MJLNaoovRnuwmML1Q=
X-Received: by 2002:a05:6214:301c:b0:6d8:a258:68b1 with SMTP id 6a1803df08f44-6dd233ac590mr233481526d6.12.1735570419865;
        Mon, 30 Dec 2024 06:53:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTbxhF9vAAzYf/o6KtxWJrYBzMZkGqhONerL8NdyVP7cKd7S1W8v//UJIACU1wLeY3BGu1IA==
X-Received: by 2002:a05:6214:301c:b0:6d8:a258:68b1 with SMTP id 6a1803df08f44-6dd233ac590mr233481346d6.12.1735570419427;
        Mon, 30 Dec 2024 06:53:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894f7fsm1466927666b.46.2024.12.30.06.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:53:38 -0800 (PST)
Message-ID: <233e7a35-0ec5-4746-b758-684a0befd005@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:53:36 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: gaokun3: Add Embedded Controller
 node
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>
References: <20241227171353.404432-1-mitltlatltl@gmail.com>
 <20241227171353.404432-6-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241227171353.404432-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: du40WDuRCKu5zcsEgL8XLLWmIwQgCkPJ
X-Proofpoint-ORIG-GUID: du40WDuRCKu5zcsEgL8XLLWmIwQgCkPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300129

On 27.12.2024 6:13 PM, Pengyu Luo wrote:
> The Embedded Controller in the Huawei Matebook E Go (s8280xp)
> is accessible on &i2c15 and provides battery and adapter status,
> port orientation status, as well as HPD event notifications for
> two USB Type-C port, etc.
> 
> Add the EC to the device tree and describe the relationship among
> the type-c ports, orientation switches and the QMP combo PHY.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> index 09b95f89e..09ca9a560 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> @@ -28,6 +28,7 @@ / {
>  
>  	aliases {
>  		i2c4 = &i2c4;
> +		i2c15 = &i2c15;
>  		serial1 = &uart2;
>  	};
>  
> @@ -216,6 +217,40 @@ map1 {
>  		};
>  	};
>  
> +	usb0-sbu-mux {
> +			compatible = "pericom,pi3usb102", "gpio-sbu-mux";
> +
> +			select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&usb0_sbu_default>;

Please preserve this order:

property-n
property-names

> +
> +			orientation-switch;

This

> +
> +			port {
> +				usb0_sbu_mux: endpoint {
> +						remote-endpoint = <&ucsi0_sbu>;

And this section have incorrect whitespacing (one tab too many, make
sure you set your tab width to 8 spaces)

Same for usb1-sbu-mux

[...]

> +	i2c15_default: i2c15-default-state {
> +		pins = "gpio36", "gpio37";
> +		function = "qup15";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
>  	mode_pin_active: mode-pin-state {
>  		pins = "gpio26";
>  		function = "gpio";
> @@ -1301,6 +1426,20 @@ tx-pins {
>  		};
>  	};
>  
> +	usb0_sbu_default: usb0-sbu-state {
> +		pins = "gpio164";
> +		function = "gpio";
> +		bias-disable;
> +		drive-strength = <16>;
> +	};
> +
> +	usb1_sbu_default: usb1-sbu-state {
> +		pins = "gpio47";
> +		function = "gpio";
> +		bias-disable;
> +		drive-strength = <16>;
> +	};

Similarly, please keep drive-strength above bias for consistency

lgtm otherwise

Konrad

