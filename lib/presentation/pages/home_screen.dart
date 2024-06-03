import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/homepage_controller.dart';
import 'package:ta_capstone/presentation/widget/search.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: HomeClipper(),
                child: Container(
                  height: 250, // Adjust the height as needed
                  color: AppColors
                      .LightGreen500, // Change this to any color or widget you want
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hi ${''}',
                      style: titleMediumWhite,
                    ),
                    Text(
                      'Ayo jelajahi Desa Wonokitri',
                      style: labelMediumWhite,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextFieldsearch(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
