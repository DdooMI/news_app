import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/theme/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.splash), fit: BoxFit.fill)),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
