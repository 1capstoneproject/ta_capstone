import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController homeC;

  final List<String> imgList = [
    'https://c4.wallpaperflare.com/wallpaper/210/493/172/landscape-photography-of-green-mountains-during-day-time-wallpaper-preview.jpg',
    'https://c4.wallpaperflare.com/wallpaper/486/575/697/black-4-legged-insect-tiny-tiny-wallpaper-preview.jpg',
    'https://c4.wallpaperflare.com/wallpaper/284/892/1012/indonesia-sunrise-4k-bromo-volcano-wallpaper-preview.jpg',
    'https://c4.wallpaperflare.com/wallpaper/968/653/146/volcano-mountains-bromo-tengger-semeru-national-park-semeru-wallpaper-preview.jpg',
    'https://c0.wallpaperflare.com/preview/170/425/70/indonesia-bromo-tengger-semeru-national-park-mountain-folks.jpg',
    'https://c4.wallpaperflare.com/wallpaper/831/674/532/nature-landscape-mount-bromo-indonesia-wallpaper-preview.jpg',
  ];

  late CarouselController carouselController;
  final RxInt current = 0.obs;
  final RxBool isSavedEventPackage = false.obs;

  @override
  void onInit() {
    homeC = TextEditingController();
    carouselController = CarouselController();

    super.onInit();
  }
}
