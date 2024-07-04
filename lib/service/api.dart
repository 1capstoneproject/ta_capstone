import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiServices extends GetxService {
  // base url
  final String endpoint = "https://577c-180-254-226-214.ngrok-free.app/";

  late Dio dio;

  Future<ApiServices> init() async {
    Get.printInfo(info: "Initialize Api Services.");
    dio = Dio(BaseOptions(
      baseUrl: endpoint,
    ));
    Get.printInfo(info: "Success initialize Api Services.");
    return this;
  }

  Future<dynamic> authentication(
      {required String username, required String password}) async {
    try {
      await dio.post("/api/public/auth/login",
          data: {"username": username, "password": password});
    } catch (e) {}
  }
}
