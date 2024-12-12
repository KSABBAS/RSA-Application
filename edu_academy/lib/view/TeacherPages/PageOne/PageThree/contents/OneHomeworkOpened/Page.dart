import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/Page.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class OneHomeworkOpened extends StatelessWidget {
  const OneHomeworkOpened({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
        return Column(
          children: [
            CMaker(
                width: double.infinity,
                height: 100,
                child: Row(children: [
                  InkWell(
                    onTap: () async {
                        AllhomeWorks = true;
                        AllHomeworksAndOneIsOpened = false;
                      Refresh!();
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
                          text: "${TeacherData.all_Homeworks[IsOpendIndex][0]}",
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
                              Refresh!();
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
                              AllHomeworksAndOneIsOpened =
                                  false; // update all hw data
                              Navigator.pop(context);
                              Refresh!();
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
                                  color: const Color.fromARGB(255, 191, 0, 0))),
                        )),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ),
          ],
        );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        return Column(
          children: [
            CMaker(
                width: double.infinity,
                height: 100,
                child: Row(children: [
                  InkWell(
                    onTap: () async {
                      TeacherData.all_Homeworks = await dbService.Fi_getAll_HW(
                          Grade_selected, TeacherData.SubjectThatIsSelected);
                        AllhomeWorks = true;
                        AllHomeworksAndOneIsOpened = false;
                      Refresh!();
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
                            Refresh!();
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
                              Refresh!();
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
                                  color: const Color.fromARGB(255, 191, 0, 0))),
                        )),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ),
          ],
        );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        return Column(
          children: [
            CMaker(
                width: double.infinity,
                height: 100,
                child: Row(children: [
                  InkWell(
                    onTap: () async {
                      TeacherData.all_Homeworks = await dbService.Fi_getAll_HW(
                          Grade_selected, TeacherData.SubjectThatIsSelected);
                        AllhomeWorks = true;
                        AllHomeworksAndOneIsOpened = false;
                      Refresh!();
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
                            Refresh!();
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
                              Refresh!();
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
                                  color: const Color.fromARGB(255, 191, 0, 0))),
                        )),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ),
          ],
        );
    } else {
      return Container();
    }
  }
}
