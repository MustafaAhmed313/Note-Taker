import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/constants/snac_bar_status.dart';
import 'package:notes_app/database/note_helper.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:notes_app/widgets/button_with_icon.dart';
import 'package:notes_app/widgets/custom_alert_dialog.dart';
import 'package:notes_app/widgets/custom_snac_bar.dart';
import 'package:notes_app/widgets/custom_text_button.dart';

import '../constants/modes.dart';
import '../models/note.dart';

PreferredSizeWidget noteAppBar({
  required TextEditingController title,
  required TextEditingController description,
  required BuildContext context,
  required Modes mode,
  int index = -1
}) {
  String oldTitle = title.text, oldDescription = description.text;

  return AppBar(
    iconTheme: IconThemeData(
      color: AppColors.primary
    ),
    backgroundColor: AppColors.primary,
    actions: [
      SizedBox(width: 24),
      buttonWithIcon(
        icon: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        }
      ),
      Spacer(),
      if (mode == Modes.CREATE)
        buttonWithIcon(
          icon: Icons.remove_red_eye_outlined),
      SizedBox(width: 20),
      if (mode == Modes.CREATE)
        buttonWithIcon(
          icon: Icons.save_outlined,
          onTap: () {
            showDialog(context: context, builder: (context) {
              return customAlertDialog(
                content: 'Save Changes ?',
                actions: [
                  customTextButton(
                    text: 'Discard' ,
                    color: AppColors.red,
                    onTap: () {
                      Get.back();
                      showDialog(context: context, builder: (context) {
                        return customAlertDialog(
                          content: 'Are your sure you want discard your changes ?',
                          actions: [
                            customTextButton(
                              text: 'Discard',
                              color: AppColors.red,
                              onTap: () {
                                Get.offAll(HomeScreen());
                              }
                            ),
                            customTextButton(
                              text: 'Keep',
                              color: AppColors.green,
                              onTap: () {
                                Get.back();
                              }
                            )
                          ]
                        );
                      });
                    }
                  ),
                  customTextButton(
                    text: 'Save',
                    color: AppColors.green,
                    onTap: () {
                      if (title.text != '') {
                        NoteHelper.createNote(
                          Note(
                            title: title.text,
                            description: description.text,
                            id: DateTime.timestamp().millisecond
                          )
                        );
                        Get.offAll(HomeScreen());
                        customSnackBar(
                          context: context,
                          content: 'New note created successfully!',
                          color: AppColors.green.withOpacity(0.5),
                          status: SnacBarStatus.SUCCESS
                        );
                      }else {
                        Get.back();
                        customSnackBar(
                          context: context,
                          content: 'You should add title to your note!',
                          color: AppColors.red.withOpacity(0.5),
                          status: SnacBarStatus.ERROR
                        );
                      }
                    }
                  ),
                ]
              );
            });
          }
        ),
      if (mode == Modes.UPDATE)
        SizedBox(width: 20),
      if (mode == Modes.UPDATE)
        buttonWithIcon(
          icon: Icons.edit_outlined,
          onTap: () {
            if (title.text == oldTitle && description.text == oldDescription) {
              customSnackBar(
                context: context,
                content: 'Change old title or description!',
                color: AppColors.red.withOpacity(0.5),
                status: SnacBarStatus.ERROR
              );
            }else {
              NoteHelper.updateNote(
                new Note(
                  title: title.text,
                  description: description.text,
                  id: DateTime.timestamp().millisecond
                ),
                index
              );
              customSnackBar(
                context: context,
                content: 'Your note updated successfully!',
                color: AppColors.green.withOpacity(0.5),
                status: SnacBarStatus.SUCCESS
              );
            }
          }
        ),
      SizedBox(width: 24),
    ],
  );
}