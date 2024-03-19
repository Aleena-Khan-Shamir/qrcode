import 'dart:developer';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QRCodeController extends GetxController {
  ScreenshotController screenshotController = ScreenshotController();

  shareQrCode() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);
        await Share.shareFiles([imagePath.path]);
      }
    });
  }

  Future<File?> generateQRCode(String data) async {
    final qrValidationResult = QrValidator.validate(
      data: data,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );

    if (qrValidationResult.isValid) {
      final QrCode? qrCode = qrValidationResult.qrCode;
      final QrPainter qrPainter = QrPainter.withQr(
        qr: qrCode!,
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.circle,
        ),
      );
      final ByteData? bytes = await qrPainter.toImageData(
        200,
        format: ImageByteFormat.png,
      );
      if (bytes != null) {
        final File tempQrFile = File('/storage/emulated/0/Download/qrcode.png');
        await tempQrFile.writeAsBytes(bytes.buffer.asUint8List());
        return tempQrFile;
      }
    }
    return null;
  }
  // ########################################
  // generate pdf in file manager(downloads)

  Future<void> generatePdf(String data) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
          build: (pw.Context context) => pw.Column(children: [
                pw.Spacer(),
                pw.Align(
                  alignment: pw.Alignment.center,
                  child: pw.FittedBox(
                      child: pw.BarcodeWidget(
                          barcode: pw.Barcode.qrCode(),
                          height: 200,
                          width: 200,
                          data: data)),
                ),
                pw.Spacer(),
              ])),
    );
    final file = File('/storage/emulated/0/Download/qrcode.pdf');
    await file.writeAsBytes(await pdf.save());
    log('$file');
    Get.snackbar('Download pdf', 'Check your downloads');
  }
}
