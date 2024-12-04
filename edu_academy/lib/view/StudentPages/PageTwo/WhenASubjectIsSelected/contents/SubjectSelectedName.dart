import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:flutter/material.dart';
class SubjectSelectedName extends StatelessWidget {
  const SubjectSelectedName({super.key});

  @override
  Widget build(BuildContext context) {
    return TMaker(
      text: GradesAndsubjects.Subjects[SubjectSelected][1],
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: const Color.fromARGB(255, 96, 123, 137),
    );
  }
}