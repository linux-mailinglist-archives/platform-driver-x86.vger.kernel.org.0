Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3430D66E475
	for <lists+platform-driver-x86@lfdr.de>; Tue, 17 Jan 2023 18:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbjAQRIm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 17 Jan 2023 12:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbjAQRI3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Jan 2023 12:08:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8DF2B0A2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2023 09:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673975261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hUAcxAV3HqtH+fwkD3kh+K//5e+iseTGh23h0lI9PEc=;
        b=i0i7wU1cTdt0bRbNuWfzuyJlI5u2bm3KYvnDIEYYJ4kdezyRQmySTPsZBA1JFjYmB1J4qd
        OJCwOCzAMnCP3WAc8rufqjmBzpjE5FKRS1yS1hZDCnq0brkJ99yscpK/xMgfOfmLZ/tb9m
        K9aHojyz0uOG3RCwX/3uPdSSQb3KcVY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-yi-ekfM8PVyUh-eRO5iWVQ-1; Tue, 17 Jan 2023 12:06:54 -0500
X-MC-Unique: yi-ekfM8PVyUh-eRO5iWVQ-1
Received: by mail-ej1-f70.google.com with SMTP id sc9-20020a1709078a0900b0086910fdf624so9640507ejc.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2023 09:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUAcxAV3HqtH+fwkD3kh+K//5e+iseTGh23h0lI9PEc=;
        b=YsUq2rB++vqBTQbit7BWFvo7+ZNVaVY02BUZBU4cp0EzYj8yLLcJLkhg3feuoeh0mh
         AUzLSWXXcFt9MbQo5fSTmSG53LHsAOiSY9rVrZ7uuWYjJwC31L63IVPIBOWndXzoUyhz
         BkiZCGKFKZTNNJEv6K88yh4fAUyga9Q6OFvlQlvGgWq7wC9Kw7Gfu6sMOqkXwLGGxzGS
         0TQJibTcWinxER4CIB6BZu3xWNMrCh1E+pS5mvFzpPmeRuWjfyi4Qe1ucv/ajTx601cr
         MB+JnPgknGt+mtlKkbpsaljatWAzwo3e0iYAVSXglh2OuvE3PshUSBqSDaoIvGI5diQf
         4MMA==
X-Gm-Message-State: AFqh2kojFADyHADWXWQvcFhdY/abbh6UWR5CSP5AFBqCzxcfyjyQe7V2
        YnZ/16ngQ9t8YbewjVgLgXKd2Cz0UY/0IF7gGaJAsNSpg3/AZO0EIOgLV7thbug4aTp5cw5aYrX
        vSDZhORVVZhr0KYHlH872Tu3aVnp+PAYC4g==
X-Received: by 2002:a17:907:c20d:b0:86f:50ff:ef28 with SMTP id ti13-20020a170907c20d00b0086f50ffef28mr9703850ejc.36.1673975186762;
        Tue, 17 Jan 2023 09:06:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/u0yKfhb3Yhgm1vCMeZEKp22J7UtBzSyfJ0A5b8v6RJWO6dLjSY9I4PQi/f1a9RoDIdlSZA==
X-Received: by 2002:a17:907:c20d:b0:86f:50ff:ef28 with SMTP id ti13-20020a170907c20d00b0086f50ffef28mr9703839ejc.36.1673975186558;
        Tue, 17 Jan 2023 09:06:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b0084c6581c16fsm13413881ejc.64.2023.01.17.09.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 09:06:22 -0800 (PST)
Message-ID: <c8aad30c-877d-7257-7b75-23a1c0dedb85@redhat.com>
Date:   Tue, 17 Jan 2023 18:06:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 2/5] Introduction of HP-BIOSCFG driver (2)
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20221202173616.180108-1-jorge.lopez2@hp.com>
 <20221202173616.180108-3-jorge.lopez2@hp.com>
 <974687b1-540b-48ee-517f-d5aeb960ef5d@redhat.com>
