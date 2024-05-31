import 'package:get/get_navigation/get_navigation.dart';
import 'package:ta_capstone/presentation/pages/splash_screen.dart';
import 'package:ta_capstone/share/routes/constant.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
    name: splashscreen,
    page: () => SplashScreen(),
  ),
];
