import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/homepage_controller.dart';
import 'package:ta_capstone/presentation/widget/carousel.dart';
import 'package:ta_capstone/presentation/widget/cart_event.dart';
import 'package:ta_capstone/presentation/widget/cart_wisata.dart';
import 'package:ta_capstone/presentation/widget/cart_wisata_populer.dart';
import 'package:ta_capstone/presentation/widget/search.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

//ini ntar di ubah ke stateless
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      HomeController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: HomeClipper(),
              child: Container(
                height: 250,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Header(name: 'name'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldsearch(),
                      SizedBox(
                        height: 10,
                      ),
                      CarousleSlider(controller: controller),
                      Text(
                        'Event Mendatang',
                        style: titleMedium,
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CardEvent(
                                image: 'image',
                                title: 'title',
                                price: 'price',
                                date: 'date',
                                location: 'location',
                                controller: controller,
                              );
                            }),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Paket Wisata',
                        style: titleMedium,
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CardWisata(
                                image: 'image',
                                name: 'name',
                                price: 'price',
                                location: 'location',
                                controller: controller,
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Wisata Populer',
                        style: titleMedium,
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 2,
                            childAspectRatio: 1 / 1.3,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return CardWisataPopuler(
                              image: 'image',
                              name: 'name',
                              location: 'location',
                              controller: controller,
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
        ]);
  }
}
