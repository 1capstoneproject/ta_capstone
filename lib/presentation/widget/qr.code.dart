import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ta_capstone/presentation/controller/detail_controller.dart';

class QrCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DetailPaketController qrController = Get.put(DetailPaketController());

    return Container(
      child: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Obx(() {
            return QrImageView(
              data: qrController.qrData.value,
              size: 200,
              backgroundColor: Colors.white,
            );
          }),
        ),
      ),
    );
  }
}
