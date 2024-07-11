import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ta_capstone/presentation/controller/detail_controller.dart';
import 'package:ta_capstone/presentation/widget/card_wisata.dart';
import 'package:ta_capstone/presentation/widget/icon_detail.dart';
import 'package:ta_capstone/presentation/widget/text_detail.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class DetailScreen extends GetView<DetailPaketController> {

  // final String title;

  const DetailScreen({
    super.key,
    // required this.title,
  });

  @override
  Widget build(BuildContext context){
    Get.put(DetailPaketController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail",
          style: titleLarge,
        ),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: controller.catPaket.length == 0 ? NetworkImage("https://static-00.iconduck.com/assets.00/no-image-icon-2048x2048-2t5cx953.png") : NetworkImage(controller.catPaket[controller.selectedImageIndex.value]),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                )),
                const SizedBox(height: 10),
                Obx(() => Container(
                  height: 60.sp,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.catPaket.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectedImageIndex.value = index;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: Obx(() =>Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.w,
                                color:
                                    index == controller.selectedImageIndex.value
                                        ? const Color(0xFF8BC342)
                                        : Colors.black26,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.network(
                              controller.catPaket[index],
                              width: 50.w,
                              height: 50.h,
                              fit: BoxFit.fill,
                            ),
                          )),
                        ),
                      );
                    },
                  ),
                )),
                SizedBox(height: 12.sp),
                Obx(() => IconDetail(name: controller.productName.value)),
                SizedBox(height: 2.sp),
                Obx(() => Html(
                  data: controller.productLongDescription.value,
                )),
                SizedBox(height: 12.sp),
                Text("Tentang Mitra",
                  style: titleMedium,
                ),
                Obx(() => ListTile(
                  title: Text(
                    controller.tourism['name']??"",
                    style: titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(999999.sp),
                    child: controller.tourism['profile'] != null ? Image.network(
                      "${controller.api.endpoint}${controller.tourism['profile']}",
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Container(
                          color: Colors.grey,
                          child: const Center(
                            child: Icon(Icons.error, color: Colors.red),
                          ),
                        );
                      },
                    ) : Image.asset("assets/images/no-profile.png"),
                  ),
                  subtitle: Text(
                    controller.tourism['description']??"",
                  ),
                )),
                SizedBox(height: 8.sp),
                Text("Wisata Lain dari Mitra ini",
                  style: titleMedium,
                ),
                Obx(() => SizedBox(
                  width: 1.sw,
                  height: 210.sp,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index){
                      var product = controller.otherProduct[index];
                      return CardWisata(
                        id: product['id'],
                        image: product['images_ids'].length == 0 ? "" : "${controller.api.endpoint}/storage/${product['images_ids'][0]['path']}",
                        name: product['name'],
                        price: NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format((product['price']as int)),
                        location: product['location'],
                      );
                    },
                    itemCount: controller.otherProduct.length,
                  ),
                )),
                SizedBox(height: 36.sp),
                // TextDetail(
                //   title: 'Yang Termasuk dalam Paket Wisata',
                //   detail: 'ADAA',
                // ),
                // TextDetail(
                //   title: 'Harap Diperhatikan',
                //   detail: 'MAU MINJEM 712 M',
                // ),
                // TextDetail(
                //   title: 'Informasi Tambahan',
                //   detail: '',
                // ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonComponentDetail(
            title: 'Beli Sekarang',
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            onTambahKeranjang: controller.tambahKeranjang,
            onCheckout: controller.checkout,
          ),
        ),
      ],
    );
  }
}


class ButtonComponentDetail extends StatelessWidget {
  final String title;
  final Icon icon;
  final void Function()? onCheckout;
  final void Function()? onTambahKeranjang;

  const ButtonComponentDetail({
    Key? key,
    required this.title,
    required this.icon,
    this.onCheckout,
    this.onTambahKeranjang
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onCheckout,
                child: Container(
                  width: (MediaQuery.of(context).size.width - 60) / 1.2,
                  height: 54,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.LightGreen500,
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: titleMediumWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 2.sp),
        GestureDetector(
          onTap: onTambahKeranjang,
          child: Container(
            width: (MediaQuery.of(context).size.width - 60) / 4,
            height: 54,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.LightGreen500,
            ),
            child: Center(
              child: icon,
            ),
          ),
        ),
      ],
    );
  }
}
