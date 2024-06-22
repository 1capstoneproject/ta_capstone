import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../presentation/pages/dashboard/account_screen.dart';
import '../../presentation/pages/dashboard/home_screen.dart';
import '../../presentation/pages/dashboard/keranjang_screen.dart';
import '../../presentation/pages/dashboard/navigation.dart';
import '../../presentation/pages/detail/detail_wisata.dart';
import '../../presentation/pages/onboarding.dart';
import '../../presentation/pages/splash_screen.dart';

class AppRoute {
  static const splashscreen = '/';
  static const onboarding = '/onboarding';
  static const String login = '/login';
  static const String homescreen = '/homescreen';
  static const String keranjangscreen = '/keranjangscreen';
  static const String accountscreen = '/accountscreen';
  static const String navigation = '/navigation';
  static const String detail_wisata = '/detailwisata';
  static const String detail_paket = '/detailpaket';
  static const String beli_paket = '/belipaket';
  static const String pembayaran = '/pembayaran';
  static const String ticketing = '/ticketing';

  static List<GetPage> get Route => [
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
          name: keranjangscreen,
          page: () => KeranjangScreen(),
        ),
        GetPage(
          name: accountscreen,
          page: () => AccountScreen(),
        ),
        GetPage(
          name: navigation,
          page: () => NavigationView(),
        ),
        GetPage(
          name: detail_wisata,
          page: () => DetailWisata(),
        )
      ];

  static Map<String, Widget Function()> get widget => {
        'Detail Wisata': () => DetailWisata(),
      };
}
