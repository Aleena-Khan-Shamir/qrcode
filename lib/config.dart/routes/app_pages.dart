import 'package:get/get.dart';
import 'package:qrcode/config.dart/routes/app_routes.dart';

import 'package:qrcode/views/home/index.dart';
import 'package:qrcode/views/qr/index.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomeViews(),
        binding: HomeBindings()),
    GetPage(
        name: Routes.qrCode,
        page: () => QRCodeViews(),
        binding: QRCodeBindings()),
  ];
}
