import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/check_out/checkout_paket.dart';
import 'package:ta_capstone/presentation/pages/dashboard/keranjang_screen.dart';
import 'package:ta_capstone/service/services.dart';

class DetailPaketController extends GetxController {
  
  final SharedPreferencesService prefs = Get.put(SharedPreferencesService());
  final ApiServices api = Get.put(ApiServices());

  var selectedImageIndex = 0.obs;
  final RxInt productId = 0.obs;

  final RxString productName = "".obs;
  final RxString productDescription = "".obs;
  final RxString productPrice = "".obs;
  final RxString productLocation = "".obs;
  final RxString productLongDescription = "".obs;

  final RxList<dynamic> catPaket = <dynamic>[
    "https://static-00.iconduck.com/assets.00/no-image-icon-2048x2048-2t5cx953.png",
    // 'https://c4.wallpaperflare.com/wallpaper/210/493/172/landscape-photography-of-green-mountains-during-day-time-wallpaper-preview.jpg',
    // 'https://i.pinimg.com/564x/59/b9/54/59b954761d1eb3fcbbbe534ea254bc90.jpg',
    // 'https://c4.wallpaperflare.com/wallpaper/210/493/172/landscape-photography-of-green-mountains-during-day-time-wallpaper-preview.jpg',
    // 'https://i.pinimg.com/564x/59/b9/54/59b954761d1eb3fcbbbe534ea254bc90.jpg',
  ].obs;

  @override
  void onInit() {
    super.onInit();
    productId.value = Get.arguments["id"];
    fetchDetail();
  }

  // fetch data dari API
  Future<void> fetchDetail() async {
    var detail = await api.getDetail(id: productId.value);
    Get.printInfo(info: detail.toString());
  }

  void handlePrimaryButtonPress() {
    Get.to(() => DaftarTiket());
    print("Primary button pressed");
  }

  void handleSecondaryButtonPress() {
    Get.to(() => KeranjangScreen());
    print("Secondary button pressed");
  }

  void terapkan() {
    print("Tombol Terapkan");
  }

  //qr.code
  var qrData = ''.obs;

  void updateQrData(String data) {
    qrData.value = data;
  }
}
