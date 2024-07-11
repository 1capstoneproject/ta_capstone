import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ta_capstone/presentation/pages/check_out/checkout_paket.dart';
import 'package:ta_capstone/presentation/pages/dashboard/keranjang_screen.dart';
import 'package:ta_capstone/service/services.dart';

class DetailPaketController extends GetxController {
  
  final SharedPreferencesService prefs = Get.put(SharedPreferencesService());
  final ApiServices api = Get.put(ApiServices());

  final RxInt selectedImageIndex = 0.obs;
  final RxInt productId = 0.obs;

  final RxString productName = "".obs;
  final RxString productDescription = "".obs;
  final RxString productPrice = "".obs;
  final RxString productLocation = "".obs;
  final RxString productLongDescription = "".obs;
  final RxMap<String, dynamic> tourism = <String, dynamic>{}.obs;
  final RxList<dynamic> otherProduct = <dynamic>[].obs;
  final RxMap<String, dynamic> globalData = <String, dynamic>{}.obs;

  final RxList<dynamic> catPaket = <dynamic>[
    "https://static-00.iconduck.com/assets.00/no-image-icon-2048x2048-2t5cx953.png",
    // 'https://c4.wallpaperflare.com/wallpaper/210/493/172/landscape-photography-of-green-mountains-during-day-time-wallpaper-preview.jpg',
    // 'https://i.pinimg.com/564x/59/b9/54/59b954761d1eb3fcbbbe534ea254bc90.jpg',
    // 'https://c4.wallpaperflare.com/wallpaper/210/493/172/landscape-photography-of-green-mountains-during-day-time-wallpaper-preview.jpg',
    // 'https://i.pinimg.com/564x/59/b9/54/59b954761d1eb3fcbbbe534ea254bc90.jpg',
  ].obs;

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show();
    productId.value = Get.arguments["id"];
    await fetchDetail();
    EasyLoading.dismiss();
  }

  // fetch data dari API
  Future<void> fetchDetail() async {
    var detail = await api.getDetail(id: productId.value);
    if(detail is bool){
      return;
    }
    detail = detail["data"];
    var images = [];
    for(var image in detail['images_ids']){
      images.add("${api.endpoint}/storage/${image["path"]}");
    }
    globalData.value = detail as Map<String, dynamic>;
    catPaket.value = images;
    productName.value = detail['name'];
    productDescription.value = detail['description'];
    productPrice.value = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format((detail['price']as int));
    productLocation.value = detail['location'];
    productLongDescription.value = detail['description_details'];
    tourism.value = detail['user'];
    otherProduct.value = detail['other_product'];
  }

  Future<void> tambahKeranjang() async {
    // buat transaksi baru dengan status draft
    EasyLoading.show();
    // check data global 
    if(globalData.isEmpty){
      EasyLoading.showError("Error bang data product detail kosong");
      return;
    }
    await api.createTransaction(
      prefs.sessionApiKeys,
      productId: globalData["id"],
      tourismId: tourism["id"],
      userId: prefs.userInfo["id"],
      quantity: 1,
      price: globalData["price"],
      total: globalData["price"] * 1,
    );
    EasyLoading.showSuccess("Berhasil menambah ke keranjang");
  }

  Future<void> checkout() async {
  // buat transaksi baru dengan status draft
    EasyLoading.show();
    // check data global 
    if(globalData.isEmpty){
      EasyLoading.showError("Error bang data product detail kosong");
      return;
    }
    dynamic response = await api.createTransaction(
      prefs.sessionApiKeys,
      productId: globalData["id"],
      tourismId: tourism["id"],
      userId: prefs.userInfo["id"],
      quantity: 1,
      price: globalData["price"],
      total: globalData["price"] * 1,
    );
    EasyLoading.dismiss();
    Get.printInfo(info: response["data"].toString());
    Get.off(() => DaftarTiket(data: response['data']), arguments: response['data']);
  }

  //qr.code
  var qrData = ''.obs;

  void updateQrData(String data) {
    qrData.value = data;
  }
}
