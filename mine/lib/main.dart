import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mine/Features/Weather/Weather.dart';
import 'package:mine/FingerPrint.dart';
import 'package:mine/Home.dart';
import 'package:mine/ItIsMe.dart';
import 'package:mine/MyTools.dart';
import 'package:mine/SplashViewPage.dart';
void main() async{
  runApp(GetMaterialApp(
    routes: {
      "SplashView":(context) =>SplashView(),
      "ItIsMe":(context) =>ItIsMe(),
      "Home":(context) =>Home(),
      "FingerPrint":(context) =>FingerPrint(),
      "Weather":(context) =>Weather(),
    },
    debugShowCheckedModeBanner: false, home: MyApp()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashView();
  }
}
