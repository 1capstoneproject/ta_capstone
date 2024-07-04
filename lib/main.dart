import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ta_capstone/service/services.dart';
import 'package:ta_capstone/share/routes/route.dart';

void main() async {
  // wait for binding initialize
  WidgetsFlutterBinding.ensureInitialized();
  // initialize services
  await initServices();
  // initialize screenutil
  await ScreenUtil.ensureScreenSize();

  runApp(ScreenUtilInit(
    builder: (context, _) {
      return GetMaterialApp(
        getPages: AppRoute.routes,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoute.splashscreen,
      );
    },
  ));
}
