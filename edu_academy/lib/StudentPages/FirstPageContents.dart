import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';
import 'package:flutter/material.dart';

class StudentFirstMainPage extends StatefulWidget {
  const StudentFirstMainPage({super.key});

  @override
  State<StudentFirstMainPage> createState() => _StudentFirstMainPageState();
}

int DayIndex = DateTime.daysPerWeek;

class _StudentFirstMainPageState extends State<StudentFirstMainPage> {
  @override
  Widget build(BuildContext context) {
    int DayIndex = DateTime.daysPerWeek;
    late Widget FirstPageBody;
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
    Widget OneDayScadual = Column(
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
                          text: "",
                          fontSize: 20,
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
                          text: "00:00\nto\n00:00",
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
                          text: "00:00\nto\n00:00",
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
                          text: "00:00\nto\n00:00",
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
                          text: "00:00\nto\n00:00",
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
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(15)),
                          color: Color.fromARGB(255, 36, 160, 209)),
                      height: (PageWidth(context) < 550)
                          ? 80
                          : (PageHeight(context) < 900)
                              ? 100
                              : 150,
                      child: TMaker(
                          text: "00:00\nto\n00:00",
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
                  width: PageWidth(context)-40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ScadualData[0].length,
                    itemBuilder: (context, index) {
                      return CMaker(
                          height: 70,
                          width :(PageWidth(context) - 40) / ScadualData[0].length,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: (index==0)?Radius.circular(15):Radius.circular(0),bottomRight: (index==ScadualData[0].length-1)?Radius.circular(15):Radius.circular(0)),
                                color:
                                    Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: TMaker(
                                  text: "${ScadualData[DayIndex][index]}",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: (index == 0)
                                      ? Color.fromARGB(255, 36, 160, 209)
                                      : const Color.fromARGB(255, 0, 0, 0))));
                    },
                  ))
              ],
            )),
      ],
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
              text: "${ScadualData[DayIndex][2]}",
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(153, 24, 58, 60)),
          subtitle: TMaker(
              text: "AT 00:00",
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(153, 24, 58, 60)),
        ));
    Widget JoinButton = InkWell(
      onTap: () {},
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
          itemCount: 2,
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
                              text: "Math - Mr:Hazem",
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
                          text: "The message",
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
                          child: SizedBox(width: 30, height: 30, child: Logo)),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: OneDayScadual),
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
        FirstPageBody = Expanded(
          child: ListView(
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
                          child: SizedBox(width: 30, height: 30, child: Logo)),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  CMaker(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: OneDayScadual),
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
                          child: SizedBox(width: 30, height: 30, child: Logo)),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  (PageWidth(context) < 900)
                      ? Column(
                          children: [
                            CMaker(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: OneDayScadual),
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
                                      child: OneDayScadual)),
                              const Padding(padding: EdgeInsets.only(left: 20)),
                              Expanded(
                                child: CMaker(
                                    circularRadius: 20,
                                    height: 200,
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
                              ),
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
