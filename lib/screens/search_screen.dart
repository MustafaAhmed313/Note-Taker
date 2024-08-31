import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/database/note_helper.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:notes_app/widgets/custom_text_input.dart';

import '../constants/snac_bar_status.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_snac_bar.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/note_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();

  List<Color> noteColors = [
    AppColors.lightPink,
    AppColors.lightRed,
    AppColors.lightGreen,
    AppColors.lightYellow,
    AppColors.lightBlue,
    AppColors.lightViolet
  ];

  Color getNoteColor({required int index}) {
    return noteColors[index % noteColors.length];
  }

  @override
  void initState() {
    NoteHelper.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(HomeScreen());
        },
        child: Icon(Icons.home, size: 30, color: AppColors.white),
        elevation: 10,
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(
          color: AppColors.primary
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: double.infinity,
          child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: customTextInput(
                    onChanged: (search) {
                      setState(() {
                        if (search.isEmpty) {
                          NoteHelper.searchList = NoteHelper.notes;
                        } else {
                          NoteHelper.searchList = NoteHelper.notes.where((note) {
                            return note.title.toLowerCase().contains(search.toLowerCase());
                          }).toList();
                        }
                      });
                    },
                    inputController: search,
                    inputStyle: TextStyle(
                        color: AppColors.grayPlaceholders,
                        fontSize: AppFontSizes.num20,
                        fontWeight: AppFontWeights.light
                    ),
                    decoration: InputDecoration(
                        hintText: 'Search by the keyword...',
                        hintStyle: TextStyle(
                            color: AppColors.grayPlaceholders,
                            fontSize: AppFontSizes.num20,
                            fontWeight: AppFontWeights.light
                        ),
                        fillColor: AppColors.secondary,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              search.text = '';
                            });
                          },
                          child: Icon(Icons.close_rounded, color: AppColors.graySearch),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15)
                    ),
                    maxLines: 1,
                  ),
                ),
                if (NoteHelper.searchList.length != 0)
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: ListView.separated(
                              itemBuilder: (context, index) => Dismissible(
                                  onDismissed: (direction) {
                                    setState(() {
                                      NoteHelper.notes;
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
                                                    Get.offAll(SearchScreen());
                                                    customSnackBar(
                                                        context: context,
                                                        content: 'The note deleted successfully',
                                                        color: AppColors.green.withOpacity(0.5),
                                                        status: SnacBarStatus.SUCCESS
                                                    );
                                                  });
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
                              itemCount: NoteHelper.searchList.length
                          )
                      )
                  ),
                if (NoteHelper.searchList.length == 0)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/cuate.png'),
                            ),
                            Text(
                              'File not found. Try searching again.',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: AppFontSizes.num20,
                                  fontWeight: AppFontWeights.light
                              ),
                            )
                          ],
                        ),
                      )
                    ),
              ],
            ),
          ),
        )
    );
  }
}
