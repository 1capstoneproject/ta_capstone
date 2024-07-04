import 'package:get/get.dart';
import 'package:ta_capstone/service/auth_service.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final AuthService _authService = AuthService();

  Future<void> login() async {}
}
