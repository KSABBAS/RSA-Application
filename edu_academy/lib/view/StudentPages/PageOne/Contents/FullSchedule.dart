import 'package:edu_academy/Data/StudentData/Schedule.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:flutter/material.dart';
class FullStudentSchedule extends StatelessWidget {
  const FullStudentSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return CMaker(
        width: double.infinity,
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: StudentSchedule.TableData[0].length,
          itemBuilder: (context, ColumnIndex) {
            return CMaker(
                width: (PageWidth(context) - 80) / StudentSchedule.TableData[0].length,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: StudentSchedule.TableData.length,
                  itemBuilder: (context, RowIndex) {
                    return CMaker(
                        height: (200) / StudentSchedule.TableData.length,
                        child: Container(
                            decoration: BoxDecoration(
                              border: const Border(right: BorderSide(), bottom: BorderSide()),
                              borderRadius: BorderRadius.only(
                                topLeft: ("$ColumnIndex $RowIndex" == "0 0") ? const Radius.circular(10) : const Radius.circular(0),
                                bottomLeft:
                                    ("$ColumnIndex $RowIndex" == "0 ${StudentSchedule.TableData.length - 1}") ? const Radius.circular(10) : const Radius.circular(0),
                                topRight: ("$ColumnIndex $RowIndex" == "${StudentSchedule.TableData[0].length - 1} 0")
                                    ? const Radius.circular(10)
                                    : const Radius.circular(0),
                                bottomRight: ("$ColumnIndex $RowIndex" == "${StudentSchedule.TableData[0].length - 1} ${StudentSchedule.TableData.length - 1}")
                                    ? const Radius.circular(10)
                                    : const Radius.circular(0),
                              ),
                              color: (ColumnIndex == 0 || RowIndex == 0) ? const Color.fromARGB(255, 36, 160, 209) : Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: TMaker(
                                text: "${StudentSchedule.TableData[RowIndex][ColumnIndex]}",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: (ColumnIndex == 0 || RowIndex == 0)
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color.fromARGB(255, 0, 0, 0))));
                  },
                ));
          },
        ));
  }
}