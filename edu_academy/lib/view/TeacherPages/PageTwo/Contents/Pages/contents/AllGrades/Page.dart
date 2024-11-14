import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/AllGrades/Contents/AllGradesView.dart';
import 'package:flutter/material.dart';

class AllGrades extends StatelessWidget {
  const AllGrades({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      return CMaker(
          height: PageHeight(context) - 165,
          width: PageWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ViewAllGrades(
            Refresh: () {
              Refresh!();
            },
          ));
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      return CMaker(
          height: PageHeight(context) - 145,
          width: PageWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ViewAllGrades(
            Refresh: () {
              Refresh!();
            },
          ));
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return CMaker(
          height: PageHeight(context) - 110,
          width: PageWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ViewAllGrades(
            Refresh: () {
              Refresh!();
            },
          ));
    } else {
      return CMaker();
    }
  }
}
