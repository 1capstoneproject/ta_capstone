import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/service/services.dart';
import 'package:ta_capstone/share/routes/route.dart';

class KeranjangController extends GetxController {
  
  final SharedPreferencesService prefs = Get.find<SharedPreferencesService>();
  final ApiServices api = Get.find<ApiServices>();

  final RxList<dynamic> transaction = [].obs;

  Future<void> fetchAllTransaction() async {
    var tx = await api.allTransaction(token: prefs.sessionApiKeys);
    if(tx is bool) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("Galat mendapatkan data transaksi, silakan coba beberapa saat lagi."),
        action: SnackBarAction(
          label: "OK",
          onPressed: () => Get.back(),
        ),
      ));
      return;
    }
    transaction.value = tx["data"];
  }

  // fungsi buat mengpaus transaksi
  Future<void> actionDeleteTransaction(int id) async {
    // tampilkan loading screen
    EasyLoading.show();
    // aksi api consume untuk menghapus transaksi
    var res = await api.deleteTransaction(prefs.sessionApiKeys, id: id);
    // check response transaksi, jika response bolean maka menampilkan error
    if(res is bool){
      // cancel loading
      EasyLoading.dismiss();
      // menampilkan error
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("Galat saat menghapus data transaksi, silakan coba beberapa saat lagi."),
        action: SnackBarAction(
          label: "OK",
          onPressed: () => Get.back(),
        ),
      ));
      // return agar fungsi selanjutnya tidak di jalankan.
      return;
    }
    // refresh list transaksi
    await fetchAllTransaction();
    // tampilkan pesan sukses mengpus transaksi
    EasyLoading.showSuccess("berhasil menghapus wisata dari keranjang.");
  }

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show();
    if(prefs.sessionApiKeys != "") {
      // EasyLoading.dismiss();
      // Get.offAndToNamed(AppRoute.onboarding);
      await fetchAllTransaction();
      EasyLoading.dismiss();
    }else{
      EasyLoading.showError("Silakan masuk untuk melanjutkan.");
    }
    
    EasyLoading.dismiss();
  }
}
