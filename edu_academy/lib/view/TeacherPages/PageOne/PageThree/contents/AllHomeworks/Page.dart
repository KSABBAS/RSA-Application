import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/Page.dart';
import 'package:flutter/material.dart';

class AllHomeworks extends StatelessWidget {
  const AllHomeworks({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      
        return (AllHomeWorksLoading)
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
                              GradeHomeWorkIsOppened = true;
                              NewHomeWork = false;
                              AllhomeWorks = false;
                            Refresh!();
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
                                          IsOpendIndex = index1;
                                          GradeHomeWorkIsOppened = false;
                                          NewHomeWork = false;
                                          AllhomeWorks = false;
                                          AllHomeworksAndOneIsOpened = true;
                                        Refresh!();
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
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TMaker(
                                                    text: TeacherData
                                                            .all_Homeworks[
                                                        index1][0],
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black)),
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10)),
                                            CMaker(
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TMaker(
                                                    textAlign: TextAlign.start,
                                                    text: TeacherData
                                                            .all_Homeworks[
                                                        index1][1],
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color.fromARGB(
                                                        255, 86, 86, 86))),
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
                                                itemCount:
                                                    (TeacherData.all_Homeworks[
                                                            index1][4] as List)
                                                        .length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 6,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10),
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      Refresh!();
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
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        return (AllHomeWorksLoading)
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
                              GradeHomeWorkIsOppened = true;
                              NewHomeWork = false;
                              AllhomeWorks = false;
                            Refresh!();
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
                                          IsOpendIndex = index1;
                                          GradeHomeWorkIsOppened = false;
                                          NewHomeWork = false;
                                          AllhomeWorks = false;
                                          AllHomeworksAndOneIsOpened = true;
                                        Refresh!();
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
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TMaker(
                                                    text: TeacherData
                                                            .all_Homeworks[
                                                        index1][0],
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black)),
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10)),
                                            CMaker(
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TMaker(
                                                    textAlign: TextAlign.start,
                                                    text: TeacherData
                                                            .all_Homeworks[
                                                        index1][1],
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color.fromARGB(
                                                        255, 86, 86, 86))),
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
                                                itemCount:
                                                    (TeacherData.all_Homeworks[
                                                            index1][4] as List)
                                                        .length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 6,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10),
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      Refresh!();
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
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        return (AllHomeWorksLoading)
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
                              GradeHomeWorkIsOppened = true;
                              NewHomeWork = false;
                              AllhomeWorks = false;
                            Refresh!();
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
                                          IsOpendIndex = index1;
                                          GradeHomeWorkIsOppened = false;
                                          NewHomeWork = false;
                                          AllhomeWorks = false;
                                          AllHomeworksAndOneIsOpened = true;
                                        Refresh!();
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
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TMaker(
                                                    text: TeacherData
                                                            .all_Homeworks[
                                                        index1][0],
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black)),
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10)),
                                            CMaker(
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TMaker(
                                                    textAlign: TextAlign.start,
                                                    text: TeacherData
                                                            .all_Homeworks[
                                                        index1][1],
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color.fromARGB(
                                                        255, 86, 86, 86))),
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
                                                itemCount:
                                                    (TeacherData.all_Homeworks[
                                                            index1][4] as List)
                                                        .length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 6,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10),
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      Refresh!();
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
    } else {
      return Container();
    }
  }
}
