import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/Page.dart';
import 'package:flutter/material.dart';
class ThirdPageHomeworkTitle extends StatelessWidget {
  const ThirdPageHomeworkTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return CMaker(
          circularRadius: 17,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 233, 255, 247),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TMaker(
              text: "${solved_hw_student[HomeworkSelected][1]}",
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color.fromARGB(255, 0, 0, 0)));
  }
}