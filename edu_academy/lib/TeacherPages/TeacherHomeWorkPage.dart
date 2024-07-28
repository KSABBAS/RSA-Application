import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';

class TeacherHomeWorkPage extends StatefulWidget {
  const TeacherHomeWorkPage({super.key});

  @override
  State<TeacherHomeWorkPage> createState() => _TeacherHomeWorkPageState();
}

bool GradeHomeWorkIsOppened = false;
int GradeHomeWorkOppenedIndex = 0;

class _TeacherHomeWorkPageState extends State<TeacherHomeWorkPage> {
  @override
  Widget build(BuildContext context) {
    if (GradeHomeWorkIsOppened) {
      // الصفحه الثانية
      return Column(children: [
        const Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      GradeHomeWorkIsOppened = false;
                    });
                  },
                  child: CMaker(
                    width: 70,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                CMaker(
                    alignment: Alignment.center,
                    height: 60,
                    circularRadius: 20,
                    width: PageWidth(context) - 150,
                    margin: const EdgeInsets.only(left: 20),
                    color: const Color.fromARGB(255, 61, 197, 255),
                    child: TMaker(
                        text: "Grade $GradeHomeWorkOppenedIndex Homework",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
      ],);
    } else {
      // الصفحة الاولى
      return Column(
        children: [
          CMaker(
              border: Border.all(),
              circularRadius: 13,
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: TMaker(
                  text: "Homeworks",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          CMaker(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              circularRadius: 20,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(61, 0, 0, 0),
                    offset: Offset(2, 2),
                    blurRadius: 10,
                    spreadRadius: .06)
              ],
              height: PageHeight(context) - 275,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  CMaker(
                    height: 75,
                    alignment: Alignment.center,
                    child: TMaker(
                        text: "ًNot graded",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  CMaker(
                    height: PageHeight(context) - 350,
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CMaker(
                                circularRadius: 15,
                                height: 70,
                                margin: const EdgeInsets.symmetric(horizontal: 40),
                                color: const Color.fromARGB(255, 14, 167, 205),
                                child: Row(
                                  children: [
                                    const Padding(padding: EdgeInsets.only(left: 20)),
                                    TMaker(
                                        text: "Grade ${index + 1}",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                    Expanded(child: Container()),
                                    MaterialButton(
                                      height: 35,
                                      minWidth: 50,
                                      color: const Color.fromARGB(255, 54, 244, 92),
                                      onPressed: () {
                                        setState(() {
                                          GradeHomeWorkIsOppened = true;
                                          GradeHomeWorkOppenedIndex = index;
                                        });
                                      },
                                      child: TMaker(
                                          text: "فتح",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 20)),
                                  ],
                                )),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ))
        ],
      );
    }
  }
}
