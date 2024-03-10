import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final key = GlobalKey<FormState>();
  final TextEditingController urlController = TextEditingController();
  @override
  void dispose() {
    urlController.dispose();
    log(urlController.text);
    super.dispose();
  }
}
