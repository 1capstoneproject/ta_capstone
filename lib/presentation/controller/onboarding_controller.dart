import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/service/services.dart';
import 'package:ta_capstone/presentation/pages/dashboard/home_screen.dart';

class OnboardingController extends GetxController {
  
  final AuthService auth = Get.find<AuthService>();
  final SharedPreferencesService prefs = Get.find<SharedPreferencesService>();
  final ApiServices api = Get.find<ApiServices>();

  // handle google login
  Future<void> handleSignIn() async {
    var credentials = await auth.googleSignIn();
    if(credentials != null){
      // check validasi di backend
      // untuk mendapatkan akses token untuk mengakses private API.
      var response = await api.googleAuthentication(
        gid: credentials.id,
        email: credentials.email,
        name: credentials.displayName,
        profile: credentials.photoUrl
      );
      // check response api
      if(response != null){
        // set sessions
      }
      return;
    }
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: const Text("Terjadi kesalahan saat login, silahkan coba beberapa saat lagi."),
      action: SnackBarAction(
        label: "OK",
        onPressed: ()=> Get.back(),
      ),
    ));
  }

}
