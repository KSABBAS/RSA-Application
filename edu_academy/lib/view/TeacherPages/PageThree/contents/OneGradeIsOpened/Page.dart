import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/OneGradeIsOpened/contents/AddNewHomework.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/OneGradeIsOpened/contents/GradeTitle.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/OneGradeIsOpened/contents/GradesStudents.dart';
import 'package:flutter/material.dart';

class OneGradeHomeworkIsOpened extends StatelessWidget {
  const OneGradeHomeworkIsOpened({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      return CMaker(
        height: PageHeight(context) - 170,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    GradeHomeWorkIsOppened = false;
                    NewHomeWork = false;
                    Refresh!();
                  },
                  child: CMaker(
                    width: 70,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                GradeTitle()
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Expanded(flex: 14, child: GradeStudents(Refresh: Refresh)),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () async {
                    AllHomeWorksLoading = true;
                    GradeHomeWorkIsOppened = false;
                    NewHomeWork = false;
                    AllhomeWorks = true;
                    Refresh!();
                    TeacherData.all_Homeworks = await dbService.Fi_getAll_HW(
                        Grade_selected, TeacherData.SubjectThatIsSelected);
                    print("Loading is done");
                    AllHomeWorksLoading = false;
                    Refresh!();
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
                              text: "كل الواجبات",
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          Expanded(child: Container()),
                          const Icon(Icons.edit),
                          Expanded(flex: 2, child: Container()),
                        ],
                      )),
                )),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Expanded(flex: 3, child: AddNewHomework(Refresh:() {
              Refresh!();
            },)),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
          ],
        ),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      return CMaker(
        height: PageHeight(context) - 190,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    GradeHomeWorkIsOppened = false;
                    NewHomeWork = false;
                    Refresh!();
                  },
                  child: CMaker(
                    width: 70,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                GradeTitle()
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Expanded(flex: 14, child: GradeStudents(Refresh: Refresh)),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            (PageWidth(context) < 910)
                ? Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 3,
                            child: InkWell(
                              onTap: () async {
                                AllHomeWorksLoading = true;
                                GradeHomeWorkIsOppened = false;
                                NewHomeWork = false;
                                AllhomeWorks = true;
                                Refresh!();
                                TeacherData.all_Homeworks =
                                    await dbService.Fi_getAll_HW(Grade_selected,
                                        TeacherData.SubjectThatIsSelected);
                                print("Loading is done");
                                AllHomeWorksLoading = false;
                                Refresh!();
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  circularRadius: 15,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 2, child: Container()),
                                      TMaker(
                                          text: "كل الواجبات",
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                      Expanded(child: Container()),
                                      const Icon(Icons.edit),
                                      Expanded(flex: 2, child: Container()),
                                    ],
                                  )),
                            )),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Expanded(flex: 3, child: AddNewHomework(Refresh:() {
                                      Refresh!();
                                    },)),
                      ],
                    ))
                : Expanded(
                    flex: 6,
                    child: Row(children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 20,
                        child: InkWell(
                          onTap: () async {
                            AllHomeWorksLoading = true;
                            GradeHomeWorkIsOppened = false;
                            NewHomeWork = false;
                            AllhomeWorks = true;
                            Refresh!();
                            TeacherData.all_Homeworks =
                                await dbService.Fi_getAll_HW(Grade_selected,
                                    TeacherData.SubjectThatIsSelected);
                            print("Loading is done");
                            AllHomeWorksLoading = false;
                            Refresh!();
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              circularRadius: 15,
                              child: Row(
                                children: [
                                  Expanded(flex: 2, child: Container()),
                                  TMaker(
                                      text: "كل الواجبات",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                  Expanded(child: Container()),
                                  const Icon(Icons.edit),
                                  Expanded(flex: 2, child: Container()),
                                ],
                              )),
                        ),
                      ),
                      Expanded(child: Container()),
                      Expanded(flex: 20, child: AddNewHomework(Refresh:() {
                                    Refresh!();
                                  },)),
                    ]),
                  ),
          ],
        ),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return CMaker(
        height: PageHeight(context) - 170,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    GradeHomeWorkIsOppened = false;
                    NewHomeWork = false;
                    Refresh!();
                  },
                  child: CMaker(
                    width: 70,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                GradeTitle()
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Expanded(flex: 14, child: GradeStudents(Refresh: Refresh)),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            (PageWidth(context) < 910)
                ? Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 3,
                            child: InkWell(
                              onTap: () async {
                                AllHomeWorksLoading = true;
                                GradeHomeWorkIsOppened = false;
                                NewHomeWork = false;
                                AllhomeWorks = true;
                                Refresh!();
                                TeacherData.all_Homeworks =
                                    await dbService.Fi_getAll_HW(Grade_selected,
                                        TeacherData.SubjectThatIsSelected);
                                print("Loading is done");
                                AllHomeWorksLoading = false;
                                Refresh!();
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  circularRadius: 15,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 2, child: Container()),
                                      TMaker(
                                          text: "كل الواجبات",
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                      Expanded(child: Container()),
                                      const Icon(Icons.edit),
                                      Expanded(flex: 2, child: Container()),
                                    ],
                                  )),
                            )),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Expanded(flex: 3, child: AddNewHomework(Refresh:() {
                                      Refresh!();
                                    },)),
                      ],
                    ))
                : Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 20,
                          child: InkWell(
                            onTap: () async {
                              AllHomeWorksLoading = true;
                              GradeHomeWorkIsOppened = false;
                              NewHomeWork = false;
                              AllhomeWorks = true;
                              Refresh!();
                              TeacherData.all_Homeworks =
                                  await dbService.Fi_getAll_HW(Grade_selected,
                                      TeacherData.SubjectThatIsSelected);
                              print("Loading is done");
                              AllHomeWorksLoading = false;
                              Refresh!();
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                circularRadius: 15,
                                child: Row(
                                  children: [
                                    Expanded(flex: 2, child: Container()),
                                    TMaker(
                                        text: "كل الواجبات",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)),
                                    Expanded(child: Container()),
                                    const Icon(Icons.edit),
                                    Expanded(flex: 2, child: Container()),
                                  ],
                                )),
                          ),
                        ),
                        Expanded(child: Container()),
                        Expanded(flex: 20, child: AddNewHomework(Refresh:() {
                                      Refresh!();
                                    },)),
                      ],
                    )),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Expanded(child: Container()),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
