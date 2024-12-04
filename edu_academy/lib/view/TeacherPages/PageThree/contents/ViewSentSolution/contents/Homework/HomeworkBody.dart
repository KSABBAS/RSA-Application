import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:flutter/material.dart';
class ThirdPageHomeworkBody extends StatelessWidget {
  const ThirdPageHomeworkBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CMaker(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: TMaker(
              text: "${solved_hw_student[HomeworkSelected][2]}",
              fontSize: (PageWidth(context) < 550)
                  ? 15
                  : (PageHeight(context) < 900)
                      ? 25
                      : 25,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 0, 0, 0)));
  }
}