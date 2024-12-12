import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/Page.dart';
import 'package:flutter/material.dart';
class GradeTitle extends StatelessWidget {
  const GradeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CMaker(
          alignment: Alignment.center,
          height: 60,
          circularRadius: 20,
          margin: const EdgeInsets.only(left: 20, right: 20),
          color: const Color.fromARGB(255, 61, 197, 255),
          child: TMaker(
              text: "$Grade_selected واجب",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white)),
    );
  }
}