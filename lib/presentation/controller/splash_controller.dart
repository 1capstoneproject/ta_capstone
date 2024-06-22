import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/onboarding.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    //_navigateToSplash();
    print("Navigating to Home in 3 seconds");
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
