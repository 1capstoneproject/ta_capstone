import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/account_edit_controller.dart';
import 'package:ta_capstone/share/app_style/style.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Import intl_phone_field package

// Assuming the file path to AccountScreen

class EditAccountScreen extends GetView<AccountEditController> {

  @override
  Widget build(BuildContext context) {
    Get.put(AccountEditController());
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
            onPressed: controller.updateAccountInfo,
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
                      radius: 50.sp,
                      backgroundImage: controller.image.value != null
                          ? FileImage(controller.image.value!)
                          : AssetImage('assets/images/profil.png')
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
                          onPressed: controller.pickImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: controller.usersEditForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Lengkap',
                      style: titleSmall,
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: controller.fullNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.LightGreen400,
                          ),
                        ),
                      ),
                      style: bodySmall,
                      validator: (value){
                        if(value == null){
                          return "Nama lengkap tidak boleh kosong.";
                        }
                        if(value.isEmpty){
                          return "Nama lengkap tidak boleh kosong";
                        }
                        return null;
                      }
                    ),
                  ],
                ),
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
                    controller: controller.phoneController,
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
                    validator: (value){
                      if(value != null){
                        return "Nomer telepon tidak boleh kosong.";
                      }
                      if(!value!.isValidNumber()){
                        return "Nomer telepon tidak valid";
                      }
                      if(!value.number.isEmpty){
                        return "Nomer telepon tidak boleh kosong";
                      }
                      return null;
                    }
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
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.LightGreen400,
                        ),
                      ),
                    ),
                    style: bodySmall,
                    readOnly: true,
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
                    controller: controller.addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.LightGreen400,
                        ),
                      ),
                    ),
                    style: bodySmall,
                    validator: (value){
                      if(value == null){
                        return "Alamat tidak boleh kosong";
                      }
                      if(value.isEmpty){
                        return "Alamat tidak boleh kosong";
                      }
                      return null;
                    }
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
