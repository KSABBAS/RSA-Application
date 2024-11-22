import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/Page.dart';
import 'package:flutter/material.dart';

final TextEditingController _MessageController = TextEditingController();

class EnterAMessageWindow extends StatelessWidget {
  EnterAMessageWindow({super.key, required this.Refresh});
  final Function()? Refresh;
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return CMaker(
        alignment: Alignment.center,
        height: 250,
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
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 15),
                child: TMaker(
                    textAlign: TextAlign.start,
                    text: "ارسل رسالة لكل الطلاب",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _MessageController,
                minLines: 1,
                maxLines: 3,
                onChanged: (value) {
                  CurrentMessage = value;
                },
                decoration: InputDecoration(
                    suffix: InkWell(
                        onTap: () async {
                          if (CurrentMessage != "") {
                            print("CurrentMessage !=  ${CurrentMessage != ""}");
                            //widget.ListOfGrades[GradeOpenedIndex][0]
                            //widget.ListOfGrades[GradeHomeWorkOppenedIndex][0]
                            print(
                                "widget.ListOfGrades[GradeOpenedIndex][0] ${TeacherData.ListOfGrades[GradeOpenedIndex][0]} ");
                            print(
                                "TeacherData.SubjectThatIsSelected ${TeacherData.SubjectThatIsSelected} ");
                            // AllMessages.add([
                            //   CurrentMessage,
                            //   CurrentMessageTime,
                            //   TheMessageDuration
                            // ]);
                            //rePublicMessages_Send(String sub, String Grade,String messgae,String date,String duration)
                            await dbService.rePublicMessages_Send(
                                TeacherData.SubjectThatIsSelected,
                                TeacherData.ListOfGrades[GradeOpenedIndex][0],
                                CurrentMessage,
                                CurrentMessageTime,
                                TheMessageDuration,
                                TeacherData.name);
                            CurrentMessage = "";
                            _MessageController.clear();
                            print("AllMessages ${TeacherData.AllMessages}");
                            Refresh!();
                          }
                        },
                        child: CMaker(
                            circularRadius: 10,
                            alignment: Alignment.center,
                            width: 50,
                            height: 35,
                            color: const Color.fromARGB(255, 61, 197, 255),
                            child: const Icon(
                              Icons.send,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 192, 192, 192)),
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 192, 192, 192)),
                        borderRadius: BorderRadius.circular(15)),
                    label: const Text(
                      "ادخل الرسالة",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 192, 192, 192)),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  DropdownButton(
                    value: TheMessageDuration,
                    items: const [
                      DropdownMenuItem(
                        value: "for 24 hours",
                        child: Text("for 24 hours"),
                      ),
                    ],
                    onChanged: (value) {
                      TheMessageDuration = value!;
                      Refresh!();
                    },
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ));
  }
}
