Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31FD012810F
	for <lists+platform-driver-x86@lfdr.de>; Fri, 20 Dec 2019 18:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfLTRE4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 20 Dec 2019 12:04:56 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:42929 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727381AbfLTRE4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Dec 2019 12:04:56 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from lsun@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 20 Dec 2019 19:04:53 +0200
Received: from farm-0002.mtbu.labs.mlnx (farm-0002.mtbu.labs.mlnx [10.15.2.32])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id xBKH4qpp029077;
        Fri, 20 Dec 2019 12:04:52 -0500
Received: (from lsun@localhost)
        by farm-0002.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id xBKH4nBM020575;
        Fri, 20 Dec 2019 12:04:49 -0500
From:   Liming Sun <lsun@mellanox.com>
To:     David Woods <dwoods@mellanox.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Cc:     Liming Sun <lsun@mellanox.com>, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, <stable@vger.kernel.org>
Subject: [PATCH v1 1/1] platform/mellanox: fix potential deadlock in the tmfifo driver
Date:   Fri, 20 Dec 2019 12:04:33 -0500
Message-Id: <7e315c0bf18b05be1ddc1c29a182ea0a27d9f6f6.1576861099.git.lsun@mellanox.com>
X-Mailer: git-send-email 1.8.3.1
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This commit fixes the potential deadlock caused by the console Rx
and Tx processing at the same time. Rx and Tx both take the console
and tmfifo spinlock but in different order which causes potential
deadlock. The fix is to use different tmfifo spinlock for Rx and
Tx since they protect different resources and it's safe to split
the lock.

Below is the reported call trace when copying/pasting large string
in the console.

Rx:
    _raw_spin_lock_irqsave (hvc lock)
    __hvc_poll
    hvc_poll
    in_intr
    vring_interrupt
    mlxbf_tmfifo_rxtx_one_desc (tmfifo lock)
    mlxbf_tmfifo_rxtx
    mlxbf_tmfifo_work_rxtx
Tx:
    _raw_spin_lock_irqsave (tmfifo lock)
    mlxbf_tmfifo_virtio_notify
    virtqueue_notify
    virtqueue_kick
    put_chars
    hvc_push
    hvc_write (hvc lock)
    ...
    do_tty_write
    tty_write

Fixes: 1357dfd7261f ("platform/mellanox: Add TmFifo driver for Mellanox BlueField Soc")
Cc: <stable@vger.kernel.org> # 5.4+
Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Liming Sun <lsun@mellanox.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 9a5c9fd..5739a966 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -149,7 +149,7 @@ struct mlxbf_tmfifo_irq_info {
  * @work: work struct for deferred process
  * @timer: background timer
  * @vring: Tx/Rx ring
- * @spin_lock: spin lock
+ * @spin_lock: Tx/Rx spin lock
  * @is_ready: ready flag
  */
 struct mlxbf_tmfifo {
@@ -164,7 +164,7 @@ struct mlxbf_tmfifo {
 	struct work_struct work;
 	struct timer_list timer;
 	struct mlxbf_tmfifo_vring *vring[2];
-	spinlock_t spin_lock;		/* spin lock */
+	spinlock_t spin_lock[2];	/* spin lock */
 	bool is_ready;
 };
 
@@ -525,7 +525,7 @@ static void mlxbf_tmfifo_console_tx(struct mlxbf_tmfifo *fifo, int avail)
 	writeq(*(u64 *)&hdr, fifo->tx_base + MLXBF_TMFIFO_TX_DATA);
 
 	/* Use spin-lock to protect the 'cons->tx_buf'. */
-	spin_lock_irqsave(&fifo->spin_lock, flags);
+	spin_lock_irqsave(&fifo->spin_lock[0], flags);
 
 	while (size > 0) {
 		addr = cons->tx_buf.buf + cons->tx_buf.tail;
@@ -552,7 +552,7 @@ static void mlxbf_tmfifo_console_tx(struct mlxbf_tmfifo *fifo, int avail)
 		}
 	}
 
-	spin_unlock_irqrestore(&fifo->spin_lock, flags);
+	spin_unlock_irqrestore(&fifo->spin_lock[0], flags);
 }
 
 /* Rx/Tx one word in the descriptor buffer. */
@@ -731,9 +731,9 @@ static bool mlxbf_tmfifo_rxtx_one_desc(struct mlxbf_tmfifo_vring *vring,
 		fifo->vring[is_rx] = NULL;
 
 		/* Notify upper layer that packet is done. */
-		spin_lock_irqsave(&fifo->spin_lock, flags);
+		spin_lock_irqsave(&fifo->spin_lock[is_rx], flags);
 		vring_interrupt(0, vring->vq);
-		spin_unlock_irqrestore(&fifo->spin_lock, flags);
+		spin_unlock_irqrestore(&fifo->spin_lock[is_rx], flags);
 	}
 
 mlxbf_tmfifo_desc_done:
@@ -852,10 +852,10 @@ static bool mlxbf_tmfifo_virtio_notify(struct virtqueue *vq)
 		 * worker handler.
 		 */
 		if (vring->vdev_id == VIRTIO_ID_CONSOLE) {
-			spin_lock_irqsave(&fifo->spin_lock, flags);
+			spin_lock_irqsave(&fifo->spin_lock[0], flags);
 			tm_vdev = fifo->vdev[VIRTIO_ID_CONSOLE];
 			mlxbf_tmfifo_console_output(tm_vdev, vring);
-			spin_unlock_irqrestore(&fifo->spin_lock, flags);
+			spin_unlock_irqrestore(&fifo->spin_lock[0], flags);
 		} else if (test_and_set_bit(MLXBF_TM_TX_LWM_IRQ,
 					    &fifo->pend_events)) {
 			return true;
@@ -1189,7 +1189,8 @@ static int mlxbf_tmfifo_probe(struct platform_device *pdev)
 	if (!fifo)
 		return -ENOMEM;
 
-	spin_lock_init(&fifo->spin_lock);
+	spin_lock_init(&fifo->spin_lock[0]);
+	spin_lock_init(&fifo->spin_lock[1]);
 	INIT_WORK(&fifo->work, mlxbf_tmfifo_work_handler);
 	mutex_init(&fifo->lock);
 
-- 
1.8.3.1

