import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/onboarding.dart';
import 'package:ta_capstone/service/services.dart';

class SplashController extends GetxController {
  final SharedPreferencesService sharedPreferences =
      Get.put(SharedPreferencesService());
  @override
  void onInit() async {
    super.onInit();
    //_navigateToSplash();
    print("Navigating to Home in 3 seconds");
    print(sharedPreferences.sessionUserIdKey);
    //sharedPreferences.sessionUserIdKey = 1000000;
    print(sharedPreferences.sessionUserPassword);
    //sharedPreferences.sessionUserPassword = "LogPass17";
    sharedPreferences.clear();

    await Future.delayed(Duration(seconds: 5));
    Get.offAll(() => OnboardingScreen());
  }

  //void _navigateToSplash() async {
  //print("Navigating to Home in 3 seconds");
  //await Future.delayed(Duration(seconds: 5));
  //Get.offAll(() => OnboardingScreen());
  //}
}

//ini nanti harus cek koneksi ke server 
//check dia apakah sudah ada sesion apa balum, jika dia ada sesian maka dia akan direct ke home, 
//jika belum dia akan direct ke onboard
