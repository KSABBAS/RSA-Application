import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/Page.dart';
import 'package:flutter/material.dart';

class GradeStudents extends StatelessWidget {
  const GradeStudents({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return CMaker(
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(61, 0, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: .06)
        ],
        circularRadius: 20,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        height: 500,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView.builder(
          itemCount:
              (TeacherData.ListOfGrades[GradeHomeWorkOppenedIndex][1] as List)
                  .length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () async {
                    OneStudentHomeWorks = true;
                    OneStudentHomeWorksIsLoading = true;
                    student_selected_list = TeacherData
                        .ListOfGrades[GradeHomeWorkOppenedIndex][1][index];
                    HomeWorkIndex = index;
                    GradeHomeWorkIsOppened = false;
                    Refresh!();
                    await TeacherFunctions(
                      SetStateCallback: () => Refresh!()
                    ).solved_hw_student_re();
                    OneStudentHomeWorksIsLoading = false;
                    Refresh!();
                  },
                  child: CMaker(
                    height: 80,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        CMaker(
                            height: 70,
                            width: 70,
                            child: CircleAvatar(
                                backgroundImage: Image.network(TeacherData
                                            .ListOfGrades[
                                        GradeHomeWorkOppenedIndex][1][index][2])
                                    .image)),
                        Expanded(
                          child: ListTile(
                            subtitle: TMaker(
                                textAlign: TextAlign.start,
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(119, 0, 0, 0)),
                            title: TMaker(
                              textAlign: TextAlign.start,
                              text: (() {
                                try {
                                  List<String> nameParts = TeacherData
                                      .ListOfGrades[GradeHomeWorkOppenedIndex]
                                          [1][index][0]
                                      .toString()
                                      .split(" ");
                                  return nameParts.length > 1
                                      ? "${nameParts[0]} ${nameParts[1]}"
                                      : nameParts[0];
                                } catch (e) {
                                  return 'None';
                                }
                              })(),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                TMaker(
                                    text: "",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                const Padding(
                                    padding: EdgeInsets.only(bottom: 5)),
                                CMaker(
                                  circularRadius: 15,
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  color: const Color.fromARGB(255, 70, 183, 66),
                                  child: TMaker(
                                      text: "عرض",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
              ],
            );
          },
        ));
  }
}
