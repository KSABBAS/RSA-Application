import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/NewHomework/Page.dart';
import 'package:flutter/material.dart';

class ScoreTFF extends StatelessWidget {
  const ScoreTFF({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return CMaker(
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(61, 0, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: .06)
        ],
        color: const Color.fromARGB(255, 255, 255, 255),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        circularRadius: 15,
        padding: const EdgeInsets.all(15),
        height: 120,
        child: Row(
          children: [
            Expanded(child: Container()),
            CMaker(
                width: 80,
                child: TMaker(
                    textAlign: TextAlign.start,
                    text: "الدرجة",
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            CMaker(
              alignment: Alignment.center,
              height: 60,
              width: 100,
              child: TextFormField(
                onChanged: (value) {
                  score = value;
                  Refresh!();
                },
                onSaved: (newValue) {
                  score = newValue!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "الحقل فارغ";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 192, 192, 192)),
                        borderRadius: BorderRadius.circular(30)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 192, 192, 192)),
                        borderRadius: BorderRadius.circular(30)),
                    label: const Text(
                      "اضف درجة",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 192, 192, 192)),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Expanded(child: Container()),
          ],
        ));
  }
}
