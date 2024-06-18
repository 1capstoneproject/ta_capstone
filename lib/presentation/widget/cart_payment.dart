import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class CartPayment extends StatelessWidget {
  const CartPayment({
    super.key,
    required this.img,
    required this.name,
  });

  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        right: 20,
      ),
      child: Row(
        children: [
          Container(
            width: Get.width * 0.2,
            height: Get.width * 0.1,
            // color: Colors.red,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      img,
                    ),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(5)),
          ),
          Spacer(),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: labelMedium,
          ),
        ],
      ),
    );
  }
}
