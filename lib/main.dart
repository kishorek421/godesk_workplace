import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/pages/intro/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GoDesk',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.primaryMaterialColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
