Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09A15F10AB
	for <lists+platform-driver-x86@lfdr.de>; Fri, 30 Sep 2022 19:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbiI3RVL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 30 Sep 2022 13:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiI3RVK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Sep 2022 13:21:10 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58809FFB1E;
        Fri, 30 Sep 2022 10:21:08 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id i12so3220438qvs.2;
        Fri, 30 Sep 2022 10:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hYgkS8Ak/ZYkgLXbi2A2pi89VVQZ4jl+MkjbVgAv2sM=;
        b=dc7MbEdZ20LE6fBnO1VrqnEWOzs3jpr2xVXCytptCPGAibCuKBV70K+IGc6X6STB1X
         8bIvuUl2n2TXARjwKJ1AqhFzZTsxPNfu62EvEsSfOQGP25y0XOEk+7yUSeqXIUkCkC+k
         OWMdV4WXWcWQOptk2bfBRcgwNJrZkR6nAxSRI+cxVQ/Ee7Kf+AksAIU/0OYEnef61Rer
         qjQAG6tix0XaU87mXucrP0SX7uMo1WMESU16XaV3LIqp3TfzWOzXPetMHmf3pjrbmqvX
         l2U0+bGS6Q3TPDbiDZmRuLorWl6dcnTSZh5Xg3XGMOYvIZy1Bc/kP/69L+XisFqrlAh8
         JcnQ==
X-Gm-Message-State: ACrzQf1uuS/dk7VDd6s1pOJD0ym2EP3Ct1Uai3aDsjTnIK3JdTmTBR0G
        Jy1bOP/AmL5NQU+yvQ4SgwlOWh/zoI2FTT1nx4I=
X-Google-Smtp-Source: AMsMyM4y5aEk45M/N4HvTqU2RAaqNYIiIZYX6N5BIHgB/DnCtTyxvOu1t6nhGXPs3vNraHLhtr2biXAhCZDpCcheHMk=
X-Received: by 2002:ad4:5beb:0:b0:4af:96ab:21e5 with SMTP id
 k11-20020ad45beb000000b004af96ab21e5mr7738252qvc.85.1664558467333; Fri, 30
 Sep 2022 10:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220928210059.891387-1-daniel.lezcano@linaro.org> <20220928210059.891387-2-daniel.lezcano@linaro.org>
In-Reply-To: <20220928210059.891387-2-daniel.lezcano@linaro.org>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 30 Sep 2022 19:20:56 +0200
Message-ID: <CAJZ5v0jMmCm-Zb7zkg852t73HRzYXCfKNaZcZrxoVdGa-k4Y+Q@mail.gmail.com>
Subject: Re: [PATCH v7 01/29] thermal/core: Add a generic thermal_zone_get_trip()
 function
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, rui.zhang@intel.com,
        Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Sep 28, 2022 at 11:01 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> The thermal_zone_device_ops structure defines a set of ops family,
