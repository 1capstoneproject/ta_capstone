import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ta_capstone/presentation/controller/checkout_controller.dart';

import 'package:ta_capstone/presentation/pages/check_out/data_diri.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../widget/button.dart';

class DaftarTiket extends GetView<CheckoutController> {
  
  final Map<String, dynamic> data;

  const DaftarTiket({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beli Paket',
          style: titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formCheckout,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 2,
                height: 150.sp,
                child: CartWidget(
                  title: data['product']['name'],
                  image: data['product']['images_ids'].length == 0 ? "https://static-00.iconduck.com/assets.00/no-image-icon-2048x2048-2t5cx953.png" : "${controller.api.endpoint}/storage/${data['product']['images_ids'][0]['path']}",
                  date: data['product']['duration'],
                  price: NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format((data['product']['price'] as int)),
                  quantity: controller.quantity.text,
                  total: NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format((data['product']['price'] as int) * int.parse(controller.quantity.text)),
                ),
              ),
              SizedBox(height: 8),
              SelectTanggal(controller: controller),
              JumlahOrang(controller: controller),
              /** Kontak Alternative */
              SizedBox(height: 24.sp),
              Text(
                "Kontak Alternative",
                style: titleMedium,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: Text(
                  "Perhatian harap isi detail kontak, pastikan data yang anda masukan benar, untuk memungkinkan kami menginformasikan anda jika terjadi perubahan jadwal.",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey.withOpacity(.9)
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Nama",
                      style: titleSmall,
                    ),
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Nama tidak boleh kosong.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                      ),
                      controller: controller.contactName,
                    ),
                    SizedBox(height: 12.sp),
                    Text(
                      "Phone",
                      style: titleSmall,
                    ),
                    IntlPhoneField(
                      validator: (value){
                        if(value!.number.isEmpty){
                          return 'Nomer handphone tidak boleh kosong.';
                        }
                        if(value.completeNumber.isPhoneNumber){
                          return 'Nomer handphone tidak valid.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                      ),
                      controller: controller.contactPhone,
                      initialCountryCode: 'ID',
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonComponent(
            title: 'Bayar',
            onPressed: controller.bayar(data),
          ),
        ),
      ],
    );
  }
}

//akhir - page---------

//CartWidget---------------
class CartWidget extends StatelessWidget {

  final String title;
  final String image;
  final String date;
  final String price;
  final String quantity;
  final String total;

  const CartWidget({
    super.key,
    this.title = "",
    this.image = "",
    this.date = "",
    this.price = "",
    this.quantity = "",
    this.total = "",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: .8.sp,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: CartCheckout(
                    title: title,
                    date: date,
                    price: price,
                    quantity: quantity,
                    total: total,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// akhir page-------------

//Selct-Tanggal-----------
class SelectTanggal extends StatefulWidget {
  
  final CheckoutController controller;

  const SelectTanggal({
    super.key,
    required this.controller,
  });

  @override
  State<SelectTanggal> createState() => _SelectTanggalState();
}

class _SelectTanggalState extends State<SelectTanggal> {
  late TextEditingController dateController;

  @override
  void initState() {
    dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Tanggal',
              style: titleSmall,
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.sp,
                horizontal: 10.sp,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0.w,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: widget.controller.date,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Pilih tanggal';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: '19/02/2024',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.date_range),
                ),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    widget.controller.date.text = pickedDate.toString();
                  }
                },
              ),
            ),
          ],
        ));
  }
}
//akhir page-------------

//jumlah - orang-------------
class JumlahOrang extends StatefulWidget {

  final CheckoutController controller;

  const JumlahOrang({
    super.key,
    required this.controller,

  });

  @override
  State<JumlahOrang> createState() => _JumlahOrangState();
}

class _JumlahOrangState extends State<JumlahOrang> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jumlah Orang',
            style: titleSmall,
          ),
          SizedBox(
            height: 7,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Jumlah orang harus diisi';
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
            controller: widget.controller.quantity,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
          )
        ],
      )
    );
  }
}
//akhir page----

//page Cart - check - out -------
class CartCheckout extends StatelessWidget {
  final String title;
  final String date;
  final String price;
  final String quantity;
  final String total;
  const CartCheckout({
    super.key,
    required this.title,
    required this.date,
    required this.price,
    required this.quantity,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleSmall,
        ),
        SizedBox(height: 5.sp),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Durasi",
              style: titleSmall,
            ),
            Text(
              date,
              // style: bodySmallGrey,
            ),
          ]
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Harga",
              style: titleSmall,
            ),
            Text(
              price,
              // style: titleSmallGreen,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quantity",
              style: titleSmall,
            ),
            Text(
              quantity,
              // style: ti,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: titleSmall,
            ),
            Text(
              total,
              // style: titleSmallGreen,
            ),
          ],
        )

      ],
    );
  }
}
//akhir - page-----

