import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: Card(
        elevation: 0.5,
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                ),
                width: 70.sp,
                height: 60.sp,
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
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  name,
                  style: labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
