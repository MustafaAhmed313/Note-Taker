import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_colors.dart';

Widget buttonWithIcon({
  required IconData icon
}) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(15)
      ),
      width: 50,
      height: 50,
      child: Icon(icon, color: AppColors.white),
    ),
  );
}