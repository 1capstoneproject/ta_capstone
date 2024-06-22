import 'package:flutter/material.dart';
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
              height: 250,
              color: AppColors.LightGreen500,
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: 70,
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
                            width: 300,
                            height: 500,
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
              Get.to(
                () => NavigationView(),
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
                SizedBox(height: 4),
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
                width: 60.0,
                height: 60.0,
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
        SizedBox(height: 20),
        Text(
          'Data Pesanan',
          style: titleLarge,
        ),
        SizedBox(height: 10),
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
        SizedBox(height: 8),
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
        SizedBox(height: 8),
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
        SizedBox(height: 8),
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
        SizedBox(height: 15),
        Divider(
          color: AppColors.LightGreen200,
        ),
        SizedBox(height: 15),
        Text(
          'Metode pembayaran QRIS',
          style: titleLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
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
          height: 8,
        ),
        Text(
          'Datang sesuai jadwal dan tunjukan tiket ini ke pokdarwis',
          style: bodySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
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


//pop up untuk tiket berhasil di simpan/di download masih belum di tambahkan.