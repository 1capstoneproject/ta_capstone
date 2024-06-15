import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class IconDetail extends StatefulWidget {
  const IconDetail({super.key});

  @override
  State<IconDetail> createState() => _IconDetailState();
}

class _IconDetailState extends State<IconDetail> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Longlivia Bromo',
          style: titleMedium,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.share,
            color: AppColors.LightGreen500,
          ),
        ),
      ],
    );
  }
}
