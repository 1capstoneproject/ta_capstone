import 'package:get/get.dart';
import 'package:ta_capstone/service/services.dart';

class AccountController extends GetxController {

  final SharedPreferencesService prefs = Get.find<SharedPreferencesService>();
  final ApiServices api = Get.find<ApiServices>();

}
