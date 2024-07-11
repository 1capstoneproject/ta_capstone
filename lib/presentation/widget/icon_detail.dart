import 'package:flutter/material.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class IconDetail extends StatelessWidget {
  
  final String name;
  
  const IconDetail({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    bool isSaved = false;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: true,
          ),
        ),
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
