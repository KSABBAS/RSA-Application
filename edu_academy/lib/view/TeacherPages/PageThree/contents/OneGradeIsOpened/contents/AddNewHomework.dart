import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:flutter/material.dart';

class AddNewHomework extends StatelessWidget {
  const AddNewHomework({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GradeHomeWorkIsOppened = false;
        NewHomeWork = true;
        Refresh!();
      },
      child: CMaker(
          height: 70,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          color: const Color.fromARGB(255, 255, 255, 255),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          circularRadius: 15,
          child: Row(
            children: [
              Expanded(flex: 2, child: Container()),
              TMaker(
                  text: "اضف واجب جديد",
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 0, 0, 0)),
              Expanded(child: Container()),
              const Icon(Icons.edit_document),
              Expanded(flex: 2, child: Container()),
            ],
          )),
    );
  }
}
