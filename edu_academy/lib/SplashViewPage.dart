import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewPage extends StatefulWidget {
  const SplashViewPage({super.key});

  @override
  State<SplashViewPage> createState() => _SplashViewPageState();
}

class _SplashViewPageState extends State<SplashViewPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? fading;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    fading = Tween<double>(begin: 0, end: 1).animate(animationController!)
      ..addListener(() {
        setState(() {
          if (animationController!.isCompleted) {
            Timer(const Duration(milliseconds: 300), () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              try {
                final List<String>? data = prefs.getStringList('id');
                log(data.toString());
                if (data != null) {
                  if (data[0] == "Student") {
                    Navigator.pushReplacementNamed(context, "StudentMainPage");
                  } else if (data[0] == "Teacher") {
                    Navigator.pushReplacementNamed(context, "TeacherMainPage");
                  } else if (data[0] == "Parent") {
                    Navigator.pushReplacementNamed(context, "ParentMainPage");
                  } else if (data[0] == "Admin") {
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
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Color.fromARGB(255, 8, 125, 159),
              Color.fromARGB(255, 74, 193, 241)
            ])),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(flex: 10, child: Container()),
              Expanded(
                  flex: 7,
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
                    ],
                  )),
              Expanded(flex: 10, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
