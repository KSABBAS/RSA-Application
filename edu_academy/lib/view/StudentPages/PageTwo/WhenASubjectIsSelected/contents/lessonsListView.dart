import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:flutter/material.dart';
class LessonsListView extends StatelessWidget {
  const LessonsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return (all_rec.isEmpty)
          ? Center(
              child: TMaker(
                  text: "لا يوجد حصص",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )
          : ListView.builder(
              itemCount: all_rec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CMaker(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    circularRadius: 15,
                    margin:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                    color: const Color.fromARGB(255, 19, 218, 132),
                    height: 90,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            launchURL(url: all_rec[index][0]);
                          },
                          child: CMaker(
                            alignment: Alignment.center,
                            circularRadius: 15,
                            width: 70,
                            height: 40,
                            color: const Color.fromARGB(255, 233, 255, 247),
                            child: TMaker(
                                text: "تشغيل",
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Column(
                          children: [
                            TMaker(
                                text: "الحصه ${index + 1}",
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            TMaker(
                                text: "التاريخ : ${all_rec[index][1]}",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)
                          ],
                        )
                      ],
                    ));
              });
  }
}