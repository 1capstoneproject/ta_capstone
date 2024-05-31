import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/onboarding.dart';



class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToSplash();
  }

  void _navigateToSplash() async {
    print("Navigating to Home in 3 seconds");
    await Future.delayed(Duration(seconds: 5));
    Get.offAll(() =>OnboardingScreen());

  }
}
