import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';
import 'package:ta_capstone/share/routes/route.dart';

import '../controller/homepage_controller.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.date,
    required this.location,
    required this.controller,
  });

  final String image;
  final String title;
  final String price;
  final String date;
  final String location;

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
    );
    return GestureDetector(
      onTap: () {
        Get.to(AppRoute.widget['Detail Wisata'], arguments: {
          'nama': 'Detail Wisata',
        });
        //Navigator.push(context, MaterialPageRoute(builder: ((context) {
        //return const DetailWisata();
        //}))); //add to route with Get.toNamed()
      },
      child: SizedBox(
        width: Get.width * .60.w,
        height: Get.height * .20.h,

        // color: Colors.red,
        child: Card(
          elevation: 7,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * .6.w,
                    height: Get.width * .3.h,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              image,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(5)),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipPath(
                          clipper: EventCliper(),
                          child: Container(
                            width: 50.w,
                            height: 50.h,
                            color: Colors.orange,
                          ),
                        ),
                        Positioned(
                          top: 13,
                          right: 2.5,
                          child: Transform.rotate(
                              angle: 50 * pi / 180,
                              child: Text(
                                'Event',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: titleMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.money,
                            size: 15.sp,
                            color: AppColors.LightGreen400,
                          ),
                          SizedBox(width: 8),
                          Text(
                            price,
                            style: labelMediumGreen,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            size: 15.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 8),
                          Text(
                            date,
                            style: labelMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.home_max,
                            size: 15.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 8),
                          Text(
                            location,
                            style: labelMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EventCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
