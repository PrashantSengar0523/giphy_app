import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/feature/controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final contoller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("GIF's",style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),),
    );
  }
}