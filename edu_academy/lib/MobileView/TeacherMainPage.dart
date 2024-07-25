// import 'dart:convert';
import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/MobileView/GradesPage.dart';
import 'package:edu_academy/MobileView/SecondPage.dart';
import 'package:edu_academy/MobileView/TeacherHomeWorkPage.dart';
import 'package:edu_academy/MobileView/ThirdPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_extensions/string_extensions.dart';

class TeacherMainPage extends StatefulWidget {
  const TeacherMainPage({super.key});

  @override
  State<TeacherMainPage> createState() => _TeacherMainPageState();
}

int PageIndex = 0;
String SubjectName = "Math";
List ListOfGrades = [
  [
    "Grade one",
    [
      "kareem said hassan abbas",
      "iman ahmed esmaeel",
      "mohsen mohammed ali",
      "hana saeed mohsen",
    ],
    [
      ["توقيت الرسالة", "1 الرسالة"],
      ["توقيت الرسالة", "1 الرسالة"],
      ["توقيت الرسالة", "1 الرسالة"]
    ],
    ["الكتاب الاول", "الكتاب الثانى"]
  ],
  [
    "Grade two",
    [
      "kareem said hassan abbas",
      "iman ahmed esmaeel",
      "mohsen mohammed ali",
      "hana saeed mohsen",
    ],
    [
      ["توقيت الرسالة", "1 الرسالة"],
      ["توقيت الرسالة", "1 الرسالة"],
      ["توقيت الرسالة", "1 الرسالة"]
    ],
    ["الكتاب الاول", "الكتاب الثانى"]
  ],
  [
    "Grade three",
    [
      "kareem said hassan abbas",
      "iman ahmed esmaeel",
      "mohsen mohammed ali",
      "hana saeed mohsen",
    ],
    [
      ["توقيت الرسالة", "1 الرسالة"],
      ["توقيت الرسالة", "1 الرسالة"],
      ["توقيت الرسالة", "1 الرسالة"]
    ],
    ["الكتاب الاول", "الكتاب الثانى"]
  ],
];

class _TeacherMainPageState extends State<TeacherMainPage> {
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
                  Container(
                      width: 70,
                      height: 50,
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              PageIndex = 0;
                            });
                          },
                          child: Image.asset("images/Book.png"))),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "kareem said",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "math",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 70,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                ],
              ),
            ),
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
                                  color:
                                      const Color.fromARGB(153, 24, 58, 60))),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: 100,
                              child: ListTile(
                                title: TMaker(
                                    text: "Math",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(153, 24, 58, 60)),
                                subtitle: TMaker(
                                    text: "AT 00:00",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(153, 24, 58, 60)),
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
                              color: const Color.fromARGB(255, 19, 184, 230),
                              onPressed: () {},
                              child: TMaker(
                                  text: "Join",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )))
                  ],
                )),
          ],
        ),
      ),
      Container(
        height: PageHeight(context)+300,
        child: ListView(
          shrinkWrap: false,
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
                  Container(
                      width: 70,
                      height: 50,
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              PageIndex = 0;
                            });
                          },
                          child: Image.asset("images/Book.png"))),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "kareem said",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "math",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 70,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            GradesPage(
              ListOfGrades:
                  ListOfGrades, // put the list of grades and its students from the database here
              SubjectName: SubjectName, // put the teacher subject here
            ),
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
                  Container(
                      width: 70,
                      height: 50,
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              PageIndex = 0;
                            });
                          },
                          child: Image.asset("images/Book.png"))),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "kareem said",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "math",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 70,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top:20), ),
            TeacherHomeWorkPage()
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
                  Container(
                      width: 70,
                      height: 50,
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              PageIndex = 0;
                            });
                          },
                          child: Image.asset("images/Book.png"))),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "kareem said",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "math",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 70,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                ],
              ),
            ),
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
