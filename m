Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79C36516E8
	for <lists+platform-driver-x86@lfdr.de>; Tue, 20 Dec 2022 01:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbiLTAAy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 19 Dec 2022 19:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiLTAAn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Dec 2022 19:00:43 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD2C1164
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Dec 2022 16:00:42 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id b189so10309804vsc.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Dec 2022 16:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=01l7JFkP453NnyyjzaRZcIcVYzN32aOeM2k93v3ztAc=;
        b=XRoj6eVYbhRSGqClHwD2gOHzKHmTRST3QOiwOwMGfCA/mM9O13YaQb/kV5SN6raKK/
         hmXRqRhh9hxnEBMy0Dk/SZE7VMiflpHyJBw7B4q3R/Pp8vggWnrYCwtiGIOPVOGOouzb
         AHVIREBqyp7CgZzCnZQi9meBTNwFxGrPhKHg6DadrGuJNS53FZFKIfpwr01FfRaCyZmm
         3haVZzpGIHNL4tSj2gxsVxfX7DosH08aTkvqQgOzpJrshsea3VYKIC6Yql7CvLKwaU9N
         SQMV8JhhhWfG3NJiNmJyRw1H42K7G4vvgjzV9fu1KDnMQbp7d/gMyWhYO5QBeHAWvlP0
         U0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01l7JFkP453NnyyjzaRZcIcVYzN32aOeM2k93v3ztAc=;
        b=6T+2apzBSxetWfrIcn2Iz9u6slxxghn0rYXhn2ulI1ZpzBrNSwG/54yW9nwbd5yIpH
         1V3pCos95a1ySDI2gHmWAAFQ1uSnN6n0OcNeEsSZrlUNdT6Qly1UnAhK7P1lt+yiJP0A
         42Quh8gPH+XcWbRRF5ofy3WPd/E7MZ3oGKewa71yluxSeMHGpTA10r5CdBSokZze2T+g
         3ecSOZ+H1/wRpGJonMaRXkPcZmCtX+/kozlxJU8xkRMhP5/6nWDUTodCAfKAr9LjRc9H
         CIkGe1tWjmZ5lPDGhc95BAnj8vdxZj3FDLHu84fZ2O5Ak3aLbr+GGUl9CPeLWjGms+LG
         LtLg==
X-Gm-Message-State: ANoB5plnCpS5v+5bdqOstFdu75lq4Y6wAT2fTr7YquXA5zf9B4jD8dXi
        UXAVq06EKFWoW0hNTTkt03O2eEAhtNEU5zJwe8c=
X-Google-Smtp-Source: AA0mqf74UebdRV7FmnvMU5p2aTYHg9qyIVHs0DmI0kThSeBZKfOmV4DpbofSr3ht1jjp7uqbuLiD/D5JUnAxlyAtmnk=
X-Received: by 2002:a67:c514:0:b0:3b1:3955:a543 with SMTP id
 e20-20020a67c514000000b003b13955a543mr10353426vsk.79.1671494441385; Mon, 19
 Dec 2022 16:00:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:612c:1190:b0:374:9212:b0c2 with HTTP; Mon, 19 Dec 2022
 16:00:40 -0800 (PST)
Reply-To: mrstheresaheidi8@gmail.com
From:   "Ms. Theresa Heidi" <faridaaliyu595@gmail.com>
Date:   Mon, 19 Dec 2022 16:00:40 -0800
Message-ID: <CAL1YZM29dfBYrgP09o4nbgXFy+OK2C20So+4e6UMh-+3H=KL6g@mail.gmail.com>
Subject: =?UTF-8?B?5oCl5LqL5rGC5Yqp?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

