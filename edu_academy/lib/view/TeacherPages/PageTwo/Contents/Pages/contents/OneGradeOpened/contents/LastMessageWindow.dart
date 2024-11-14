import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
class LastMessageWindow extends StatelessWidget {
  const LastMessageWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return CMaker(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          height: 120,
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
          child: ListView(
            children: [
              CMaker(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: TMaker(
                    textAlign: TextAlign.start,
                    text: TeacherData.AllMessages[TeacherData.AllMessages.length - 1][0],
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              CMaker(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: TMaker(
                    textAlign: TextAlign.start,
                    text: "التاريخ : ${TeacherData.AllMessages[TeacherData.AllMessages.length - 1][1]}",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ));
  }
}