import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AccountController extends GetxController {
  var image = Rx<File?>(null);

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
    fullNameController.text = fullName.value;
    phoneController.text = phoneNumber.value;
    emailController.text = email.value;
    addressController.text = address.value;
    super.onInit();
  }

  // Fungsi untuk menyimpan perubahan data akun
  void updateAccountInfo({
    required String fullName,
    required String phone,
    required String email,
    required String address,
  }) {
    this.fullName.value = fullName;
    phoneNumber.value = phone;
    this.email.value = email;
    this.address.value = address;
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
