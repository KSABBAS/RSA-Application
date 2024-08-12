import 'package:edu_academy/AdminPages/AdminMainPage.dart';
import 'package:edu_academy/Login/LogInPage.dart';
import 'package:edu_academy/ParentPages/ParentMainPage.dart';
import 'package:edu_academy/ParentPages/SonPage.dart';
import 'package:edu_academy/TeacherPages/TeacherMainPage.dart';
import 'package:edu_academy/ParentPages/ParentSignUpPage.dart';
import 'package:edu_academy/StudentPages/StudentMobileSignUpPage.dart';
import 'package:edu_academy/TeacherPages/TeacherSignUpPage.dart';
import 'package:edu_academy/Login/WhatAreYouPage.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:edu_academy/SplashViewPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'service/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        "TeacherSignUpPage": (context) => const TeacherSignUpPage(),
      },
      home: const SplashViewPage()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}