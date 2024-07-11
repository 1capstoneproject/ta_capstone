import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/service/services.dart';
import 'package:ta_capstone/share/routes/route.dart';

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
        prefs.sessionApiKeys = response["messages"];
        var isValid = await api.validate(token: prefs.sessionApiKeys);
        // save session valid ke sharedpreference
        // katanya biar hemat request.
        prefs.userInfo = isValid["data"];
        // redirect ke dashboard
        Get.offAllNamed(AppRoute.homescreen);
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
