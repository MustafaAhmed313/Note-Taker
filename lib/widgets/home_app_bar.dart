import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';

PreferredSizeWidget homeAppBar() {
  return AppBar(
    backgroundColor: AppColors.primary,
    leadingWidth: 150,
    leading: Padding(
      padding: EdgeInsets.only(left: 24),
      child: Text(
        'Notes',
        style: TextStyle(
            color: AppColors.white,
            fontSize: AppFontSizes.num43,
            fontWeight: AppFontWeights.semiBold
        ),
      ),
    ),
    actions: [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Icon(Icons.search_rounded, color: AppColors.white),
        ),
      ),
      SizedBox(width: 20),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Icon(Icons.info_outline_rounded, color: AppColors.white),
        ),
      ),
      SizedBox(width: 24)
    ],
  );
}