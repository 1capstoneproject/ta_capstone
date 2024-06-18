import 'package:flutter/material.dart';

import '../../share/app_style/style.dart';

class TextDetail extends StatelessWidget {
  const TextDetail({
    super.key,
    required this.title,
    required this.detail,
  });

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleSmall,
              ),
              SizedBox(height: .5),
              Text(
                detail,
                style: bodySmallGrey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
