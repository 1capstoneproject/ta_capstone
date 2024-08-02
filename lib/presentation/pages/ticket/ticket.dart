import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ta_capstone/presentation/pages/check_out/checkout_paket.dart';
import 'package:ta_capstone/presentation/pages/ticket/cetak_tiket.dart';
import 'package:ta_capstone/presentation/widget/qr.code.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

import '../../widget/button.dart';

class Ticketing extends StatelessWidget {
  const Ticketing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 2,
              height: 150.sp,
              child: CartWidget(),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 25.sp,
                top: 15.sp,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                'Selesaikan Pembayaran Sebelum Minggu, 02 Juni 2024 - 15:53 WIB',
                style: bodySmallGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Container(
                height: Get.height * .10,
                color: AppColors.Orange300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'PENTING! Segera Buka aplikasi QRIS di Smartohone kamu, lalu Pilih Bayar. Setelah itu, cek email kamu untuk informasi selengkapnya',
                    style: labelMedium,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 25,
                top: 20,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                'Scan QR dengan Aplikasi E- wallet',
                style: labelMediumGreen,
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonComponent(
            title: 'Cek Status',
            onPressed: () {
              
            },
          ),
        ),
      ],
    );
  }
}
