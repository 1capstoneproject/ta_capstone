import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ta_capstone/presentation/controller/homepage_controller.dart';
import 'package:ta_capstone/presentation/widget/carousel.dart';
import 'package:ta_capstone/presentation/widget/card_wisata.dart';
import 'package:ta_capstone/presentation/widget/search.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
    );
    Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.fetchAll,
          child: Stack(
            children: [
              ClipPath(
                clipper: HomeClipper(),
                child: Container(
                  height: 250.h,
                  color: AppColors.LightGreen500,
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Header(name: 'User'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFieldsearch(),
                        SizedBox(height: 10),
                        CarousleSlider(bannerList: controller.bannerList),
                        Text(
                          'Event Mendatang',
                          style: titleMedium,
                        ),
                        SizedBox(
                            height: 240.sp,
                            child: Obx(
                              () => ListView.builder(
                                itemCount: controller.eventList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var event = controller.eventList[index];
                                  return CardWisata(
                                    id: event['id'],
                                    image: event['images_ids'].length == 0
                                        ? ""
                                        : "${controller.api.endpoint}/storage/${event['images_ids'][0]['path']}",
                                    name: event['name'] ?? "",
                                    price: NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0)
                                        .format((event['price'] as int)),
                                    location: event['location'] ?? "",
                                    type: "Event",
                                  );
                                },
                              ),
                            )),
                        SizedBox(height: 8.h),
                        Text(
                          'Paket Wisata',
                          style: titleMedium,
                        ),
                        SizedBox(
                            height: 180.h,
                            child: Obx(
                              () => ListView.builder(
                                itemCount: controller.packageList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var package = controller.packageList[index];
                                  return CardWisata(
                                    id: package['id'],
                                    image: package['images_ids'].length == 0
                                        ? ""
                                        : "${controller.api.endpoint}/storage/${package['images_ids'][0]['path']}",
                                    name: package['name'],
                                    price: NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0)
                                        .format((package['price'] as int)),
                                    location: package['location'],
                                  );
                                },
                              ),
                            )),
                        const SizedBox(height: 7),
                        Text(
                          'Wisata Populer',
                          style: titleMedium,
                        ),
                        Obx(() => GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1 / 1.3,
                              ),
                              itemCount: controller.productList.length,
                              itemBuilder: (context, index) {
                                var popular = controller.packageList[index];
                                return CardWisata(
                                  id: popular['id'],
                                  image: popular['images_ids'].length == 0
                                      ? ""
                                      : "${controller.api.endpoint}/storage/${popular['images_ids'][0]['path']}",
                                  name: popular['name'],
                                  price: NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format((popular['price'] as int)),
                                  location: popular['location'],
                                  type: "Populer",
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> fetchData() async {
    return [];
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

class Header extends StatelessWidget {
  final String name;

  const Header({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'Hi $name,',
          style: titleMediumWhite,
        ),
        Text(
          'Ayo jelajahi Desa Wonokitri',
          style: labelMediumWhite,
        ),
      ],
    );
  }
}
