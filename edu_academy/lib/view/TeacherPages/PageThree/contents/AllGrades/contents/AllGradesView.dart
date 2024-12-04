import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:flutter/material.dart';

class ThirdPageAllGradesView extends StatelessWidget {
  const ThirdPageAllGradesView({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return CMaker(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        circularRadius: 20,
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(61, 0, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: .06)
        ],
        height: PageHeight(context) - 265,
        padding: const EdgeInsets.only(top: 20),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: CMaker(
          height: PageHeight(context) - 350,
          child: ListView.builder(
            itemCount: TeacherData.ListOfGrades.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CMaker(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(61, 0, 0, 0),
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            spreadRadius: .06)
                      ],
                      circularRadius: 15,
                      color: const Color.fromARGB(255, 233, 255, 247),
                      height: 70,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 20)),
                          TMaker(
                              text: "${TeacherData.ListOfGrades[index][0]}",
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          Expanded(child: Container()),
                          InkWell(
                            onTap: () {
                              GradeHomeWorkIsOppened = true;
                              NewHomeWork = false;
                              GradeHomeWorkOppenedIndex = index;
                              Grade_selected =
                                  TeacherData.ListOfGrades[index][0];
                              Refresh!();
                            },
                            child: CMaker(
                              height: 40,
                              width: 70,
                              color: const Color.fromARGB(255, 54, 244, 92),
                              circularRadius: 15,
                              alignment: Alignment.center,
                              child: TMaker(
                                  text: "فتح",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(right: 20)),
                        ],
                      )),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              );
            },
          ),
        ));
  }
}
