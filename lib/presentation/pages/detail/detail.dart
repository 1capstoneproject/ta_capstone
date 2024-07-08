import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/detail_controller.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(controller.catPaket[controller.selectedImageIndex.value]),
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
                // const IconDetail(),
                // TextDetail(
                //   title: 'Informasi Detail',
                //   detail: 'P BANG ADA 100 GA ?',
                // ),
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
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: ButtonComponentDetail(
        //     title: 'Beli Sekarang',
        //     icon: const Icon(
        //       Icons.shopping_bag_outlined,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