5oWI5ZaE5o2Q5qy+77yBDQoNCuivt+S7lOe7humYheivu++8jOaIkeefpemBk+i/meWwgeS/oeeh
ruWunuWPr+iDveS8mue7meS9oOS4gOS4quaDiuWWnOOAgiDmiJHlnKjpnIDopoHkvaDluK7liqnn
moTml7blgJnpgJrov4fnp4HkurrmkJzntKLpgYfliLDkuobkvaDnmoTnlLXlrZDpgq7ku7bogZTn
s7vjgIINCuaIkeaAgOedgOayiemHjeeahOaCsuS8pOWGmei/meWwgemCruS7tue7meS9oO+8jOaI
kemAieaLqemAmui/h+S6kuiBlOe9keS4juS9oOiBlOezu++8jOWboOS4uuWug+S7jeeEtuaYr+ac
gOW/q+eahOayn+mAmuWqkuS7i+OAgg0KDQrmiJHmmK82MuWygeeahOeJueiVvuiOjirmtbfokoLl
pKvkurrvvIznm67liY3lm6DogrrnmYzlnKjku6XoibLliJfnmoTkuIDlrrbnp4Hnq4vljLvpmaLk
vY/pmaLmsrvnlpfjgIINCjTlubTliY3vvIzmiJHnmoTkuIjlpKvljrvkuJblkI7vvIzmiJHnq4vl
jbPooqvor4rmlq3lh7rmgqPmnInogrrnmYzvvIzku5bmiorku5bmiYDmnInnmoTkuIDliIfpg73n
lZnnu5nkuobmiJHjgIIg5oiR5bim552A5oiR55qE56yU6K6w5pys55S16ISR5Zyo5LiA5a625Yy7
6Zmi6YeM77yM5oiR5LiA55u05Zyo5o6l5Y+X6IK66YOo55mM55eH55qE5rK755aX44CCDQoNCuaI
keS7juaIkeW3suaVheeahOS4iOWkq+mCo+mHjOe7p+aJv+S6huS4gOeslOi1hOmHke+8jOWPquac
ieS4gOeZvuS4h+S6jOWNgeS4h+e+juWFg++8iDEsMjAwLDAwMCwwMOe+juWFg++8ieOAgueOsOWc
qOW+iOaYjuaYvu+8jOaIkeato+WcqOaOpei/keeUn+WRveeahOacgOWQjuWHoOWkqe+8jOaIkeiu
pOS4uuaIkeS4jeWGjemcgOimgei/meeslOmSseS6huOAgg0K5oiR55qE5Yy755Sf6K6p5oiR5piO
55m977yM55Sx5LqO6IK655mM55qE6Zeu6aKY77yM5oiR5LiN5Lya5oyB57ut5LiA5bm044CCDQoN
Cui/meeslOmSsei/mOWcqOWbveWklumTtuihjO+8jOeuoeeQhuWxguS7peecn+ato+eahOS4u+S6
uueahOi6q+S7veWGmeS/oee7meaIke+8jOimgeaxguaIkeWHuumdouaUtumSse+8jOaIluiAheet
vuWPkeS4gOWwgeaOiOadg+S5pu+8jOiuqeWIq+S6uuS7o+aIkeaUtumSse+8jOWboOS4uuaIkeeU
n+eXheS4jeiDvei/h+adpeOAgg0K5aaC5p6c5LiN6YeH5Y+W6KGM5Yqo77yM6ZO26KGM5Y+v6IO9
5Lya5Zug5Li65L+d5oyB6L+Z5LmI6ZW/5pe26Ze06ICM6KKr5rKh5pS26LWE6YeR44CCDQoNCuaI
keWGs+WumuS4juaCqOiBlOezu++8jOWmguaenOaCqOaEv+aEj+W5tuacieWFtOi2o+W4ruWKqeaI
keS7juWkluWbvemTtuihjOaPkOWPlui/meeslOmSse+8jOeEtuWQjuWwhui/meeslOi1hOmHkeeU
qOS6juaFiOWWhOS6i+S4mu+8jOW4ruWKqeW8seWKv+e+pOS9k+OAgg0K5oiR6KaB5L2g5Zyo5oiR
5Ye65LqL5LmL5YmN55yf6K+a5Zyw5aSE55CG6L+Z5Lqb5L+h5omY5Z+66YeR44CCIOi/meS4jeaY
r+S4gOeslOiiq+ebl+eahOmSse+8jOS5n+ayoeaciea2ieWPiueahOWNsemZqeaYrzEwMCXnmoTp
o47pmanlhY3otLnkuI7lhYXliIbnmoTms5Xlvovor4HmmI7jgIINCg0K5oiR6KaB5L2g5ou/NDUl
55qE6ZKx57uZ5L2g5Liq5Lq65L2/55So77yM6ICMNTUl55qE6ZKx5bCG55So5LqO5oWI5ZaE5bel
5L2c44CCDQrmiJHlsIbmhJ/osKLkvaDlnKjov5nku7bkuovkuIrmnIDlpKfnmoTkv6Hku7vlkozk
v53lr4bvvIzku6Xlrp7njrDmiJHlhoXlv4PnmoTmhL/mnJvvvIzlm6DkuLrmiJHkuI3mg7PopoHk
u7vkvZXkvJrljbHlj4rmiJHmnIDlkI7nmoTmhL/mnJvnmoTkuJzopb/jgIINCuaIkeW+iOaKseat
ie+8jOWmguaenOaCqOaUtuWIsOi/meWwgeS/oeWcqOaCqOeahOWeg+WcvumCruS7tu+8jOaYr+eU
seS6juacgOi/keeahOi/nuaOpemUmeivr+WcqOi/memHjOeahOWbveWutuOAgg0KDQrkvaDkurLn
iLHnmoTlprnlprnjgIINCueJueiVvuiOjirmtbfokoLlpKvkuroNCg==
