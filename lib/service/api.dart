import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiServices extends GetxService {

  // base url
  // final String endpoint = "https://577c-180-254-226-214.ngrok-free.app/";

  // local
  final String endpoint = "http://192.168.1.2:8000";

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

  // fungsi buat consume banner dari server.
  Future<dynamic> allBanner() async {
    try {
      var response = await dio.get("/api/public/banner");
      return response.data;
    }catch(e){
      Get.printError(info: e.toString());
      return false;
    }
  }

  // @REGION: PRODUCT API CONSUMER

  // fungsi buat consume api produk event dari server.
  Future<dynamic> allProductEvent() async {
    try{
      var response = await dio.get("/api/public/product/event");
      return response.data;
    }catch(e){
      Get.printError(info: e.toString());
      return false;
    }
  }

  // fungsi buat consume api paket dari server.
  Future<dynamic> allPackage() async {
    try{
      var response = await dio.get("/api/public/product/package");
      return response.data;
    }catch(e){
      Get.printError(info: e.toString());
      return false;
    }
  }

  // fungsi buat consume api produk dari server.
  Future<dynamic> allProduct() async {
    try{
      var response = await dio.get("/api/public/product");
      return response.data;
    }catch(e){
      Get.printError(info: e.toString());
      return false;
    }
  }

  Future<dynamic> getDetail({ required int id }) async {
    try{
      var response = await dio.get("/api/public/product/details/$id");
      return response.data;
    }catch(e){
      Get.printError(info: e.toString());
      return false;
    }
  }

  // @ENDREGION
}
