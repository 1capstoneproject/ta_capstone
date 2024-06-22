import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/dashboard/navigation.dart';
import 'package:ta_capstone/share/app_style/style.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Import intl_phone_field package
import '../../controller/account_controller.dart';

import '../dashboard/account_screen.dart'; // Assuming the file path to AccountScreen

class EditAccountScreen extends StatelessWidget {
  final AccountController accountController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengaturan Akun',
          style: titleLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.data_saver_on),
            onPressed: () {
              // Save changes to controller when save button is pressed
              accountController.updateAccountInfo(
                fullName: accountController.fullNameController.text,
                phone: accountController.phoneController.text,
                email: accountController.emailController.text,
                address: accountController.addressController.text,
              );
              // Navigate back to AccountScreen
              Get.to(() => NavigationView());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: accountController.image.value != null
                          ? FileImage(accountController.image.value!)
                          : AssetImage('assets/images/default_avatar.png')
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          iconSize: 15,
                          icon: Icon(
                            Icons.camera_alt,
                          ),
                          onPressed: accountController.pickImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Lengkap',
                    style: titleSmall,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: accountController.fullNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.LightGreen400,
                        ),
                      ),
                    ),
                    style: bodySmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nomor Telepon',
                    style: titleSmall,
                  ),
                  SizedBox(height: 8),
                  IntlPhoneField(
                    controller: accountController.phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.LightGreen400,
                        ),
                      ),
                    ),
                    initialCountryCode:
                        'ID', // Initial country code (e.g., Indonesia = ID)
                    onChanged: (phone) {
                      print(phone
                          .completeNumber); // Print the complete phone number
                    },
                    style: bodySmall,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: titleSmall,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: accountController.emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.LightGreen400,
                        ),
                      ),
                    ),
                    style: bodySmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alamat',
                    style: titleSmall,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: accountController.addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.LightGreen400,
                        ),
                      ),
                    ),
                    style: bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
