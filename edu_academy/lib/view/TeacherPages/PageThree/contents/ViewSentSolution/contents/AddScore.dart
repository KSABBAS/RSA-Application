import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:flutter/material.dart';
class AddScore extends StatelessWidget {
  const AddScore({super.key});
  @override
  Widget build(BuildContext context) {
    return CMaker(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          circularRadius: 20,
          child: Row(
            children: [
              SizedBox(
                  height: 80,
                  width: 80,
                  child: Form(
                    key: ScoreKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "الحقل فارغ";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        GrantedScore = newValue.toString();
                      },
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 192, 192, 192)),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  )),
              TMaker(
                  text: " / ${solved_hw_student[HomeworkSelected][4]}",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)
            ],
          ));
  }
}