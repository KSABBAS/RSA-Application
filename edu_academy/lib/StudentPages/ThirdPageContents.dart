import 'dart:io';

import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

bool HomeWorkOpend = false;
bool HomeWorkOpend2 = false;
List Cols = [
  const Color.fromARGB(255, 142, 255, 43),
  const Color.fromARGB(255, 255, 204, 0),
  const Color.fromARGB(255, 255, 0, 0),
  const Color.fromARGB(255, 42, 226, 236),
  const Color.fromARGB(255, 42, 90, 236),
  const Color.fromARGB(255, 162, 42, 236),
  const Color.fromARGB(255, 236, 42, 145),
  const Color.fromARGB(255, 161, 255, 126)
];
List HomeWorks = [
  [
    "اللغة العربية",
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
        "images/Logo.png",
        "images/webinar.png",
        "images/Logo.png",
        "images/webinar.png",
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [false],

      /// solve or not
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ]
      ],

      /// solve or not [data of solve]
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ],
        ['3 / 5 ⭐', 'comment']
      ],

      /// solve or not [data of solve] [score,comment]
    ],
  ],
  [
    "الرياضيات",
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [false],

      /// solve or not
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ]
      ],

      /// solve or not [data of solve]
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ],
        ['score', 'comment']
      ],

      /// solve or not [data of solve] [score,comment]
    ],
  ],
  [
    "الكيمياء",
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [false],

      /// solve or not
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ]
      ],

      /// solve or not [data of solve]
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ],
        ['score', 'comment']
      ],

      /// solve or not [data of solve] [score,comment]
    ],
  ],
];
int HomeWorkIndex = 0;
bool ThirdPageThirdPage = false;
int HomeworkSelected = 0;
String HomeworkSelectedState = "";
bool StartedSoving = false;
String StudentHomeWorkAnswer = "";
bool EditSolution = false;
bool ViewSentSolution = false;

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    late Widget ThirdPageContents;
    Widget Logo = InkWell(
        onTap: () {
          setState(() {
            PageIndex = 0;
          });
        },
        child: Image.asset("images/Book.png"));
    Widget StudentNameTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        name,
        style: TextStyle(
            fontSize: (PageWidth(context) < 550)
                ? 17
                : (PageHeight(context) < 900)
                    ? 20
                    : 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 5, 123, 151)),
      ),
    );
    Widget StudentGradeTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        grade,
        style: TextStyle(
            fontSize: (PageWidth(context) < 550)
                ? 17
                : (PageHeight(context) < 900)
                    ? 20
                    : 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 89, 89, 87)),
      ),
    );
    Widget Notifications = InkWell(
      onTap: () {},
      child: Container(
        width: 70,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        height: (PageWidth(context) < 550) ? 50 : 100,
        child: Icon(
          Icons.notifications,
          size: (PageWidth(context) < 550)
              ? 25
              : (PageHeight(context) < 900)
                  ? 30
                  : 35,
        ),
      ),
    );
    Widget HomeworkSubjectName = CMaker(
      width: double.infinity,
      alignment: Alignment.center,
      child: CMaker(
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 6,
                spreadRadius: .03,
                color: Color.fromARGB(58, 0, 0, 0)),
          ],
          circularRadius: 20,
          color: const Color.fromARGB(255, 36, 160, 209),
          alignment: Alignment.center,
          height: 70,
          width: 150,
          child: TMaker(
              text: HomeWorks[HomeWorkIndex][0],
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 255, 255, 255))),
    );
    if (ThirdPageThirdPage) {
      Widget ThirdPageHomeworkBody = CMaker(
          circularRadius: 17,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 233, 255, 247),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TMaker(
              text: "${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][2]}",
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color.fromARGB(255, 0, 0, 0)));
      Widget ThirdPageHomeworkTitle = CMaker(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: TMaker(
              text: "${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][1]}",
              fontSize: (PageWidth(context) < 550)
                  ? 15
                  : (PageHeight(context) < 900)
                      ? 25
                      : 25,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 255, 255, 255)));
      Widget HomeworkImages = CMaker(
        height: 250,
        width: double.infinity,
        child: GridView.builder(
            itemCount: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][3].length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InstaImageViewer(
                backgroundColor: const Color.fromARGB(137, 104, 104, 104),
                child: Image(
                  image: AssetImage(
                      HomeWorks[HomeWorkIndex][HomeworkSelected + 1][3][index]),
                ),
              );
            }),
      );
      Widget HomeworkStudentImages = CMaker(
        color: const Color.fromARGB(255, 255, 255, 255),
        circularRadius: 25,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: (HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].length == 0)
            ? 0
            : 230,
        width: double.infinity,
        child: GridView.builder(
            itemCount: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InstaImageViewer(
                  backgroundColor: const Color.fromARGB(137, 104, 104, 104),
                  child: Image(
                    image: Image.file(HomeWorks[HomeWorkIndex]
                            [HomeworkSelected + 1][4][index])
                        .image,
                  ));
            }),
      );
      Widget StarsOf10 = CMaker(
          circularRadius: 20,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TMaker(
              text: "9/10 ⭐",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 36, 160, 209)));
      Widget TeacherHomeworkNotes = InkWell(
          onTap: () {},
          child: CMaker(
              circularRadius: 20,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TMaker(
                  text: "الملاحظات",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 36, 160, 209))));
      Widget StudentHomeWorkBody = SizedBox(
        height: 210,
        child: TextField(
          onChanged: (value) {
            StudentHomeWorkAnswer = value;
          },
          maxLines: 8,
          decoration: InputDecoration(
              hintText: "Write Something",
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 192, 192, 192)),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      );
      //Third
      if (HomeworkSelectedState == "Un Solved") {
        if (StartedSoving) {
          setState(() {
            ThirdPageContents = Column(
              children: [
                Container(
                    width: double.infinity,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                InkWell(
                    onTap: () {
                      setState(() {
                        StartedSoving = false;
                      });
                    },
                    child: CMaker(
                        margin: const EdgeInsets.only(left: 15),
                        height: 30,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        circularRadius: 20,
                        child: const Icon(
                          Icons.arrow_back,
                          size: 28,
                        ))),
                const Padding(padding: EdgeInsets.only(top: 20)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(
                    flex: 13,
                    child: CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      circularRadius: 20,
                      color: const Color.fromARGB(255, 36, 160, 209),
                      child: ListView(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          ThirdPageHomeworkTitle,
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          CMaker(
                              height: 100,
                              alignment: Alignment.center,
                              child: ThirdPageHomeworkBody),
                          HomeworkImages,
                          const Padding(padding: EdgeInsets.only(top: 40)),
                          CMaker(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              circularRadius: 25,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: StudentHomeWorkBody),
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          CMaker(
                              height: 70,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () async {
                                  HomeWorks[HomeWorkIndex][HomeworkSelected + 1]
                                          [4]
                                      .add(File(
                                          (await PhotoImageFromGalary()).path));
                                  setState(() {});
                                },
                                child: CMaker(
                                    circularRadius: 17,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 30,
                                        right: 30),
                                    color: const Color.fromARGB(255, 22, 255, 111),
                                    child: TMaker(
                                        text: "Upload a Photo",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromARGB(255, 71, 69, 69))),
                              )),
                          const Padding(padding: EdgeInsets.only(top: 30)),
                          HomeworkStudentImages,
                          const Padding(padding: EdgeInsets.only(top: 30)),
                          CMaker(
                              height: 70,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {},
                                child: CMaker(
                                    circularRadius: 17,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 30,
                                        right: 30),
                                    color: const Color.fromARGB(
                                        255, 233, 255, 247),
                                    child: TMaker(
                                        text: "Send",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                              )),
                          const Padding(padding: EdgeInsets.only(top: 30)),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            );
          });
        } else {
          setState(() {
            ThirdPageContents = Column(
              children: [
                Container(
                    width: double.infinity,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                InkWell(
                    onTap: () {
                      setState(() {
                        HomeWorkOpend = true;
                        ThirdPageThirdPage = false;
                      });
                    },
                    child: CMaker(
                        margin: const EdgeInsets.only(left: 15),
                        height: 30,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        circularRadius: 20,
                        child: const Icon(
                          Icons.arrow_back,
                          size: 28,
                        ))),
                const Padding(padding: EdgeInsets.only(top: 20)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(
                    flex: 13,
                    child: CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      circularRadius: 20,
                      color: const Color.fromARGB(255, 36, 160, 209),
                      child: ListView(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          ThirdPageHomeworkTitle,
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          CMaker(
                              height: 100,
                              alignment: Alignment.center,
                              child: ThirdPageHomeworkBody),
                          HomeworkImages,
                          const Padding(padding: EdgeInsets.only(top: 40)),
                          CMaker(
                              height: 70,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    StartedSoving = true;
                                  });
                                },
                                child: CMaker(
                                    circularRadius: 17,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 30,
                                        right: 30),
                                    color: const Color.fromARGB(
                                        255, 233, 255, 247),
                                    child: TMaker(
                                        text: "بدء الحل",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                              )),
                          const Padding(padding: EdgeInsets.only(top: 30)),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            );
          });
        }
      } else if (HomeworkSelectedState == "Being Marked") {
        if (EditSolution) {
          setState(() {
            ThirdPageContents = Column(
              children: [
                Container(
                    width: double.infinity,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                InkWell(
                    onTap: () {
                      setState(() {
                        EditSolution = false;
                      });
                    },
                    child: CMaker(
                        margin: const EdgeInsets.only(left: 15),
                        height: 30,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        circularRadius: 20,
                        child: const Icon(
                          Icons.arrow_back,
                          size: 28,
                        ))),
                const Padding(padding: EdgeInsets.only(top: 20)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(
                    flex: 13,
                    child: CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      circularRadius: 20,
                      color: const Color.fromARGB(255, 36, 160, 209),
                      child: ListView(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          ThirdPageHomeworkTitle,
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          CMaker(
                              height: 100,
                              alignment: Alignment.center,
                              child: ThirdPageHomeworkBody),
                          HomeworkImages,
                          const Padding(padding: EdgeInsets.only(top: 40)),
                          CMaker(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              circularRadius: 25,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: StudentHomeWorkBody),
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          CMaker(
                              height: 70,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () async {
                                  HomeWorks[HomeWorkIndex][HomeworkSelected + 1]
                                          [4]
                                      .add(File(
                                          (await PhotoImageFromGalary()).path));
                                  setState(() {});
                                },
                                child: CMaker(
                                    circularRadius: 17,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 30,
                                        right: 30),
                                    color: const Color.fromARGB(255, 22, 255, 111),
                                    child: TMaker(
                                        text: "Upload a Photo",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromARGB(255, 71, 69, 69))),
                              )),
                          const Padding(padding: EdgeInsets.only(top: 30)),
                          HomeworkStudentImages,
                          const Padding(padding: EdgeInsets.only(top: 30)),
                          CMaker(
                              height: 70,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {},
                                child: CMaker(
                                    circularRadius: 17,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 30,
                                        right: 30),
                                    color: const Color.fromARGB(
                                        255, 233, 255, 247),
                                    child: TMaker(
                                        text: "Send",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                              )),
                          const Padding(padding: EdgeInsets.only(top: 30)),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            );
          });
        } else if (ViewSentSolution) {
          setState(() {
            ThirdPageContents = Column(
              children: [
                Container(
                    width: double.infinity,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                InkWell(
                    onTap: () {
                      setState(() {
                        ViewSentSolution = false;
                      });
                    },
                    child: CMaker(
                        margin: const EdgeInsets.only(left: 15),
                        height: 30,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        circularRadius: 20,
                        child: const Icon(
                          Icons.arrow_back,
                          size: 28,
                        ))),
                const Padding(padding: EdgeInsets.only(top: 20)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(
                    flex: 13,
                    child: CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      circularRadius: 20,
                      color: const Color.fromARGB(255, 36, 160, 209),
                      child: ListView(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          ThirdPageHomeworkTitle,
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          CMaker(
                              height: 100,
                              alignment: Alignment.center,
                              child: ThirdPageHomeworkBody),
                          HomeworkImages,
                          const Padding(padding: EdgeInsets.only(top: 40)),
                          CMaker(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              circularRadius: 25,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: TMaker(
                                  text: HomeWorks[HomeWorkIndex]
                                      [HomeworkSelected + 1][2],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          const Padding(padding: EdgeInsets.only(top: 30)),
                          HomeworkStudentImages,
                          const Padding(padding: EdgeInsets.only(top: 30)),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            );
          });
        } else {
          setState(() {
            ThirdPageContents = Column(
              children: [
                Container(
                    width: double.infinity,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                InkWell(
                    onTap: () {
                      setState(() {
                        HomeWorkOpend = true;
                        ThirdPageThirdPage = false;
                      });
                    },
                    child: CMaker(
                        margin: const EdgeInsets.only(left: 15),
                        height: 30,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        circularRadius: 20,
                        child: const Icon(
                          Icons.arrow_back,
                          size: 28,
                        ))),
                const Padding(padding: EdgeInsets.only(top: 20)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(
                    flex: 13,
                    child: CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      circularRadius: 20,
                      color: const Color.fromARGB(255, 36, 160, 209),
                      child: ListView(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          ThirdPageHomeworkTitle,
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          CMaker(
                              height: 100,
                              alignment: Alignment.center,
                              child: ThirdPageHomeworkBody),
                          HomeworkImages,
                          const Padding(padding: EdgeInsets.only(top: 40)),
                          Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              CMaker(
                                  height: 70,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        EditSolution = true;
                                      });
                                    },
                                    child: CMaker(
                                        circularRadius: 17,
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 30,
                                            right: 30),
                                        color: const Color.fromARGB(
                                            255, 233, 255, 247),
                                        child: TMaker(
                                            text: "تعديل الحل",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0))),
                                  )),
                              Expanded(
                                child: Container(),
                              ),
                              CMaker(
                                  height: 70,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        ViewSentSolution = true;
                                      });
                                    },
                                    child: CMaker(
                                        circularRadius: 17,
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 30,
                                            right: 30),
                                        color: const Color.fromARGB(
                                            255, 233, 255, 247),
                                        child: TMaker(
                                            text: "عرض الحل",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0))),
                                  )),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 30)),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            );
          });
        }
      } else {
        if (ViewSentSolution) {
          setState(() {
            ThirdPageContents = Column(
              children: [
                Container(
                    width: double.infinity,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                InkWell(
                    onTap: () {
                      setState(() {
                        ViewSentSolution = false;
                      });
                    },
                    child: CMaker(
                        margin: const EdgeInsets.only(left: 15),
                        height: 30,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        circularRadius: 20,
                        child: const Icon(
                          Icons.arrow_back,
                          size: 28,
                        ))),
                const Padding(padding: EdgeInsets.only(top: 20)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(
                    flex: 13,
                    child: CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      circularRadius: 20,
                      color: const Color.fromARGB(255, 36, 160, 209),
                      child: ListView(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          ThirdPageHomeworkTitle,
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          CMaker(
                              height: 100,
                              alignment: Alignment.center,
                              child: ThirdPageHomeworkBody),
                          HomeworkImages,
                          const Padding(padding: EdgeInsets.only(top: 40)),
                          CMaker(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              circularRadius: 25,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: TMaker(
                                  text: HomeWorks[HomeWorkIndex]
                                      [HomeworkSelected + 1][2],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          const Padding(padding: EdgeInsets.only(top: 30)),
                          HomeworkStudentImages,
                          const Padding(padding: EdgeInsets.only(top: 30)),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            );
          });
        } else {
          setState(() {
            ThirdPageContents = Column(
              children: [
                Container(
                    width: double.infinity,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                InkWell(
                    onTap: () {
                      setState(() {
                        HomeWorkOpend = true;
                        ThirdPageThirdPage = false;
                      });
                    },
                    child: CMaker(
                        margin: const EdgeInsets.only(left: 15),
                        height: 30,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        circularRadius: 20,
                        child: const Icon(
                          Icons.arrow_back,
                          size: 28,
                        ))),
                const Padding(padding: EdgeInsets.only(top: 20)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(
                    flex: 13,
                    child: CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      circularRadius: 20,
                      color: const Color.fromARGB(255, 36, 160, 209),
                      child: ListView(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          ThirdPageHomeworkTitle,
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          CMaker(
                              height: 100,
                              alignment: Alignment.center,
                              child: ThirdPageHomeworkBody),
                          HomeworkImages,
                          const Padding(padding: EdgeInsets.only(top: 40)),
                          Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: CMaker(
                                    circularRadius: 17,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 30,
                                        right: 30),
                                    color: const Color.fromARGB(
                                        255, 233, 255, 247),
                                    child: TMaker(
                                        text: HomeWorks[HomeWorkIndex]
                                            [HomeworkSelected +1][7][2][0],
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              CMaker(
                                  height: 70,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        ViewSentSolution = true;
                                      });
                                    },
                                    child: CMaker(
                                        circularRadius: 17,
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 30,
                                            right: 30),
                                        color: const Color.fromARGB(
                                            255, 233, 255, 247),
                                        child: TMaker(
                                            text: "عرض الحل",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0))),
                                  )),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 30)),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            );
          });
        }
      }
    } else if (HomeWorkOpend) {
      // Second
      Widget SecondPageArrowBack = InkWell(
          onTap: () {
            setState(() {
              HomeWorkOpend = false;
              ThirdPageThirdPage = false;
            });
          },
          child: CMaker(
              margin: const EdgeInsets.only(left: 15),
              height: 30,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              circularRadius: 20,
              child: const Icon(
                Icons.arrow_back,
                size: 28,
              )));
      Widget HomeWorksBuilder = CMaker(
          padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
          circularRadius: 25,
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
          width: double.infinity,
          color: const Color.fromARGB(255, 36, 160, 209),
          child: ListView.builder(
              itemCount: HomeWorks[HomeWorkIndex].length - 1,
              itemBuilder: (context, index) {
                return CMaker(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(58, 0, 0, 0)),
                  ],
                  padding: const EdgeInsets.all(10),
                  circularRadius: 25,
                  margin: const EdgeInsets.only(bottom: 30),
                  color: const Color.fromARGB(255, 233, 255, 247),
                  height: 120,
                  width: double.infinity,
                  child: Row(
                    children: [
                      CMaker(
                        width: 140,
                        child: Column(
                          children: [
                            Expanded(child: CMaker(child: Container())),
                            CMaker(
                                circularRadius: 15,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                color: (HomeWorks[HomeWorkIndex][index + 1][7]
                                            [0] ==
                                        false)
                                    ? const Color.fromARGB(255, 249, 84, 84)
                                    : (HomeWorks[HomeWorkIndex][index + 1][7]
                                                .length ==
                                            2)
                                        ? const Color.fromARGB(255, 66, 133, 241)
                                        : const Color.fromARGB(255, 32, 222, 32),
                                child: TMaker(
                                    text: (HomeWorks[HomeWorkIndex][index + 1]
                                                [7][0] ==
                                            false)
                                        ? "Un Solved"
                                        : (HomeWorks[HomeWorkIndex][index + 1]
                                                        [7]
                                                    .length ==
                                                2)
                                            ? "Being Marked"
                                            : HomeWorks[HomeWorkIndex]
                                                [index + 1][7][2][0],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white)),
                            Expanded(child: CMaker(child: Container())),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  HomeWorkOpend = false;
                                  ThirdPageThirdPage = true;
                                  HomeworkSelected = index;
                                  HomeworkSelectedState =
                                      (HomeWorks[HomeWorkIndex][index + 1][7]
                                                  [0] ==
                                              false)
                                          ? "Un Solved"
                                          : (HomeWorks[HomeWorkIndex][index + 1]
                                                          [7]
                                                      .length ==
                                                  2)
                                              ? "Being Marked"
                                              : HomeWorks[HomeWorkIndex]
                                                  [index + 1][7][2][0];
                                });
                              },
                              child: CMaker(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  circularRadius: 20,
                                  color:
                                      const Color.fromARGB(255, 235, 218, 118),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  height: 40,
                                  child: TMaker(
                                      text: "View",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Expanded(
                        flex: 5,
                        child: CMaker(
                            height: double.infinity,
                            padding: const EdgeInsets.only(right: 10),
                            child: TMaker(
                                textAlign: TextAlign.end,
                                text:
                                    "${HomeWorks[HomeWorkIndex][index + 1][1]}",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                      ),
                    ],
                  ),
                );
              }));
      if (PageWidth(context) < 550) {
        setState(() {
          ThirdPageContents = CMaker(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                SecondPageArrowBack,
                const Padding(padding: EdgeInsets.only(top: 20)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(flex: 13, child: HomeWorksBuilder)
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          ThirdPageContents = CMaker(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                SecondPageArrowBack,
                const Padding(padding: EdgeInsets.only(bottom: 30)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(bottom: 30)),
                Expanded(flex: 13, child: HomeWorksBuilder)
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          ThirdPageContents = Expanded(
            child: CMaker(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
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
                      height: 80,
                      child: Row(
                        children: [
                          Expanded(
                              child:
                                  SizedBox(width: 30, height: 30, child: Logo)),
                          Expanded(flex: 3, child: StudentNameTC),
                          Expanded(flex: 2, child: StudentGradeTC),
                          Expanded(child: Notifications)
                        ],
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  SecondPageArrowBack,
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  Expanded(flex: 13, child: HomeWorksBuilder)
                ],
              ),
            ),
          );
        });
      }
    } else {
      // First
      Widget StudentFullScadual = CMaker(
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: TableData[0].length,
            itemBuilder: (context, ColumnIndex) {
              return CMaker(
                  width: (PageWidth(context) - 40) / TableData[0].length,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: TableData.length,
                    itemBuilder: (context, RowIndex) {
                      return CMaker(
                          height: (200) / TableData.length,
                          child: Container(
                              decoration: BoxDecoration(
                                border: const Border(
                                    right: BorderSide(), bottom: BorderSide()),
                                borderRadius: BorderRadius.only(
                                  topLeft: ("$ColumnIndex $RowIndex" == "0 0")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  bottomLeft: ("$ColumnIndex $RowIndex" ==
                                          "0 ${TableData.length - 1}")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  topRight: ("$ColumnIndex $RowIndex" ==
                                          "${TableData[0].length - 1} 0")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  bottomRight: ("$ColumnIndex $RowIndex" ==
                                          "${TableData[0].length - 1} ${TableData.length - 1}")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                ),
                                color: (ColumnIndex == 0 || RowIndex == 0)
                                    ? const Color.fromARGB(255, 36, 160, 209)
                                    : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: TMaker(
                                  text: "${TableData[RowIndex][ColumnIndex]}",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: (ColumnIndex == 0 || RowIndex == 0)
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : const Color.fromARGB(255, 0, 0, 0))));
                    },
                  ));
            },
          ));
      Widget HomeWorksWidget = CMaker(
        alignment: Alignment.center,
        circularRadius: 8,
        margin: const EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
        width: double.infinity,
        height: (PageHeight(context) - 430),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 6,
              spreadRadius: .03,
              color: Color.fromARGB(82, 0, 0, 0)),
        ],
        color: const Color.fromARGB(255, 36, 160, 209),
        child: Column(
          children: [
            CMaker(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: CMaker(
                    circularRadius: 20,
                    height: 25,
                    width: 80,
                    color: const Color.fromARGB(255, 233, 255, 247),
                    margin:
                        const EdgeInsets.only(top: 20, bottom: 15, right: 10),
                    alignment: Alignment.center,
                    child: TMaker(
                        text: "الواجبات",
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 20, 206, 61)))),
            CMaker(
              height: PageHeight(context) - 490,
              child: ListView.builder(
                  itemCount: HomeWorks.length,
                  itemBuilder: (context, index) {
                    return CMaker(
                      circularRadius: 10,
                      color: const Color.fromARGB(255, 233, 255, 247),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 30),
                      width: double.infinity,
                      height: 95,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Container()),
                              TMaker(
                                  text: "${HomeWorks[index][0]}",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 5, left: 10),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Cols[index]),
                              )
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 2)),
                          CMaker(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 10),
                              child: TMaker(
                                  text: "واجب محلول : 3",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(
                                      255, 101, 239, 106))),
                          const Padding(padding: EdgeInsets.only(bottom: 2)),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    HomeWorkIndex = index;
                                    HomeWorkOpend = true;
                                  });
                                },
                                child: CMaker(
                                  margin:
                                      const EdgeInsets.only(left: 7, bottom: 2),
                                  alignment: Alignment.center,
                                  color:
                                      const Color.fromARGB(255, 36, 160, 209),
                                  circularRadius: 10,
                                  height: 30,
                                  width: 60,
                                  child: TMaker(
                                      text: "تصفح",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255)),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              CMaker(
                                padding: const EdgeInsets.only(right: 10),
                                child: TMaker(
                                    text: "واجب غير محلول : 0",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 255, 36, 36)),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
      if (PageWidth(context) < 550) {
        setState(() {
          ThirdPageContents = Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
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
                        height: 80,
                        child: Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                                    width: 30, height: 30, child: Logo)),
                            Expanded(flex: 3, child: StudentNameTC),
                            Expanded(flex: 2, child: StudentGradeTC),
                            Expanded(child: Notifications)
                          ],
                        )),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(82, 0, 0, 0)),
                        ],
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: StudentFullScadual)
                  ],
                ),
              ),
              HomeWorksWidget
            ],
          );
        });
      }
      if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          ThirdPageContents = Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
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
                        height: 80,
                        child: Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                                    width: 30, height: 30, child: Logo)),
                            Expanded(flex: 3, child: StudentNameTC),
                            Expanded(flex: 2, child: StudentGradeTC),
                            Expanded(child: Notifications)
                          ],
                        )),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(82, 0, 0, 0)),
                        ],
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: StudentFullScadual)
                  ],
                ),
              ),
              HomeWorksWidget
            ],
          );
        });
      }
      if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          ThirdPageContents = Expanded(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
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
                          height: 80,
                          child: Row(
                            children: [
                              Expanded(
                                  child: SizedBox(
                                      width: 30, height: 30, child: Logo)),
                              Expanded(flex: 3, child: StudentNameTC),
                              Expanded(flex: 2, child: StudentGradeTC),
                              Expanded(child: Notifications)
                            ],
                          )),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      CMaker(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 6,
                                spreadRadius: .03,
                                color: Color.fromARGB(82, 0, 0, 0)),
                          ],
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: StudentFullScadual)
                    ],
                  ),
                ),
                HomeWorksWidget
              ],
            ),
          );
        });
      }
    }
    print(HomeworkSelected);
    return ThirdPageContents;
  }
}
