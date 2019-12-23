Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 234E7129417
	for <lists+platform-driver-x86@lfdr.de>; Mon, 23 Dec 2019 11:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfLWKRQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 23 Dec 2019 05:17:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59743 "EHLO eggs.gnu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbfLWKRQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Dec 2019 05:17:16 -0500
Received: from fencepost.gnu.org ([2001:470:142:3::e]:54529)
        by eggs.gnu.org with esmtp (Exim 4.71)
        (envelope-from <ebrahim@gnu.org>)
        id 1ijKm2-0005zu-O3
        for platform-driver-x86@vger.kernel.org; Mon, 23 Dec 2019 05:17:14 -0500
Received: from ip124.ip-151-80-200.eu ([151.80.200.124]:34884 helo=[10.8.0.97])
        by fencepost.gnu.org with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
        (Exim 4.82)
        (envelope-from <ebrahim@gnu.org>)
        id 1ijKm2-00032a-5z
        for platform-driver-x86@vger.kernel.org; Mon, 23 Dec 2019 05:17:14 -0500
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH] drm/i915: Fix enable OA report logic
From:   Ebrahim Byagowi <ebrahim@gnu.org>
Message-ID: <d24e431a-a5ca-6bb0-812c-bb368ee64876@gnu.org>
Date:   Mon, 23 Dec 2019 13:47:10 +0330
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Clang raises

  drivers/gpu/drm/i915/i915_perf.c:2474:50: warning: operator '?:' has lower precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-parentheses]
                             !(stream->sample_flags & SAMPLE_OA_REPORT) ?
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
  drivers/gpu/drm/i915/i915_perf.c:2474:50: note: place parentheses around the '|' expression to silence this warning
                             !(stream->sample_flags & SAMPLE_OA_REPORT) ?
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
  drivers/gpu/drm/i915/i915_perf.c:2474:50: note: place parentheses around the '?:' expression to evaluate it first
                             !(stream->sample_flags & SAMPLE_OA_REPORT) ?
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^

with -Wbitwise-conditional-parentheses and apparently is right
as '|' is evaluated before '?:' which doesn't seem to be the intention
here so let's put parentheses in the right place to fix it.

Signed-off-by: Ebrahim Byagowi <ebrahim@gnu.org>
---
 drivers/gpu/drm/i915/i915_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 2ae14bc14931..db963f7c2e2e 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2471,9 +2471,9 @@ static int gen12_enable_metric_set(struct i915_perf_stream *stream)
 			    * If the user didn't require OA reports, instruct the
 			    * hardware not to emit ctx switch reports.
 			    */
-			   !(stream->sample_flags & SAMPLE_OA_REPORT) ?
-			   _MASKED_BIT_ENABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS) :
-			   _MASKED_BIT_DISABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS));
+			   (!(stream->sample_flags & SAMPLE_OA_REPORT) ?
+			    _MASKED_BIT_ENABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS) :
+			    _MASKED_BIT_DISABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS)));
 
 	intel_uncore_write(uncore, GEN12_OAG_OAGLBCTXCTRL, periodic ?
 			   (GEN12_OAG_OAGLBCTXCTRL_COUNTER_RESUME |
-- 
2.24.0

