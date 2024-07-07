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

  // fungsi check credensial auhtentikasi ke server
  Future<dynamic> authentication({ required String username, required String password }) async {
    try {
      var response = await dio.post(
        "/api/public/auth/login",
        data: {
          "username": username,
          "password": password
        }
      );
      return response.data;
    } catch (e) {
      Get.printError(info: e.toString());
      return null;
    }
  }

  // fungsi check credensial menggunakan oauth google
  Future<dynamic> googleAuthentication({
    required String gid,
    required String email,
    String? name = "",
    String? profile = "",
  }) async {
    try {
      var response = await dio.post(
        "/api/public/auth/login",
        data: {
          "gid": gid,
          "email": email,
          "name": name,
          "profile": profile,
        }
      );
      return response.data;
    }catch(e){
      Get.printError(info: e.toString());
      return null;
    }
  }

  // fungsi untuk check konektifitas ke server
  Future<bool> ping() async {
    try {
      await dio.get("/api");
      return true;
    } catch (e) {
      Get.printError(info: e.toString());
      return false;
    }
  }
}
