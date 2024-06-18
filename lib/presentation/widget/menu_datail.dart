import 'package:flutter/material.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class MenuDetail extends StatelessWidget {
  final String title;
  final IconData menuIcon; // Mengubah tipe data menjadi IconData

  const MenuDetail({
    Key? key,
    required this.title,
    required this.menuIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Icon(
              menuIcon,
              color: AppColors.DarkGrey300,
              size: 15,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: bodySmallGrey,
            ),
          ],
        ),
      ],
    );
  }
}
