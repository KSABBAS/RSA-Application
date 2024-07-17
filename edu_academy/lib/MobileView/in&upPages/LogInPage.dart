import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LoginPageState();
}

var obscureText = true;
bool loggedIn = false;
List l = [2.2];

class _LoginPageState extends State<LogInPage> {
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
          decoration: BoxDecoration(
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
                        padding: EdgeInsets.fromLTRB(0, 40, 20, 0),
                        alignment: Alignment.center,
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(255, 8, 125, 159),
                              fontWeight: FontWeight.w700),
                        ),
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.zero,
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(23000),
                              bottomRight: Radius.circular(10)),
                          color: const Color.fromARGB(255, 255, 255, 255),
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
                  decoration: InputDecoration(
                      label: Text(
                        "Full Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      icon: Icon(Icons.person_sharp),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Expanded(child: Container()),
                TextField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(Icons.remove_red_eye_outlined),
                      ),
                      label: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      icon: Icon(Icons.password),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
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
        Container(
          height: Sheight * (3 / 13),
          child: Column(
            children: [
              Expanded(child: Container()),
              InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w700),
                    ),
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 74, 193, 241),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onTap: () {
                    setState(() {
                      loggedIn = true;
                      // 
                    });
                    if (loggedIn) {
                      Navigator.pushReplacementNamed(
                          context, "StudentMainPage");
                    }
                  }),
              Expanded(child: Container()),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "New User ? ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 206, 206, 206),
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "WhatAreYouPage");
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 74, 193, 241),
                              fontWeight: FontWeight.w500),
                        )),
                  )),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        ),
      ]),
    );
  }
}
