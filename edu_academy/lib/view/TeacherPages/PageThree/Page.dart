import 'dart:io';

import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/AllGrades/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/OneGradeIsOpened/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/OneGradeIsOpened/contents/GradeTitle.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/OneSutdentHomework/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/ViewSentSolution/Page.dart';
import 'package:edu_academy/view/TeacherPages/TeacherMainPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TeacherThirdPageContents extends StatefulWidget {
  TeacherThirdPageContents(
      {super.key, required this.ListOfGrades, required this.SubjectName});
  List ListOfGrades;
  String SubjectName;
  @override
  State<TeacherThirdPageContents> createState() =>
      _TeacherThirdPageContentsState();
}

List<dynamic> HomeworkImagesLinks = [];

bool GradeHomeWorkIsOppened = false;
int GradeHomeWorkOppenedIndex = 0;
bool NewHomeWork = false;
String HomeworkTitle = "";
String HomeworkBody = "";
GlobalKey<FormState> HomeworkKey = GlobalKey();
GlobalKey<FormState> ScoreKey = GlobalKey();
bool AllhomeWorks = false;
bool OneStudentHomeWorks = false;
bool AllHomeworksAndOneIsOpend = false;
int IsOpendIndex = 0;
String Grade_selected = '';
String score = '0';
int HomeWorkIndex = 0;
int HomeworkSelected = 0;
String HomeworkSelectedState = "";
bool ViewSentSolution = false;
String GrantedScore = "";
String TeacherComment = "";
List student_selected_list = [];
List<dynamic> solved_hw_student = [];

late bool OneStudentHomeWorksIsLoading;
late bool AllHomeWorksLoading;

final dbService = DatabaseService();

