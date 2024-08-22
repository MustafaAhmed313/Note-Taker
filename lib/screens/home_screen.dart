import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/screens/create_note_screen.dart';
import 'package:notes_app/widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const CreateNoteScreen());
        },
        child: Icon(Icons.add, color: AppColors.white, size: 40),
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        elevation: 7,
      ),
      appBar: homeAppBar(),
      body: Container(
        width: double.infinity,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/rafiki.png')),
            const Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: Text(
                'Create your first note !',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: AppFontWeights.light,
                  fontSize: AppFontSizes.num20
                )
              )
            )
          ],
        ),
      ),
    );
  }
}
