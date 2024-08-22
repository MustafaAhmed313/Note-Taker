import 'package:flutter/cupertino.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';

Widget customTextButton({
  required String text,
  Color? color,
  void Function()? onTap
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      width: 112,
      height: 39,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                color: AppColors.white,
                fontSize: AppFontSizes.num18,
                fontWeight: AppFontWeights.regular
            ),
          )
        ],
      ),
    ),
  );
}