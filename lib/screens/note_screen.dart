import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/widgets/custom_text_input.dart';
import 'package:notes_app/widgets/note_app_bar.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: noteAppBar(
        title: title,
        description: description,
        context: context
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Padding(padding: EdgeInsets.only(left: 24, right: 24), child: Column(
              children: [
                SizedBox(height: 20),
                customTextInput(
                  inputController: title,
                  placeholder: 'Title',
                  placeHolderStyle: TextStyle(
                      color: AppColors.grayPlaceholders,
                      fontSize: AppFontSizes.num48,
                      fontWeight: AppFontWeights.regular
                  ),
                  inputStyle: TextStyle(
                      color: AppColors.white,
                      fontWeight: AppFontWeights.regular,
                      fontSize: AppFontSizes.num35
                  )
                ),
                SizedBox(height: 10),
                customTextInput(
                  inputController: description,
                  placeholder: 'Type something...',
                  placeHolderStyle: TextStyle(
                      color: AppColors.grayPlaceholders,
                      fontSize: AppFontSizes.num23,
                      fontWeight: AppFontWeights.regular
                  ),
                  inputStyle: TextStyle(
                      color: AppColors.white,
                      fontWeight: AppFontWeights.regular,
                      fontSize: AppFontSizes.num23
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
