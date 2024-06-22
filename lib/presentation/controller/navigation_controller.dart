import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/account_controller.dart';
import 'package:ta_capstone/presentation/controller/homepage_controller.dart';
import 'package:ta_capstone/presentation/controller/transaction_controller.dart';

import 'package:ta_capstone/presentation/pages/dashboard/home_screen.dart';

import '../pages/dashboard/account_screen.dart';
import '../pages/dashboard/keranjang_screen.dart';

class NavigationController extends GetxController {
  final homeC = Get.lazyPut(() => HomeController());
  final Keranjangc = Get.lazyPut(() => KeranjangController());
  final accountC = Get.lazyPut(() => AccountController());
  final RxInt selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const KeranjangScreen(),
    AccountScreen(),
  ];
}
