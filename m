Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10204D97ED
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Mar 2022 10:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346650AbiCOJoq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Mar 2022 05:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343948AbiCOJoo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Mar 2022 05:44:44 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693D637A8C
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 02:43:32 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2e5827a76f4so23096437b3.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=P8W2zlHhaj8msdiLGZsvH8h/dlj9jpJS1lAWC0cxfyXlKg+gAi/zFE2sBBvK8lpsK9
         uXWfAwXCNA554d6XRMbjrMotHKU5NkcYIU2KGdOuwBk4wkS3PhWfL3wNsmettVVruImG
         AJqSlUefY1vuqZNEbqbIzzD8CcRDu9dp5mpCgkjtymLHFEexm63Jd82SrHTFttepUcGH
         9bSN46zEyGhANMW0lYjQh4TUN4wFE+S5sYJOr3REJM0yFfJw/dzjD7uGpS5mKRIPTHyJ
         tzog+VLGxwTj/vkpOhgf771GCJCFpwQxeBv0X8N+xinD8oI3wPzh280m8+uYcl1KRflo
         BGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=241pa3nhUolw/UrOxXgFW10DEQ4YpkUQLVyl8nI4VoksN1kfc4PwWwobWPl+FmjpLx
         KeBMajL0UXTcA6l1atbN01Z2ijaDw1S1aJtk1oiq4XqGGDw2ZK4gWrfGyQDpo2pPr221
         EZpqx8CYLLCJVi4G3O/txf3rQ/Wua6gVWqsuRq/3VNKgZXhsAtQNYXGxfpDlPGISN56r
         SWwt7zrQpPvt4cDuV9ecHAy7LcszRZ+AJPkvCaH62nURqsEEM1EsRtSruxMoiBBrDTGF
         vBKTTk9Eu/rE+ybqS9pzrKBv+iEhpsdLtIr9wej1HAweLNDo5hXMzZcQeaRY8JPageYS
         rsMQ==
X-Gm-Message-State: AOAM530elYgsrDlnjH12vCGxDRUHbrUz67xBaEFSVNOMlsNl7nd9/y6h
        BN7Ga+099IaI0wic23QAiswivYVQ/g0nvXlIV/o=
X-Google-Smtp-Source: ABdhPJwVsekcMZgSyNAPsQy9+EgUtS3wxoaIFe8v5bDjGziMGzErR5YhgfErhsNI2RShE8Nv6htEwSuTMB0rCfhWA6U=
X-Received: by 2002:a0d:ee03:0:b0:2d6:c6cd:d598 with SMTP id
 x3-20020a0dee03000000b002d6c6cdd598mr24163038ywe.425.1647337405036; Tue, 15
 Mar 2022 02:43:25 -0700 (PDT)
MIME-Version: 1.0
Sender: randallkrakauer@gmail.com
Received: by 2002:a05:7000:708:0:0:0:0 with HTTP; Tue, 15 Mar 2022 02:43:24
 -0700 (PDT)
From:   Lia Ahil <mrsliaahil070@gmail.com>
Date:   Tue, 15 Mar 2022 09:43:24 +0000
X-Google-Sender-Auth: C5QcHaMudrzNWb5oeFCbn2dloIo
Message-ID: <CAG=YkKBSM1vhvnxgTYe2XnfRUMsZhyBBtxGg3VmoNmeLb7+zxA@mail.gmail.com>
Subject: Hello,Did you receive my email message
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


