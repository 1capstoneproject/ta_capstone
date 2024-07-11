import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/account_controller.dart';
import 'package:ta_capstone/presentation/controller/homepage_controller.dart';
import 'package:ta_capstone/presentation/controller/transaction_controller.dart';

import '../pages/dashboard/home_screen.dart';
import '../pages/dashboard/account_screen.dart';
import '../pages/dashboard/keranjang_screen.dart';

class NavigationController extends GetxController {
  late final HomeController homeC;
  late final KeranjangController keranjangC;
  late final AccountController accountC;
  final RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  final screens = [
    HomeScreen(),
    KeranjangScreen(),
    AccountScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
    homeC = Get.put(HomeController());
    keranjangC = Get.put(KeranjangController());
    accountC = Get.put(AccountController());
  }
}
