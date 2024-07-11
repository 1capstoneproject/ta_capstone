import 'package:get/get.dart';

// fungsi export ini
// but export file
// import api.dart
// import shared_prefrences

// services.dart

export './share_preference.dart';
import './share_preference.dart';

export './api.dart';
import './api.dart';

export './auth_service.dart';
import './auth_service.dart';

export './midtrans_service.dart';
import './midtrans_service.dart';

Future<void> initServices() async {
  // initialize services
  Get.printInfo(info: "Initialize services");
  await Get.putAsync(() => SharedPreferencesService().init());
  await Get.putAsync(() => ApiServices().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => MidtransServices().init());
  Get.printInfo(info: "Success initialize service");
}
