import 'package:flutter/material.dart';
import 'package:notes_app/constants/snac_bar_status.dart';

import '../constants/app_colors.dart';
import '../constants/app_font_sizes.dart';
import '../constants/app_font_weights.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar({
  required BuildContext context,
  required String content,
  required Color color,
  required SnacBarStatus status
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                status == SnacBarStatus.ERROR ? Icons.error_outline : Icons.done_outline_outlined,
                color: AppColors.white
              ),
              SizedBox(width: 20),
              Text(
                content,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppFontSizes.num18,
                  fontWeight: AppFontWeights.regular
                ),
              ),
            ],
          )
      ),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
    )
  );
}