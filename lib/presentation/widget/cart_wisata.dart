import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_capstone/presentation/pages/detail/detail_paket.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

import '../controller/homepage_controller.dart';

class CardWisata extends StatelessWidget {
  const CardWisata({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.location,
    required this.controller,
  });

  final String image;
  final String name;
  final String price;
  final String location;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return const DetailPaket();
        })));
      },
      child: SizedBox(
        width: Get.width * .65,
        height: 240,
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
                    width: Get.width * .6,
                    height: Get.width * .3,
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
                            width: 50,
                            height: 50,
                            color: Colors.orange,
                          ),
                        ),
                        Positioned(
                          top: 13,
                          right: 2.5,
                          child: Transform.rotate(
                              angle: 50 * pi / 180,
                              child: Text(
                                'Wisata',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10,
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
                            name,
                            style: titleMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.money,
                            size: 15,
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
                            size: 15,
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
