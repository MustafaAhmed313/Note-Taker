import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/constants/app_font_sizes.dart';
import 'package:notes_app/constants/app_font_weights.dart';
import 'package:notes_app/screens/create_note_screen.dart';
import 'package:notes_app/widgets/home_app_bar.dart';

import '../constants/app_colors.dart';

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
        child: Icon(Icons.add, size: 30, color: AppColors.white),
        elevation: 10,
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Get.to(CreateNoteScreen());
        },
      ),

      appBar: homeAppBar(),
      body: Container(
        color: AppColors.primary,
        width: double.infinity,
        child: Column(
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
        )
      ),
    );
  }
}
