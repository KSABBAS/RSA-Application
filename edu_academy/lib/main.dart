import 'package:edu_academy/MobileView/StudentHomePage.dart';
import 'package:edu_academy/MobileView/SubjectPage.dart';
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
  runApp(
    
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "StudentHomePage": (context) => StudentHomePage(),
        "SplashView": (context) => SplashViewPage(),
        "StudentMobileSignUpPage": (context) => StudentMobileSignUpPage(),
        "LogInPage": (context) => LogInPage(),
        "StudentMainPage": (context) => StudentMainPage(),
        "WhatAreYouPage": (context) => WhatAreYouPage(),
        "ParentSignUpPage": (context) => ParentSignUpPage(),
        "TeacherSignUpPage": (context) => TeacherSignUpPage(),
      },
      home: SplashViewPage()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
