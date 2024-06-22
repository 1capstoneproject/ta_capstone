import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/edit_account/edit_account.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';
import '../../controller/account_controller.dart';

class AccountScreen extends StatelessWidget {
  final AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Account',
          style: titleLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => EditAccountScreen());
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          Center(
            child: Obx(() {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: accountController.image.value != null
                        ? FileImage(accountController.image.value!)
                        : AssetImage('assets/images/Ovo.png') as ImageProvider,
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              '${accountController.fullName}',
              style: titleMedium,
            ),
          ),
          SizedBox(height: 20),
          Container(
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
                  text: '${accountController.phoneNumber}',
                ),
                ContactInfo(
                  label: 'Email',
                  icon: Icons.email,
                  text: '${accountController.email}',
                ),
                ContactInfo(
                  label: 'Alamat',
                  icon: Icons.home,
                  text: '${accountController.address}',
                ),
              ],
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
