import 'package:flutter/material.dart';

import '../../share/app_colors/colors.dart';

class TextFieldsearch extends StatelessWidget {
  const TextFieldsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.LightGreen400)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.LightGreen400),
        ),
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.LightGreen400,
        ),
        hintText: 'cari',
      ),
    );
  }
}
