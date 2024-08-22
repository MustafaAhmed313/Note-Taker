import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/widgets/button_with_icon.dart';

PreferredSizeWidget homeAppBar() {
  return AppBar(
    backgroundColor: AppColors.primary,
    leadingWidth: 150,
    leading: const Padding(
      padding: EdgeInsets.only(left: 24),
      child: Text(
        'Notes',
        style: TextStyle(
            color: AppColors.white,
            fontSize: AppFontSizes.num43,
            fontWeight: AppFontWeights.semiBold
        )
      ),
    ),
    actions: [
      buttonWithIcon(icon: Icons.search_rounded),
      SizedBox(width: 20),
      buttonWithIcon(icon: Icons.info_outline_rounded),
      SizedBox(width: 24),
    ],
  );
}