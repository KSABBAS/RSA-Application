import 'package:edu_academy/Data/TeacherData/ScheduleDart.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
class FullSchedule extends StatelessWidget {
  const FullSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return CMaker(
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: TableData.Table[0].length,
            itemBuilder: (context, ColumnIndex) {
              return CMaker(
                  width: (PageWidth(context) - 80) / TableData.Table[0].length,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: TableData.Table.length,
                    itemBuilder: (context, RowIndex) {
                      return CMaker(
                          height: (200) / TableData.Table.length,
                          child: Container(
                              decoration: BoxDecoration(
                                border: const Border(
                                    right: BorderSide(), bottom: BorderSide()),
                                borderRadius: BorderRadius.only(
                                  topLeft: ("$ColumnIndex $RowIndex" == "0 0")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  bottomLeft: ("$ColumnIndex $RowIndex" ==
                                          "0 ${TableData.Table.length - 1}")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  topRight: ("$ColumnIndex $RowIndex" ==
                                          "${TableData.Table[0].length - 1} 0")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  bottomRight: ("$ColumnIndex $RowIndex" ==
                                          "${TableData.Table[0].length - 1} ${TableData.Table.length - 1}")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                ),
                                color: (ColumnIndex == 0 || RowIndex == 0)
                                    ? const Color.fromARGB(255, 36, 160, 209)
                                    : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: TMaker(
                                  text: "${TableData.Table[RowIndex][ColumnIndex]}",
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