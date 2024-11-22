import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:flutter/material.dart';

class HomeworksBuilder extends StatelessWidget {
  const HomeworksBuilder({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return CMaker(
        height: PageHeight(context) - 200,
        padding: const EdgeInsets.only( right: 15, left: 15),
        circularRadius: 25,
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
        width: double.infinity,
        color: const Color.fromARGB(255, 36, 160, 209),
        child: ListView.builder(
            itemCount: solved_hw_student.length,
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
                margin: const EdgeInsets.only(bottom: 15,top: 15),
                color: const Color.fromARGB(255, 233, 255, 247),
                height: 120,
                width: double.infinity,
                child: Row(
                  children: [
                    CMaker(
                      width: 140,
                      child: Column(
                        children: [
                          Expanded(child: CMaker(child: Container())),
                          CMaker(
                              circularRadius: 15,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              color: () {
                                if ((solved_hw_student[index] as List).length <=
                                    5) {
                                  // unsolve
                                  return const Color.fromARGB(255, 249, 84, 84);
                                } else {
                                  if (solved_hw_student[index][7] == '0') {
                                    // un scored
                                    return const Color.fromARGB(
                                        255, 66, 133, 241);
                                  } else {
                                    // scored done
                                    return const Color.fromARGB(
                                        255, 32, 222, 32);
                                  }
                                }
                                //  const Color.fromARGB(255, 66, 133, 241)
                                // const Color.fromARGB(255, 32, 222, 32)
                              }(),
                              child: TMaker(
                                  text: () {
                                    if ((solved_hw_student[index] as List)
                                            .length <=
                                        5) {
                                      // unsolve
                                      return "غير محلول";
                                    } else {
                                      if (solved_hw_student[index][7] == '0') {
                                        // un scored
                                        return "لم يقيم";
                                      } else {
                                        // scored done
                                        return "${solved_hw_student[index][7]}/${solved_hw_student[index][4]}";
                                      }
                                    }
                                    // return "hi";
                                  }(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                          Expanded(child: CMaker(child: Container())),
                          if (!((solved_hw_student[index] as List).length <= 5))
                            if (solved_hw_student[index][7] == '0')
                              InkWell(
                                onTap: () {
                                  OneStudentHomeWorks = false;
                                  ViewSentSolution = true;
                                  HomeworkSelected = index;
                                  Refresh!();
                                },
                                child: CMaker(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    circularRadius: 20,
                                    color: () {
                                      if ((solved_hw_student[index] as List)
                                              .length <=
                                          5) {
                                        // unsolve
                                        return const Color.fromARGB(
                                            123, 179, 176, 176);
                                      } else {
                                        return const Color.fromARGB(
                                            255, 235, 218, 118);
                                      }

                                      // return
                                    }(),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    height: 40,
                                    child: TMaker(
                                        text: "عرض",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                              ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: CMaker(
                            child: Column(
                      children: [
                        Expanded(
                          child: CMaker(
                              height: double.infinity,
                              width: double.infinity,
                              padding: const EdgeInsets.only(right: 10),
                              child: TMaker(
                                  textAlign: TextAlign.end,
                                  text: "${solved_hw_student[index][1]}",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 0, 0, 0))),
                        ),
                        Expanded(
                          child: CMaker(
                              height: double.infinity,
                              width: double.infinity,
                              padding: const EdgeInsets.only(right: 10),
                              child: TMaker(
                                  textAlign: TextAlign.end,
                                  text: "${solved_hw_student[index][2]}",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0))),
                        ),
                      ],
                    )))
                  ],
                ),
              );
            }));
  }
}
