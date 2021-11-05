Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF0F445F33
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Nov 2021 05:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhKEEuI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Nov 2021 00:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbhKEEuI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 00:50:08 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A8CC061714
        for <platform-driver-x86@vger.kernel.org>; Thu,  4 Nov 2021 21:47:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j9so7437703pgh.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Nov 2021 21:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=o/wF/V9TAVPEMQT2oLx1JVaew2djn3pZBY/upXLYuzc=;
        b=elDk7egNDuEGnzO/m4ttkPeIxzPFgRxZYGyU0giXQ9gGkSViXIZ9tPyrHfjNNlPiVI
         OIraDV1ZKY3ijf0FnIeVNOo5pB90jYLA9YzQztAIb+zxRqd24ual5w/n1bkEtLXh+H4Z
         3/L54mIdtxwZj0XPET6slNHQo70WwZrstmPp24z3XJiHH6k21Egkf0g3lZkQSMvetIIK
         F8SjuqVfMEXn8qqZf6K9EEtBxoC9LcSl3D5GHqqCDuW0/yG8P81hTqpyDjKIoHFSmqUV
         oRKqjx0CjG30l8YKU6WCbJPg+OTIfLyk2d3ZIIrVYQ3SoTs+FUu+KZFVmhdRs/vtRufA
         bGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=o/wF/V9TAVPEMQT2oLx1JVaew2djn3pZBY/upXLYuzc=;
        b=uMRwhjvm81lvVobtYR0xaunZI/a2t/1OEujhHI3C4zBvy7WTGu0ngyqc4TZ5Kc2znX
         u4eMUJydFPQs5NrzThylEwV7K0E9yadfhP9APOTvfgI/D6az794OCBio1VLkeJlpQ08c
         dZXnQrMhm2wOnB0q7bawunCm9y9InWZk7iL6ct14b6wD3YMceoaRIoZ6gSbUnYfjM+7S
         h5zhKA/fKqNGriR69vjEBQUYbEd3+uwv0EgMPZE2UdakxsnqEybzOD/mjfkQrI2K3qgx
         FDwec07a2viGG5E+YByCM7IDeb/UP3ymvMZwA0Ip7K0XJBbRkO6Rfk6rdQGWA9E+MyJN
         gQ7g==
X-Gm-Message-State: AOAM530B2HTo/dbHpquJUpHJKkpDGDGAHF2g4BAojfpeNz/HdM7ElLmm
        1gVI866ds+KIU2rFdZ/pGMy0OLv/HgDPB3zqXKQ=
X-Google-Smtp-Source: ABdhPJzdEoDvclbNUX6pqbT041ZAwV7IvKPO1Tu5UjuyaeWmKL0CA2c+7Z9f/ImJv/OWCej6g+01gGVKrdXj9XZ1txg=
X-Received: by 2002:a63:5614:: with SMTP id k20mr4616618pgb.252.1636087648833;
 Thu, 04 Nov 2021 21:47:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:8c86:0:0:0:0 with HTTP; Thu, 4 Nov 2021 21:47:28
 -0700 (PDT)
Reply-To: mstheresaheidi8@gmail.com
From:   Mrs Theresa Heidi <amandasamira39@gmail.com>
Date:   Fri, 5 Nov 2021 04:47:28 +0000
Message-ID: <CAA2j17D47FREoE0TxcZm__n4uHJTgUXzPV40iy6cbPhO+yQ9ZQ@mail.gmail.com>
Subject: =?UTF-8?B?55eF6Zmi44GL44KJ44Gu57eK5oCl44Gu5Yqp44GR77yB?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

