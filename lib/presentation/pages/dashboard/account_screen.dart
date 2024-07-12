import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/edit_account/edit_account.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';
import '../../controller/account_controller.dart';

class AccountScreen extends GetView<AccountController> {

  @override
  Widget build(BuildContext context) {
    Get.put(AccountController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Profil Saya',
          style: titleLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              Get.to(() => EditAccountScreen());
              Get.delete<AccountController>(force: true);
              Get.put(AccountController());

            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 20.sp,
          horizontal: 20.sp,
        ),
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50.sp,
                  backgroundImage: controller.prefs.userInfo['profile'] == null
                      ? AssetImage('assets/images/profil.png') as ImageProvider
                      : NetworkImage(
                        (controller.prefs.userInfo['profile'] as String).startsWith("https://") ?
                        (controller.prefs.userInfo['profile'] as String) :
                        "${controller.api.endpoint}${controller.prefs.userInfo['profile']}",
                      ) as ImageProvider,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              controller.prefs.userInfo['name']??"Silakan login",
              style: titleMedium,
            ),
          ),
          SizedBox(height: 20),
          Visibility(
            visible: controller.prefs.userInfo.isNotEmpty,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContactInfo(
                    label: 'Nomor Telepon',
                    icon: Icons.phone,
                    text: '${controller.prefs.userInfo['phone']??''}',
                  ),
                  ContactInfo(
                    label: 'Email',
                    icon: Icons.email,
                    text: '${controller.prefs.userInfo['email']}',
                  ),
                  ContactInfo(
                    label: 'Alamat',
                    icon: Icons.home,
                    text: '${controller.prefs.userInfo['address']}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String label;
  final IconData icon;
  final String text;

  ContactInfo({required this.label, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: AppColors.LightGreen400,
              ),
              SizedBox(width: 10),
              Text(
                label,
                style: titleSmall,
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 30), // Adjust as needed
            child: Text(
              text,
              style: bodySmallGrey,
            ),
          ),
        ],
      ),
    );
  }
}
