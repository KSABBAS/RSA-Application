import 'package:edu_academy/Data/StudentData/StudentData.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class StudentNextClass extends StatefulWidget {
  const StudentNextClass({super.key});

  @override
  State<StudentNextClass> createState() => _StudentNextClassState();
}
Future<void> _launchURL({required String url}) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      //mj
    }
  }
class _StudentNextClassState extends State<StudentNextClass> {
  @override
  Widget build(BuildContext context) {
    return CMaker(
        circularRadius: 20,
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 6,
              spreadRadius: .03,
              color: Color.fromARGB(82, 0, 0, 0)),
        ],
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  flex: 6,
                  child: CMaker(
                      width: 130,
                      child: TMaker(
                          text: "الحصة القادمة",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(153, 24, 58, 60))),
                ),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      width: 150,
                      child: ListTile(
                        title: TMaker(
                            text: "دخول 👇", //
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(153, 24, 58, 60)),
                        subtitle: TMaker(
                            text: () {
                              String grade_0 = StudentData.grade.contains('(Lang)')
                                  ? StudentData.grade.replaceAll('(Lang)', '').trim()
                                  : StudentData.grade;
                              if (int.parse(grade_0[grade_0.length - 1]) <= 6 &&
                                  StudentData.grade[StudentData.grade.length - 2] == " ") {
                                return "الرقم السري:0000";
                              } else {
                                return "الرقم السري:2000";
                              }
                            }(),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(153, 24, 58, 60)),
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            )),
            Expanded(
                child: CMaker(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        _launchURL(
                            url: (int.parse(StudentData.grade[StudentData.grade.length - 1]) <= 6 &&
                                    StudentData.grade[StudentData.grade.length - 2] == " ")
                                ? "https://us06web.zoom.us/j/3088571822?pwd=E5VM4ANDKYA5jW59RKUuwRvVA2onkA.1"
                                : "https://us06web.zoom.us/j/5052829198");
                      },
                      child: CMaker(
                        alignment: Alignment.center,
                        circularRadius: 13,
                        height: (PageWidth(context) < 550)
                            ? 40
                            : (PageHeight(context) < 900)
                                ? 60
                                : 70,
                        width: (PageWidth(context) < 550)
                            ? 120
                            : (PageHeight(context) < 900)
                                ? 120
                                : 200,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "انضم",
                            fontSize: (PageWidth(context) < 550)
                                ? 20
                                : (PageHeight(context) < 900)
                                    ? 25
                                    : 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    )))
          ],
        ));
  }
}
