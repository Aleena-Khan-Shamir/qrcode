import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config.dart/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Generate QR code',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
