import 'dart:developer';

import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/StudentPages/Notifications.dart';
import 'package:edu_academy/StudentPages/StudentAppBar.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';
// import 'package:edu_academy/service/Databse_Service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentFirstMainPage extends StatefulWidget {
  const StudentFirstMainPage({super.key});

  @override
  State<StudentFirstMainPage> createState() => _StudentFirstMainPageState();
}

List<dynamic> Messgaes_list = [];

Object? realTimeValues;

class _StudentFirstMainPageState extends State<StudentFirstMainPage> {
  late Future<void> _dataFuture;
  Future<void> _launchURL({required String url}) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      //mj
    }
  }

  @override
  void initState() {
    super.initState();
    _dataFuture = regetmessages();
  }

  regetmessages() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? items = prefs.getStringList('id');
      grade = items![2].split("-")[1];
      final real = FirebaseDatabase.instance;
      final allMes = real.ref("Messages").child(grade);
      print("grade $grade");
      allMes.onValue.listen(
        (event) {
          setState(() {
            try {
              realTimeValues = event.snapshot.value;
              print("realTimeValues $realTimeValues");
              Map map = realTimeValues as Map;
              print("map.keys ${map.keys}");
              for (var i in map.keys) {
                for (var j in map[i].keys) {
                  Messgaes_list.add([i, map[i][j][3], map[i][j][0]]);
                }
              }
            } catch (e) {
              print("e $e");
            }
          });
        },
      );
    } catch (e) {
      log("e ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    int DayIndex = DateTime.now().weekday;
    late Widget FirstPageBody;
    Widget FullScadual = CMaker(
        width: double.infinity,
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: TableData[0].length,
          itemBuilder: (context, ColumnIndex) {
            return CMaker(
                width: (PageWidth(context) - 80) / TableData[0].length,
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
    Widget OneDayTable = InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: FullScadual,
            );
          },
        );
      },
      child: Column(
        children: [
          CMaker(
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 6,
                    spreadRadius: .03,
                    color: Color.fromARGB(82, 0, 0, 0)),
              ],
              circularRadius: 15,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(15)),
                            color: Color.fromARGB(255, 36, 160, 209)),
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        child: TMaker(
                            textAlign: TextAlign.center,
                            text: "Time and Day",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "10:00\nto\n10:45",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "10:45\nto\n11:30",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "11:30\nto\n12:15",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "12:15\nto\n12:30",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15)),
                            color: Color.fromARGB(255, 36, 160, 209)),
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        child: TMaker(
                            text: "12:30\nto\n1:15",//2:00 - 1:15 //2:45 - 2:00
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                    ],
                  ),
                  CMaker(
                      height: 70,
                      width: PageWidth(context) - 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: TableData[0].length,
                        itemBuilder: (context, index) {
                          return CMaker(
                              height: 70,
                              width: (PageWidth(context) >= 550 &&
                                      PageWidth(context) < 1200 &&
                                      PageHeight(context) < 900)
                                  ? (PageWidth(context) - 165) /
                                      TableData[0].length
                                  : (PageWidth(context) >= 550 &&
                                          PageWidth(context) >= 1200 &&
                                          PageHeight(context) < 900)
                                      ? (PageWidth(context) - 790) /
                                          TableData[0].length
                                      : ((PageWidth(context) - 40) /
                                          TableData[0].length),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: (index == 0)
                                            ? const Radius.circular(15)
                                            : const Radius.circular(0),
                                        bottomRight:
                                            (index == TableData[0].length - 1)
                                                ? const Radius.circular(15)
                                                : const Radius.circular(0)),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: TMaker(
                                      text: "${TableData[DayIndex][index]}",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: (index == 0)
                                          ? const Color.fromARGB(
                                              255, 36, 160, 209)
                                          : const Color.fromARGB(
                                              255, 0, 0, 0))));
                        },
                      ))
                ],
              )),
        ],
      ),
    );
    Widget NextClassTC = CMaker(
        width: 130,
        child: TMaker(
            text: "Next Class :",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(153, 24, 58, 60)));
    Widget LessonAndDate = Container(
        alignment: Alignment.centerLeft,
        width: 150,
        child: ListTile(
          title: TMaker(
              text: "join 👇", //
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(153, 24, 58, 60)),
          subtitle: TMaker(
              text: () {
                if (int.parse(grade[grade.length - 1]) <= 6 &&
                    grade[grade.length - 2] == " ") {
                  return "Password:0000";
                } else {
                  return "Password:2000";
                }
              }(),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(153, 24, 58, 60)),
        ));
    Widget JoinButton = InkWell(
      onTap: () {
        _launchURL(
            url: (int.parse(grade[grade.length - 1]) <= 6 &&
                    grade[grade.length - 2] == " ")
                ? "https://us06web.zoom.us/j/3088571822?pwd=E5VM4ANDKYA5jW59RKUuwRvVA2onkA.1"
                : "https://us06web.zoom.us/j/5052829198");
      },
      child: CMaker(
        alignment: Alignment.center,
        circularRadius: 13,
        height: (PageWidth(context) < 550)
            ? 40
            : (PageHeight(context) < 900)
                ? 60
                : 70,
        width: (PageWidth(context) < 550)
            ? 120
            : (PageHeight(context) < 900)
                ? 120
                : 200,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: const Color.fromARGB(255, 36, 160, 209),
        child: TMaker(
            text: "Join",
            fontSize: (PageWidth(context) < 550)
                ? 20
                : (PageHeight(context) < 900)
                    ? 25
                    : 30,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
    Widget TeacherNotesT = TMaker(
        text: "Notes form teachers",
        fontSize: (PageWidth(context) < 550)
            ? 20
            : (PageHeight(context) < 900)
                ? 18
                : 25,
        fontWeight: FontWeight.w700,
        color: const Color.fromARGB(255, 255, 255, 255));
    Widget TeacherNotesWindow = CMaker(
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 6,
              spreadRadius: .03,
              color: Color.fromARGB(82, 0, 0, 0)),
        ],
        circularRadius: 20,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: (PageWidth(context) < 550)
            ? 300
            : (PageHeight(context) < 900)
                ? 300
                : 400,
        width: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView.builder(
          itemCount: Messgaes_list.length,
          itemBuilder: (context, index) {
            return CMaker(
              border: Border.all(
                  width: 1, color: const Color.fromARGB(31, 78, 78, 78)),
              circularRadius: 20,
              color: const Color.fromARGB(255, 36, 160, 209),
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              margin: const EdgeInsets.only(
                  bottom: 0, top: 20, left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      CMaker(
                          circularRadius: 20,
                          alignment: Alignment.center,
                          height: (PageWidth(context) < 550)
                              ? 30
                              : (PageHeight(context) < 900)
                                  ? 30
                                  : 30,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TMaker(
                              text:
                                  "${Messgaes_list[index][0]} - ${Messgaes_list[index][1]}",
                              fontSize: (PageWidth(context) < 550)
                                  ? 22
                                  : (PageHeight(context) < 900)
                                      ? 20
                                      : 25,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      Expanded(child: Container()),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  CMaker(
                      padding: const EdgeInsets.only(left: 20),
                      width: double.infinity,
                      child: TMaker(
                          textAlign: TextAlign.start,
                          text: "${Messgaes_list[index][2]}",
                          fontSize: (PageWidth(context) < 550)
                              ? 17
                              : (PageHeight(context) < 900)
                                  ? 15
                                  : 20,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 255, 255, 255))),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                ],
              ),
            );
          },
        ));
    if (PageWidth(context) < 550) {
      setState(() {
        FirstPageBody = CMaker(
          child: ListView(
            children: [
              StudentAppBar(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: OneDayTable),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      circularRadius: 20,
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 6,
                                child: NextClassTC,
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Expanded(
                                flex: 6,
                                child: LessonAndDate,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(),
                              ),
                            ],
                          )),
                          Expanded(
                              child: CMaker(
                                  alignment: Alignment.center,
                                  child: JoinButton))
                        ],
                      )),
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: CMaker(
                        circularRadius: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        alignment: Alignment.center,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        height: 40,
                        child: TeacherNotesT),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  TeacherNotesWindow,
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ],
          ),
        );
      });
    }
    if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      setState(() {
        FirstPageBody = CMaker(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              StudentAppBar(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: OneDayTable),
                  const Padding(padding: EdgeInsets.only(bottom: 40)),
                  CMaker(
                      circularRadius: 20,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 6,
                                child: NextClassTC,
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Expanded(
                                flex: 6,
                                child: LessonAndDate,
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(),
                              ),
                            ],
                          )),
                          Expanded(
                              child: CMaker(
                                  alignment: Alignment.center,
                                  child: JoinButton))
                        ],
                      )),
                  const Padding(padding: EdgeInsets.only(bottom: 50)),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: CMaker(
                        circularRadius: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 120),
                        alignment: Alignment.center,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        height: 60,
                        child: TeacherNotesT),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  TeacherNotesWindow,
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ],
          ),
        );
      });
    }
    if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      setState(() {
        FirstPageBody = Expanded(
          child: ListView(
            children: [
              StudentAppBar(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  (PageWidth(context) < 1200)
                      ? Column(
                          children: [
                            CMaker(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: OneDayTable),
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                            CMaker(
                                circularRadius: 20,
                                height: 200,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 6,
                                      spreadRadius: .03,
                                      color: Color.fromARGB(82, 0, 0, 0)),
                                ],
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: NextClassTC,
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: LessonAndDate,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                        child: CMaker(
                                            alignment: Alignment.center,
                                            child: JoinButton))
                                  ],
                                )),
                          ],
                        )
                      : CMaker(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  child: CMaker(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: OneDayTable)),
                              const Padding(padding: EdgeInsets.only(left: 20)),
                              CMaker(
                                  circularRadius: 20,
                                  height: 200,
                                  width: 350,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 6,
                                        spreadRadius: .03,
                                        color: Color.fromARGB(82, 0, 0, 0)),
                                  ],
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: NextClassTC,
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: LessonAndDate,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: CMaker(
                                              alignment: Alignment.center,
                                              child: JoinButton))
                                    ],
                                  )),
                            ],
                          ),
                        ),
                  const Padding(padding: EdgeInsets.only(bottom: 50)),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: CMaker(
                        circularRadius: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 120),
                        alignment: Alignment.center,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        height: 60,
                        child: TeacherNotesT),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  TeacherNotesWindow,
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ],
          ),
        );
      });
    }
    return FirstPageBody;
  }
}
