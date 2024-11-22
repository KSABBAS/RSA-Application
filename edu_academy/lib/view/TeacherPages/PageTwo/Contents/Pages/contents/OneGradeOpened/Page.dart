import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/OneGradeOpened/contents/AllMessageButton.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/OneGradeOpened/contents/EnterAMessageWindow.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/OneGradeOpened/contents/GoToBooksWindow.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/OneGradeOpened/contents/LastMessageWindow.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/OneGradeOpened/contents/StudentsWindow.dart';
import 'package:flutter/material.dart';

class OneGradeIsOpended extends StatelessWidget {
  const OneGradeIsOpended({super.key, required this.Refresh});
  final Function()? Refresh;
  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      return CMaker(
        width: PageWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    GradeIsOpened = false;
                    Refresh!();
                  },
                  child: CMaker(
                    width: 70,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                Expanded(
                  child: CMaker(
                      alignment: Alignment.center,
                      height: 60,
                      circularRadius: 20,
                      margin: const EdgeInsets.only(left: 20),
                      color: const Color.fromARGB(255, 61, 197, 255),
                      child: TMaker(
                          text: TeacherData.ListOfGrades[GradeOpenedIndex][0],
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            GoToBooksWindow(Refresh: () {
              Refresh!();
            }),
            const Padding(padding: EdgeInsets.only(top: 30)),
            StudentsWindow(Refresh: () {
              Refresh!();
            }),
            const Padding(padding: EdgeInsets.only(top: 20)),
            AllMessageButton(
              Refresh: () => Refresh!(),
            ),
            LastMessageWindow(),
            const Padding(padding: EdgeInsets.only(top: 20)),
            EnterAMessageWindow(
              Refresh: () {
                Refresh!();
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      return CMaker(
        width: PageWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    GradeIsOpened = false;
                    Refresh!();
                  },
                  child: CMaker(
                    width: 70,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                Expanded(
                  child: CMaker(
                      alignment: Alignment.center,
                      height: 60,
                      circularRadius: 20,
                      margin: const EdgeInsets.only(left: 20),
                      color: const Color.fromARGB(255, 61, 197, 255),
                      child: TMaker(
                          text: TeacherData.ListOfGrades[GradeOpenedIndex][0],
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            GoToBooksWindow(Refresh: () {
              Refresh!();
            }),
            const Padding(padding: EdgeInsets.only(top: 30)),
            StudentsWindow(Refresh: () {
              Refresh!();
            }),
            const Padding(padding: EdgeInsets.only(top: 20)),
            AllMessageButton(
              Refresh: () => Refresh!(),
            ),
            LastMessageWindow(),
            const Padding(padding: EdgeInsets.only(top: 20)),
            EnterAMessageWindow(
              Refresh: () {
                Refresh!();
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return CMaker(
        width: PageWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: (PageWidth(context) > 900)
            ? Column(
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          GradeIsOpened = false;
                          Refresh!();
                        },
                        child: CMaker(
                          width: 70,
                          height: 50,
                          alignment: Alignment.center,
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Expanded(
                        child: CMaker(
                            alignment: Alignment.center,
                            height: 60,
                            circularRadius: 20,
                            margin: const EdgeInsets.only(left: 20),
                            color: const Color.fromARGB(255, 61, 197, 255),
                            child: TMaker(
                                text: TeacherData.ListOfGrades[GradeOpenedIndex]
                                    [0],
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                          flex: 6,
                          child: CMaker(
                              height: PageHeight(context) - 220,
                              child: ListView(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 30)),
                                  CMaker(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    alignment: Alignment.centerLeft,
                                    child: GoToBooksWindow(Refresh: () {
                                      Refresh!();
                                    }),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 20)),
                                  CMaker(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      alignment: Alignment.centerLeft,
                                      child: StudentsWindow(Refresh: () {
                                        Refresh!();
                                      })),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 20)),
                                ],
                              ))),
                      Expanded(child: Container()),
                      Expanded(
                        flex: 6,
                        child: CMaker(
                          height: PageHeight(context) - 220,
                          child: ListView(
                            children: [
                              CMaker(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerLeft,
                                child: AllMessageButton(
                                  Refresh: () => Refresh!(),
                                ),
                              ),
                              CMaker(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerLeft,
                                child: LastMessageWindow(),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              CMaker(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerLeft,
                                child: EnterAMessageWindow(
                                  Refresh: () {
                                    Refresh!();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          GradeIsOpened = false;
                          Refresh!();
                        },
                        child: CMaker(
                          width: 70,
                          height: 50,
                          alignment: Alignment.center,
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Expanded(
                        child: CMaker(
                            alignment: Alignment.center,
                            height: 60,
                            circularRadius: 20,
                            margin: const EdgeInsets.only(left: 20),
                            color: const Color.fromARGB(255, 61, 197, 255),
                            child: TMaker(
                                text: TeacherData.ListOfGrades[GradeOpenedIndex]
                                    [0],
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  GoToBooksWindow(Refresh: () {
                    Refresh!();
                  }),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  StudentsWindow(Refresh: () {
                    Refresh!();
                  }),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  AllMessageButton(
                    Refresh: () => Refresh!(),
                  ),
                  LastMessageWindow(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  EnterAMessageWindow(Refresh: () {
                    Refresh!();
                  }),
                  Padding(padding: EdgeInsets.only(top: 20)),
                ],
              ),
      );
    } else {
      return Container();
    }
  }
}
