import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/check_out/checkout_paket.dart';

class DetailPaketController extends GetxController {
  var selectedImageIndex = 0.obs;
  final List<String> catPaket = [
    'https://c4.wallpaperflare.com/wallpaper/210/493/172/landscape-photography-of-green-mountains-during-day-time-wallpaper-preview.jpg',
    'https://i.pinimg.com/564x/59/b9/54/59b954761d1eb3fcbbbe534ea254bc90.jpg',
    'https://c4.wallpaperflare.com/wallpaper/210/493/172/landscape-photography-of-green-mountains-during-day-time-wallpaper-preview.jpg',
    'https://i.pinimg.com/564x/59/b9/54/59b954761d1eb3fcbbbe534ea254bc90.jpg',
  ];

  void handlePrimaryButtonPress() {
    Get.to(() => DaftarTiket());
    print("Primary button pressed");
  }

  void handleSecondaryButtonPress() {
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
