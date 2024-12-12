import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/Page.dart';
import 'package:flutter/material.dart';
class AddComment extends StatelessWidget {
  const AddComment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130,
        child: TextField(
          onChanged: (value) {
            TeacherComment = value;
          },
          maxLines: 4,
          decoration: InputDecoration(
              hintText: "اضف تعليق",
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 192, 192, 192)),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      );
  }
}