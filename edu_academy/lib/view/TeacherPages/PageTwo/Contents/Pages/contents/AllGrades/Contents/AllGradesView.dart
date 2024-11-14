import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/Page.dart';
import 'package:flutter/material.dart';
class ViewAllGrades extends StatefulWidget {
  const ViewAllGrades({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  State<ViewAllGrades> createState() => _ViewAllGradesState();
}

class _ViewAllGradesState extends State<ViewAllGrades> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: TeacherData.ListOfGrades.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CMaker(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      height: (() {
                        try {
                          return TeacherData.ListOfGrades[index][1][0].length *
                              100.0;
                        } catch (e) {
                          return 2.0 * 100.0;
                        }
                      }()),
                      width: double.infinity,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(70, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            spreadRadius: .06)
                      ],
                      circularRadius: 20,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          CMaker(
                              alignment: Alignment.center,
                              height: 60,
                              circularRadius: 10,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  TMaker(
                                      text:
                                          "${TeacherData.ListOfGrades[index][0]} - ${TeacherData.SubjectThatIsSelected}",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                  Expanded(flex: 10, child: Container()),
                                  InkWell(
                                    onTap: () async {
                                      GradeIsOpened = true;
                                      GradeOpenedIndex = index;
                                      await TeacherFunctions(SetStateCallback: widget.Refresh!()).regetmessages();
                                      setState(() {});
                                    },
                                    child: CMaker(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      color: const Color.fromARGB(
                                          255, 54, 244, 92),
                                      circularRadius: 20,
                                      child: TMaker(
                                          text: "فتح",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                ],
                              )),
                          const Padding(padding: EdgeInsets.only(bottom: 30)),
                          Expanded(
                            child: (!(TeacherData.ListOfGrades[index][1].length ==
                                    0))
                                ? ListView.builder(
                                    itemCount:
                                        TeacherData.ListOfGrades[index][1].length,
                                    itemBuilder: (context, StudentIndex) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            leading: CMaker(
                                                height: 70,
                                                width: 70,
                                                child: CircleAvatar(
                                                    backgroundImage: Image.network(
                                                            TeacherData.ListOfGrades[
                                                                    index][1][
                                                                StudentIndex][2])
                                                        .image)),
                                            title: TMaker(
                                              textAlign: TextAlign.start,
                                              text: TeacherData.ListOfGrades[index]
                                                      [1][StudentIndex][0]
                                                  .toString(),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0),
                                            ),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                          ),
                                        ],
                                      );
                                    })
                                : const Text(
                                    "لا يوجد طلاب مضافة",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                          ),
                        ],
                      )),
                ],
              ),
            );
          });
  }
}