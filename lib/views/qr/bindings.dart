import 'package:get/get.dart';
import 'package:qrcode/views/qr/controller.dart';

class QRCodeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QRCodeController());
  }
}
