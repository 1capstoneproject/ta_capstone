import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/dashboard/home_screen.dart';
import 'package:ta_capstone/presentation/pages/dashboard/navigation.dart';
import 'package:ta_capstone/presentation/widget/button.dart';

import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../widget/qr.code.dart';

class CetakTiket extends StatelessWidget {
  const CetakTiket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: HomeClipper(),
            child: Container(
              height: 250.sp,
              color: AppColors.LightGreen500,
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: 70.sp,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/white.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 35,
                      ),
                      child: Center(
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(16),
                          child: TicketWidget(
                            width: 300.sp,
                            height: 500.sp,
                            isCornerRounded: true,
                            padding: EdgeInsets.all(20),
                            child: TicketData(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonComponent(
            title: 'Download E - Ticket',
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                            'assets/images/ticketpopup.png'), // Replace with your image path
                        SizedBox(height: 10.sp),
                        Text(
                          'Ticket Berhasil Disimpan',
                          style: titleMedium,
                        ),
                        SizedBox(height: 10.sp),
                        Text(
                          'E-ticket anda berhasil Disimpan di perangkat anda',
                          style: bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Batal'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Unduh'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Get.to(() => NavigationView());
                          // Add your download logic here
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Longlivia Bromo',
                  style: titleLarge,
                ),
                SizedBox(height: 4.sp),
                Text(
                  'ID Wisata: 123456',
                  style: bodySmallGrey,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),

              //barcode masih belum muncul,
              child: Container(
                width: 60.0.sp,
                height: 60.0.sp,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: QrCodeView(),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Divider(
          color: AppColors.LightGreen200,
        ),
        SizedBox(height: 20.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Data Pesanan',
              style: titleLarge,
            ),
          ],
        ),
        SizedBox(height: 10.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nama Pesanan',
              style: bodySmallGrey,
            ),
            Text(
              'John Doe',
              style: bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 8.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kategori',
              style: bodySmallGrey,
            ),
            Text(
              'Liburan',
              style: bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 8.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tanggal Keberangkatan',
              style: bodySmallGrey,
            ),
            Text(
              '25 Juni 2024',
              style: bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 8.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jumlah Kelompok',
              style: bodySmallGrey,
            ),
            Text(
              '5 Orang',
              style: bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 15.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Metode pembayaran QRIS',
              style: titleLarge,
            ),
          ],
        ),
        Divider(
          color: AppColors.LightGreen200,
        ),
        SizedBox(height: 10.sp),
        Text(
          'Tanggal',
          style: bodySmall,
          textAlign: TextAlign.center,
        ),
        Text(
          '25 Juni 2024',
          style: titleSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8.sp,
        ),
        Text(
          'Datang sesuai jadwal dan tunjukan tiket ini ke pokdarwis',
          style: bodySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8.sp,
        ),
        Text(
          'Rp. 0.000.000',
          style: titleMediumGreen,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