In-Reply-To: <974687b1-540b-48ee-517f-d5aeb960ef5d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 1/16/23 17:07, Hans de Goede wrote:
> Hi Jorge,
> 
> First of all some generic remarks which apply to all patches:
> 
> 1. Quite a few non local / non static functions have generic names like e.g.
> calculate_string_buffer().
> 
> If this code is build into the main kernel vmlinuz then these will
> all be part of a global namespace, leading to potential symbol
> collisions to avoid these please make the following 2 changes
> 
> i) Make functions which are only used in a single .c file static
>    e.g. wmi_error_and_message()
> ii) Prefix others with hp_bioscfg_, e.g. hp_bioscfg_calculate_string_buffer()
>    to avoid possible symbol clashes

One more generic remark. All the struct string_data, struct integer_data, etc.
structs have an attribute_name member. But except for some leftover code
filling (but never reading) that in spmobj-attributes.c there is no code using
that. Please remove the attribute_name member from all the string_ / integer_ /
enumeration_data, etc. structs.

Also some more issues in this patch which I noticed while looking at patch 3/5:

> +int get_integer_from_buffer(int **buffer, int *buffer_size, int *integer)
> +{
> +	int *ptr = PTR_ALIGN(*buffer, 4);

This may move the ptr, but if it does, then buffer_size should be
modified accordingly since you have just consumed some buffer-space
by moving the pointer.

So you will want to add something like this:

	int align_size = (char *)ptr - (char *)(*buffer);


> +
> +	/* Ensure there is enough space remaining to read the integer */
> +	if (*buffer_size < sizeof(int))
> +		return -EINVAL;

This check is not correct, because you are not taking the alignment
adjustment which I mentioned above into account instead this should be:

	if (*buffer_size < (sizeof(int) + align_size))
		return -EINVAL;



> +
> +	*integer = *(ptr++);
> +	*buffer = ptr;

And this:

> +	*buffer_size -= sizeof(int);

Should be:

	*buffer_size -= sizeof(int) + align_size;

> +
> +	return 0;
> +}
> +
> +int get_string_from_buffer(u16 **buffer, int *buffer_size, char **str)
> +{
> +	u16 *ptr = *buffer;
> +	u16 ptrlen;
> +
> +	u16 size;
> +	int i;
> +	char *output = NULL;
> +	int escape = 0;
> +

What if *buffer_size is 0 at this point already, now you have
just read past the end of the buffer.

> +	ptrlen = *(ptr++);
> +	size = ptrlen / 2;
> +
> +	/* Ensure there is enough space remaining to read and convert
> +	 * the string
> +	 */
> +	if (*buffer_size < (size *  sizeof(u16)))

Use " < ptrlen" here ?

> +		return -EINVAL;
> +
> +
> +	for (i = 0; i < size; i++)
> +		if (ptr[i] == '\\' || ptr[i] == '\r' || ptr[i] == '\n' || ptr[i] == '\t')
> +			escape++;
> +

There are a number of issues with the code below.

> +	size += escape;

This not only increases the allocated size, but also
causes the for (i = 0; i < size; i++) to loop over the
extra space allocated for escaping special chars, while
it also does:

		if (*ptr == '\\' || *ptr == '\r' || *ptr == '\n' || *ptr == '\t')
			output[i++] = '\\';

Which increases i, so in the end this will end up writing

size + esc times to output even though the size of output is
only size + 1.

so I think you simply want to put the + escape inside the
kcalloc like this:

	*str = kcalloc(size + escape + 1, sizeof(char), GFP_KERNEL);

And keep size at it was (instead of incrementing it with esc).
	
> +	*str = kcalloc(size + 1, sizeof(char), GFP_KERNEL);
> +	if (!*str)
> +		return -ENOMEM;
> +
> +	output = *str;
> +
> +	/*
> +	 * convert from UTF-16 unicode to ASCII
> +	 */
> +	utf16s_to_utf8s(ptr, ptrlen, UTF16_HOST_ENDIAN, output, size);

There are 4 issues with just this single line:

1. The inlen parameter of utf16s_to_utf8s is in wchar_t-s not in bytes,
   so you should pass size here, not ptrlen
2. The size of the destination buffer is simply the number of u16-s in
   the source string, but a single u16 may expand to a multi-byte UTF8 sequence
   so that might be too small.
3. In the for loop below you are completely overwriting the result of this
   conversion, so you might just as well not have made this call at all
4. You are not using the return value which may be different from size
   because of the multi-byte sequence expansion.

> +
> +	for (i = 0; i < size; i++) {
> +		if (*ptr == '\\' || *ptr == '\r' || *ptr == '\n' || *ptr == '\t')
> +			output[i++] = '\\';
> +
> +		if (*ptr == '\r')
> +			output[i] = 'r';
> +		else if (*ptr == '\n')
> +			output[i] = 'n';
> +		else if (*ptr == '\t')
> +			output[i] = 't';
> +		else if (*ptr == '"')
> +			output[i] = '\'';
> +		else
> +			output[i] = *ptr;
> +		ptr++;
> +	}

You are not properly 0 terminating the string here, since you have
kcalloc-ed the memory this will be fine (if we forget about the possible
buffer overruns when escaping). But it would be better to use a
regular malloc, avoiding needlessly clearing the mem and then explicitly
add the 0 termination here.

> +
> +	*buffer = ptr;
> +	*buffer_size -= size * sizeof(u16);

This is not taking into account the 2 bytes used by the size header,
those should also be subtracted.

> +	return size;
> +}


