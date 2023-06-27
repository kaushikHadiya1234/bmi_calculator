import 'package:bmi_calculator/BMI/View/home_screen.dart';
import 'package:bmi_calculator/BMI/View/results.dart';
import 'package:bmi_calculator/BMI/View/splace_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
           '/':(p0) => SplaceScreen(),
           'home':(p0) => HomeScreen(),
          'result':(p0) => ResultScreen()
        },
      ),
    ),
  );
}
