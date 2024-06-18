import 'package:flutter/material.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class ButtonComponent extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const ButtonComponent({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Periksa apakah onPressed tidak null sebelum melakukan navigasi
        if (onPressed != null) {
          onPressed!(); // Panggil fungsi onPressed jika tidak null
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF8BC342),
        ),
        child: Center(
          child: Text(
            title,
            style: titleMediumWhite,
          ),
        ),
      ),
    );
  }
}
