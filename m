Return-Path: <platform-driver-x86+bounces-3504-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ECC8CFE8E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 May 2024 13:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E97BD1F21473
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 May 2024 11:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E5A13BC3A;
	Mon, 27 May 2024 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/CGlSq2"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC73613B5B9
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716807854; cv=none; b=h1UBl0do22ZwE8axON+EOpG9NjpEZ/8rvjen8otMbqF2dE0lCy6Y/ONbpQVwOZSDCLhNq7wJ5x9bqGK28MAr1RyhEmgkiGPu7nZ1eHpcoUrcuDIBGm299zsdTe+LyD+fR0utyopcLOaLmLOo9LDe5RP5oYYtigdx2ShpVpIMJJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716807854; c=relaxed/simple;
	bh=yuX+wFP7fMTWfpbVBFssj2MGbALckEkCiS/YZH6S6Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVz2ojR6lFD8p71mLC7v5ik0X1SHl0pK3nHHYxqAfR0GZrxKFN4XkbqQLYUDhQnBkvRAE2hg90jqd32hoQE3UPU+7fK1GGkkfSqsRJ9NSr8yCp4s+xd4rAYF7CaOn7DHhStPy0XHoK4vhWdC223lr+vVImnGmeL+ZDZoOXPNNcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/CGlSq2; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e95a1d5ee2so59627311fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 04:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716807850; x=1717412650; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ikk0MTqK6vpn61sKB0R5HgfSO+QOYsjG/QHNlCN938c=;
        b=S/CGlSq2Gu6GLkF+nsvyeOZcm9yVP7NU2T4WfSBq9q3aKcAoDbP2rwnBYr5DRq9jxY
         BGRITp02iYr/u8Kc2nBjUCy7Dg8VcHKjamwfktw8Whu+/KsYOhZeZ5ourKfZ8Kbt6B/U
         R17yhjtP6inoyfyu9KQkxYDuUp1ygvkNMpT5KKarvN9K3+lzf1EAEZWHGfFJIU1PbT0/
         etHady4QiTKtBoxtiIcqTDzRrWiAkGHkCLkTKUFv+dQiozwz50Zc+EYGF7W7a9VN0DAN
         mRdEFCe8Uzpjay2SwUx+hfq1V8yUf2L5BK5/i2ihehEWJB+YVJDCc9C2HlDwbJQZPKc1
         qK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716807850; x=1717412650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ikk0MTqK6vpn61sKB0R5HgfSO+QOYsjG/QHNlCN938c=;
        b=DYsWx4h66iaKHt7aP04GPrC47FXa6SPQGMoRpzBoA9LLEGJlEwQ44rgqJpIZ0wF6nr
         n6iKvv+dJJT3kmilKccChcyhUCh4VaaBkzYh2Ix8CL7Iz6WABmAPDpZMMa73rXYcD6FP
         NkhcNeEJPJuyhsqzVyOmXx80SdasdLM+NzW5rgiCqtiWtfDcjT6+MAju1H14p6q1dMhV
         KVnqf//SixA58NtMEJ3ua/M0Wjcs0fcsO29SwjJR1Ow5N3kMPrOBoS0S3xH+qM7idWuO
         0xYRBnoijDdvCfHWsymV6LT/rQ1vt38yoHHudvVWsaDJgseZRobq4X8Cb5gR2gytpem7
         Ygaw==
X-Forwarded-Encrypted: i=1; AJvYcCWxD5wznQAtsL7HCMvOtgav+OAHnbaaTz8QE5F3jlNw8QR35ZIuqAtB+c9AMzsvLlJWyjQHRgGq8MqKizboH6Y5wDAIJQ8xJu3F5WQLOLcY/55m6A==
X-Gm-Message-State: AOJu0YyzknV5xt/dQTKPwYNFIFg9Rn3bx3qSS8JibqicTggPiEGvVmAL
	9KUNWT6zWFROqJnhZ2LASCH6gmsV8RH93f0FRAN2s9ujQzAHlFdAb/g55+KZYIo=
X-Google-Smtp-Source: AGHT+IGElvPB6h5Dsq7+RN2HrAz4iulgHd8bLdU9hxq/60HzPeIZmMqN72sL2LTUtDSF+/HXazY/+g==
X-Received: by 2002:a2e:9899:0:b0:2e5:685a:85b5 with SMTP id 38308e7fff4ca-2e95b041622mr74590631fa.1.1716807849899;
        Mon, 27 May 2024 04:04:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcd7bbcsm19087591fa.32.2024.05.27.04.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 04:04:09 -0700 (PDT)
Date: Mon, 27 May 2024 14:04:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: power: supply: Add Lenovo Yoga C630
 EC
Message-ID: <yy6llkseusmg2rzyt2iytb6pjelqycsfgawt2g24gccujqkxxb@yzdari2gq6rt>
References: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
 <20240527-yoga-ec-driver-v3-1-327a9851dad5@linaro.org>
 <f05953c74f2bf58256306eb3d554ae0b@trvn.ru>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f05953c74f2bf58256306eb3d554ae0b@trvn.ru>

On Mon, May 27, 2024 at 03:21:27PM +0500, Nikita Travkin wrote:
> Dmitry Baryshkov писал(а) 27.05.2024 15:03:
> > From: Bjorn Andersson <andersson@kernel.org>
> > 
> > Add binding for the Embedded Controller found in the Qualcomm
> > Snapdragon-based Lenovo Yoga C630.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/power/supply/lenovo,yoga-c630-ec.yaml | 83 ++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml b/Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml
> > new file mode 100644
> > index 000000000000..52a302850743
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/supply/lenovo,yoga-c630-ec.yaml#
> 
> Should this binding join aspire1 one in bindings/platform ?

Good idea

> 
> Nikita
> 
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lenovo Yoga C630 Embedded Controller.
> > +
> > +maintainers:
> > +  - Bjorn Andersson <andersson@kernel.org>
> > +
> > +description:
> > +  The Qualcomm Snapdragon-based Lenovo Yoga C630 has an Embedded Controller
> > +  (EC) which handles things such as battery and USB Type-C. This binding
> > +  describes the interface, on an I2C bus, to this EC.
> > +
> > +properties:
> > +  compatible:
> > +    const: lenovo,yoga-c630-ec
> > +
> > +  reg:
> > +    const: 0x70
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  '^connector@[01]$':
> > +    $ref: /schemas/connector/usb-connector.yaml#
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |+
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    i2c1 {
> > +        clock-frequency = <400000>;
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        embedded-controller@70 {
> > +            compatible = "lenovo,yoga-c630-ec";
> > +            reg = <0x70>;
> > +
> > +            interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            connector@0 {
> > +                compatible = "usb-c-connector";
> > +                reg = <0>;
> > +                power-role = "source";
> > +                data-role = "host";
> > +            };
> > +
> > +            connector@1 {
> > +                compatible = "usb-c-connector";
> > +                reg = <1>;
> > +                power-role = "source";
> > +                data-role = "host";
> > +            };
> > +        };
> > +    };
> > +...

-- 
With best wishes
Dmitry

