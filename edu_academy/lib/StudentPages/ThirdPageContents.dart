import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';

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
    {"Name": "اللغة العربية"},
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "no"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "yes"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "9"}
    ],
  ],
  [
    {"Name": "الرياضيات"},
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "no"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "yes"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "9"}
    ],
  ],
  [
    {"Name": "الكيمياء"},
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "no"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "yes"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "9"}
    ],
  ],
];
int HomeWorkIndex = 0;
bool ThirdPageThirdPage = false;
int HomeworkSelected = 0;
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
              text: HomeWorks[HomeWorkIndex][0]["Name"],
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 255, 255, 255))),
    );
    Widget ThirdPageBackButton = InkWell(
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
            )));
    if (ThirdPageThirdPage) {
      //Third
      Widget ThirdPageHomeworkTitle = CMaker(
          circularRadius: 17,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 233, 255, 247),
          child: TMaker(
              text: " الواجب رقم ${HomeworkSelected + 1}",
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color.fromARGB(255, 0, 0, 0)));
      Widget ThirdPageHomeworkDescription = CMaker(
          alignment: Alignment.center,
          child: TMaker(
              text: "حل من صفحه 55 الى صفحه 60 كتاب المعاصر",
              fontSize: (PageWidth(context) < 550)
                  ? 15
                  : (PageHeight(context) < 900)
                      ? 25
                      : 25,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 255, 255, 255)));
      Widget HomeworkImage = CMaker(
          width: double.infinity, child: Image.asset("images/webinar.png"));
      Widget ThirdPageHomeworkDescription2 = CMaker(
          alignment: Alignment.center,
          child: TMaker(
              text: "حل صفحه رقم 1 و صفحه 2 فى ال pdf",
              fontSize: (PageWidth(context) < 550)
                  ? 15
                  : (PageHeight(context) < 900)
                      ? 25
                      : 25,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 255, 255, 255)));
      Widget BookPdfButton = InkWell(
        onTap: () {},
        child: CMaker(
            circularRadius: 17,
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 70, right: 70),
            color: const Color.fromARGB(255, 233, 255, 247),
            child: TMaker(
                text: "File.pdf",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 0, 0))),
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
      Widget ViewTheRightSolution = InkWell(
        onTap: () {},
        child: CMaker(
            circularRadius: 17,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
            color: const Color.fromARGB(255, 233, 255, 247),
            child: TMaker(
                text: "عرض الحل",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 0, 0))),
      );
      if (PageWidth(context) < 550) {
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
                        child: SizedBox(width: 30, height: 30, child: Logo)),
                    Expanded(flex: 3, child: StudentNameTC),
                    Expanded(flex: 2, child: StudentGradeTC),
                    Expanded(child: Notifications)
                  ],
                )),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ThirdPageBackButton,
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
                      Expanded(
                          flex: 3,
                          child: CMaker(
                              alignment: Alignment.center,
                              child: ThirdPageHomeworkTitle)),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      ThirdPageHomeworkDescription,
                      Expanded(flex: 10, child: HomeworkImage),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      ThirdPageHomeworkDescription2,
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Expanded(
                          flex: 3,
                          child: CMaker(
                              alignment: Alignment.center,
                              child: BookPdfButton)),
                      const Padding(padding: EdgeInsets.only(top: 40)),
                      CMaker(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                child: CMaker(
                                    alignment: Alignment.center,
                                    child: StarsOf10)),
                            Expanded(
                                child: CMaker(
                                    alignment: Alignment.center,
                                    child: TeacherHomeworkNotes)),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      Expanded(
                          flex: 2,
                          child: CMaker(
                              alignment: Alignment.center,
                              child: ViewTheRightSolution)),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                    ],
                  ),
                )),
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        );
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
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
                        child: SizedBox(width: 30, height: 30, child: Logo)),
                    Expanded(flex: 3, child: StudentNameTC),
                    Expanded(flex: 2, child: StudentGradeTC),
                    Expanded(child: Notifications)
                  ],
                )),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ThirdPageBackButton,
            const Padding(padding: EdgeInsets.only(top: 20)),
            HomeworkSubjectName,
            const Padding(padding: EdgeInsets.only(top: 20)),
            Expanded(
                flex: 13,
                child: CMaker(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  circularRadius: 20,
                  color: const Color.fromARGB(255, 36, 160, 209),
                  child: Row(
                    children: [
                      Expanded(child: HomeworkImage),
                      Expanded(
                        flex: 2,
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 60)),
                            Expanded(
                                flex: 3,
                                child: CMaker(
                                    alignment: Alignment.center,
                                    child: ThirdPageHomeworkTitle)),
                            const Padding(padding: EdgeInsets.only(top: 60)),
                            ThirdPageHomeworkDescription,
                            const Padding(padding: EdgeInsets.only(top: 60)),
                            ThirdPageHomeworkDescription2,
                            const Padding(padding: EdgeInsets.only(top: 60)),
                            Expanded(
                                flex: 3,
                                child: CMaker(
                                    alignment: Alignment.center,
                                    child: BookPdfButton)),
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: CMaker(
                                          alignment: Alignment.center,
                                          child: StarsOf10)),
                                  Expanded(
                                      child: CMaker(
                                          alignment: Alignment.center,
                                          child: TeacherHomeworkNotes)),
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            Expanded(
                                flex: 2,
                                child: CMaker(
                                    alignment: Alignment.center,
                                    child: ViewTheRightSolution)),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        );
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        ThirdPageContents = Expanded(
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
                          child: SizedBox(width: 30, height: 30, child: Logo)),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 60)),
              ThirdPageBackButton,
              const Padding(padding: EdgeInsets.only(top: 60)),
              HomeworkSubjectName,
              const Padding(padding: EdgeInsets.only(top: 60)),
              Expanded(
                  flex: 13,
                  child: CMaker(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    circularRadius: 20,
                    color: const Color.fromARGB(255, 36, 160, 209),
                    child: Row(
                      children: [
                        Expanded(child: HomeworkImage),
                        Expanded(
                          flex: 2,
                          child: ListView(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Expanded(
                                  flex: 3,
                                  child: CMaker(
                                      alignment: Alignment.center,
                                      child: ThirdPageHomeworkTitle)),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              ThirdPageHomeworkDescription,
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              ThirdPageHomeworkDescription2,
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              Expanded(
                                  flex: 3,
                                  child: CMaker(
                                      alignment: Alignment.center,
                                      child: BookPdfButton)),
                              const Padding(padding: EdgeInsets.only(top: 40)),
                              CMaker(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: CMaker(
                                            alignment: Alignment.center,
                                            child: StarsOf10)),
                                    Expanded(
                                        child: CMaker(
                                            alignment: Alignment.center,
                                            child: TeacherHomeworkNotes)),
                                  ],
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 30)),
                              Expanded(
                                  flex: 2,
                                  child: CMaker(
                                      alignment: Alignment.center,
                                      child: ViewTheRightSolution)),
                              const Padding(padding: EdgeInsets.only(top: 30)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        );
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
              itemCount: 3,
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
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            HomeWorkOpend = false;
                            ThirdPageThirdPage = true;
                            HomeworkSelected = index;
                          });
                        },
                        child: CMaker(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            circularRadius: 20,
                            color: const Color.fromARGB(255, 235, 218, 118),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            height: 40,
                            child: TMaker(
                                text: "State",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                      ),
                      Expanded(child: Container()),
                      CMaker(
                          padding: const EdgeInsets.only(right: 10),
                          child: TMaker(
                              text: " الواجب رقم ${index + 1}",
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
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
            physics: NeverScrollableScrollPhysics(),
            itemCount: ScadualData[0].length,
            itemBuilder: (context, ColumnIndex) {
              return CMaker(
                  width: (PageWidth(context) - 40) / ScadualData[0].length,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ScadualData.length,
                    itemBuilder: (context, RowIndex) {
                      return CMaker(
                          height: (200) / ScadualData.length,
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(), bottom: BorderSide()),
                                borderRadius: BorderRadius.only(
                                  topLeft: ("$ColumnIndex $RowIndex" == "0 0")
                                      ? Radius.circular(10)
                                      : Radius.circular(0),
                                  bottomLeft:
                                      ("$ColumnIndex $RowIndex" == "0 ${ScadualData.length-1}")
                                          ? Radius.circular(10)
                                          : Radius.circular(0),
                                  topRight: ("$ColumnIndex $RowIndex" == "${ScadualData[0].length-1} 0")
                                      ? Radius.circular(10)
                                      : Radius.circular(0),
                                  bottomRight:
                                      ("$ColumnIndex $RowIndex" == "${ScadualData[0].length-1} ${ScadualData.length-1}")
                                          ? Radius.circular(10)
                                          : Radius.circular(0),
                                ),
                                color: (ColumnIndex == 0 || RowIndex == 0)
                                    ? Color.fromARGB(255, 36, 160, 209)
                                    : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: TMaker(
                                  text: "${ScadualData[RowIndex][ColumnIndex]}",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: (ColumnIndex == 0 || RowIndex == 0)
                                      ? Color.fromARGB(255, 255, 255, 255)
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
                                  text: "${HomeWorks[index][0]["Name"]}",
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
    return ThirdPageContents;
  }
}
