import 'package:flutter/material.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class IconDetail extends StatelessWidget {
  const IconDetail({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSaved = false;
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
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
