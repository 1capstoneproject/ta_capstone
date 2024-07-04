import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/homepage_controller.dart';
import 'package:ta_capstone/presentation/widget/carousel.dart';
import 'package:ta_capstone/presentation/widget/cart_event.dart';
import 'package:ta_capstone/presentation/widget/cart_wisata.dart';
import 'package:ta_capstone/presentation/widget/cart_wisata_populer.dart';
import 'package:ta_capstone/presentation/widget/search.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';
import 'package:dio/dio.dart';

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
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              var data = snapshot.data!;

              return Stack(
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
                            CarousleSlider(controller: controller),
                            Text(
                              'Event Mendatang',
                              style: titleMedium,
                            ),
                            SizedBox(
                              height: 240.h,
                              child: ListView.builder(
                                itemCount: data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var event = data[index];
                                  return CardEvent(
                                    image: event['image'],
                                    title: event['title'],
                                    price: event['price'],
                                    date: event['date'],
                                    location: event['location'],
                                    controller: controller,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Paket Wisata',
                              style: titleMedium,
                            ),
                            SizedBox(
                              height: 240.h,
                              child: ListView.builder(
                                itemCount: data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var package = data[index];
                                  return CardWisata(
                                    image: package['image'],
                                    name: package['title'],
                                    price: package['price'],
                                    location: package['location'],
                                    controller: controller,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              'Wisata Populer',
                              style: titleMedium,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1 / 1.3,
                              ),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                var popular = data[index];
                                return CardWisataPopuler(
                                  image: popular['image'],
                                  name: popular['title'],
                                  location: popular['location'],
                                  controller: controller,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<dynamic>> fetchData() async {
    try {
      var dio = Dio();
      var response = await dio.get('http://192.168.42.217//api/event.php');
      if (response.statusCode == 200) {
        print(response.statusCode);
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
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
