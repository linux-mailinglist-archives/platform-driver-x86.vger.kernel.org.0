Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECA85F8426
	for <lists+platform-driver-x86@lfdr.de>; Sat,  8 Oct 2022 09:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiJHHvM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 8 Oct 2022 03:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJHHvL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 Oct 2022 03:51:11 -0400
X-Greylist: delayed 449 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 08 Oct 2022 00:51:08 PDT
Received: from cstnet.cn (smtp85.cstnet.cn [159.226.251.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD534183BB;
        Sat,  8 Oct 2022 00:51:08 -0700 (PDT)
Received: from sunying$nj.iscas.ac.cn ( [96.47.239.249] ) by
 ajax-webmail-APP-13 (Coremail) ; Sat, 8 Oct 2022 15:43:36 +0800 (GMT+08:00)
X-Originating-IP: [96.47.239.249]
Date:   Sat, 8 Oct 2022 15:43:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5a2Z5rui?= <sunying@nj.iscas.ac.cn>
To:     platform-driver-x86@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Should the "CONFIG_COMMON_CLK" configuration item be turned on by
 default in Linux/x86 6.0.0?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220622(41e5976f)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2b6514ef.3a9bc.183b68caf53.Coremail.sunying@nj.iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: twCowAD3MZspKkFjzJgFAA--.56863W
X-CM-SenderInfo: 5vxq5xdqj60y4olvutnvoduhdfq/1tbiAw8NAWNA4wCx6gAAsb
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGksCkkgbm90aWNlZCB0aGF0IGluIHRoZSByZWNlbnQgbmV3IHZlcnNpb24gb2YgTGludXgveDg2
IDYuMCwgdGhlIGNvbmZpZ3VyYXRpb24gaXRlbSAiQ09ORklHX0NPTU1PTl9DTEsiIGlzIHR1cm5l
ZCBvZmYgYnkgZGVmYXVsdCwgd2hpbGUgaXQgd2FzIHVzdWFsbHkgdHVybmVkIG9uIGluIHByZXZp
b3VzIHZlcnNpb25zLCBpcyB0aGVyZSBhbnkgcGFydGljdWxhciByZWFzb24gZm9yIHRoaXM/IE9y
IGhhcyBpdCBiZWVuIGZvcmdvdHRlbj8KClRoYW5rcyEKCg==
