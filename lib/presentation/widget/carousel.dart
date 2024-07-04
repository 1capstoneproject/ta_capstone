import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import '../controller/homepage_controller.dart';

class CarousleSlider extends StatelessWidget {
  const CarousleSlider({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 160.sp,
              autoPlay: true,
              aspectRatio: 2.0.sp,
              viewportFraction: 1.sp,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  controller.current.value = index,
            ),
            items: controller.imgList
                .map((item) => SizedBox(
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                "assets/images/banner.png",
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                // width: 280.0,
                                // height: 200,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Container(
                                    color: Colors.grey,
                                    child: const Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    ),
                                  );
                                },
                              ),
                              // Image.network(
                              //   item,
                              //   fit: BoxFit.cover,
                              //   width: 280.0,
                              //   height: 200,
                              //   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              //     return Container(
                              //       color: Colors.grey,
                              //       child: const Center(
                              //         child: Icon(Icons.error, color: Colors.red),
                              //       ),
                              //     );
                              //   },
                              // ),

                              // Positioned(
                              //  bottom: 0.0,
                              //   left: 0.0,
                              //   right: 0.0,
                              //   child: Container(
                              //     decoration: const BoxDecoration(
                              //       gradient: LinearGradient(
                              //         colors: [
                              //           Color.fromARGB(200, 0, 0, 0),
                              //           Color.fromARGB(0, 0, 0, 0)
                              //         ],
                              //         begin: Alignment.bottomCenter,
                              //         end: Alignment.topCenter,
                              //       ),
                              //     ),
                              //     padding: const EdgeInsets.symmetric(
                              //         vertical: 10.0, horizontal: 20.0),
                              //     child: Text(
                              //       '${controller.imgList.indexOf(item)}',
                              //       style: const TextStyle(
                              //         color: Colors.transparent,
                              //         fontSize: 20.0,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      controller.carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 6.0.sp,
                    height: 6.0.sp,
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppColors.LightGreen400)
                          .withOpacity(controller.current.value == entry.key
                              ? 0.9
                              : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
