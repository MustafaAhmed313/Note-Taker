import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/database/note_helper.dart';
import 'package:notes_app/screens/note_screen.dart';
import 'package:notes_app/widgets/home_app_bar.dart';
import 'package:notes_app/widgets/note_item.dart';

import '../models/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Color> noteColors = [
    AppColors.lightPink,
    AppColors.lightRed,
    AppColors.lightGreen,
    AppColors.lightYellow,
    AppColors.lightBlue,
    AppColors.lightViolet
  ];

  @override
  void initState() {
    NoteHelper.getNotes();
    super.initState();
  }

  Color getNoteColor({required int index}) {
    return noteColors[index % noteColors.length];
  }

  @override
  Widget build(BuildContext context) {
    print(NoteHelper.notes.length);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 30, color: AppColors.white),
        elevation: 10,
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Get.to(NoteScreen());
        },
      ),

      appBar: homeAppBar(),
      body: Container(
        color: AppColors.primary,
        width: double.infinity,
        child: NoteHelper.notes.length == 0 ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/rafiki.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Text(
                'Create your first note !',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppFontSizes.num20,
                    fontWeight: AppFontWeights.light
                ),
              )
            )
          ],
        ) : Padding(
          padding: EdgeInsets.only(top: 40, left: 24, right: 24),
          child: ListView.separated(
            itemBuilder: (context, index) => noteItem(
                note: NoteHelper.notes[index],
                color: getNoteColor(index: index),
            ),
            separatorBuilder: (context , index) => SizedBox(height: 20),
            itemCount: NoteHelper.notes.length
          ),
        ),
      ),
    );
  }
}
