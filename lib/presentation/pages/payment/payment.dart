import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/check_out/checkout_paket.dart';
import 'package:ta_capstone/presentation/pages/ticket/ticket.dart';
import 'package:ta_capstone/presentation/widget/cart_payment.dart';
import 'package:ta_capstone/share/app_style/style.dart';

import '../../../share/app_colors/colors.dart';
import '../../controller/detail_controller.dart';
import '../../widget/button.dart';

class Pembayaran extends StatelessWidget {
  const Pembayaran({super.key});

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
              width: MediaQuery.of(context).size.width * 2.sp,
              height: 150.sp,
              child: CartWidget(),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 25,
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data Pesanan',
                    style: titleSmall,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextDp(
                    title: 'Nama Pemesanan',
                    data: 'Data',
                  ),
                  TextDp(
                    title: 'Kategori',
                    data: 'data',
                  ),
                  TextDp(
                    title: 'Tanggal Pemberangkatan',
                    data: 'data',
                  ),
                  TextDp(
                    title: 'Jumlah Kelompok',
                    data: 'data',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.sp,
                      right: 20.sp,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Total',
                          style: labelMedium,
                        ),
                        Spacer(),
                        SizedBox(
                          height: 8.sh,
                        ),
                        Text(
                          'data',
                          style: labelMediumGreen,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.sh,
                  ),
                  const ButtonTotal(
                    title: '',
                    decs: 'Terapkan',
                  ),
                  SizedBox(
                    height: 15.sh,
                  ),
                  Text(
                    'Metode Pembayaran',
                    style: titleMedium,
                  ),
                  const CartPayment(
                    img: 'assets/images/qris.png',
                    name: 'QRIS',
                  ),
                  const CartPayment(
                    img: 'assets/images/Ovo.png',
                    name: 'OVO',
                  ),
                  const CartPayment(
                    img: 'assets/images/gopay.png',
                    name: 'GOPAY',
                  ),
                  const CartPayment(
                    img: 'assets/images/shopee.png',
                    name: 'SHOPEE',
                  ),
                  const CartPayment(
                    img: 'assets/images/linkaja.png',
                    name: 'LINKAJA',
                  ),
                  const CartPayment(
                    img: 'assets/images/dana.png',
                    name: 'DANA',
                  ),
                  const CartPayment(
                    img: 'assets/images/cod.png',
                    name: 'COD',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonComponent(
            title: 'Beli Sekarang',
            onPressed: () {
              Get.to(
                () => Ticketing(),
              );
            },
          ),
        ),
      ],
    );
  }
}
//akhir - page-----------

//TextDp ----------------
class TextDp extends StatelessWidget {
  const TextDp({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        right: 20,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: bodySmallGrey,
          ),
          Spacer(),
          SizedBox(
            height: 8.sh,
          ),
          Text(
            data,
            style: labelMedium,
          ),
        ],
      ),
    );
  }
}
//akhir ---page

//Button -total----------------
class ButtonTotal extends StatelessWidget {
  final String title;
  final String decs;

  const ButtonTotal({
    Key? key,
    required this.title,
    required this.decs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailPaketController controller = Get.find<DetailPaketController>();

    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.LightGreen400,
                          width: 2,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF777A77),
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      counterText: '',
                      hintText: 'Masukkan Kode Kupon',
                      hintStyle: bodySmallGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            // onTap: controller.terapkan,
            child: Container(
              width: (MediaQuery.of(context).size.width - 60) / 3.5,
              height: 54,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.LightGreen500,
              ),
              child: Center(
                child: Text(
                  decs,
                  style: labelMediumWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
