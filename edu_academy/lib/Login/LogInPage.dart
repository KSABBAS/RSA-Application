import 'dart:developer';

import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/services.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LoginPageState();
}

String FullName = "";
String Password = "";
var obscureText = true;
bool loggedIn = false;
List l = [2.2];
GlobalKey<FormState> key1 = GlobalKey();

String last_input1_value = '';
String last_input2_value = '';

class _LoginPageState extends State<LogInPage> {
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    late Widget LoginBody;
    print(PageWidth(context));
    Widget InputPart = SizedBox(
      height: 250,
      width: double.infinity,
      child:Column(
          children: [
            Expanded(
              child: Container(),
            ),
            TextFormField(
              initialValue: last_input1_value,
              onSaved: (newValue) {
                FullName = newValue!;
              },
              decoration: InputDecoration(
                  icon: const Icon(Icons.person_sharp),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 192, 192, 192)),
                      borderRadius: BorderRadius.circular(30)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 192, 192, 192)),
                      borderRadius: BorderRadius.circular(30)),
                  label: const Text(
                    "Email or Phone Number",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 192, 192, 192)),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Expanded(
              child: Container(),
            ),
            TextFormField(
              initialValue: last_input2_value,
              onSaved: (newValue) {
                Password = newValue!;
              },
              obscureText: obscureText,
              decoration: InputDecoration(
                  icon: const Icon(Icons.password),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 192, 192, 192)),
                      borderRadius: BorderRadius.circular(30)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 192, 192, 192)),
                      borderRadius: BorderRadius.circular(30)),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: const Icon(Icons.remove_red_eye_outlined),
                  ),
                  label: const Text(
                    "Password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 192, 192, 192)),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
    );
    Widget LoginButton = InkWell(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 120,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 74, 193, 241),
              borderRadius: BorderRadius.circular(30)),
          child: const Text(
            "Log in",
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w700),
          ),
        ),
        onTap: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          setState(() {
            loggedIn = true;
          });
          if (loggedIn) {
            key1.currentState!.save();
          }
          // send data to data base
          await prefs
              .setStringList('Login_last_value', <String>[FullName, Password]);
          // log("['$FullName', '$Password']" as num);
          OverlayLoadingProgress.start(
            context,
            widget: CMaker(
              circularRadius: 15,
              color: const Color.fromARGB(198, 255, 255, 255),
              width: MediaQuery.of(context).size.width / 3.6,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 13),
              child: const AspectRatio(
                aspectRatio: 1,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ),
          );
          List data = await dbService.fiRead_ForLogin(FullName, Password);
          OverlayLoadingProgress.stop();
          if (data[0]) {
            await prefs.setStringList(
                'id', <String>['${data[1]}', '${data[2]}', '${data[3]}']);
            log("['${data[1]}', '${data[2]}', '${data[3]}']");
            print("data from database services $data");
            PanaraInfoDialog.show(
              context,
              title: "Success",
              message: "Now you are good to go",
              buttonText: "Okay",
              onTapDismiss: () {
                Navigator.pop(context);
                if (data[1].toString().split("#")[0] == "Student") {
                  Navigator.pushReplacementNamed(context, "StudentMainPage");
                } else if (data[1].toString().split("#")[0] == "Teacher") {
                  Navigator.pushReplacementNamed(context, "TeacherMainPage");
                } else if (data[1].toString().split("#")[0] == "Parent") {
                  Navigator.pushReplacementNamed(context, "ParentMainPage");
                } else if (data[1].toString().split("#")[0] == "Admin") {
                  Navigator.pushReplacementNamed(context, "AdminMainPage");
                }
              },
              panaraDialogType: PanaraDialogType.success,
              barrierDismissible: false,
            );
          } else {
            PanaraInfoDialog.show(
              context,
              title: "Sorry",
              message:
                  "Email or name does not exist \n or the password is wrong",
              buttonText: "Okay",
              onTapDismiss: () {
                Navigator.pop(context);
                FullName = "";
                Password = "";
              },
              panaraDialogType: PanaraDialogType.error,
              barrierDismissible: true,
            );
          }
        });
    List<Widget> ToWhatAreYouPage = [
      Container(
        alignment: Alignment.centerRight,
        child: const Text(
          "New User ? ",
          style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 206, 206, 206),
              fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "WhatAreYouPage");
            },
            child: const Text(
              "Sign up",
              style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 74, 193, 241),
                  fontWeight: FontWeight.w500),
            )),
      ),
    ];
    Widget Logo = SizedBox(
        height: 150,
        child: Image.asset(
          "images/Logo.png",
          fit: BoxFit.contain,
        ));
    Widget LoginCircle = Container(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
          alignment: Alignment.center,
          width: 160,
          height: 160,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.zero,
                topLeft: Radius.circular(10),
                topRight: Radius.circular(5000),
                bottomRight: Radius.circular(10)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: const Text(
            "Log in",
            style: TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 8, 125, 159),
                fontWeight: FontWeight.w700),
          ),
        ));
    print(PageWidth(context));
    print(PageHeight(context));
    if (PageWidth(context) <= 550) {
      print("===============================================\nis a phone");
      setState(() {
        LoginBody = Scaffold(
          body: Form(
            key: key1,
            child: CMaker(
              height: PageHeight(context),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                          Color.fromARGB(255, 8, 125, 159),
                          Color.fromARGB(255, 74, 193, 241)
                        ])),
                    child: Row(
                      children: [
                          Expanded(
                            child: LoginCircle,
                          ),
                        Flexible(
                            child: CMaker(
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: Logo))
                      ],
                    ),
                  ),
                  Expanded(flex: 2,child: Container()),
                  CMaker(margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),child: InputPart),
                  Expanded(flex: 2,child: Container()),
                            CMaker(alignment: Alignment.center,child: LoginButton),
                  Expanded(flex: 1,child: Container()),
                            Flexible(
                                child: Row(
                              children: [
                                Expanded(
                                  child: ToWhatAreYouPage[0],
                                ),
                                Expanded(
                                  child: ToWhatAreYouPage[1],
                                ),
                              ],
                            )),
                  Expanded(flex: 2,child: Container()),
                ],
              ),
            ),
          ),
        );
      });
    } else if(PageWidth(context) >= 550&&PageHeight(context)>=900){
      print("===============================================\nnot a phone");
      setState(() {
        LoginBody = Scaffold(
          body: Form(
            key: key1,
            child: CMaker(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 8, 125, 159),
                      Color.fromARGB(255, 74, 193, 241)
                    ]),
                child: Column(
                  children: [
                    Expanded(flex: 3,child: Container()),
                    CMaker(
                      height: PageHeight(context)/6,
                      child: Row(
                        children: [
                      Expanded(
                        child: Image.asset(
                                                  "images/Logo.png",
                                                  fit: BoxFit.contain,
                                                ),
                      ),
                        ],
                      ),
                    ),
                    CMaker(
                        circularRadius: 20,
                        color: Colors.white,
                        height: 400,
                        width: 450,
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: ListView(
                          children: [
                            InputPart,
                            CMaker(alignment: Alignment.center,child: LoginButton),
                            const Padding(padding:EdgeInsets.only(bottom: 20)),
                            Row(
                              children: [
                                Expanded(
                                  child: ToWhatAreYouPage[0],
                                ),
                                Expanded(
                                  child: ToWhatAreYouPage[1],
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                          ],
                        )),
                    Expanded(flex: 5, child: Container()),
                  ],
                )),
          ),
        );
      });
    } else if(PageWidth(context) >= 550&&PageHeight(context)<900){
      print("===============================================\nnot a phone");
      setState(() {
        LoginBody = Scaffold(
          body: Form(
            key: key1,
            child: CMaker(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 8, 125, 159),
                      Color.fromARGB(255, 74, 193, 241)
                    ]),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                  CMaker(width: PageWidth(context)/3,child: Column(
                    children: [
                      Expanded(child: Container(),),
                      Expanded(flex: 20,child: CMaker(width: 200,
                        child: Image.asset(
                                                  "images/Logo.png",
                                                  fit: BoxFit.contain,
                                                ),)),
                      Expanded(child: Container(),),
                    ],
                  ),),
                  Expanded(child: Container()),
                  CMaker(
                        circularRadius: 20,
                        color: Colors.white,
                        height: 400,
                        width: (PageWidth(context)<800)? PageWidth(context)/2:400,
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: ListView(
                          children: [
                            InputPart,
                            CMaker(alignment: Alignment.center,child: LoginButton),
                            const Padding(padding:EdgeInsets.only(bottom: 20)),
                              Row(
                                children: [
                                  Expanded(
                                    child: ToWhatAreYouPage[0],
                                  ),
                                  Expanded(
                                    child: ToWhatAreYouPage[1],
                                  )
                                ],
                              ),
                            Expanded(child: Container()),
                          ],
                        )),
                    Expanded( child: Container()),
                  ],
                )),
          ),
        );
      });
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return LoginBody;
  }
}
