import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/service/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CheckoutController extends GetxController {

  // inisialisasi form validasi
  final GlobalKey<FormState> formCheckout = GlobalKey<FormState>();

  // mendapatkan service
  final SharedPreferencesService prefs = Get.find<SharedPreferencesService>();
  final ApiServices api = Get.find<ApiServices>();
  final MidtransServices midtrans = Get.find<MidtransServices>();

  // field data kontak darurat
  final TextEditingController contactName = TextEditingController();
  final TextEditingController contactPhone = TextEditingController();

  // field informasi dan kalkulasi total tagihan
  final TextEditingController date = TextEditingController();
  final TextEditingController quantity = TextEditingController(text: "1");
  final RxInt total = 0.obs;

  @override
  void onInit(){
    setData(Get.arguments);
    super.onInit();
  }

  void setData(dynamic data) {
    Get.printInfo(info: data.toString());
    date.text = data['date'];
    quantity.text = data['quantity'].toString();
    contactName.text = data["contact_name"] ?? prefs.userInfo["name"];
    contactPhone.text = data['phone_number'] ?? prefs.userInfo["phone"] ?? "";
    // Get.printInfo(info: data["contact_name"] ?? prefs.userInfo["name"]);
    // Get.printInfo(info: data['phone_number'] ?? prefs.userInfo["phone"] ?? "");
  }

  void Function() bayar(dynamic data){
    if(formCheckout.currentState != null && formCheckout.currentState!.validate()){
      return () async {
        EasyLoading.show();
        // sebelumnya melakukan flow pembayaran menggunakan midtrans
        // kita update detail transaksi terlebih dahulu
        // dan set status inprogress untuk menghindari berkali kali request
        // payment ke midtrans, dan menghindari duplicate order
        Get.printInfo(info: data['status'].toString());
        if(data['status'] == 'draft'){
          Get.printInfo(info: "Executed");
          await api.transactionBeforeRequestPayment(
            prefs.sessionApiKeys,
            data["id"],
            phoneNumber: contactPhone.text,
            name: contactName.text,
            quantity: int.parse(quantity.text),
            total: (data['price'] as int) * int.parse(quantity.text),
            price: data["price"],
            date: date.text,
          );
        }
        // menyiapkan transaksi midtrans dan mendapatkan token pembayaran
        // masalah duplicate order sudah di handle sama oni di api backend.
        dynamic response = await api.transactionRequestPayment(prefs.sessionApiKeys, transactionId: data["id"]);
        Get.printInfo(info: response.toString());
        // // melakukan flow pembayaran menggunakan midtrans
        midtrans.sdk.setUIKitCustomSetting(
          showPaymentStatus: true,
          skipCustomerDetailsPages: true,
        );
        await midtrans.sdk.startPaymentUiFlow(token: response['data']['token']);
        // crosscheck paymen
        EasyLoading.dismiss();
        Get.back();
      };
    }
    return (){};
  }
}