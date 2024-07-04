import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ta_capstone/presentation/pages/check_out/checkout_paket.dart';
import 'package:ta_capstone/presentation/pages/payment/payment.dart';
import 'package:ta_capstone/presentation/widget/button.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class DataDiri extends StatelessWidget {
  const DataDiri({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Diri',
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
            TextDr(),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: 'Nama Kelompok',
              hidetitle: 'nama kelompok',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: 'Email',
              hidetitle: 'email',
            ),
            SizedBox(
              height: 10,
            ),
            Customphone(
              title: 'Nomor Hp Kelompok',
              hidetitle: 'nomor hp kelompok',
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
                () => Pembayaran(),
              );
            },
          ),
        ),
      ],
    );
  }
}

//akhir - page-----------

//first - page ---------
class Customphone extends StatelessWidget {
  final String title;
  final String hidetitle;

  const Customphone({
    super.key,
    required this.title,
    required this.hidetitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: titleMedium),
          const SizedBox(height: 8),
          IntlPhoneField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.LightGreen400,
                ),
              ),
            ),
            initialCountryCode: 'INA',
            inputFormatters: [
              FilteringTextInputFormatter
                  .digitsOnly, // Hanya menerima input angka
            ],
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
        ],
      ),
    );
  }
}
//end - page----------

//TextFieldDr-------------
class CustomTextField extends StatelessWidget {
  final String title;
  final String hidetitle;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hidetitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: titleSmall,
          ),
          const SizedBox(height: 8),
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
              hintText: hidetitle,
              hintStyle: bodySmallGrey,
            ),
          ),
        ],
      ),
    );
  }
}
//akhir - page-----------

//widget TextDr -------------
class TextDr extends StatelessWidget {
  const TextDr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'Data Diri',
            style: titleSmall,
          ),
          Text(
            'Masukkan data diri dari kelompok anda',
            style: bodySmallGrey,
          ),
        ],
      ),
    );
  }
}
