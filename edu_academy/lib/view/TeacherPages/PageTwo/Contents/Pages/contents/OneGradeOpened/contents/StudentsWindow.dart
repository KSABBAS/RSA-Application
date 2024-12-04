import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/Page.dart';
import 'package:flutter/material.dart';
class StudentsWindow extends StatelessWidget {
  const StudentsWindow({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return CMaker(
        alignment: Alignment.center,
        height: 280,
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(42, 0, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: .06)
        ],
        circularRadius: 20,
        width: PageWidth(context) - 60,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: CMaker(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: TeacherData.ListOfGrades[GradeOpenedIndex][1].length,
              itemBuilder: (context, StudentIndex) {
                return Column(
                  children: [
                    ListTile(
                      leading: CMaker(
                          height: 70,
                          width: 70,
                          child: CircleAvatar(
                              backgroundImage: Image.network(
                                      TeacherData.ListOfGrades[GradeOpenedIndex][1]
                                          [StudentIndex][2])
                                  .image)),
                      title: TMaker(
                        textAlign: TextAlign.start,
                        text:
                            '${TeacherData.ListOfGrades[GradeOpenedIndex][1][StudentIndex][0]}',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                  ],
                );
              }),
        ),
      );
  }
}