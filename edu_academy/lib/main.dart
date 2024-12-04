import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/view/AdminPages/AdminMainPage.dart';
import 'package:edu_academy/Login/LogInPage.dart';
import 'package:edu_academy/view/ParentPages/HomePage.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:edu_academy/view/TeacherPages/TeacherMainPage.dart';
import 'package:edu_academy/view/ParentPages/ParentSignUpPage.dart';
import 'package:edu_academy/view/StudentPages/SignUp/StudentMobileSignUpPage.dart';
import 'package:edu_academy/view/TeacherPages/SignUp/Page.dart';
import 'package:edu_academy/Login/WhatAreYouPage.dart';
import 'package:edu_academy/view/StudentPages/HomePage.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:edu_academy/SplashViewPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'service/firebase_options.dart' ;
//hh@gmail.com 1234  00 22
//flutter build web --web-renderer canvaskit --release
//firebase deploy --only hosting -m "V 1.0.1"
//firebase init hosting
//flutter build web  --web-renderer html --release
// flutter clean; Start-Sleep -Seconds 7; flutter build web --web-renderer html --release; firebase init hosting; firebase deploy --only hosting -m "V 1.0.2"


void main() async {
  try{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  } catch (e) {
    print('Failed to initialize');
  }
  final dbService = DatabaseService();
  GradesAndsubjects.GradesSubjects= await dbService.FiGet_allSub_indexs();
  GradesAndsubjects.Subjects = await dbService.FiGet_allSub_data();

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