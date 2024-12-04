import 'package:edu_academy/Data/TeacherData/ScheduleDart.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/contents/Page/FirstPage.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/contents/Page/Contents/FullSchedule.dart';
import 'package:flutter/material.dart';
class OneDaySchedule extends StatelessWidget {
  const OneDaySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(child: FullSchedule(),);
          },
        );
      },
      child: Column(
        children: [
          CMaker(
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 6,
                    spreadRadius: .03,
                    color: Color.fromARGB(82, 0, 0, 0)),
              ],
              circularRadius: 15,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(15)),
                            color: Color.fromARGB(255, 36, 160, 209)),
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        child: TMaker(
                            text: "",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15)),
                            color: Color.fromARGB(255, 36, 160, 209)),
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                    ],
                  ),
                  CMaker(
                      height: 70,
                      width: PageWidth(context) - 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: TableData.Table[0].length,
                        itemBuilder: (context, index) {
                          return CMaker(
                              height: 70,
                              width: (PageWidth(context) >= 550 &&
                                      PageWidth(context) < 1200 &&
                                      PageHeight(context) < 900)
                                  ? (PageWidth(context) - 165) /
                                      TableData.Table[0].length
                                  : (PageWidth(context) >= 550 &&
                                          PageWidth(context) >= 1200 &&
                                          PageHeight(context) < 900)
                                      ? (PageWidth(context) - 380) /
                                          TableData.Table[0].length
                                      : ((PageWidth(context) - 40) /
                                          TableData.Table[0].length),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: (index == 0)
                                            ? const Radius.circular(15)
                                            : const Radius.circular(0),
                                        bottomRight:
                                            (index == TableData.Table[0].length - 1)
                                                ? const Radius.circular(15)
                                                : const Radius.circular(0)),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: TMaker(
                                      text: "${TableData.Table[DayIndex][index]}",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: (index == 0)
                                          ? const Color.fromARGB(
                                              255, 36, 160, 209)
                                          : const Color.fromARGB(
                                              255, 0, 0, 0))));
                        },
                      ))
                ],
              )),
        ],
      ),
    );
  }
}