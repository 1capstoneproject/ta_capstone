import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiServices extends GetxService {

  // base url
  final String endpoint = "https://mouse-capable-entirely.ngrok-free.app";

  // local a
  // final String endpoint = "http://192.168.86.81:8000";
  // final String endpoint = "http://192.168.1.2:8000 ";

  late Dio dio;

  Future<ApiServices> init() async {
    Get.printInfo(info: "Initialize Api Services.");
    dio = Dio(BaseOptions(
      baseUrl: endpoint,
    ));
    Get.printInfo(info: "Success initialize Api Services.");
    return this;
  }

  // fungsi auhtentikasi ke server
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

  // fungsi untuk memvalidasi token jika token expired, maka
  // user akan di force logout dan hapus session.
  Future<dynamic> validate({ required String token }) async {
    try {
      var response = await dio.post(
        "/api/private/session",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          }
        )
      );
      return response.data;
    } catch (e) {
      Get.printError(info: e.toString());
      return false;
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

  // @REGION: TRANSACTION API CONSUMER
  Future<dynamic> allTransaction({ required String token }) async {
    try{
      var response = await dio.post(
        "/api/private/transaction",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          }
        )
      );
      return response.data;
    }catch(e){
      Get.printError(info: e.toString());
      return false;
    }
  }

  Future<dynamic> deleteTransaction(String token, { required int id }) async {
    try{
      var response = await dio.post(
        "/api/private/transaction/delete/${id}",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          }
        )
      );
      return response.data;
    } on DioException catch(e){
      Get.printError(info: e.response.toString());
      return false;
    }catch(e){
      return false;
    }
  }

  Future<dynamic> createTransaction(
    String token,
    {
      required int productId,
      required int userId,
      required int tourismId,
      required int quantity,
      required int total,
      required int price,
      // optional field
      String phoneNumber = "",
      String contactNumber = "",
      String orderData = "",
    }
  ) async {
    try{
      var response = await dio.post(
        "/api/private/transaction/create",
        data: {
          "product_id": productId,
          "user_id": userId,
          "tourism_id": tourismId,
          "quantity": quantity,
          "price": price,
          "total": total,
          "phone_number": phoneNumber,
          "contact_number": contactNumber,
          "order_data": orderData
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          }
        )
      );
      return response.data;
    }on DioException catch(e){
      Get.printError(info: e.response.toString());
    }catch(e){
     
      Get.printError(info: e.toString());
      return false;
    }
  }

  Future<dynamic> transactionBeforeRequestPayment(
    String token,
    int id,
    {
      required String phoneNumber,
      required String name,
      required int quantity,
      required int total,
      required int price,
      required String date,
    }
  ) async {
    try{
      // var response = await
      var response = await dio.post(
        "/api/private/transaction/edit/$id",
        data: {
          "phone_number": phoneNumber,
          "contact_name": name,
          "status": "inprogress",
          "price": price,
          "total": total,
          "quantity": quantity,
          "date": date,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          }
        )
      );
      return response.data;
    }on DioException catch(e){
      Get.printError(info: e.response.toString());
    }catch(e){
      Get.printError(info: e.toString());
      return false;
    }
  }

  Future<dynamic> transactionRequestPayment(String token, { required int transactionId }) async {
    try {
      var response = await dio.post(
        "/api/private/transaction/request/payment/$transactionId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",   
          }
        )
      );
      return response.data;
    } on DioException catch(e){
      Get.printError(info: e.response.toString());
      return false;
    }catch(e){
      Get.printError(info: e.toString());
      return false;
    }
  }
  // @ENDREGION

  // @REGION: USER API CONSUMER
  Future<dynamic> updateUser() async {}

  Future<dynamic> requestDelete() async {}
  // @ENDREGION


}
