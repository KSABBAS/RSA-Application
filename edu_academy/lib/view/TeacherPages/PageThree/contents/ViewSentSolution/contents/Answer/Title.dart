import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:flutter/material.dart';
class HomeworkAnswerTitle extends StatelessWidget {
  const HomeworkAnswerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return CMaker(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TMaker(
              text: "${solved_hw_student[HomeworkSelected][1]}",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 0, 0, 0)));
  }
}