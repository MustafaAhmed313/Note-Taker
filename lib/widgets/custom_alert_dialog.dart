import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_font_sizes.dart';
import '../constants/app_font_weights.dart';

AlertDialog customAlertDialog({
  String? content,
  List<Widget>? actions,
}) {
  return AlertDialog(
    title: Center(
      child: Center(
        child: Icon(Icons.info, color: AppColors.grayIcons),
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    contentPadding: EdgeInsets.all(25),
    actionsAlignment: MainAxisAlignment.spaceBetween,
    backgroundColor: AppColors.primary,
    content: SizedBox(
      width: 330,
      child: Text(
        '$content',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.grayText,
            fontSize: AppFontSizes.num23,
            fontWeight: AppFontWeights.regular
        ),
      )
    ),
    actions: actions,
  );
}
