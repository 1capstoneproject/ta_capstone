import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/share/routes/constant.dart';
import 'package:ta_capstone/share/routes/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //getPages: routes,
      //initialRoute: splashscreen,
      getPages: AppRoute.Route,
      initialRoute: AppRoute.splashscreen,
    );
  }
}
