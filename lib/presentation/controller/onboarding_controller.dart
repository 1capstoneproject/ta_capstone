import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/service/services.dart';
import 'package:ta_capstone/presentation/pages/dashboard/home_screen.dart';

class OnboardingController extends GetxController {
  final AuthService auth = Get.find<AuthService>();

  //signin
  Future<void> handleSignIn() async {
    await auth.googleSignIn();
  }

  //logout
  Future<void> handleSignOut(BuildContext context) async {}
}
