import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:flutter/material.dart';
class AllMessageButton extends StatelessWidget {
  const AllMessageButton({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return CMaker(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () async {
                await TeacherFunctions(SetStateCallback:() => Refresh!()).regetmessages();
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      child: CMaker(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.topLeft,
                          height: 100.0 + ((TeacherData.AllMessages.length - 1) * 70.0),
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
                          child: ListView.builder(
                              itemCount: TeacherData.AllMessages.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CMaker(
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      child: TMaker(
                                          textAlign: TextAlign.start,
                                          text: TeacherData.AllMessages[index][0],
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    CMaker(
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      child: TMaker(
                                          textAlign: TextAlign.start,
                                          text:
                                              "التاريخ : ${TeacherData.AllMessages[index][1]}",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                    )
                                  ],
                                );
                              })),
                    );
                  },
                );
              },
              child: const Text("كل الرسائل")));
  }
}