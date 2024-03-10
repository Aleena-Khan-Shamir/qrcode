import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode/views/home/controller.dart';
import 'package:qrcode/views/qr/controller.dart';
import 'package:screenshot/screenshot.dart';

class QRCodeViews extends GetView<QRCodeController> {
  QRCodeViews({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: FittedBox(
                child: Screenshot(
                  controller: controller.screenshotController,
                  child: QrImageView(
                    data: homeController.urlController.text,
                    version: QrVersions.auto,
                    size: 200.0,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => controller.shareQrCode(),
                    icon: const Icon(Icons.share)),
                ElevatedButton(
                    onPressed: () => controller
                        .generatePdf(homeController.urlController.text),
                    child: const Text('Save')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
