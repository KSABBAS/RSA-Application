import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
class HomeworkImages extends StatelessWidget {
  const HomeworkImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CMaker(
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 6,
              spreadRadius: .03,
              color: Color.fromARGB(58, 0, 0, 0)),
        ],
        color: const Color.fromARGB(255, 233, 255, 247),
        circularRadius: 25,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: (PageWidth(context) >= 550)
            ? (PageHeight(context) > 900)
                ? 400
                : 300
            : 250,
        width: double.infinity,
        child: GridView.builder(
            itemCount: (solved_hw_student[HomeworkSelected][3] as List).length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InstaImageViewer(
                backgroundColor: const Color.fromARGB(255, 233, 255, 247),
                child: Image.network(
                    solved_hw_student[HomeworkSelected][3][index] as String),
              );
            }),
      );
  }
}