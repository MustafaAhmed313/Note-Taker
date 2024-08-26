import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/constants/modes.dart';
import 'package:notes_app/database/note_helper.dart';
import 'package:notes_app/screens/note_screen.dart';

import '../models/note.dart';

Widget noteItem({
  required int index,
  required Color color,
}) {
  return GestureDetector(
    onLongPress: () {},
    onTap: () {
      Get.to(NoteScreen(mode: Modes.UPDATE, index: index));
    },
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top:21.5 , bottom: 21.5, left: 37.5, right: 37.5),
        child: Text(
          '${NoteHelper.notes[index].title}',
          style: TextStyle(
            color: AppColors.black,
            fontSize: AppFontSizes.num25,
            fontWeight: AppFontWeights.regular
          ),
        ),
      ),
    ),
  );
}