class _TeacherThirdPageContentsState extends State<TeacherThirdPageContents> {
  @override
  Widget build(BuildContext context) {
    late Widget ThirdPageBody;
    if (AllHomeworksAndOneIsOpend) {
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
                      onTap: () async {
                        setState(() {
                          AllhomeWorks = true;
                          AllHomeworksAndOneIsOpend = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: CMaker(
                      alignment: Alignment.center,
                      circularRadius: 20,
                      margin: const EdgeInsets.only(right: 20),
                      height: 70,
                      child: TMaker(
                          text: "كل الواجبات",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ))
                  ])),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                width: double.infinity,
                height: PageHeight(context) - 320,
                margin: const EdgeInsets.only(left: 20, right: 20),
                circularRadius: 20,
                alignment: Alignment.center,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(61, 0, 0, 0),
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: .06)
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                child: ListView(
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        height: 60,
                        circularRadius: 20,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: TMaker(
                            text:
                                "${TeacherData.all_Homeworks[IsOpendIndex][0]}",
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30),
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: TeacherData.all_Homeworks[IsOpendIndex][1],
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
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        itemCount:
                            (TeacherData.all_Homeworks[IsOpendIndex][4] as List)
                                .length,
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
                              child: InstaImageViewer(
                                backgroundColor:
                                    const Color.fromARGB(255, 233, 255, 247),
                                child: Image.network(
                                  TeacherData.all_Homeworks[IsOpendIndex][4]
                                      [index],
                                  fit: BoxFit.fitWidth,
                                ),
                              ));
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
                              padding: const EdgeInsets.all(10),
                              circularRadius: 15,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(61, 0, 0, 0),
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    spreadRadius: .06)
                              ],
                              color: const Color.fromARGB(255, 233, 255, 247),
                              child: TMaker(
                                  text: "التعديل(قريبا)",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black))),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    CMaker(
                      child: InkWell(
                          onTap: () async {
                            PanaraInfoDialog.show(
                              context,
                              title: "تمهل",
                              message: "هل انت متأكد انك تريد حذف الواجب",
                              buttonText: "حذف",
                              onTapDismiss: () async {
                                //delete hw start
                                await dbService.FiDelete_Hw_techer(
                                    Grade_selected,
                                    TeacherData.SubjectThatIsSelected,
                                    TeacherData.all_Homeworks[IsOpendIndex][5]
                                        as String);
                                TeacherData.all_Homeworks =
                                    await dbService.Fi_getAll_HW(Grade_selected,
                                        TeacherData.SubjectThatIsSelected);
                                AllhomeWorks = true;
                                AllHomeworksAndOneIsOpend =
                                    false; // update all hw data
                                Navigator.pop(context);
                                setState(() {});
                              },
                              panaraDialogType: PanaraDialogType.warning,
                              barrierDismissible: true,
                            );
                            //delete hw end
                          },
                          child: CMaker(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: CMaker(
                                padding: const EdgeInsets.all(10),
                                circularRadius: 15,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(61, 0, 0, 0),
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      spreadRadius: .06)
                                ],
                                color: const Color.fromARGB(255, 233, 255, 247),
                                child: TMaker(
                                    text: "حذف الواجب",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(255, 191, 0, 0))),
                          )),
                    ),
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
                      onTap: () async {
                        TeacherData.all_Homeworks =
                            await dbService.Fi_getAll_HW(Grade_selected,
                                TeacherData.SubjectThatIsSelected);
                        setState(() {
                          AllhomeWorks = true;
                          AllHomeworksAndOneIsOpend = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: CMaker(
                      alignment: Alignment.center,
                      circularRadius: 20,
                      margin: const EdgeInsets.only(right: 20),
                      height: 70,
                      child: TMaker(
                          text: "كل الواجبات",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ))
                  ])),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                width: double.infinity,
                height: PageHeight(context) - 320,
                margin: const EdgeInsets.only(left: 20, right: 20),
                circularRadius: 20,
                alignment: Alignment.center,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(61, 0, 0, 0),
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: .06)
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                child: ListView(
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        height: 60,
                        circularRadius: 20,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: TMaker(
                            text: "العنوان ${IsOpendIndex + 1}",
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
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
                      margin: const EdgeInsets.symmetric(horizontal: 20),
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
                              padding: const EdgeInsets.all(10),
                              circularRadius: 15,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(61, 0, 0, 0),
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    spreadRadius: .06)
                              ],
                              color: const Color.fromARGB(255, 233, 255, 247),
                              child: TMaker(
                                  text: "تعديل(قريبا)",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black))),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                      child: InkWell(
                          onTap: () async {
                            PanaraInfoDialog.show(
                              context,
                              title: "تمهل",
                              message: "هل انت متأكد انك تريد حذف الواجب",
                              buttonText: "حذف",
                              onTapDismiss: () async {
                                //delete hw start
                                await dbService.FiDelete_Hw_techer(
                                    Grade_selected,
                                    TeacherData.SubjectThatIsSelected,
                                    TeacherData.all_Homeworks[IsOpendIndex][5]
                                        as String);
                                TeacherData.all_Homeworks =
                                    await dbService.Fi_getAll_HW(
                                        Grade_selected,
                                        TeacherData
                                            .SubjectThatIsSelected); // update all hw data
                                Navigator.pop(context);
                                setState(() {});
                              },
                              panaraDialogType: PanaraDialogType.warning,
                              barrierDismissible: true,
                            );
                            //delete hw end
                          },
                          child: CMaker(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: CMaker(
                                padding: const EdgeInsets.all(10),
                                circularRadius: 15,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(61, 0, 0, 0),
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      spreadRadius: .06)
                                ],
                                color: const Color.fromARGB(255, 233, 255, 247),
                                child: TMaker(
                                    text: "حذف الواجب",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(255, 191, 0, 0))),
                          )),
                    ),
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
                      onTap: () async {
                        TeacherData.all_Homeworks =
                            await dbService.Fi_getAll_HW(Grade_selected,
                                TeacherData.SubjectThatIsSelected);
                        setState(() {
                          AllhomeWorks = true;
                          AllHomeworksAndOneIsOpend = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: CMaker(
                      alignment: Alignment.center,
                      circularRadius: 20,
                      margin: const EdgeInsets.only(right: 20),
                      height: 70,
                      child: TMaker(
                          text: "كل الواجبات",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ))
                  ])),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                width: double.infinity,
                height: PageHeight(context) - 320,
                margin: const EdgeInsets.only(left: 20, right: 20),
                circularRadius: 20,
                alignment: Alignment.center,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(61, 0, 0, 0),
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: .06)
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                child: ListView(
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        alignment: Alignment.centerLeft,
                        height: 60,
                        circularRadius: 20,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: TMaker(
                            text: "العنوان ${IsOpendIndex + 1}",
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
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
                      margin: const EdgeInsets.symmetric(horizontal: 20),
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
                              padding: const EdgeInsets.all(10),
                              circularRadius: 15,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(61, 0, 0, 0),
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    spreadRadius: .06)
                              ],
                              color: const Color.fromARGB(255, 233, 255, 247),
                              child: TMaker(
                                  text: "تعديل (قريبا)",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black))),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                      child: InkWell(
                          onTap: () async {
                            PanaraInfoDialog.show(
                              context,
                              title: "تمهل",
                              message: "هل انت متأكد انك تريد حذف الواجب",
                              buttonText: "حذف",
                              onTapDismiss: () async {
                                //delete hw start
                                await dbService.FiDelete_Hw_techer(
                                    Grade_selected,
                                    TeacherData.SubjectThatIsSelected,
                                    TeacherData.all_Homeworks[IsOpendIndex][5]
                                        as String);
                                TeacherData.all_Homeworks =
                                    await dbService.Fi_getAll_HW(
                                        Grade_selected,
                                        TeacherData
                                            .SubjectThatIsSelected); // update all hw data
                                Navigator.pop(context);
                                setState(() {});
                              },
                              panaraDialogType: PanaraDialogType.warning,
                              barrierDismissible: true,
                            );
                            //delete hw end
                          },
                          child: CMaker(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: CMaker(
                                padding: const EdgeInsets.all(10),
                                circularRadius: 15,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(61, 0, 0, 0),
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      spreadRadius: .06)
                                ],
                                color: const Color.fromARGB(255, 233, 255, 247),
                                child: TMaker(
                                    text: "حذف الواجب",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(255, 191, 0, 0))),
                          )),
                    ),
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
          ThirdPageBody = (AllHomeWorksLoading)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : Column(
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                child: const Icon(Icons.arrow_back)),
                          ),
                          Expanded(
                              child: CMaker(
                            alignment: Alignment.center,
                            circularRadius: 20,
                            margin: const EdgeInsets.only(right: 20),
                            height: 70,
                            child: TMaker(
                                text: "كل الواجبات",
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ))
                        ])),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        width: double.infinity,
                        height: PageHeight(context) - 320,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        circularRadius: 20,
                        alignment: Alignment.center,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(61, 0, 0, 0),
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              spreadRadius: .06)
                        ],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                alignment: Alignment.centerLeft,
                                height: 60,
                                circularRadius: 20,
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TMaker(
                                    text: "$Grade_selected واجبات",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 0, 0, 0))),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                              circularRadius: 20,
                              height: PageHeight(context) - 420,
                              child: ListView.builder(
                                  itemCount: TeacherData.all_Homeworks.length,
                                  itemBuilder: (context, index1) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            IsOpendIndex = index1;
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
                                          margin: const EdgeInsets.only(
                                              top: 15,
                                              bottom: 15,
                                              left: 20,
                                              right: 20),
                                          width: double.infinity,
                                          height: 180,
                                          color: const Color.fromARGB(
                                              255, 233, 255, 247),
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: [
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10)),
                                              CMaker(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: TMaker(
                                                      text: TeacherData
                                                              .all_Homeworks[
                                                          index1][0],
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10)),
                                              CMaker(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: TMaker(
                                                      textAlign:
                                                          TextAlign.start,
                                                      text: TeacherData
                                                              .all_Homeworks[
                                                          index1][1],
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              86,
                                                              86,
                                                              86))),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20)),
                                              CMaker(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                height: 70,
                                                width: double.infinity,
                                                child: GridView.builder(
                                                  itemCount: (TeacherData
                                                              .all_Homeworks[
                                                          index1][4] as List)
                                                      .length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 6,
                                                          crossAxisSpacing: 10,
                                                          mainAxisSpacing: 10),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {});
                                                      },
                                                      child: Image.network(
                                                        () {
                                                          print(
                                                              "=================================\n$TeacherData.all_Homeworks");
                                                          print(index);
                                                          return TeacherData
                                                                  .all_Homeworks[
                                                              index1][4][index];
                                                        }(),
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
          ThirdPageBody = (AllHomeWorksLoading)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : Column(
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                child: const Icon(Icons.arrow_back)),
                          ),
                          Expanded(
                              child: CMaker(
                            alignment: Alignment.center,
                            circularRadius: 20,
                            margin: const EdgeInsets.only(right: 20),
                            height: 70,
                            child: TMaker(
                                text: "كل الواجبات",
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ))
                        ])),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        width: double.infinity,
                        height: PageHeight(context) - 320,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        circularRadius: 20,
                        alignment: Alignment.center,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(61, 0, 0, 0),
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              spreadRadius: .06)
                        ],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                alignment: Alignment.centerLeft,
                                height: 60,
                                circularRadius: 20,
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TMaker(
                                    text: "$Grade_selected واجبات",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 0, 0, 0))),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                              circularRadius: 20,
                              height: PageHeight(context) - 420,
                              child: ListView.builder(
                                  itemCount: TeacherData.all_Homeworks.length,
                                  itemBuilder: (context, index1) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            IsOpendIndex = index1;
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
                                          margin: const EdgeInsets.only(
                                              top: 15,
                                              bottom: 15,
                                              left: 20,
                                              right: 20),
                                          width: double.infinity,
                                          height: 180,
                                          color: const Color.fromARGB(
                                              255, 233, 255, 247),
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: [
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10)),
                                              CMaker(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: TMaker(
                                                      text: TeacherData
                                                              .all_Homeworks[
                                                          index1][0],
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10)),
                                              CMaker(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: TMaker(
                                                      textAlign:
                                                          TextAlign.start,
                                                      text: TeacherData
                                                              .all_Homeworks[
                                                          index1][1],
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              86,
                                                              86,
                                                              86))),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20)),
                                              CMaker(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                height: 70,
                                                width: double.infinity,
                                                child: GridView.builder(
                                                  itemCount: (TeacherData
                                                              .all_Homeworks[
                                                          index1][4] as List)
                                                      .length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 6,
                                                          crossAxisSpacing: 10,
                                                          mainAxisSpacing: 10),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {});
                                                      },
                                                      child: Image.network(
                                                        () {
                                                          print(
                                                              "=================================\n$TeacherData.all_Homeworks");
                                                          print(index);
                                                          return TeacherData
                                                                  .all_Homeworks[
                                                              index1][4][index];
                                                        }(),
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
          ThirdPageBody = (AllHomeWorksLoading)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : Column(
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                child: const Icon(Icons.arrow_back)),
                          ),
                          Expanded(
                              child: CMaker(
                            alignment: Alignment.center,
                            circularRadius: 20,
                            margin: const EdgeInsets.only(right: 20),
                            height: 70,
                            child: TMaker(
                                text: "كل الواجبات",
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ))
                        ])),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        width: double.infinity,
                        height: PageHeight(context) - 320,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        circularRadius: 20,
                        alignment: Alignment.center,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(61, 0, 0, 0),
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              spreadRadius: .06)
                        ],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                alignment: Alignment.centerLeft,
                                height: 60,
                                circularRadius: 20,
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TMaker(
                                    text: "$Grade_selected واجبات",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 0, 0, 0))),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                              circularRadius: 20,
                              height: PageHeight(context) - 420,
                              child: ListView.builder(
                                  itemCount: TeacherData.all_Homeworks.length,
                                  itemBuilder: (context, index1) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            IsOpendIndex = index1;
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
                                          margin: const EdgeInsets.only(
                                              top: 15,
                                              bottom: 15,
                                              left: 20,
                                              right: 20),
                                          width: double.infinity,
                                          height: 180,
                                          color: const Color.fromARGB(
                                              255, 233, 255, 247),
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: [
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10)),
                                              CMaker(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: TMaker(
                                                      text: TeacherData
                                                              .all_Homeworks[
                                                          index1][0],
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10)),
                                              CMaker(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: TMaker(
                                                      textAlign:
                                                          TextAlign.start,
                                                      text: TeacherData
                                                              .all_Homeworks[
                                                          index1][1],
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              86,
                                                              86,
                                                              86))),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20)),
                                              CMaker(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                height: 70,
                                                width: double.infinity,
                                                child: GridView.builder(
                                                  itemCount: (TeacherData
                                                              .all_Homeworks[
                                                          index1][4] as List)
                                                      .length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 6,
                                                          crossAxisSpacing: 10,
                                                          mainAxisSpacing: 10),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {});
                                                      },
                                                      child: Image.network(
                                                        () {
                                                          print(
                                                              "=================================\n$TeacherData.all_Homeworks");
                                                          print(index);
                                                          return TeacherData
                                                                  .all_Homeworks[
                                                              index1][4][index];
                                                        }(),
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
                        "اضف عنوان",
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
                      text: "الموضوع",
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
                        "اضف موضوع",
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
                      text: "الدرجة",
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
                        "اضف درجة",
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
      Widget AddAnImageToHomework = CMaker(
          margin: const EdgeInsets.only(left: 20),
          height: 50,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              InkWell(
                onTap: () async {
                  print("kIsWeb $kIsWeb");
                  if (kIsWeb) {
                    await TeacherFunctions(
                      SetStateCallback: () => setState(() {}),
                    ).pickImageFromGallery();
                  } else {
                    XFile? Image = await PhotoImageFromGalary();
                    if (Image != null) {
                      HomeworkImagesLinks.add(File(Image.path));
                      setState(() {});
                    }
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
                            text: "اضف صورة",
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
                  child: (kIsWeb)
                      ? Image.memory(
                          HomeworkImagesLinks[index],
                          fit: BoxFit.fitWidth,
                        )
                      : Image.file(
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
            List<dynamic> filesList = [];
            print("HomeworkImagesLinks ${HomeworkImagesLinks}");
            if (HomeworkImagesLinks.isNotEmpty) {
              filesList = await dbService.stHwStore(HomeworkImagesLinks);
              print("filesList ${filesList}");
            }
            //fiAdd_Hw(String Grade, String Subject, String Teacher_Id, List Files_List,
            //String HomeworkTitle, String HomeworkBody, String score)
            await dbService.fiAdd_Hw(
                TeacherData.ListOfGrades[GradeHomeWorkOppenedIndex][0],
                TeacherData.SubjectThatIsSelected,
                Teacher_Id,
                filesList,
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
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 61, 197, 255),
            alignment: Alignment.center,
            circularRadius: 15,
            child: TMaker(
                text: "ارسال",
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
                    children: [ThirdPageArrowBack, GradeTitle()],
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
                              text: "شكل الواجب النهائي",
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
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
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
                    children: [ThirdPageArrowBack, GradeTitle()],
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
                              text: "شكل الواجب النهائي",
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
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
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
                      children: [ThirdPageArrowBack, GradeTitle()],
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
                                text: "شكل الواجب النهائي",
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
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CMaker(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsetsDirectional.only(end: 20),
                        child: SendHomeworkButton),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                )),
          );
        });
      }
    } else if (ViewSentSolution) {
      return SentSolutionView(Refresh: () {
        setState(() {});
      },);
    } else if (OneStudentHomeWorks) {
      // Student homeworks
      return OneStudentHomework(Refresh: () {
        setState(() {});
      });
    } else if (GradeHomeWorkIsOppened) {
      // الصفحه الثانية
      return OneGradeHomeworkIsOpened(Refresh: () {
        setState(() {});
      });
    } else {
      // الصفحة الاولى
      return ThirdPageAllGrades(Refresh: () {
        setState(() {});
      });
    }
    return ThirdPageBody;
  }
}
