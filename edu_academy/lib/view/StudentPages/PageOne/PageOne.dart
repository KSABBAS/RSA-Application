import 'dart:developer';

import 'package:edu_academy/Data/StudentData/StudentData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/Other/StudentAppBar.dart';
import 'package:edu_academy/view/StudentPages/HomePage.dart';
import 'package:edu_academy/view/StudentPages/PageOne/Contents/JoinNextClass.dart';
import 'package:edu_academy/view/StudentPages/PageOne/Contents/SmallSchedule%20copy.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class StudentFirstMainPage extends StatefulWidget {
  const StudentFirstMainPage({super.key});

  @override
  State<StudentFirstMainPage> createState() => _StudentFirstMainPageState();
}

List<dynamic> Messgaes_list = [];

Object? realTimeValues;

class _StudentFirstMainPageState extends State<StudentFirstMainPage> {
  late Future<void> _dataFuture;
  @override
  void initState() {
    super.initState();
    _dataFuture = regetmessages();
  }

  regetmessages() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? items = prefs.getStringList('id');
      StudentData.grade = items![2].split("-")[1];
      String grade0 = StudentData.grade.contains('(Lang)')
          ? StudentData.grade.replaceAll('(Lang)', '').trim()
          : StudentData.grade;
      final real = FirebaseDatabase.instance;
      final allMes = real.ref("Messages").child(grade0);
      print("grade $grade0");
      allMes.onValue.listen(
        (event) {
          setState(() {
            try {
              realTimeValues = event.snapshot.value;
              print("realTimeValues $realTimeValues");
              Map map = realTimeValues as Map;
              print("map.keys ${map.keys}");
              Messgaes_list = [];
              for (var i in map.keys) {
                for (var j in map[i].keys) {
                  Messgaes_list.add([i, map[i][j][3], map[i][j][0]]);
                }
              }
              print("Messgaes_list ${Messgaes_list}");
              Messgaes_list.sort((a, b) => b[1].compareTo(a[1]));
              Messgaes_list = Messgaes_list.reversed.toList();
            } catch (e) {
              print("e $e");
            }
          });
        },
      );
    } catch (e) {
      log("e $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    int DayIndex = DateTime.now().weekday;
    late Widget FirstPageBody;
    Widget TeacherNotesT = TMaker(
        text: "رسائل من المعلمين",
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
              const StudentAppBar(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: SmallStudentSchedule(DayIndex: DayIndex)),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  StudentNextClass(),
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
              const StudentAppBar(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: SmallStudentSchedule(DayIndex: DayIndex)),
                  const Padding(padding: EdgeInsets.only(bottom: 40)),
                  StudentNextClass(),
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
              const StudentAppBar(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  (PageWidth(context) < 1200)
                      ? Column(
                          children: [
                            CMaker(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child:
                                    SmallStudentSchedule(DayIndex: DayIndex)),
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                            StudentNextClass(),
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
                                      child: SmallStudentSchedule(
                                          DayIndex: DayIndex))),
                              const Padding(padding: EdgeInsets.only(left: 20)),
                              StudentNextClass(),
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
