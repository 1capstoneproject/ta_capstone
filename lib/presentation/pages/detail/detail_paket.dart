import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/controller/detail_controller.dart';
import 'package:ta_capstone/presentation/widget/icon_detail.dart';
import 'package:ta_capstone/presentation/widget/text_detail.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class DetailPaket extends StatefulWidget {
  
  final int id;

  const DetailPaket({
    super.key,
    required this.id,
  });


  @override
  State<DetailPaket> createState() => _DetailPaketState();
}

class _DetailPaketState extends State<DetailPaket> {
  late final DetailPaketController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DetailPaketController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Paket',
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
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
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
                          child: Container(
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const IconDetail(),
                TextDetail(
                  title: 'Informasi Detail',
                  detail: 'P BANG ADA 100 GA ?',
                ),
                TextDetail(
                  title: 'Yang Termasuk dalam Paket Wisata',
                  detail: 'ADAA',
                ),
                TextDetail(
                  title: 'Harap Diperhatikan',
                  detail: 'MAU MINJEM 712 M',
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
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonComponentDetail(
            title: 'Beli Sekarang',
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonComponentDetail extends StatelessWidget {
  final String title;
  final Icon icon;

  const ButtonComponentDetail({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailPaketController controller = Get.find<DetailPaketController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: controller.handlePrimaryButtonPress,
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
        const SizedBox(width: 5),
        GestureDetector(
          onTap: controller.handleSecondaryButtonPress,
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
