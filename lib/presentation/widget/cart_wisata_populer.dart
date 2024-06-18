import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/share/app_style/style.dart';

import '../controller/homepage_controller.dart';

class CardWisataPopuler extends StatelessWidget {
  const CardWisataPopuler({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.controller,
  });

  final String image;
  final String name;

  final String location;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: Get.width * 50,
        height: Get.height * 60,

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
                    width: Get.width * .6,
                    height: Get.width * .4,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              image,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(5)),
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
