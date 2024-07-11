import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/service/api.dart';
import 'package:ta_capstone/service/share_preference.dart';

class HomeController extends GetxController {
  late TextEditingController homeC;

  final RxBool isLoading = false.obs;

  final RxList<String> bannerList = <String>[].obs;
  final RxList<dynamic> eventList = <dynamic>[].obs;
  final RxList<dynamic> packageList = <dynamic>[].obs;
  final RxList<dynamic> productList = <dynamic>[].obs;
  final RxList<dynamic> popularList = <dynamic>[].obs;

  final SharedPreferencesService prefs = Get.find<SharedPreferencesService>();
  final ApiServices api = Get.find<ApiServices>();
  
  final RxBool isSavedEventPackage = false.obs;

  // mendapatkan data banner.
  Future<void> fetchBanner() async {
    var banner = await api.allBanner();
    if(banner is bool){
      return;
    }
    for(var banners in banner["data"]){
      bannerList.add("${api.endpoint}${banners["path"]}");
    }
  }

  // mendapatkan produk wisata yang sedang event.
  Future<void> fetchEventProduct() async {
    var product = await api.allProductEvent();
    if(product is bool){
      return;
    }
    eventList.value = product["data"];
  }

  // mendapatkan data paket wisata.
  Future<void> fetchPackage() async {
    var product = await api.allPackage();
    if(product is bool){
      return;
    }
    packageList.value = product["data"];
  }

  // mendapatkan data produk wisata
  Future<void> fetchProduct() async {
    var product = await api.allProduct();
    if(product is bool){
      return;
    }
    productList.value = product["data"];
  }

  // mendapatkan data produk populer
  Future<void> fetchPopular() async {
    var product = await api.allProduct();
    if(product is bool){
      return;
    }
    popularList.value = product["data"];
  }

  // mendapatkan semua data
  Future<void> fetchAll() async {
    isLoading.value = true;
    // reset all state
    bannerList.value = [];
    eventList.value = [];
    packageList.value = [];
    productList.value = [];
    popularList.value = [];

    // fetch all data.
    await fetchBanner();
    await fetchEventProduct();
    await fetchPackage();
    await fetchProduct();

    isLoading.value = false;
  }

  @override
  void onInit() async {
    super.onInit();
    Get.printInfo(info: prefs.userInfo.toString());
    homeC = TextEditingController();
    await fetchAll();
  }
}
