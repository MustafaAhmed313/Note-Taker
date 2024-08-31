import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/constants/app_colors.dart';
import 'package:notes_app/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: LottieBuilder.asset(
          'assets/animation/Animation - 1723983227864.json',
          fit: BoxFit.cover
        ),
      ),
      nextScreen: HomeScreen(),
      splashIconSize: 300,
      backgroundColor: AppColors.white,
      duration: 3500,
    );
  }
}
