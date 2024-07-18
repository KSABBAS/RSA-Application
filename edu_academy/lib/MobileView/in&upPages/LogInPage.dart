import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LoginPageState();
}

var obscureText = true;
bool loggedIn = false;
List l = [2.2];

String Login_Email = "";
String Login_Password = "";

class _LoginPageState extends State<LogInPage> {
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    final Sheigt = MediaQuery.of(context).size.height;
    l.add(Sheigt);
    double Sheight = l[1];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView(children: [
        Container(
          height: Sheight * (5 / 13),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                Color.fromARGB(255, 8, 125, 159),
                Color.fromARGB(255, 74, 193, 241)
              ])),
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
                        alignment: Alignment.center,
                        height: 160,
                        width: 160,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.zero,
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(23000),
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
                      )),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            height: double.infinity,
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "images/Logo.png",
                              fit: BoxFit.fill,
                            )),
                      ),
                    ],
                  ))
                ],
              )),
            ],
          ),
        ),
        Container(
          height: Sheight * (5 / 13),
          alignment: Alignment.center,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 60, top: 60, bottom: 0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    Login_Email = value;
                  },
                  decoration: InputDecoration(
                      label: const Text(
                        "Email or Phone number",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      icon: const Icon(Icons.person_sharp),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Expanded(child: Container()),
                TextField(
                  onChanged: (value) {
                    Login_Password = value;
                  },
                  obscureText: obscureText,
                  decoration: InputDecoration(
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      icon: const Icon(Icons.password),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Sheight * (3 / 13),
          child: Column(
            children: [
              Expanded(child: Container()),
              InkWell(
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
                  onTap: () {
                    setState(() {
                      loggedIn = true;
                      //
                    });

                    if (loggedIn) {
                      dbService.rlRead_ForLogin(Login_Email,Login_Password);
                      // Navigator.pushReplacementNamed(context, "StudentMainPage");
                    }
                  }),
              Expanded(child: Container()),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "New User ? ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 206, 206, 206),
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                  Expanded(
                      child: Container(
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
                  )),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        ),
      ]),
    );
  }
}
