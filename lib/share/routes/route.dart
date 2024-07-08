import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ta_capstone/presentation/pages/detail/detail.dart';
import 'package:ta_capstone/presentation/pages/dashboard/account_screen.dart';
import 'package:ta_capstone/presentation/pages/dashboard/keranjang_screen.dart';
import 'package:ta_capstone/presentation/pages/dashboard/navigation.dart';
import 'package:ta_capstone/presentation/pages/onboarding.dart';
import 'package:ta_capstone/presentation/pages/splash_screen.dart';

class AppRoute {
  static const String splashscreen = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String homescreen = '/homescreen';
  static const String keranjangscreen = '/keranjangscreen';
  static const String accountscreen = '/accountscreen';
  static const String navigation = '/navigation';
  static const String detail = '/detail';
  static const String beli_paket = '/belipaket';
  static const String pembayaran = '/pembayaran';
  static const String ticketing = '/ticketing';

  static List<GetPage> get routes => [
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
          page: () => NavigationView(),
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
          name: detail,
          page: () => DetailScreen(),
        ),
      ];
}