6Kaq5oSb44Gq44KL5oSb44GZ44KL5Lq644CBDQoNCuaFiOWWhOWvhOS7mOOBk+OBruaJi+e0meOB
jOOBguOBquOBn+OBq+mpmuOBjeOBqOOBl+OBpuadpeOCi+OBi+OCguOBl+OCjOOBquOBhOOBk+OB
qOOBr+eiuuOBi+OBp+OBmeOAgeazqOaEj+a3seOBj+iqreOCk+OBp+OBj+OBoOOBleOBhOOAguen
geOBr+OBguOBquOBn+OBruaPtOWKqeOCkuW/heimgeOBqOOBl+OBpuOBhOOCi+mWk+OBq+engeea
hOOBquaknOe0ouOCkumAmuOBl+OBpuOBguOBquOBn+OBrumbu+WtkOODoeODvOODq+OBrumAo+e1
oeWFiOOBq+WHuuOBj+OCj+OBl+OBvuOBl+OBn+OAguengeOBr+W/g+OBi+OCieaCsuOBl+OBv+OC
kui+vOOCgeOBpuOBk+OBruODoeODvOODq+OCkuabuOOBhOOBpuOBhOOBvuOBmeOAguOCpOODs+OC
v+ODvOODjeODg+ODiOOBjOS+neeEtuOBqOOBl+OBpuacgOmAn+OBruOCs+ODn+ODpeODi+OCseOD
vOOCt+ODp+ODs+aJi+auteOBp+OBguOCi+OBn+OCgeOAgeOCpOODs+OCv+ODvOODjeODg+ODiOOC
kuS7i+OBl+OBpuOBguOBquOBn+OBq+mAo+e1oeOBmeOCi+OBk+OBqOOCkumBuOaKnuOBl+OBvuOB
l+OBn+OAgg0KDQrnp4Hjga7lkI3liY3jga/jg4bjg6zjgrXjg7vjg4/jgqTjgrjlpKvkurrjgafj
gZnnp4Hjga/nj77lnKjjgIHnp4HjgYw2Muats+OBruiCuueZjOOBrue1kOaenOOBqOOBl+OBpuOC
pOOCueODqeOCqOODq+OBruengeeri+eXhemZouOBq+WFpemZouOBl+OBpuOBiuOCiuOAgeengeOB
r+e0hDTlubTliY3jgIHlpKvjga7mrbvlvozjgZnjgZDjgavogrrjgYzjgpPjgajoqLrmlq3jgZXj
gozjgb7jgZfjgZ/jgILnp4Hjga/ogrrjga7nmYzjga7msrvnmYLjgpLlj5fjgZHjgabjgYTjgovj
gZPjgZPjga7nl4XpmaLjgafnp4Hjga7jg6njg4Pjg5fjg4jjg4Pjg5fjgajkuIDnt5LjgavjgYTj
gb7jgZnjgILnp4Hjga/kuqHjgY3lpKvjgYvjgonlj5fjgZHntpnjgYTjgaDos4fph5HjgpLmjIHj
gaPjgabjgYTjgb7jgZnjgYzjgIHlkIjoqIjjga8yNTDkuIfjg4njg6soMiw1MDAsMDAwLDAwMOex
s+ODieODqynjgafjgZnjgILku4rjgIHnp4Hjga/np4Hjga7kurrnlJ/jga7mnIDlvozjga7ml6Xj
gavov5HjgaXjgYTjgabjgYTjgovjgZPjgajjga/mmI7jgonjgYvjgafjgYLjgorjgIHnp4Hjga/j
goLjgYbjgZPjga7jgYrph5HjgpLlv4XopoHjgajjgZfjgarjgYTjgajmgJ3jgYTjgb7jgZnjgILn
p4Hjga7ljLvogIXjga/jgIHnp4HjgYzogrrnmYzjga7llY/poYzjga7jgZ/jgoHjgasx5bm06ZaT
57aa44GL44Gq44GE44GT44Go44KS56eB44Gr55CG6Kej44GV44Gb44G+44GX44Gf44CCDQoNCuOB
k+OBruOBiumHkeOBr+OBvuOBoOWkluWbveOBrumKgOihjOOBq+OBguOCiuOAgee1jOWWtuiAheOB
r+engeOCkuacrOW9k+OBruaJgOacieiAheOBqOOBl+OBpuOAgeOBiumHkeOCkuWPl+OBkeWPluOC
i+OBn+OCgeOBq+WJjeOBq+WHuuOBpuadpeOCi+OBi+OAgeeXheawl+OBruOBn+OCgeOBq+adpeOC
i+OBk+OBqOOBjOOBp+OBjeOBquOBhOOBruOBp+engeOBq+S7o+OCj+OBo+OBpuiqsOOBi+OBq+OB
neOCjOOCkuWPl+OBkeWPluOCi+OBn+OCgeOBruaJv+iqjeabuOOCkueZuuihjOOBmeOCi+OCiOOB
huOBq+abuOOBhOOBn+OAgumKgOihjOOBruihjOWLleOBq+WkseaVl+OBmeOCi+OBqOOAgeOBneOC
jOOCkumVt+OBj+e2reaMgeOBl+OBn+OBn+OCgeOBq+izh+mHkeOBjOayoeWPjuOBleOCjOOCi+WP
r+iDveaAp+OBjOOBguOCiuOBvuOBmeOAgg0KDQrnp4HjgYzlpJblm73jga7pioDooYzjgYvjgonj
gZPjga7jgYrph5HjgpLlvJXjgY3lh7rjgZnjga7jgpLmiYvkvJ3jgaPjgabjgY/jgozjgovjgarj
gonjgIHjgYLjgarjgZ/jgavpgKPntaHjgZnjgovjgZPjgajjgavjgZfjgb7jgZfjgZ/jgILjgZ3j
gZfjgabjgIHmhYjlloTmtLvli5Xjga7jgZ/jgoHjga7os4fph5HjgpLkvb/jgaPjgabjgIHmgbXj
gb7jgozjgarjgYTkurrjgIXjgpLliqnjgZHjgIHnpL7kvJrjga5Db3ZpZC0xOeODkeODs+ODh+OD
n+ODg+OCr+OBqOaIpuOBhuOBk+OBqOOCguOBp+OBjeOBvuOBmeOAguengeOBq+S9leOBi+OBjOi1
t+OBk+OCi+WJjeOBq+OAgeOBk+OCjOOCieOBruS/oeiol+WfuumHkeOCkuiqoOWun+OBq+aJseOB
o+OBpuOBu+OBl+OBhOOAguOBk+OCjOOBr+ebl+OBvuOCjOOBn+OBiumHkeOBp+OBr+OBquOBj+OA
geWujOWFqOOBquazleeahOiovOaLoOOBjOOBguOCjOOBsDEwMO+8heODquOCueOCr+OBjOOBquOB
hOOBqOOBhOOBhuWNsemZuuOBr+OBguOCiuOBvuOBm+OCk+OAgg0KDQrnp4Hjga/jgYLjgarjgZ/j
gavjgYLjgarjgZ/jga7lgIvkurrnmoTjgarkvb/nlKjjga7jgZ/jgoHjga7nt4/jgYrph5Hjga40
NSXjgpLlj5bjgaPjgabjgbvjgZfjgYTjgYzjgIHjgYrph5Hjga41NSXjga/mhYjlloTmtLvli5Xj
gavooYzjgY/jgILnp4Hjga/np4Hjga7mnIDlvozjga7poZjjgYTjgpLljbHpmbrjgavjgZXjgonj
gZnjgoLjga7jgpLmnJvjgpPjgafjgYTjgarjgYTjga7jgafjgIHnp4Hjga/np4Hjga7lv4Pjga7m
rLLmnJvjgpLpgZTmiJDjgZnjgovjgZ/jgoHjgavjgIHjgZPjga7llY/poYzjgafjgYLjgarjgZ/j
ga7mnIDlpKfpmZDjga7kv6HpoLzjgajmqZ/lr4bmgKfjgavmhJ/orJ3jgZfjgb7jgZnjgILjgYLj
garjgZ/jga7jgrnjg5Hjg6DjgafjgZPjga7miYvntJnjgpLlj5fjgZHlj5bjgaPjgZ/loLTlkIjj
gIHnp4Hjga/pnZ7luLjjgavnlLPjgZfoqLPjgYLjgorjgb7jgZvjgpPjgYzjgIHlm73jga7mnIDo
v5Hjga7mjqXntprjgqjjg6njg7zjgavjgojjgovjgoLjga7jgafjgZnjgIINCg0K44GC44Gq44Gf
44Gu5pyA5oSb44Gu5aeJ5aa544CCDQrjg4bjg6zjgrXjg7vjg4/jgqTjgrjlpKvkuroNCg==
