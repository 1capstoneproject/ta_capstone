import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ta_capstone/service/services.dart';
import 'package:ta_capstone/share/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // wait for binding initialize
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase | cape cape ngerapiin auto format :()
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB45kko7CZnachkE5gswZW_O5Be1sUwcDo',
      appId: '1:453247308468:android:35f4e0ecdbf792346fbde1',
      messagingSenderId: '453247308468',
      projectId: 'wonokitri-tourism',
    )
  );
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
