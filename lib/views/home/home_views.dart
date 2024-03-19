import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/config.dart/config.dart';
import 'package:qrcode/views/home/controller.dart';

class HomeViews extends GetView<HomeController> {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.key,
      child: Scaffold(
        appBar: AppBar(title: const Text('QR Code'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller.urlController,
                decoration: InputDecoration(
                    hintText: 'Enter your Url ',
                    labelText: 'Enter your Url ',
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.clear, size: 15),
                        onPressed: () {
                          controller.urlController.clear();
                        }),
                    border: const OutlineInputBorder(borderSide: BorderSide())),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter url';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    if (controller.key.currentState!.validate()) {
                      log(controller.urlController.text);
                      Get.toNamed(Routes.qrCode);
                    }
                  },
                  style:
                      const ButtonStyle(splashFactory: InkSplash.splashFactory),
                  child: const Text('Generate QRCode'))
            ],
          ),
        ),
      ),
    );
  }
}
