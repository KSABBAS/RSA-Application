import 'package:edu_academy/MobileView/StudentHomePage.dart';
import 'package:edu_academy/MobileView/in&upPages/ParentSignUpPage.dart';
import 'package:edu_academy/MobileView/in&upPages/StudentMobileSignUpPage.dart';
import 'package:edu_academy/MobileView/in&upPages/TeacherSignUpPage.dart';
import 'package:edu_academy/WhatAreYouPage.dart';
import 'package:edu_academy/MobileView/in&upPages/LogInPage.dart';
import 'package:edu_academy/MobileView/StudentMainPage.dart';
import 'package:edu_academy/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:edu_academy/SplashViewPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "StudentHomePage": (context) => const StudentHomePage(),
        "SplashView": (context) => const SplashViewPage(),
        "StudentMobileSignUpPage": (context) => const StudentMobileSignUpPage(),
        "LogInPage": (context) => const LogInPage(),
        "StudentMainPage": (context) => const StudentMainPage(),
        "WhatAreYouPage": (context) => const WhatAreYouPage(),
        "ParentSignUpPage": (context) => const ParentSignUpPage(),
        "TeacherSignUpPage": (context) => const TeacherSignUpPage()
      },
      home: const SplashViewPage()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
