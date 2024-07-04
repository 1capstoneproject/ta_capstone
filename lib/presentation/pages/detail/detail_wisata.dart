import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/detail_paket_controller.dart';
import 'package:ta_capstone/presentation/widget/icon_detail.dart';
import 'package:ta_capstone/presentation/widget/text_detail.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class DetailWisata extends StatelessWidget {
  const DetailWisata({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailPaketController controller = Get.put(DetailPaketController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments['nama'],
          //'Detail Wisata',
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => Container(
                      width: MediaQuery.of(context).size.width * 0.9.sp,
                      height: MediaQuery.of(context).size.height * 0.3.sp,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(controller
                              .catPaket[controller.selectedImageIndex.value]),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                  height: 60.h,
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
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width:
                                    index == controller.selectedImageIndex.value
                                        ? 1
                                        : 1,
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const IconDetail(),
                TextDetail(
                  title: 'Informasi Detail',
                  detail: '',
                ),
                TextDetail(
                  title: 'Harap Diperhatikan',
                  detail: '',
                ),
                TextDetail(
                  title: 'Informasi Tambahan',
                  detail: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
