import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ta_capstone/service/services.dart';

class AccountEditController extends GetxController {
  final Rx<File?> image = Rx<File?>(null);

  final SharedPreferencesService prefs = Get.find<SharedPreferencesService>();
  final ApiServices api = Get.find<ApiServices>();

  final GlobalKey<FormState> usersEditForm = GlobalKey<FormState>();

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  // Variabel untuk menyimpan data akun
  var fullName = ''.obs;
  var phoneNumber = ''.obs;
  var email = ''.obs;
  var address = ''.obs;

  // TextEditingController untuk mengontrol input dari user
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void onInit() {
    // Mengambil data saat ini untuk ditampilkan di form
    fullNameController.text = prefs.userInfo["name"] ?? "";
    phoneController.text = prefs.userInfo["phone"] ?? "";
    emailController.text = prefs.userInfo["email"] ?? "";
    addressController.text = prefs.userInfo["address"] ?? "";
    super.onInit();
  }

  // Fungsi untuk menyimpan perubahan data akun
  Future<void> updateAccountInfo() async {
    // form validasi
    if(usersEditForm.currentState != null && usersEditForm.currentState!.validate()){
      EasyLoading.show(status: "Sedang mengupdate data user harap tunggu.");
      dynamic response = await api.updateUser(
        prefs.sessionApiKeys,
        prefs.userInfo['id'],
        fullName: fullNameController.text,
        phone: phoneController.text,
        email: emailController.text,
        address: addressController.text,
        profile: image.value
      ).catchError((e) => print(e));
      if(response is bool){
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text("Gagal mengupdate users."),
            action: SnackBarAction(
              label: "OK",
              onPressed: () => Get.back(),
            ),
          ),
        );
        EasyLoading.dismiss();
        return;
      }
      EasyLoading.dismiss();
      var userData = response['data'];
      prefs.userInfo = userData;
      Get.back();
    }
  }

  @override
  void onClose() {
    // Membersihkan TextEditingController saat widget dihapus
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
