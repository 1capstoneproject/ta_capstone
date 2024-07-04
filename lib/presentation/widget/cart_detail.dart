import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class KotakDetail extends StatelessWidget {
  final String title;

  const KotakDetail({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Color(0xFf8bC342),
            borderRadius: BorderRadius.circular(8), // Radius border
          ),
          child: Center(
            child: Text(
              title,
              style: titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}
