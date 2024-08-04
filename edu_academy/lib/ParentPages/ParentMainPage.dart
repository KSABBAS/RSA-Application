// import 'dart:convert';
import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/StudentPages/SecondPageContents.dart';
import 'package:edu_academy/StudentPages/ThirdPageContents.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_extensions/string_extensions.dart';

class ParentMainPage extends StatefulWidget {
  const ParentMainPage({super.key});

  @override
  State<ParentMainPage> createState() => _ParentMainPageState();
}

int PageIndex = 0;

String name = '';
String grade = "";
class _ParentMainPageState extends State<ParentMainPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? items = prefs.getStringList('id');
      log(items.toString());
      if (items != null && items.isNotEmpty) {
        setState(() {
          name = items[2].split("-")[0] as String;
          name = "${name.split(" ")[0]} ${name.split(" ")[1]}".toTitleCase;
          // grade = items[2].split("-")[1] as String;
          // userData = jsonDecode(items[2]) as Map<String, dynamic>;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    List<Widget> Pages = [
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(82, 0, 0, 0)),
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 20, right: 30),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              grade,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
                flex: 8,
                child: CMaker(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CMaker(
                            circularRadius: 16,
                            border: Border.all(width: 1),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15)),
                                          color:
                                              Color.fromARGB(255, 6, 122, 153)),
                                      height: 80,
                                      child: TMaker(
                                          text: "",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                    Expanded(
                                        child: CMaker(
                                      alignment: Alignment.center,
                                      height: 80,
                                      color: const Color.fromARGB(
                                          255, 6, 122, 153),
                                      child: TMaker(
                                          text: "00:00\nto\n00:00",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                    Expanded(
                                        child: CMaker(
                                      alignment: Alignment.center,
                                      height: 80,
                                      color: const Color.fromARGB(
                                          255, 6, 122, 153),
                                      child: TMaker(
                                          text: "00:00\nto\n00:00",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                    Expanded(
                                        child: CMaker(
                                      alignment: Alignment.center,
                                      height: 80,
                                      color: const Color.fromARGB(
                                          255, 6, 122, 153),
                                      child: TMaker(
                                          text: "00:00\nto\n00:00",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                    Expanded(
                                        child: CMaker(
                                      alignment: Alignment.center,
                                      height: 80,
                                      color: const Color.fromARGB(
                                          255, 6, 122, 153),
                                      child: TMaker(
                                          text: "00:00\nto\n00:00",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15)),
                                          color:
                                              Color.fromARGB(255, 6, 122, 153)),
                                      height: 80,
                                      child: TMaker(
                                          text: "00:00\nto\n00:00",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15)),
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                      height: 60,
                                      child: TMaker(
                                          text: "Day",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                              255, 6, 122, 153)),
                                    )),
                                    Expanded(
                                        child: CMaker(
                                      alignment: Alignment.center,
                                      height: 60,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: TMaker(
                                        text: "Math",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 6, 122, 153),
                                      ),
                                    )),
                                    Expanded(
                                        child: CMaker(
                                      alignment: Alignment.center,
                                      height: 60,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: TMaker(
                                        text: "Math",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 6, 122, 153),
                                      ),
                                    )),
                                    Expanded(
                                        child: CMaker(
                                      alignment: Alignment.center,
                                      height: 60,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: TMaker(
                                        text: "Math",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 6, 122, 153),
                                      ),
                                    )),
                                    Expanded(
                                        child: CMaker(
                                      alignment: Alignment.center,
                                      height: 60,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: TMaker(
                                        text: "Math",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 6, 122, 153),
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(15)),
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                      height: 60,
                                      child: TMaker(
                                        text: "Math",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 6, 122, 153),
                                      ),
                                    )),
                                  ],
                                ),
                              ],
                            )),
                        const Padding(padding: EdgeInsets.only(top: 30)),
                        CMaker(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 6,
                                  spreadRadius: .03,
                                  color: Color.fromARGB(82, 0, 0, 0)),
                            ],
                            circularRadius: 15,
                            width: PageWidth(context) - 40,
                            height: 130,
                            child: Column(
                              children: [
                                Expanded(
                                  child: CMaker(
                                      child: Row(
                                    children: [
                                      Expanded(child: Container()),
                                      SizedBox(
                                          width: 120,
                                          child: TMaker(
                                              text: "Next Class :",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  153, 24, 58, 60))),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          width: 100,
                                          child: ListTile(
                                            title: TMaker(
                                                text: "Math",
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    153, 24, 58, 60)),
                                            subtitle: TMaker(
                                                text: "AT 00:00",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    153, 24, 58, 60)),
                                          )),
                                      Expanded(child: Container()),
                                    ],
                                  )),
                                ),
                                Expanded(
                                    child: CMaker(
                                        alignment: Alignment.center,
                                        child: MaterialButton(
                                          height: 40,
                                          color: const Color.fromARGB(
                                              255, 19, 184, 230),
                                          onPressed: () {},
                                          child: TMaker(
                                              text: "Join",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        )))
                              ],
                            )),
                        Expanded(child: CMaker(child: Container()))
                      ],
                    ))),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(82, 0, 0, 0)),
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 20, right: 30),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              grade,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            const SecondPage(),
            const Padding(padding: EdgeInsets.only(bottom: 10))
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(82, 0, 0, 0)),
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 20, right: 30),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              grade,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(flex: 8, child: Container(child: const ThirdPage())),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(82, 0, 0, 0)),
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 20, right: 30),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              grade,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.remove('id');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SplashViewPage()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Icon(Icons.logout_sharp),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(flex: 8, child: Container()),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 255, 247),
      bottomNavigationBar: CurvedNavigationBar(
          color: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color.fromARGB(255, 233, 255, 247),
          index: PageIndex,
          height: 75,
          onTap: (val) {
            setState(() {
              PageIndex = val;
            });
          },
          items: const [
            Icon(
              Icons.home,
              color: Colors.black,
            ),
            Icon(
              Icons.menu_book,
              color: Colors.black,
            ),
            Icon(
              Icons.book,
              color: Colors.black,
            ),
            Icon(
              Icons.person,
              color: Colors.black,
            ),
          ]),
      body: Pages.elementAt(PageIndex),
    );
  }
}
