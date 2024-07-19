import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:edu_academy/MobileView/StudentMainPage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  @override
  State<SecondPage> createState() => _SecondPageState();
}

bool anySubjectSelected = false;
int SubjectSelected = 0;
bool OpenBooks = false;
bool OpenBook = false;
int bookOpend = 0;

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    if (anySubjectSelected) {
      return Column(
        children: [
          CMaker(
            height: 50,
            child: Expanded(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          anySubjectSelected = false;
                          OpenBooks = false;
                          OpenBook = false;
                        });
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Image.asset(Subjects[SubjectSelected][0]),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      TMaker(
                          text: Subjects[SubjectSelected][1],
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 96, 123, 137),),
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
              color: const Color.fromARGB(255, 159, 207, 19),
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        OpenBooks = true;
                        anySubjectSelected = false;
                      });
                    },
                    color: const Color.fromARGB(255, 217, 216, 216),
                    child: TMaker(
                        text: "فتح",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Expanded(
                      child: CMaker(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: TMaker(
                              text: "عرض الكتب",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)))
                ],
              )),
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
                      color: const Color.fromARGB(255, 6, 122, 153)),
                  Expanded(child: Container())
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 10)),
          SizedBox(
            height: PageHeight(context) - (350),
            child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CMaker(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      circularRadius: 15,
                      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                      color: const Color.fromARGB(255, 6, 122, 153),
                      height: 60,
                      child: Row(
                        children: [
                          MaterialButton(
                            minWidth: 70,
                            onPressed: () {},
                            color: const Color.fromARGB(255, 18, 207, 60),
                            child: TMaker(
                                text: "تشغيل",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Column(
                            children: [
                              TMaker(
                                  text: "الحصه ${index + 1}",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              TMaker(
                                  text: "التاريخ",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white)
                            ],
                          )
                        ],
                      ));
                }),
          )
        ],
      );
    } else if (OpenBooks) {
      return Column(
        children: [
          CMaker(
            height: 50,
            child: Expanded(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          anySubjectSelected = true;
                          OpenBooks = false;
                          OpenBook = false;
                        });
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Image.asset(Subjects[SubjectSelected][0]),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      TMaker(
                          text: Subjects[SubjectSelected][1],
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 104, 202, 255),),
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
              alignment: Alignment.center,
              height: 70,
              child: TMaker(
                  text: "اضغط لعرض الكتاب",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          SizedBox(
            height: PageHeight(context) - (310),
            child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              OpenBook = true;
                              OpenBooks = false;
                              anySubjectSelected = false;
                              bookOpend = index+1;
                            });
                          },
                          child: CMaker(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              circularRadius: 5,
                              color: const Color.fromARGB(255, 217, 216, 216),
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              height: 40,
                              width: double.infinity,
                              child: TMaker(
                                  text: "File ${index+1} book.pdf",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 55, 114, 242)))),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 40),
                      )
                    ],
                  );
                }),
          )
        ],
      );
    } else if (OpenBook) {
      return Column(
        children: [
          CMaker(
            height: 50,
            child: Expanded(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          anySubjectSelected = false;
                          OpenBooks = true;
                          OpenBook = false;
                        });
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Image.asset(Subjects[SubjectSelected][0]),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      TMaker(
                          text: Subjects[SubjectSelected][1],
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 104, 202, 255),),
                    ],
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CMaker(
              height: 95,
              color: const Color.fromARGB(255, 6, 122, 153),
              circularRadius: 8,
                alignment: Alignment.center,
                child: Column(
                  children: [
                        const Padding(padding: EdgeInsets.only(top: 5)),
                    TMaker(
                        text: "File $bookOpend book.pdf",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        MaterialButton(
                            minWidth: 70,
                            onPressed: () {},
                            color: const Color.fromARGB(255, 18, 207, 60),
                            child: TMaker(
                                text: "تنزيل",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                  ],
                )),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 15),child: CMaker(border: Border.all(width: .5),alignment: Alignment.center,circularRadius: 8,color: const Color.fromARGB(255,217,216,216),width: double.infinity,height: (PageHeight(context)-380),child: TMaker(text: "file view", fontSize: 30, fontWeight:FontWeight.w400, color: Colors.black),),)
        ],
      );
    } else {
      return Expanded(
          child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 104, 202, 255),
                  ),
              child: const Text(
                "الكتب الدراسية",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: Subjects.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          SubjectSelected = index;
                          anySubjectSelected = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                col[index][0],
                                col[index][1],
                              ]),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                Subjects[index][1],
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            )),
                            Expanded(
                              child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(Subjects[index][0])),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ));
    }
  }
}
