import 'dart:io';

import 'package:edu_academy/TeacherPages/TeacherMainPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class TeacherThirdPageContents extends StatefulWidget {
  TeacherThirdPageContents(
      {super.key, required this.ListOfGrades, required this.SubjectName});
  List ListOfGrades;
  String SubjectName;
  @override
  State<TeacherThirdPageContents> createState() =>
      _TeacherThirdPageContentsState();
}

List<File> HomeworkImagesLinks = [];
bool GradeHomeWorkIsOppened = false;
int GradeHomeWorkOppenedIndex = 0;
bool NewHomeWork = false;
String HomeworkTitle = "";
String HomeworkBody = "";
GlobalKey<FormState> HomeworkKey = GlobalKey();
bool AllhomeWorks = false;
bool AllHomeworksAndOneIsOpend = false;
int IsOpendIndex = 0;
String Grade_selected = '';

List<dynamic> all_Homeworks = [];
String score = '5';

class _TeacherThirdPageContentsState extends State<TeacherThirdPageContents> {
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    late Widget ThirdPageBody;
    Widget GradeTitle = Expanded(
      child: CMaker(
          alignment: Alignment.center,
          height: 60,
          circularRadius: 20,
          margin: const EdgeInsets.only(left: 20, right: 20),
          color: const Color.fromARGB(255, 61, 197, 255),
          child: TMaker(
              text: "${Grade_selected} Homework",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white)),
    );
    if (AllHomeworksAndOneIsOpend) {
      print("homeworks");
      // third page
      if (PageWidth(context) < 550) {
        setState(() {
          ThirdPageBody = Column(
            children: [
              CMaker(
                  width: double.infinity,
                  height: 100,
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          AllhomeWorks = true;
                          AllHomeworksAndOneIsOpend = false;
                        });
                      },
                      child: CMaker(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: CMaker(
                      alignment: Alignment.center,
                      circularRadius: 20,
                      margin: EdgeInsets.only(right: 20),
                      height: 70,
                      child: TMaker(
                          text: "All Homeworks",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ))
                  ])),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                width: double.infinity,
                height: PageHeight(context) - 320,
                margin: EdgeInsets.only(left: 20, right: 20),
                circularRadius: 20,
                alignment: Alignment.center,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(61, 0, 0, 0),
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: .06)
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                child: ListView(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        height: 60,
                        circularRadius: 20,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: TMaker(
                            text: "Title ${IsOpendIndex + 1}",
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30),
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "Body",
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 86, 86, 86))),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                      height: 300,
                      boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: .06)
                  ],
                      color: const Color.fromARGB(255, 233, 255, 247),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Image.asset(
                              "images/Logo.png",
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
          CMaker(
            width: double.infinity,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: CMaker(
                  padding: EdgeInsets.all(10),
                  circularRadius: 15,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: .06)
                  ],
                  color: const Color.fromARGB(
                      255, 233, 255, 247),
                  child: TMaker(
                      text: "Edit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black))),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          CMaker(
            width: double.infinity,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: CMaker(
                  padding: EdgeInsets.all(10),
                  circularRadius: 15,
                  boxShadow: const [
                    BoxShadow(
                        color:
                            Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: .06)
                  ],
                  color: const Color.fromARGB(
                      255, 233, 255, 247),
                  child: TMaker(
                      text: "Delete",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)))),
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                ),
              ),
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          ThirdPageBody = Column(
            children: [
              CMaker(
                  width: double.infinity,
                  height: 100,
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          AllhomeWorks = true;
                          AllHomeworksAndOneIsOpend = false;
                        });
                      },
                      child: CMaker(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: CMaker(
                      alignment: Alignment.center,
                      circularRadius: 20,
                      margin: EdgeInsets.only(right: 20),
                      height: 70,
                      child: TMaker(
                          text: "All Homeworks",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ))
                  ])),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                width: double.infinity,
                height: PageHeight(context) - 320,
                margin: EdgeInsets.only(left: 20, right: 20),
                circularRadius: 20,
                alignment: Alignment.center,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(61, 0, 0, 0),
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: .06)
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                child: ListView(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        height: 60,
                        circularRadius: 20,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: TMaker(
                            text: "Title ${IsOpendIndex + 1}",
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30),
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "Body",
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 86, 86, 86))),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                      height: 300,
                      boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: .06)
                  ],
                      color: const Color.fromARGB(255, 233, 255, 247),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Image.asset(
                              "images/Logo.png",
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
          CMaker(
            width: double.infinity,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: CMaker(
                  padding: EdgeInsets.all(10),
                  circularRadius: 15,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: .06)
                  ],
                  color: const Color.fromARGB(
                      255, 233, 255, 247),
                  child: TMaker(
                      text: "Edit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black))),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          CMaker(
            width: double.infinity,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: CMaker(
                  padding: EdgeInsets.all(10),
                  circularRadius: 15,
                  boxShadow: const [
                    BoxShadow(
                        color:
                            Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: .06)
                  ],
                  color: const Color.fromARGB(
                      255, 233, 255, 247),
                  child: TMaker(
                      text: "Delete",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)))),
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                ),
              ),
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          ThirdPageBody = Column(
            children: [
              CMaker(
                  width: double.infinity,
                  height: 100,
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          AllhomeWorks = true;
                          AllHomeworksAndOneIsOpend = false;
                        });
                      },
                      child: CMaker(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: CMaker(
                      alignment: Alignment.center,
                      circularRadius: 20,
                      margin: EdgeInsets.only(right: 20),
                      height: 70,
                      child: TMaker(
                          text: "All Homeworks",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ))
                  ])),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                width: double.infinity,
                height: PageHeight(context) - 320,
                margin: EdgeInsets.only(left: 20, right: 20),
                circularRadius: 20,
                alignment: Alignment.center,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(61, 0, 0, 0),
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: .06)
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                child: ListView(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        height: 60,
                        circularRadius: 20,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: TMaker(
                            text: "Title ${IsOpendIndex + 1}",
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30),
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "Body",
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 86, 86, 86))),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                      height: 300,
                      boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: .06)
                  ],
                      color: const Color.fromARGB(255, 233, 255, 247),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Image.asset(
                              "images/Logo.png",
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
          CMaker(
            width: double.infinity,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: CMaker(
                  padding: EdgeInsets.all(10),
                  circularRadius: 15,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: .06)
                  ],
                  color: const Color.fromARGB(
                      255, 233, 255, 247),
                  child: TMaker(
                      text: "Edit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black))),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          CMaker(
            width: double.infinity,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: CMaker(
                  padding: EdgeInsets.all(10),
                  circularRadius: 15,
                  boxShadow: const [
                    BoxShadow(
                        color:
                            Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: .06)
                  ],
                  color: const Color.fromARGB(
                      255, 233, 255, 247),
                  child: TMaker(
                      text: "Delete",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)))),
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                ),
              ),
            ],
          );
        });
      }
    } else if (AllhomeWorks) {
      if (PageWidth(context) < 550) {
        setState(() {
          ThirdPageBody = Column(
            children: [
              CMaker(
                  width: double.infinity,
                  height: 100,
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          GradeHomeWorkIsOppened = true;
                          NewHomeWork = false;
                          AllhomeWorks = false;
                        });
                      },
                      child: CMaker(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: CMaker(
                      alignment: Alignment.center,
                      circularRadius: 20,
                      margin: EdgeInsets.only(right: 20),
                      height: 70,
                      child: TMaker(
                          text: "All Homeworks",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ))
                  ])),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                  width: double.infinity,
                  height: PageHeight(context) - 320,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  circularRadius: 20,
                  alignment: Alignment.center,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        spreadRadius: .06)
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      CMaker(
                          alignment: Alignment.centerLeft,
                          height: 60,
                          circularRadius: 20,
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: TMaker(
                              text:
                                  "Grade ${GradeHomeWorkOppenedIndex + 1} Homework",
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      CMaker(
                        circularRadius: 20,
                        height: PageHeight(context) - 420,
                        child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      IsOpendIndex = index;
                                      GradeHomeWorkIsOppened = false;
                                      NewHomeWork = false;
                                      AllhomeWorks = false;
                                      AllHomeworksAndOneIsOpend = true;
                                    });
                                  },
                                  child: CMaker(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(61, 0, 0, 0),
                                          offset: Offset(2, 2),
                                          blurRadius: 10,
                                          spreadRadius: .06)
                                    ],
                                    circularRadius: 20,
                                    margin: EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 20,
                                        right: 20),
                                    width: double.infinity,
                                    height: 180,
                                    color: const Color.fromARGB(
                                        255, 233, 255, 247),
                                    child: Column(
                                      children: [
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10)),
                                        CMaker(
                                            alignment: Alignment.centerLeft,
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: TMaker(
                                                text: "Title",
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black)),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10)),
                                        CMaker(
                                            alignment: Alignment.centerLeft,
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: TMaker(
                                                textAlign: TextAlign.start,
                                                text: "Body",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                color: const Color.fromARGB(
                                                    255, 86, 86, 86))),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20)),
                                        CMaker(
                                          height: 70,
                                          width: double.infinity,
                                          child: GridView.builder(
                                            itemCount: 4,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 6,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                },
                                                child: Image.asset(
                                                  "images/Logo.png",
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                      ),
                    ],
                  )),
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          ThirdPageBody = Column(
            children: [
              CMaker(
                  width: double.infinity,
                  height: 100,
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          GradeHomeWorkIsOppened = true;
                          NewHomeWork = false;
                          AllhomeWorks = false;
                        });
                      },
                      child: CMaker(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: CMaker(
                      alignment: Alignment.center,
                      circularRadius: 20,
                      margin: EdgeInsets.only(right: 20),
                      height: 70,
                      child: TMaker(
                          text: "All Homeworks",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ))
                  ])),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                  width: double.infinity,
                  height: PageHeight(context) - 320,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  circularRadius: 20,
                  alignment: Alignment.center,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(61, 0, 0, 0),
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        spreadRadius: .06)
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      CMaker(
                          alignment: Alignment.centerLeft,
                          height: 60,
                          circularRadius: 20,
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: TMaker(
                              text:
                                  "Grade ${GradeHomeWorkOppenedIndex + 1} Homework",
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      CMaker(
                        circularRadius: 20,
                        height: PageHeight(context) - 420,
                        child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      IsOpendIndex = index;
                                      GradeHomeWorkIsOppened = false;
                                      NewHomeWork = false;
                                      AllhomeWorks = false;
                                      AllHomeworksAndOneIsOpend = true;
                                    });
                                  },
                                  child: CMaker(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(61, 0, 0, 0),
                                          offset: Offset(2, 2),
                                          blurRadius: 10,
                                          spreadRadius: .06)
                                    ],
                                    circularRadius: 20,
                                    margin: EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 20,
                                        right: 20),
                                    width: double.infinity,
                                    height: 180,
                                    color: const Color.fromARGB(
                                        255, 233, 255, 247),
                                    child: Column(
                                      children: [
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10)),
                                        CMaker(
                                            alignment: Alignment.centerLeft,
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: TMaker(
                                                text: "Title",
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black)),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10)),
                                        CMaker(
                                            alignment: Alignment.centerLeft,
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: TMaker(
                                                textAlign: TextAlign.start,
                                                text: "Body",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                color: const Color.fromARGB(
                                                    255, 86, 86, 86))),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20)),
                                        CMaker(
                                          height: 70,
                                          width: double.infinity,
                                          child: GridView.builder(
                                            itemCount: 4,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 6,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                },
                                                child: Image.asset(
                                                  "images/Logo.png",
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                      ),
                    ],
                  )),
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          ThirdPageBody = Column(
                children: [
                  CMaker(
                      width: double.infinity,
                      height: 100,
                      child: Row(children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              GradeHomeWorkIsOppened = true;
                              NewHomeWork = false;
                              AllhomeWorks = false;
                            });
                          },
                          child: CMaker(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              child: Icon(Icons.arrow_back)),
                        ),
                        Expanded(
                            child: CMaker(
                          alignment: Alignment.center,
                          circularRadius: 20,
                          margin: EdgeInsets.only(right: 20),
                          height: 70,
                          child: TMaker(
                              text: "All Homeworks",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ))
                      ])),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      height: PageHeight(context) - 320,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      circularRadius: 20,
                      alignment: Alignment.center,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(61, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            spreadRadius: .06)
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 20)),
                          CMaker(
                              alignment: Alignment.centerLeft,
                              height: 60,
                              circularRadius: 20,
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TMaker(
                                  text:
                                      "Grade ${GradeHomeWorkOppenedIndex + 1} Homework",
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 0, 0, 0))),
                          Padding(padding: EdgeInsets.only(bottom: 20)),
                          CMaker(
                            circularRadius: 20,
                            height: PageHeight(context) - 420,
                            child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        setState(() {
                                          IsOpendIndex = index;
                                          GradeHomeWorkIsOppened = false;
                                          NewHomeWork = false;
                                          AllhomeWorks = false;
                                          AllHomeworksAndOneIsOpend = true;
                                        });
                                      },
                                      child: CMaker(
                                        boxShadow: const [
                                          BoxShadow(
                                              color:
                                                  Color.fromARGB(61, 0, 0, 0),
                                              offset: Offset(2, 2),
                                              blurRadius: 10,
                                              spreadRadius: .06)
                                        ],
                                        circularRadius: 20,
                                        margin: EdgeInsets.only(
                                            top: 15,
                                            bottom: 15,
                                            left: 20,
                                            right: 20),
                                        width: double.infinity,
                                        height: 180,
                                        color: const Color.fromARGB(
                                            255, 233, 255, 247),
                                        child: Column(
                                          children: [
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10)),
                                            CMaker(
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TMaker(
                                                    text: "Title",
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black)),
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10)),
                                            CMaker(
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TMaker(
                                                    textAlign: TextAlign.start,
                                                    text: "Body",
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color.fromARGB(
                                                        255, 86, 86, 86))),
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 20)),
                                            CMaker(
                                              height: 70,
                                              width: double.infinity,
                                              child: GridView.builder(
                                                itemCount: 4,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 6,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10),
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {});
                                                    },
                                                    child: Image.asset(
                                                      "images/Logo.png",
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                }),
                          ),
                        ],
                      )),
                ],
          );
        });
      }
    } else if (NewHomeWork) {
      Widget ThirdPageArrowBack = InkWell(
        onTap: () {
          setState(() {
            GradeHomeWorkIsOppened = true;
            NewHomeWork = false;
          });
        },
        child: CMaker(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back),
        ),
      );
      Widget HomeworkTitleTFF = CMaker(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          color: const Color.fromARGB(255, 255, 255, 255),
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          circularRadius: 15,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CMaker(
                  width: double.infinity,
                  child: TMaker(
                      textAlign: TextAlign.start,
                      text: "Title",
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              SizedBox(
                height: 70,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      HomeworkTitle = value;
                    });
                  },
                  onSaved: (newValue) {
                    HomeworkTitle = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "الحقل فارغ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      label: const Text(
                        "Add Title",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ],
          ));
      Widget HomeworkBodyTFF = CMaker(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06),
          ],
          color: const Color.fromARGB(255, 255, 255, 255),
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          circularRadius: 15,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CMaker(
                  width: double.infinity,
                  child: TMaker(
                      textAlign: TextAlign.start,
                      text: "Body",
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              SizedBox(
                height: 220,
                child: TextFormField(
                  minLines: 10,
                  maxLines: 10,
                  onChanged: (value) {
                    setState(() {
                      HomeworkBody = value;
                    });
                  },
                  onSaved: (newValue) {
                    HomeworkBody = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "الحقل فارغ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      label: const Text(
                        "Add Body",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ],
          ));
      Widget ScoreTFF = CMaker(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          color: const Color.fromARGB(255, 255, 255, 255),
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          circularRadius: 15,
          padding: const EdgeInsets.all(15),
          height: 120,
          child: Row(
            children: [
              Expanded(child: Container()),
              CMaker(
                  width: 80,
                  child: TMaker(
                      textAlign: TextAlign.start,
                      text: "Score",
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              CMaker(
                alignment: Alignment.center,
                height: 60,
                width: 100,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      score = value;
                    });
                  },
                  onSaved: (newValue) {
                    score = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "الحقل فارغ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      label: const Text(
                        "Add Score",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Expanded(child: Container()),
            ],
          ));
      ;
      Widget AddAnImageToHomework = CMaker(
          margin: const EdgeInsets.only(left: 20),
          height: 50,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              InkWell(
                onTap: () async {
                  XFile? Image = await PhotoImageFromGalary();
                  if (Image != null) {
                    HomeworkImagesLinks.add(File(Image.path));
                    setState(() {});
                  }
                },
                child: CMaker(
                    circularRadius: 15,
                    height: 60,
                    color: Colors.white,
                    width: 150,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(61, 0, 0, 0),
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: .06)
                    ],
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        TMaker(
                            text: "add a photo",
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                        Expanded(child: Container()),
                        const Icon(Icons.photo_library),
                        Expanded(child: Container()),
                      ],
                    )),
              ),
              const Padding(padding: EdgeInsets.only(left: 20)),
            ],
          ));
      Widget HomeWorkFinalLook = ListView(
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          CMaker(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: TMaker(
                  text: HomeworkTitle,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          CMaker(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: HomeworkBody,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 86, 86, 86))),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          CMaker(
            height: (HomeworkImagesLinks.length % 2 == 0)
                ? HomeworkImagesLinks.length * 80
                : (HomeworkImagesLinks.length + 1) * 80,
            width: double.infinity,
            child: GridView.builder(
              itemCount: HomeworkImagesLinks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      HomeworkImagesLinks.removeAt(index);
                    });
                  },
                  child: Image.file(
                    HomeworkImagesLinks[index],
                    fit: BoxFit.fitWidth,
                  ),
                );
              },
            ),
          )
        ],
      );
      Widget SendHomeworkButton = InkWell(
        onTap: () async {
          if (HomeworkKey.currentState!.validate()) {
            HomeworkKey.currentState!.save();
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
            List<dynamic> Files_List = [];
            print(HomeworkImagesLinks);
            if (HomeworkImagesLinks.length != 0) {
              Files_List = await dbService.stHwStore(HomeworkImagesLinks);
              print(Files_List);
            }
            //fiAdd_Hw(String Grade, String Subject, String Teacher_Id, List Files_List,
            //String HomeworkTitle, String HomeworkBody, String score)
            dbService.fiAdd_Hw(
                ListOfGrades[GradeHomeWorkOppenedIndex][0],
                SubjectThatIsSelected,
                Teacher_Id,
                Files_List,
                HomeworkTitle,
                HomeworkBody,
                score);

            OverlayLoadingProgress.stop();
            PanaraInfoDialog.show(
              context,
              title: "نجاح",
              message: "تم اضافة الواجب بنجاح",
              buttonText: "عودة",
              onTapDismiss: () {
                Navigator.pop(context);
                setState(() {
                  GradeHomeWorkIsOppened = true;
                  NewHomeWork = false;
                });
              },
              panaraDialogType: PanaraDialogType.success,
              barrierDismissible: false,
            );
          }
        },
        child: CMaker(
            width: 80,
            padding: EdgeInsets.all(10),
            color: Color.fromARGB(255, 61, 197, 255),
            alignment: Alignment.center,
            circularRadius: 15,
            child: TMaker(
                text: "Send",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      );
      if (PageWidth(context) < 550) {
        setState(() {
          ThirdPageBody = Form(
            key: HomeworkKey,
            child: CMaker(
              height: PageHeight(context) - 180,
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    children: [ThirdPageArrowBack, GradeTitle],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  HomeworkTitleTFF,
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  HomeworkBodyTFF,
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ScoreTFF,
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  AddAnImageToHomework,
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: CMaker(
                          width: 140,
                          height: 70,
                          alignment: Alignment.bottomCenter,
                          child: TMaker(
                              text: "Final Look",
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      height: 200,
                      child: CMaker(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(61, 0, 0, 0),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: .06)
                          ],
                          color: const Color.fromARGB(255, 255, 255, 255),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          circularRadius: 15,
                          padding: const EdgeInsets.all(15),
                          child: HomeWorkFinalLook)),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: CMaker(width: 80, child: SendHomeworkButton)),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          ThirdPageBody = Form(
            key: HomeworkKey,
            child: CMaker(
              height: PageHeight(context) - 180,
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    children: [ThirdPageArrowBack, GradeTitle],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  HomeworkTitleTFF,
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  HomeworkBodyTFF,
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  ScoreTFF,
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  AddAnImageToHomework,
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: CMaker(
                          width: 140,
                          height: 70,
                          alignment: Alignment.bottomCenter,
                          child: TMaker(
                              text: "Final Look",
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      height: 300,
                      child: CMaker(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(61, 0, 0, 0),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: .06)
                          ],
                          color: const Color.fromARGB(255, 255, 255, 255),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          circularRadius: 15,
                          padding: const EdgeInsets.all(15),
                          child: HomeWorkFinalLook)),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: CMaker(width: 80, child: SendHomeworkButton)),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          ThirdPageBody = Form(
            key: HomeworkKey,
            child: CMaker(
                height: PageHeight(context) - 180,
                child: ListView(
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: [ThirdPageArrowBack, GradeTitle],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    HomeworkTitleTFF,
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    HomeworkBodyTFF,
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    ScoreTFF,
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    AddAnImageToHomework,
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: CMaker(
                            width: 140,
                            height: 70,
                            alignment: Alignment.bottomCenter,
                            child: TMaker(
                                text: "Final Look",
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.black))),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        width: double.infinity,
                        height: 200,
                        child: CMaker(
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(61, 0, 0, 0),
                                  offset: Offset(2, 2),
                                  blurRadius: 10,
                                  spreadRadius: .06)
                            ],
                            color: const Color.fromARGB(255, 255, 255, 255),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            circularRadius: 15,
                            padding: const EdgeInsets.all(15),
                            child: HomeWorkFinalLook)),
                    //   (PageWidth(context) < 900)
                    //       ? Column(
                    //           children: [
                    //             HomeworkTitleTFF,
                    //             const Padding(
                    //                 padding: EdgeInsets.only(bottom: 20)),
                    //             HomeworkBodyTFF,
                    //             const Padding(
                    //                 padding: EdgeInsets.only(bottom: 20)),
                    //             ScoreTFF,
                    //             const Padding(
                    //                 padding: EdgeInsets.only(bottom: 20)),
                    //             AddAnImageToHomework,
                    //             const Padding(
                    //                 padding: EdgeInsets.only(bottom: 20)),
                    //                 CMaker(width: double.infinity,alignment: Alignment.center,child: CMaker(width: 140,height: 70,alignment: Alignment.bottomCenter,child: TMaker(text: "Final Look", fontSize: 28, fontWeight:FontWeight.w700, color:Colors.black))),
                    // const Padding(padding: EdgeInsets.only(bottom: 20)),
                    //             HomeWorkFinalLook,
                    //           ],
                    //         )
                    //       :
                    // Row(
                    //           children: [
                    //             CMaker(width: double.infinity,alignment: Alignment.center,child: CMaker(width: 140,height: 70,alignment: Alignment.bottomCenter,child: TMaker(text: "Final Look", fontSize: 28, fontWeight:FontWeight.w700, color:Colors.black))),
                    // const Padding(padding: EdgeInsets.only(bottom: 20)),
                    //             Expanded(
                    //               flex: 10,
                    //               child: CMaker(
                    //                   height: 400,
                    //                   child: CMaker(
                    //                       boxShadow: const [
                    //                         BoxShadow(
                    //                             color:
                    //                                 Color.fromARGB(61, 0, 0, 0),
                    //                             offset: Offset(2, 2),
                    //                             blurRadius: 10,
                    //                             spreadRadius: .06)
                    //                       ],
                    //                       color: const Color.fromARGB(
                    //                           255, 255, 255, 255),
                    //                       alignment: Alignment.center,
                    //                       margin: const EdgeInsets.symmetric(
                    //                           horizontal: 20),
                    //                       circularRadius: 15,
                    //                       padding: const EdgeInsets.all(15),
                    //                       child: HomeWorkFinalLook)),
                    //             ),
                    //             Expanded(child: Container()),
                    //             Expanded(
                    //               flex: 10,
                    //               child: CMaker(
                    //                 height: PageHeight(context) - 200,
                    //                 child: ListView(children: [
                    //                   HomeworkTitleTFF,
                    //                   const Padding(
                    //                       padding: EdgeInsets.only(bottom: 20)),
                    //                   HomeworkBodyTFF,
                    //                   const Padding(
                    //                       padding: EdgeInsets.only(bottom: 20)),
                    //                   AddAnImageToHomework,
                    //                 ]),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsetsDirectional.only(end: 20),
                        child: SendHomeworkButton),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                )),
          );
        });
      }
    } else if (GradeHomeWorkIsOppened) {
      // الصفحه الثانية
      Widget SecondPageArrowBack = InkWell(
        onTap: () {
          setState(() {
            GradeHomeWorkIsOppened = false;
            NewHomeWork = false;
          });
        },
        child: CMaker(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back),
        ),
      );
      Widget GradesStudents = CMaker(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 20,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          height: 500,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: ListView.builder(
            itemCount: ListOfGrades.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CMaker(
                    height: 80,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        CMaker(
                            height: 70,
                            width: 70,
                            child: CircleAvatar(
                                backgroundImage:
                                    Image.asset("images/Person.png").image)),
                        Expanded(
                          child: ListTile(
                            subtitle: TMaker(
                                textAlign: TextAlign.start,
                                text: "Last solved : 00:00",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(119, 0, 0, 0)),
                            title: TMaker(
                              textAlign: TextAlign.start,
                              text:(() {
                                List<String> nameParts = widget.ListOfGrades[GradeHomeWorkOppenedIndex][1][index][0].toString().split(" ");
                                return nameParts.length > 1 
                                    ? "${nameParts[0]} ${nameParts[1]}" 
                                    : nameParts[0];
                              })(),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                TMaker(
                                    text: "State",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                const Padding(
                                    padding: EdgeInsets.only(bottom: 5)),
                                InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: CMaker(
                                    circularRadius: 15,
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 80,
                                    color: const Color.fromARGB(
                                        255, 159, 211, 211),
                                    child: TMaker(
                                        text: "check",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                ],
              );
            },
          ));
      Widget AllHomeworks = InkWell(
        onTap: ()  async {
          all_Homeworks = await 
                dbService.Fi_getAll_HW(Grade_selected, SubjectThatIsSelected) ;
          setState(()  {
            // fitch all home works
            print(Grade_selected);
            print(SubjectThatIsSelected);
            print("all_Homeworks $all_Homeworks");

  
            GradeHomeWorkIsOppened = false;
            NewHomeWork = false;
            AllhomeWorks = true;
          });
        },
        child: CMaker(
            height: 70,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(61, 0, 0, 0),
                  offset: Offset(2, 2),
                  blurRadius: 10,
                  spreadRadius: .06)
            ],
            color: const Color.fromARGB(255, 255, 255, 255),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            circularRadius: 15,
            child: Row(
              children: [
                Expanded(flex: 2, child: Container()),
                TMaker(
                    text: "All Homeworks",
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 0, 0)),
                Expanded(child: Container()),
                const Icon(Icons.edit),
                Expanded(flex: 2, child: Container()),
              ],
            )),
      );
      Widget AddNewHomework = InkWell(
        onTap: () {
          setState(() {
            GradeHomeWorkIsOppened = false;
            NewHomeWork = true;
          });
        },
        child: CMaker(
            height: 70,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(61, 0, 0, 0),
                  offset: Offset(2, 2),
                  blurRadius: 10,
                  spreadRadius: .06)
            ],
            color: const Color.fromARGB(255, 255, 255, 255),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            circularRadius: 15,
            child: Row(
              children: [
                Expanded(flex: 2, child: Container()),
                TMaker(
                    text: "Add new Homworks",
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 0, 0)),
                Expanded(child: Container()),
                const Icon(Icons.edit_document),
                Expanded(flex: 2, child: Container()),
              ],
            )),
      );
      if (PageWidth(context) < 550) {
        setState(() {
          ThirdPageBody = CMaker(
            height: PageHeight(context) - 170,
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [SecondPageArrowBack, GradeTitle],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Expanded(flex: 14, child: GradesStudents),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                ),
                Expanded(flex: 3, child: AllHomeworks),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Expanded(flex: 3, child: AddNewHomework),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                ),
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          ThirdPageBody = CMaker(
            height: PageHeight(context) - 190,
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [SecondPageArrowBack, GradeTitle],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Expanded(flex: 14, child: GradesStudents),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                ),
                (PageWidth(context) < 910)
                    ? Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Expanded(flex: 3, child: AllHomeworks),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            Expanded(flex: 3, child: AddNewHomework),
                          ],
                        ))
                    : Expanded(
                        flex: 6,
                        child: Row(children: [
                          Expanded(child: Container()),
                          Expanded(
                            flex: 20,
                            child: AllHomeworks,
                          ),
                          Expanded(child: Container()),
                          Expanded(flex: 20, child: AddNewHomework),
                        ]),
                      ),
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          ThirdPageBody = CMaker(
            height: PageHeight(context) - 170,
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [SecondPageArrowBack, GradeTitle],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Expanded(flex: 14, child: GradesStudents),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                ),
                (PageWidth(context) < 910)
                    ? Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Expanded(flex: 3, child: AllHomeworks),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            Expanded(flex: 3, child: AddNewHomework),
                          ],
                        ))
                    : Expanded(
                        flex: 6,
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                              flex: 20,
                              child: AllHomeworks,
                            ),
                            Expanded(child: Container()),
                            Expanded(flex: 20, child: AddNewHomework),
                          ],
                        )),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                ),
                Expanded(child: Container()),
              ],
            ),
          );
        });
      }
    } else {
      // الصفحة الاولى
      Widget ThirdPageFirstTitle = CMaker(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 13,
          width: (PageWidth(context) < 700) ? double.infinity : 500,
          height: 60,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: TMaker(
              text: "Homeworks",
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black));
      Widget ThirdPageGrades = CMaker(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          circularRadius: 20,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          height: PageHeight(context) - 265,
          padding: const EdgeInsets.only(top: 20),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: CMaker(
            height: PageHeight(context) - 350,
            child: ListView.builder(
              itemCount: ListOfGrades.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CMaker(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(61, 0, 0, 0),
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              spreadRadius: .06)
                        ],
                        circularRadius: 15,
                        color: const Color.fromARGB(255, 233, 255, 247),
                        height: 70,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 20)),
                            TMaker(
                                text: "${ListOfGrades[index][0]}",
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  GradeHomeWorkIsOppened = true;
                                  NewHomeWork = false;
                                  GradeHomeWorkOppenedIndex = index;
                                  Grade_selected = ListOfGrades[index][0];
                                });
                              },
                              child: CMaker(
                                height: 40,
                                width: 70,
                                color: const Color.fromARGB(255, 54, 244, 92),
                                circularRadius: 15,
                                alignment: Alignment.center,
                                child: TMaker(
                                    text: "فتح",
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(right: 20)),
                          ],
                        )),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                );
              },
            ),
          ));
      if (PageWidth(context) < 550) {
        setState(() {
          ThirdPageBody = Column(
            children: [
              ThirdPageFirstTitle,
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              ThirdPageGrades
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          ThirdPageBody = Column(
            children: [
              ThirdPageFirstTitle,
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              ThirdPageGrades
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          ThirdPageBody = Column(
            children: [
              ThirdPageFirstTitle,
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              ThirdPageGrades
            ],
          );
        });
      }
    }
    return ThirdPageBody;
  }
}
