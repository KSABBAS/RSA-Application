import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/Page.dart';
import 'package:flutter/material.dart';

class GoToBooksWindow extends StatelessWidget {
  const GoToBooksWindow({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return CMaker(
        //9
        alignment: Alignment.center,
        height: 60,
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
        child: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 20)),
            TMaker(
                text: "الكتب و الملفات",
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 0, 0, 0)),
            Expanded(child: Container()),
            Expanded(child: Container()),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                // open books button
                TeacherFunctions(
                  SetStateCallback: () {
                    Refresh!();
                  },
                ).books_load();
                GradeIsOpened = false;
                BooksAreOpened = true;
                Refresh!();
              },
              child: CMaker(
                height: 40,
                width: 70,
                color: const Color.fromARGB(255, 54, 244, 92),
                circularRadius: 20,
                alignment: Alignment.center,
                child: TMaker(
                    text: "فتح",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Expanded(child: Container()),
          ],
        ));
  }
}
