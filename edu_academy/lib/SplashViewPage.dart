import 'dart:async';
import 'dart:developer';

import 'package:edu_academy/Login/LogInPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewPage extends StatefulWidget {
  const SplashViewPage({super.key});

  @override
  State<SplashViewPage> createState() => _SplashViewPageState();
}

class _SplashViewPageState extends State<SplashViewPage> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? fading;
  @override
  void initState()  {
    final dbService = DatabaseService();
    // GradesSubjects = await dbService.FiGet_allSub_indexs();
    // Subjects = await dbService.FiGet_allSub_data();
    
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    fading = Tween<double>(begin: 0, end: 1).animate(animationController!)
      ..addListener(() {
        setState(() {
          if (animationController!.isCompleted) {
            Timer(const Duration(milliseconds: 300), () async {
              
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              //  satrt save data writen in login page
              final List<String>? loginLastValue = prefs.getStringList("Login_last_value");
              last_input1_value = loginLastValue?.isNotEmpty == true ? loginLastValue![0] : '';
              last_input2_value = loginLastValue?.isNotEmpty == true ? loginLastValue![1] : '';
              // end

              try {
                final List<String>? data = prefs.getStringList('id');
                // Navigator.pushReplacementNamed(context, "LogInPage"); //delete

                log(data.toString());
                if (data != null) {
                  if (data[0].toString().split("#")[0] == "Student") {
                    Navigator.pushReplacementNamed(context, "StudentMainPage");
                  } else if (data[0].toString().split("#")[0] == "Teacher") {
                    Navigator.pushReplacementNamed(context, "TeacherMainPage");
                  } else if (data[0].toString().split("#")[0] == "Parent") {
                    Navigator.pushReplacementNamed(context, "ParentMainPage");
                  } else if (data[0].toString().split("#")[0] == "Admin") {
                    Navigator.pushReplacementNamed(context, "AdminMainPage");
                  } else {
                    Navigator.pushReplacementNamed(context, "LogInPage");
                  }
                } else {
                  Navigator.pushReplacementNamed(context, "LogInPage");
                }
              } catch (e) {
                log(e.toString());
                Navigator.pushReplacementNamed(context, "LogInPage");
              }
            });
          }
        });
      });
    animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color.fromARGB(255, 8, 125, 159), Color.fromARGB(255, 74, 193, 241)])),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(flex: 10, child: Container()),
              Expanded(
                  flex: 7,
                  child: CMaker(
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                            flex: 8,
                            child: Opacity(
                              opacity: fading?.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset("images/Logo.png"),
                              ),
                            )),
                        Expanded(flex: 1, child: Container()),
                      ],
                    ),
                  )),
              Expanded(flex: 5, child: Container()),
              Expanded(flex: 2,child: CMaker(alignment: Alignment.bottomCenter,child: Opacity(opacity: fading?.value,child: TMaker(text: "Powered By", fontSize: 18, fontWeight:FontWeight.w600, color: const Color.fromARGB(210, 243, 243, 243))))),
              Expanded(flex: 3,child: CMaker(alignment: Alignment.topCenter,child: Opacity(opacity: fading?.value,child:TMaker(text: "Codeveloper", fontSize: 25, fontWeight:FontWeight.w600, color: const Color.fromARGB(210, 243, 243, 243)))))
            ],
          ),
        ),
      ),
    );
  }
}
