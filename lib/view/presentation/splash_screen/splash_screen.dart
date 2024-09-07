import 'package:flutter/material.dart';
import 'package:travel_app_task/core/routs/app_router.dart';
import 'package:travel_app_task/view/widget/bottomnavbar/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
      reverseDuration: const Duration(seconds: 1),
    );
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    opacityAnimation =
        CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          AppRouter.closeOthers(context, const BottomNavBar());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ScaleTransition(
        scale: scaleAnimation,
        child: FadeTransition(
          opacity: opacityAnimation,
          child: const Center(
              child: Text(
            "Travel App",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
