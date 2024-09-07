import 'package:flutter/material.dart';
import 'package:travel_app_task/core/constant/app_colors.dart';
import 'package:travel_app_task/view/presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: AppColors.scaffoldBgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.scaffoldBgColor,
          surfaceTintColor: AppColors.scaffoldBgColor
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