> get_trip_temp(), get_trip_hyst(), get_trip_type(). Each of them is
> returning a property of a trip point.
>
> The result is the code is calling the ops everywhere to get a trip
> point which is supposed to be defined in the backend driver. It is a
> non-sense as a thermal trip can be generic and used by the backend
> driver to declare its trip points.
>
> Part of the thermal framework has been changed and all the OF thermal
> drivers are using the same definition for the trip point and use a
> thermal zone registration variant to pass those trip points which are
> part of the thermal zone device structure.
>
> Consequently, we can use a generic function to get the trip points
> when they are stored in the thermal zone device structure.
>
> This approach can be generalized to all the drivers and we can get rid
> of the ops->get_trip_*. That will result to a much more simpler code
> and make possible to rework how the thermal trip are handled in the
> thermal core framework as discussed previously.
>
> This change adds a function thermal_zone_get_trip() where we get the
> thermal trip point structure which contains all the properties (type,
> temp, hyst) instead of doing multiple calls to ops->get_trip_*.
>
> That opens the door for trip point extension with more attributes. For
> instance, replacing the trip points disabled bitmask with a 'disabled'
> field in the structure.
>
> Here we replace all the calls to ops->get_trip_* in the thermal core
> code with a call to the thermal_zone_get_trip() function.
>
> The thermal zone ops defines a callback to retrieve the critical
> temperature. As the trip handling is being reworked, all the trip
> points will be the same whatever the driver and consequently finding
> the critical trip temperature will be just a loop to search for a
> critical trip point type.
>
> Provide such a generic function, so we encapsulate the ops
> get_crit_temp() which can be removed when all the backend drivers are
> using the generic trip points handling.
>
> While at it, add the thermal_zone_get_num_trips() to encapsulate the
> code more and reduce the grip with the thermal framework internals.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Zhang Rui <rui.zhang@intel.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/thermal/thermal_core.c    | 114 ++++++++++++++++++++++++------
>  drivers/thermal/thermal_core.h    |   2 +
>  drivers/thermal/thermal_helpers.c |  28 ++++----
>  drivers/thermal/thermal_netlink.c |  21 +++---
>  drivers/thermal/thermal_sysfs.c   |  66 +++++++----------
>  include/linux/thermal.h           |   7 ++
>  6 files changed, 149 insertions(+), 89 deletions(-)
>
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 4eab77d0e59c..16ef91dc102f 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -341,35 +341,31 @@ static void handle_critical_trips(struct thermal_zone_device *tz,
>                 tz->ops->critical(tz);
>  }
>
> -static void handle_thermal_trip(struct thermal_zone_device *tz, int trip)
> +static void handle_thermal_trip(struct thermal_zone_device *tz, int trip_id)
>  {
> -       enum thermal_trip_type type;
> -       int trip_temp, hyst = 0;
> +       struct thermal_trip trip;
>
>         /* Ignore disabled trip points */
> -       if (test_bit(trip, &tz->trips_disabled))
> +       if (test_bit(trip_id, &tz->trips_disabled))
>                 return;
>
> -       tz->ops->get_trip_temp(tz, trip, &trip_temp);
> -       tz->ops->get_trip_type(tz, trip, &type);
> -       if (tz->ops->get_trip_hyst)
> -               tz->ops->get_trip_hyst(tz, trip, &hyst);
> +       __thermal_zone_get_trip(tz, trip_id, &trip);
>
>         if (tz->last_temperature != THERMAL_TEMP_INVALID) {
> -               if (tz->last_temperature < trip_temp &&
> -                   tz->temperature >= trip_temp)
> -                       thermal_notify_tz_trip_up(tz->id, trip,
> +               if (tz->last_temperature < trip.temperature &&
> +                   tz->temperature >= trip.temperature)
> +                       thermal_notify_tz_trip_up(tz->id, trip_id,
>                                                   tz->temperature);
> -               if (tz->last_temperature >= trip_temp &&
> -                   tz->temperature < (trip_temp - hyst))
> -                       thermal_notify_tz_trip_down(tz->id, trip,
> +               if (tz->last_temperature >= trip.temperature &&
> +                   tz->temperature < (trip.temperature - trip.hysteresis))
> +                       thermal_notify_tz_trip_down(tz->id, trip_id,
>                                                     tz->temperature);
>         }
>
> -       if (type == THERMAL_TRIP_CRITICAL || type == THERMAL_TRIP_HOT)
> -               handle_critical_trips(tz, trip, trip_temp, type);
> +       if (trip.type == THERMAL_TRIP_CRITICAL || trip.type == THERMAL_TRIP_HOT)
> +               handle_critical_trips(tz, trip_id, trip.temperature, trip.type);
>         else
> -               handle_non_critical_trips(tz, trip);
> +               handle_non_critical_trips(tz, trip_id);
>  }
>
>  static void update_temperature(struct thermal_zone_device *tz)
> @@ -1142,6 +1138,79 @@ static void thermal_set_delay_jiffies(unsigned long *delay_jiffies, int delay_ms
>                 *delay_jiffies = round_jiffies(*delay_jiffies);
>  }
>
> +int thermal_zone_get_num_trips(struct thermal_zone_device *tz)
> +{
> +       return tz->num_trips;
> +}
> +EXPORT_SYMBOL_GPL(thermal_zone_get_num_trips);
> +
> +int thermal_zone_get_crit_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +       int i, ret = -EINVAL;
> +
> +       if (tz->ops->get_crit_temp)
> +               return tz->ops->get_crit_temp(tz, temp);
> +
> +       if (!tz->trips)
> +               return -EINVAL;
> +
> +       mutex_lock(&tz->lock);
> +
> +       for (i = 0; i < tz->num_trips; i++) {
> +               if (tz->trips[i].type == THERMAL_TRIP_CRITICAL) {
> +                       *temp = tz->trips[i].temperature;
> +                       ret = 0;
> +                       break;
> +               }
> +       }
> +
> +       mutex_unlock(&tz->lock);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(thermal_zone_get_crit_temp);
> +
> +int __thermal_zone_get_trip(struct thermal_zone_device *tz, int trip_id,
> +                           struct thermal_trip *trip)
> +{
> +       int ret;
> +
> +       if (!tz || trip_id < 0 || trip_id >= tz->num_trips || !trip)
> +               return -EINVAL;
> +
> +       if (tz->trips) {
> +               *trip = tz->trips[trip_id];
> +               return 0;
> +       }
> +
> +       if (tz->ops->get_trip_hyst) {
> +               ret = tz->ops->get_trip_hyst(tz, trip_id, &trip->hysteresis);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               trip->hysteresis = 0;
> +       }
> +
> +       ret = tz->ops->get_trip_temp(tz, trip_id, &trip->temperature);
> +       if (ret)
> +               return ret;
> +
> +       return tz->ops->get_trip_type(tz, trip_id, &trip->type);
> +}
> +
> +int thermal_zone_get_trip(struct thermal_zone_device *tz, int trip_id,
> +                         struct thermal_trip *trip)
> +{
> +       int ret;
> +
> +       mutex_lock(&tz->lock);
> +       ret = __thermal_zone_get_trip(tz, trip_id, trip);
> +       mutex_unlock(&tz->lock);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(thermal_zone_get_trip);
> +
>  /**
>   * thermal_zone_device_register_with_trips() - register a new thermal zone device
>   * @type:      the thermal zone device type
> @@ -1174,8 +1243,6 @@ thermal_zone_device_register_with_trips(const char *type, struct thermal_trip *t
>                                         int polling_delay)
>  {
>         struct thermal_zone_device *tz;
> -       enum thermal_trip_type trip_type;
> -       int trip_temp;
>         int id;
>         int result;
>         int count;
> @@ -1202,7 +1269,7 @@ thermal_zone_device_register_with_trips(const char *type, struct thermal_trip *t
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       if (num_trips > 0 && (!ops->get_trip_type || !ops->get_trip_temp))
> +       if (num_trips > 0 && (!ops->get_trip_type || !ops->get_trip_temp) && !trips)
>                 return ERR_PTR(-EINVAL);
>
>         tz = kzalloc(sizeof(*tz), GFP_KERNEL);
> @@ -1252,9 +1319,10 @@ thermal_zone_device_register_with_trips(const char *type, struct thermal_trip *t
>                 goto release_device;
>
>         for (count = 0; count < num_trips; count++) {
> -               if (tz->ops->get_trip_type(tz, count, &trip_type) ||
> -                   tz->ops->get_trip_temp(tz, count, &trip_temp) ||
> -                   !trip_temp)
> +               struct thermal_trip trip;
> +
> +               result = thermal_zone_get_trip(tz, count, &trip);
> +               if (result)
>                         set_bit(count, &tz->trips_disabled);
>         }
>
> diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
> index 1571917bd3c8..879e91a48435 100644
> --- a/drivers/thermal/thermal_core.h
> +++ b/drivers/thermal/thermal_core.h
> @@ -113,6 +113,8 @@ int thermal_build_list_of_policies(char *buf);
>  /* Helpers */
>  void thermal_zone_set_trips(struct thermal_zone_device *tz);
>  void __thermal_zone_set_trips(struct thermal_zone_device *tz);
> +int __thermal_zone_get_trip(struct thermal_zone_device *tz, int trip_id,
> +                           struct thermal_trip *trip);
>  int __thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp);
>
>  /* sysfs I/F */
> diff --git a/drivers/thermal/thermal_helpers.c b/drivers/thermal/thermal_helpers.c
> index c65cdce8f856..06dded36e95e 100644
> --- a/drivers/thermal/thermal_helpers.c
> +++ b/drivers/thermal/thermal_helpers.c
> @@ -69,7 +69,7 @@ int __thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp)
>         int ret = -EINVAL;
>         int count;
>         int crit_temp = INT_MAX;
> -       enum thermal_trip_type type;
> +       struct thermal_trip trip;
>
>         lockdep_assert_held(&tz->lock);
>
> @@ -80,10 +80,9 @@ int __thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp)
>
>         if (IS_ENABLED(CONFIG_THERMAL_EMULATION) && tz->emul_temperature) {
>                 for (count = 0; count < tz->num_trips; count++) {
> -                       ret = tz->ops->get_trip_type(tz, count, &type);
> -                       if (!ret && type == THERMAL_TRIP_CRITICAL) {
> -                               ret = tz->ops->get_trip_temp(tz, count,
> -                                               &crit_temp);
> +                       ret = __thermal_zone_get_trip(tz, count, &trip);
> +                       if (!ret && trip.type == THERMAL_TRIP_CRITICAL) {
> +                               crit_temp = trip.temperature;
>                                 break;
>                         }
>                 }
> @@ -124,29 +123,30 @@ EXPORT_SYMBOL_GPL(thermal_zone_get_temp);
>
>  void __thermal_zone_set_trips(struct thermal_zone_device *tz)
>  {
> -       int low = -INT_MAX;
> -       int high = INT_MAX;
> -       int trip_temp, hysteresis;
> +       struct thermal_trip trip;
> +       int low = -INT_MAX, high = INT_MAX;
>         int i, ret;
>
>         lockdep_assert_held(&tz->lock);
>
> -       if (!tz->ops->set_trips || !tz->ops->get_trip_hyst)
> +       if (!tz->ops->set_trips)
>                 return;
>
>         for (i = 0; i < tz->num_trips; i++) {
>                 int trip_low;
>
> -               tz->ops->get_trip_temp(tz, i, &trip_temp);
> -               tz->ops->get_trip_hyst(tz, i, &hysteresis);
> +               ret = __thermal_zone_get_trip(tz, i , &trip);
> +               if (ret)
> +                       return;
>
> -               trip_low = trip_temp - hysteresis;
> +               trip_low = trip.temperature - trip.hysteresis;
>
>                 if (trip_low < tz->temperature && trip_low > low)
>                         low = trip_low;
>
> -               if (trip_temp > tz->temperature && trip_temp < high)
> -                       high = trip_temp;
> +               if (trip.temperature > tz->temperature &&
> +                   trip.temperature < high)
> +                       high = trip.temperature;
>         }
>
>         /* No need to change trip points */
> diff --git a/drivers/thermal/thermal_netlink.c b/drivers/thermal/thermal_netlink.c
> index 050d243a5fa1..2a3190d55358 100644
> --- a/drivers/thermal/thermal_netlink.c
> +++ b/drivers/thermal/thermal_netlink.c
> @@ -452,7 +452,8 @@ static int thermal_genl_cmd_tz_get_trip(struct param *p)
>         struct sk_buff *msg = p->msg;
>         struct thermal_zone_device *tz;
>         struct nlattr *start_trip;
> -       int i, id;
> +       struct thermal_trip trip;
> +       int ret, i, id;
>
>         if (!p->attrs[THERMAL_GENL_ATTR_TZ_ID])
>                 return -EINVAL;
> @@ -471,18 +472,14 @@ static int thermal_genl_cmd_tz_get_trip(struct param *p)
>
>         for (i = 0; i < tz->num_trips; i++) {
>
> -               enum thermal_trip_type type;
> -               int temp, hyst = 0;
> -
> -               tz->ops->get_trip_type(tz, i, &type);
> -               tz->ops->get_trip_temp(tz, i, &temp);
> -               if (tz->ops->get_trip_hyst)
> -                       tz->ops->get_trip_hyst(tz, i, &hyst);
> -
> +               ret = __thermal_zone_get_trip(tz, i, &trip);
> +               if (ret)
> +                       goto out_cancel_nest;
> +
>                 if (nla_put_u32(msg, THERMAL_GENL_ATTR_TZ_TRIP_ID, i) ||
> -                   nla_put_u32(msg, THERMAL_GENL_ATTR_TZ_TRIP_TYPE, type) ||
> -                   nla_put_u32(msg, THERMAL_GENL_ATTR_TZ_TRIP_TEMP, temp) ||
> -                   nla_put_u32(msg, THERMAL_GENL_ATTR_TZ_TRIP_HYST, hyst))
> +                   nla_put_u32(msg, THERMAL_GENL_ATTR_TZ_TRIP_TYPE, trip.type) ||
> +                   nla_put_u32(msg, THERMAL_GENL_ATTR_TZ_TRIP_TEMP, trip.temperature) ||
> +                   nla_put_u32(msg, THERMAL_GENL_ATTR_TZ_TRIP_HYST, trip.hysteresis))
>                         goto out_cancel_nest;
>         }
>
> diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/thermal_sysfs.c
> index ec495c7dff03..d093d7aa64c6 100644
> --- a/drivers/thermal/thermal_sysfs.c
> +++ b/drivers/thermal/thermal_sysfs.c
> @@ -83,20 +83,17 @@ trip_point_type_show(struct device *dev, struct device_attribute *attr,
>                      char *buf)
>  {
>         struct thermal_zone_device *tz = to_thermal_zone(dev);
> -       enum thermal_trip_type type;
> -       int trip, result;
> +       struct thermal_trip trip;
> +       int trip_id, result;
>
> -       if (!tz->ops->get_trip_type)
> -               return -EPERM;
> -
> -       if (sscanf(attr->attr.name, "trip_point_%d_type", &trip) != 1)
> +       if (sscanf(attr->attr.name, "trip_point_%d_type", &trip_id) != 1)
>                 return -EINVAL;
>
> -       result = tz->ops->get_trip_type(tz, trip, &type);
> +       result = thermal_zone_get_trip(tz, trip_id, &trip);
>         if (result)
>                 return result;
>
> -       switch (type) {
> +       switch (trip.type) {
>         case THERMAL_TRIP_CRITICAL:
>                 return sprintf(buf, "critical\n");
>         case THERMAL_TRIP_HOT:
> @@ -115,39 +112,33 @@ trip_point_temp_store(struct device *dev, struct device_attribute *attr,
>                       const char *buf, size_t count)
>  {
>         struct thermal_zone_device *tz = to_thermal_zone(dev);
> -       int trip, ret;
> -       int temperature, hyst = 0;
> -       enum thermal_trip_type type;
> +       struct thermal_trip trip;
> +       int trip_id, ret;
>
>         if (!tz->ops->set_trip_temp && !tz->trips)
>                 return -EPERM;
>
> -       if (sscanf(attr->attr.name, "trip_point_%d_temp", &trip) != 1)
> +       if (sscanf(attr->attr.name, "trip_point_%d_temp", &trip_id) != 1)
>                 return -EINVAL;
>
> -       if (kstrtoint(buf, 10, &temperature))
> +       if (kstrtoint(buf, 10, &trip.temperature))
>                 return -EINVAL;
>
>         if (tz->ops->set_trip_temp) {
> -               ret = tz->ops->set_trip_temp(tz, trip, temperature);
> +               ret = tz->ops->set_trip_temp(tz, trip_id, trip.temperature);
>                 if (ret)
>                         return ret;
>         }
>
>         if (tz->trips)
> -               tz->trips[trip].temperature = temperature;
> +               tz->trips[trip_id].temperature = trip.temperature;
>
> -       if (tz->ops->get_trip_hyst) {
> -               ret = tz->ops->get_trip_hyst(tz, trip, &hyst);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       ret = tz->ops->get_trip_type(tz, trip, &type);
> +       ret = thermal_zone_get_trip(tz, trip_id, &trip);
>         if (ret)
>                 return ret;
>
> -       thermal_notify_tz_trip_change(tz->id, trip, type, temperature, hyst);
> +       thermal_notify_tz_trip_change(tz->id, trip_id, trip.type,
> +                                     trip.temperature, trip.hysteresis);
>
>         thermal_zone_device_update(tz, THERMAL_EVENT_UNSPECIFIED);
>
> @@ -159,21 +150,17 @@ trip_point_temp_show(struct device *dev, struct device_attribute *attr,
>                      char *buf)
>  {
>         struct thermal_zone_device *tz = to_thermal_zone(dev);
> -       int trip, ret;
> -       int temperature;
> +       struct thermal_trip trip;
> +       int trip_id, ret;
>
> -       if (!tz->ops->get_trip_temp)
> -               return -EPERM;
> -
> -       if (sscanf(attr->attr.name, "trip_point_%d_temp", &trip) != 1)
> +       if (sscanf(attr->attr.name, "trip_point_%d_temp", &trip_id) != 1)
>                 return -EINVAL;
>
> -       ret = tz->ops->get_trip_temp(tz, trip, &temperature);
> -
> +       ret = thermal_zone_get_trip(tz, trip_id, &trip);
>         if (ret)
>                 return ret;
>
> -       return sprintf(buf, "%d\n", temperature);
> +       return sprintf(buf, "%d\n", trip.temperature);
>  }
>
>  static ssize_t
> @@ -211,18 +198,17 @@ trip_point_hyst_show(struct device *dev, struct device_attribute *attr,
>                      char *buf)
>  {
>         struct thermal_zone_device *tz = to_thermal_zone(dev);
> -       int trip, ret;
> -       int temperature;
> +       struct thermal_trip trip;
> +       int trip_id, ret;
>
> -       if (!tz->ops->get_trip_hyst)
> -               return -EPERM;
> -
> -       if (sscanf(attr->attr.name, "trip_point_%d_hyst", &trip) != 1)
> +       if (sscanf(attr->attr.name, "trip_point_%d_hyst", &trip_id) != 1)
>                 return -EINVAL;
>
> -       ret = tz->ops->get_trip_hyst(tz, trip, &temperature);
> +       ret = thermal_zone_get_trip(tz, trip_id, &trip);
> +       if (ret)
> +               return ret;
>
> -       return ret ? ret : sprintf(buf, "%d\n", temperature);
> +       return ret ? ret : sprintf(buf, "%d\n", trip.hysteresis);
>  }
>
>  static ssize_t
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index a5a18351a898..feb8b61df746 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -335,6 +335,13 @@ static inline void devm_thermal_of_zone_unregister(struct device *dev,
>  }
>  #endif
>
> +int thermal_zone_get_trip(struct thermal_zone_device *tz, int trip_id,
> +                         struct thermal_trip *trip);
> +
> +int thermal_zone_get_num_trips(struct thermal_zone_device *tz);
> +
> +int thermal_zone_get_crit_temp(struct thermal_zone_device *tz, int *temp);
> +
>  #ifdef CONFIG_THERMAL
>  struct thermal_zone_device *thermal_zone_device_register(const char *, int, int,
>                 void *, struct thermal_zone_device_ops *,
> --
> 2.34.1
>
