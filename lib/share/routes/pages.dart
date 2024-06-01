import 'package:get/get.dart';

import 'package:ta_capstone/presentation/pages/home_screen.dart';
import 'package:ta_capstone/presentation/pages/navigation.dart';
import 'package:ta_capstone/presentation/pages/onboarding.dart';

import 'package:ta_capstone/share/routes/constant.dart';

import '../../presentation/pages/account_screen.dart';
import '../../presentation/pages/splash_screen.dart';
import '../../presentation/pages/transaction_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
    name: splashscreen,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: onboarding,
    page: () => OnboardingScreen(),
  ),
  GetPage(
    name: homescreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: transactionscreen,
    page: () => TransactionScreen(),
  ),
  GetPage(
    name: accountscreen,
    page: () => AccountScreen(),
  ),
  GetPage(
    name: navigation,
    page: () => NavigationView(),
  ),
];
