import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/database/note_helper.dart';
import 'package:notes_app/widgets/custom_text_input.dart';
import 'package:notes_app/widgets/note_app_bar.dart';

import '../constants/modes.dart';
import '../models/note.dart';

class NoteScreen extends StatefulWidget {
  final Modes _mode;
  final int _index;

  NoteScreen({super.key, Modes mode = Modes.CREATE , int index = -1}) : _index = index, _mode = mode;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget._mode == Modes.UPDATE) {
      title.text = NoteHelper.notes[widget._index].title?? '';
      description.text = NoteHelper.notes[widget._index].description?? '';
    }

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: noteAppBar(
        title: title,
        description: description,
        context: context,
        mode: widget._mode,
        index: widget._index
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
