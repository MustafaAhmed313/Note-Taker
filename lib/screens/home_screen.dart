import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/constants/modes.dart';
import 'package:notes_app/constants/snac_bar_status.dart';
import 'package:notes_app/database/note_helper.dart';
import 'package:notes_app/screens/note_screen.dart';
import 'package:notes_app/widgets/custom_snac_bar.dart';
import 'package:notes_app/widgets/home_app_bar.dart';
import 'package:notes_app/widgets/note_item.dart';

import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_text_button.dart';

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
    setState(() {
      NoteHelper.getNotes();
      print('a: ' + NoteHelper.notes.toString());
      print('b: ' + NoteHelper.searchList.toString());
    });
    super.initState();
  }

  Color getNoteColor({required int index}) {
    return noteColors[index % noteColors.length];
  }

  Future<void> refreshList() async {
    setState(() {});
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
          Get.to(NoteScreen(mode: Modes.CREATE));
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
          child: RefreshIndicator(
            onRefresh: refreshList,
            child: ListView.separated(
                itemBuilder: (context, index) => Dismissible(
                    onDismissed: (direction) {
                      setState(() {
                        NoteHelper.deleteNote(index);//index = 0
                      });
                    },
                    confirmDismiss: (direction) {
                      return showDialog(context: context, builder: (context) {
                        return customAlertDialog(
                            content: 'Are your sure you want delete this note ?',
                            actions: [
                              customTextButton(
                                  text: 'Delete',
                                  color: AppColors.red,
                                  onTap: () {
                                    setState(() {
                                      NoteHelper.deleteNote(index);
                                    });
                                    Get.offAll(HomeScreen());
                                    customSnackBar(
                                        context: context,
                                        content: 'The note deleted successfully',
                                        color: AppColors.green.withOpacity(0.5),
                                        status: SnacBarStatus.SUCCESS
                                    );
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
                    },
                    key: Key(index.toString()),
                    background: Container(
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.delete, color: AppColors.white, size: 40)
                        ],
                      ),
                    ),
                    child: noteItem(
                      index: index,
                      color: getNoteColor(index: index),
                    )
                ),
                separatorBuilder: (context , index) => SizedBox(height: 20),
                itemCount: NoteHelper.notes.length
            ),
          ),
        ),
      ),
    );
  }
}
