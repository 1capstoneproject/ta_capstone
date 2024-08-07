import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/navigation_controller.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => FloatingNavbar(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(8),
          borderRadius: 25,
          itemBorderRadius: 25,
          backgroundColor: AppColors.LightGreen500,
          selectedBackgroundColor: Colors.white,
          selectedItemColor: AppColors.LightGreen500,
          items: [
            FloatingNavbarItem(
              icon: Icons.home,
            ),
            FloatingNavbarItem(
              icon: Icons.card_travel,
            ),
            FloatingNavbarItem(
              icon: Icons.person,
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: (val) {
            controller.selectedIndex.value = val;
            controller.pageController.jumpToPage(val);
          },
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        children: controller.screens,
        onPageChanged: (index){
          controller.selectedIndex.value = index;
          controller.pageController.jumpToPage(index);
        },
      ),
    );
  }
}
