import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/SecondPageContents.dart';
import 'package:flutter/material.dart';
class SubjectSelectedImage extends StatelessWidget {
  const SubjectSelectedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(GradesAndsubjects.Subjects[SubjectSelected][0]);
  }
}