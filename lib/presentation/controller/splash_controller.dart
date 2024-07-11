import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/service/services.dart';
import 'package:ta_capstone/share/routes/route.dart';

class SplashController extends GetxController {
  
  final SharedPreferencesService prefs = Get.find<SharedPreferencesService>();
  final ApiServices apiServices = Get.find<ApiServices>();

  @override
  void onInit() async {
    super.onInit();
    
    // cek konektifitas server apakah tersedia atau tidak
    var isOk = await apiServices.ping();
    if(!isOk) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text("Galat Jaringan, Gagal terhubung dengan server, silakah check koneksi kamu atau gunakan jaringan wifi dan coba kembali beberapa saat lagi."),
        action: SnackBarAction(
          label: "Siap Komandan",
          onPressed: ()=> Get.back(),
        ),
      ));
    }

    await Future.delayed(Duration(milliseconds: 500), () async {
      // check login user ketika userid itu ada dan session googleid ada maka redirect
      // ke home page, jika tidak maka kirim ke neraka.
      if(prefs.sessionApiKeys != ""){
        
        // validasi ulang apakah token masih bisa di gunakan atau tidak
        var isValid = await apiServices.validate(token: prefs.sessionApiKeys);
        if(isValid is bool) {
          // clear all sessions
          await prefs.deleteSession();
          // redirect to onboard pages
          Get.offAllNamed(AppRoute.onboarding);
          return;
        }
        
        // save session valid ke sharedpreference
        // katanya biar hemat request.
        prefs.userInfo = isValid["data"];

        Get.offAllNamed(AppRoute.homescreen);
        return;
      }
      Get.offAllNamed(AppRoute.onboarding);
    });
  }
}
