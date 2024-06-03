import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController homeC;

  @override
  void onInit() {
    homeC = TextEditingController();
    super.onInit();
  }
}