As for determining outsize, I notice that in all the call sites
of get_string_from_buffer() you are copying the returned string
to a fixed-size destination buffer, so instead of allocating it here,
you can just pass in that fixed size buffer right away, also
removig a needless malloc + strcpy + free in the process.

So all in all I think this function should look something like this
(untested):

int get_string_from_buffer(u8 **buffer, int *buffer_size, char *dst, int dst_size)
{
	u16 *src = (u16 *)(*buffer);
	int in, out, src_size, len;

	if (buffer_size < sizeof(u16))
		return -EINVAL;

	src_size = *src++;
	*buffer_size -= sizeof(u16)

	if (*buffer_size < src_size)
		return -EINVAL;

	/* convert size bytes -> u16 units */
	src_size /= sizeof(u16);

	in = 0;
	out = 0;
	while (in < src_size && out < dst_size) {
		len = 0;
		while (in + len < src_size && src[in + len] != '\\' && src[in + len] != '\r' && src[in + len] != '\n' && src[in + len] != '\t' && src[in + len] != '"')
			len++;

		if (len) {
			out += utf16s_to_utf8s(src + in, len, UTF16_HOST_ENDIAN, dst + out, dst_size - out);
			in += len;
			continue;
		}

		/* Special case convert " -> ' */
		if (src[in] == '"') {
			dst[out++] = '\'';
			in++;
			continue;
		}

		dst[out++] = '\\';
		if (out == dst_size)
			break;

		if (src[in] == '\\')
			dst[out++] = '\\';
		else if (src[in] == '\r')
			dst[out++] = 'r';
		else if (src[in] == '\n')
			dst[out++] = 'n';
		else if (src[in] == '\t')
			dst[out++] = 't';

		in++;
	}

	if (out == output_size) {
		pr_warn("UTF16 string too long, truncated\n");
		out--;
	}

	dst[out] = 0;

	*buffer += src_size * sizeof(u16);
	*buffer_size -= in * sizeof(u16);
	return 0;
}

Note I have also changed the buffer function parameter type from u16 ** to u8**
so that callers don't need to cast it.

Regards,

Hans



I'll continue reviewing this patch-set later, not sure yet when ...


