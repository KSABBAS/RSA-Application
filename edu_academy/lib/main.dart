import 'package:edu_academy/MobileView/AdminMainPage.dart';
import 'package:edu_academy/MobileView/ParentMainPage.dart';
import 'package:edu_academy/MobileView/TeacherMainPage.dart';
import 'package:edu_academy/MobileView/in&upPages/ParentSignUpPage.dart';
import 'package:edu_academy/MobileView/in&upPages/StudentMobileSignUpPage.dart';
import 'package:edu_academy/MobileView/in&upPages/TeacherSignUpPage.dart';
import 'package:edu_academy/WhatAreYouPage.dart';
import 'package:edu_academy/MobileView/in&upPages/LogInPage.dart';
import 'package:edu_academy/MobileView/StudentMainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:edu_academy/SplashViewPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  //dart fix --dry-run
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "SplashView": (context) => const SplashViewPage(),
        "StudentMobileSignUpPage": (context) => const StudentMobileSignUpPage(),
        "LogInPage": (context) => const LogInPage(),
        "StudentMainPage": (context) => const StudentMainPage(),
        "ParentMainPage": (context) => const ParentMainPage(),
        "TeacherMainPage": (context) => const TeacherMainPage(),
        "AdminMainPage": (context) => const AdminMainPage(),
        "WhatAreYouPage": (context) => const WhatAreYouPage(),
        "ParentSignUpPage": (context) => const ParentSignUpPage(),
        "TeacherSignUpPage": (context) => const TeacherSignUpPage()
      },
      home: const SplashViewPage()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
