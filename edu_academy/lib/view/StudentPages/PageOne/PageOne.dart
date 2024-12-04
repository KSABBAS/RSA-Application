import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/StudentPages/Other/StudentAppBar.dart';
import 'package:edu_academy/view/StudentPages/PageOne/Contents/JoinNextClass.dart';
import 'package:edu_academy/view/StudentPages/PageOne/Contents/MessageBox.dart';
import 'package:edu_academy/view/StudentPages/PageOne/Contents/SmallSchedule%20copy.dart';
import 'package:flutter/material.dart';
import 'dart:core';


class StudentFirstMainPage extends StatefulWidget {
  const StudentFirstMainPage({super.key});

  @override
  State<StudentFirstMainPage> createState() => _StudentFirstMainPageState();
}

class _StudentFirstMainPageState extends State<StudentFirstMainPage> {
  @override
  Widget build(BuildContext context) {
    int DayIndex = DateTime.now().weekday;
    late Widget FirstPageBody;
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
                  MessagesFromTeachers(),
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
                  MessagesFromTeachers(),
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
                  MessagesFromTeachers(),
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
