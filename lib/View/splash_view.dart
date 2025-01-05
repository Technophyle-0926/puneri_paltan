import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/dashboard_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.off(() => DashboardView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          'assets/splashimage.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
