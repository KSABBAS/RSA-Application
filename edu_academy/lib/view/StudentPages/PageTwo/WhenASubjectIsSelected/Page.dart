import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/StudentPages/Other/StudentAppBar.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/OpenTheBooksButton.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/SubjectSelectedImage.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/SubjectSelectedName.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/lessonsListView.dart';
import 'package:flutter/material.dart';

class WhenASebjectIsSelected extends StatefulWidget {
  const WhenASebjectIsSelected({super.key, required this.Refresh});
  final Function()? Refresh;
  @override
  State<WhenASebjectIsSelected> createState() => _WhenASebjectIsSelectedState();
}

class _WhenASebjectIsSelectedState extends State<WhenASebjectIsSelected> {
  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      return Column(
        children: [
          const StudentAppBar(),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          CMaker(
            height: 50,
            child: CMaker(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        anySubjectSelected = false;
                        OpenBooks = false;
                        OpenBook = false;
                        widget.Refresh!();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      SubjectSelectedImage(),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      SubjectSelectedName()
                    ],
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          CMaker(
              circularRadius: 20,
              color: const Color.fromARGB(255, 36, 160, 209),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Row(
                children: [
                  OpenTheBooksButton(
                    Refresh: () {
                      widget.Refresh!();
                    },
                  ),
                  Expanded(
                      child: CMaker(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: TMaker(
                              text: "عرض الكتب",
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)))
                ],
              )),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          CMaker(
              height: 50,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Image.asset("images/webinar.png"),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  TMaker(
                      text: "الحصص المسجلة",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 54, 54, 54)),
                  Expanded(child: Container())
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          SizedBox(
              height: PageHeight(context) - (380), child: LessonsListView()),
        ],
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      return Column(
        children: [
          const StudentAppBar(),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
          CMaker(
            height: 50,
            child: CMaker(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        anySubjectSelected = false;
                        OpenBooks = false;
                        OpenBook = false;
                        widget.Refresh!();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      SubjectSelectedImage(),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      SubjectSelectedName()
                    ],
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          CMaker(
              circularRadius: 20,
              color: const Color.fromARGB(255, 36, 160, 209),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Row(
                children: [
                  OpenTheBooksButton(
                    Refresh: () {
                      widget.Refresh!();
                    },
                  ),
                  Expanded(
                      child: CMaker(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: TMaker(
                              text: "عرض الكتب",
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)))
                ],
              )),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          CMaker(
              height: 50,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Image.asset("images/webinar.png"),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  TMaker(
                      text: "الحصص المسجلة",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 54, 54, 54)),
                  Expanded(child: Container())
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          SizedBox(
              height: PageHeight(context) - (380), child: LessonsListView()),
        ],
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return Expanded(
        child: CMaker(
          child: Column(
            children: [
              const StudentAppBar(),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              CMaker(
                height: 50,
                child: CMaker(
                  height: double.infinity,
                  width: double.infinity,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            anySubjectSelected = false;
                            OpenBooks = false;
                            OpenBook = false;
                            widget.Refresh!();
                          },
                          icon: const Icon(Icons.arrow_back)),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          SubjectSelectedImage(),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          SubjectSelectedName()
                        ],
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              CMaker(
                  circularRadius: 20,
                  color: const Color.fromARGB(255, 36, 160, 209),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: Row(
                    children: [
                      OpenTheBooksButton(
                        Refresh: () {
                          widget.Refresh!();
                        },
                      ),
                      Expanded(
                          child: CMaker(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: TMaker(
                                  text: "عرض الكتب",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)))
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              CMaker(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Image.asset("images/webinar.png"),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      TMaker(
                          text: "الحصص المسجلة",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 54, 54, 54)),
                      Expanded(child: Container())
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              SizedBox(
                  height: PageHeight(context) - (380),
                  child: LessonsListView()),
            ],
          ),
        ),
      );
    } else {
      //later on we can use this for reloading
      return Container();
    }
  }
}
