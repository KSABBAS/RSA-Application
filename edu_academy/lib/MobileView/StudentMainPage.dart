import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/MobileView/SecondPage.dart';
import 'package:edu_academy/MobileView/ThirdPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

int PageIndex = 0;
List<List<Color>> col = [
  [const Color.fromARGB(255, 9, 220, 206), const Color.fromARGB(255, 146, 206, 22)],
  [const Color.fromARGB(255, 247, 68, 110), const Color.fromARGB(255, 148, 80, 225)],
  [const Color.fromARGB(255, 214, 128, 12), const Color.fromARGB(255, 254, 197, 44)],
  [const Color.fromARGB(255, 248, 67, 114), const Color.fromARGB(255, 248, 152, 68)],
  [const Color.fromARGB(255, 254, 165, 41), const Color.fromARGB(255, 251, 99, 26)],
  [const Color.fromARGB(255, 31, 229, 175), const Color.fromARGB(255, 55, 114, 242)],
  [const Color.fromARGB(255, 9, 220, 206), const Color.fromARGB(255, 146, 206, 22)],
  [const Color.fromARGB(255, 247, 68, 110), const Color.fromARGB(255, 148, 80, 225)],
  [const Color.fromARGB(255, 214, 128, 12), const Color.fromARGB(255, 254, 197, 44)],
  [const Color.fromARGB(255, 248, 67, 114), const Color.fromARGB(255, 248, 152, 68)],
  [const Color.fromARGB(255, 254, 165, 41), const Color.fromARGB(255, 251, 99, 26)],
  [const Color.fromARGB(255, 31, 229, 175), const Color.fromARGB(255, 55, 114, 242)],
  [const Color.fromARGB(255, 9, 220, 206), const Color.fromARGB(255, 146, 206, 22)],
  [const Color.fromARGB(255, 247, 68, 110), const Color.fromARGB(255, 148, 80, 225)],
  [const Color.fromARGB(255, 214, 128, 12), const Color.fromARGB(255, 254, 197, 44)],
  [const Color.fromARGB(255, 248, 67, 114), const Color.fromARGB(255, 248, 152, 68)],
  [const Color.fromARGB(255, 254, 165, 41), const Color.fromARGB(255, 251, 99, 26)],
  [const Color.fromARGB(255, 31, 229, 175), const Color.fromARGB(255, 55, 114, 242)],
  [const Color.fromARGB(255, 9, 220, 206), const Color.fromARGB(255, 146, 206, 22)],
  [const Color.fromARGB(255, 247, 68, 110), const Color.fromARGB(255, 148, 80, 225)],
  [const Color.fromARGB(255, 214, 128, 12), const Color.fromARGB(255, 254, 197, 44)],
  [const Color.fromARGB(255, 248, 67, 114), const Color.fromARGB(255, 248, 152, 68)],
  [const Color.fromARGB(255, 254, 165, 41), const Color.fromARGB(255, 251, 99, 26)],
  [const Color.fromARGB(255, 31, 229, 175), const Color.fromARGB(255, 55, 114, 242)],
  [const Color.fromARGB(255, 9, 220, 206), const Color.fromARGB(255, 146, 206, 22)],
  [const Color.fromARGB(255, 247, 68, 110), const Color.fromARGB(255, 148, 80, 225)],
  [const Color.fromARGB(255, 214, 128, 12), const Color.fromARGB(255, 254, 197, 44)],
  [const Color.fromARGB(255, 248, 67, 114), const Color.fromARGB(255, 248, 152, 68)],
  [const Color.fromARGB(255, 254, 165, 41), const Color.fromARGB(255, 251, 99, 26)],
  [const Color.fromARGB(255, 31, 229, 175), const Color.fromARGB(255, 55, 114, 242)],
];
List<List> Subjects = [
  ["images/SubjectsIcons/ألماني.png", "ألماني"],
  ["images/SubjectsIcons/إيطالي.png", "إيطالي"],
  ["images/SubjectsIcons/استاتيكا.png", "استاتيكا"],
  ["images/SubjectsIcons/الأحياء.png", "الأحياء"],
  ["images/SubjectsIcons/التوكاتسو.png", "التوكاتسو"],
  ["images/SubjectsIcons/الجغرافيا.png", "الجغرافيا"],
  ["images/SubjectsIcons/الجيولوجيا.png", "الجيولوجيا"],
  ["images/SubjectsIcons/الرياضيات.png", "الرياضيات"],
  ["images/SubjectsIcons/العلوم.png", "العلوم"],
  ["images/SubjectsIcons/الفيزياء.png", "الفيزياء"],
  ["images/SubjectsIcons/الكيمياء.png", "الكيمياء"],
  ["images/SubjectsIcons/اللغة الأسبانية.png", "اللغة الأسبانية"],
  ["images/SubjectsIcons/اللغه الانجليزية.png", "اللغه الانجليزية"],
  ["images/SubjectsIcons/تاريخ.png", "تاريخ"],
  ["images/SubjectsIcons/تربية دينية.png", "تربية دينية"],
  ["images/SubjectsIcons/تربية فنية.png", "تربية فنية"],
  ["images/SubjectsIcons/تفاضل وتكامل.png", "تفاضل وتكامل"],
  ["images/SubjectsIcons/تكنولوجيا المعلومات.png", "تكنولوجيا المعلومات"],
  ["images/SubjectsIcons/جبر.png", "جبر"],
  ["images/SubjectsIcons/حاسب آلي.png", "حاسب آلي"],
  ["images/SubjectsIcons/دراسات .png", "دراسات "],
  ["images/SubjectsIcons/ديناميكا.png", "ديناميكا"],
  ["images/SubjectsIcons/علم النفس.png", "علم النفس"],
  ["images/SubjectsIcons/فرنساوي.png", "فرنساوي"],
  ["images/SubjectsIcons/فلسفه.png", "فلسفه"],
  ["images/SubjectsIcons/قيم واحترام الآخر.png", "قيم واحترام الآخر"],
  ["images/SubjectsIcons/مهارات المهنية.png", "مهارات المهنية"],
  ["images/SubjectsIcons/هندسة فراغيه.png", "هندسة فراغيه"],
  ["images/SubjectsIcons/هندسة.png", "هندسة"],
];

class _StudentMainPageState extends State<StudentMainPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                BoxShadow(offset: Offset(1, 1),blurRadius: 6,spreadRadius: .03,color: Color.fromARGB(82, 0, 0, 0)),
              ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 20, right: 30),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              "kareem said",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Grade 12",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(flex: 8, child: CMaker(padding: const EdgeInsets.all(20),child: Column(children: [
              CMaker(circularRadius: 16,border: Border.all(width: 1),child: Column(children: [
                Row(children: [
                  Expanded(child: Container(decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(15)),color: Color.fromARGB(255, 6, 122, 153)),height: 80,child: TMaker(text: "", fontSize: 20, fontWeight:FontWeight.w600, color: Colors.white),)),
                  Expanded(child: CMaker(alignment: Alignment.center,height: 80,color: const Color.fromARGB(255, 6, 122, 153),child: TMaker(text: "00:00\nto\n00:00", fontSize: 13, fontWeight:FontWeight.w600, color: Colors.white),)),
                  Expanded(child: CMaker(alignment: Alignment.center,height: 80,color: const Color.fromARGB(255, 6, 122, 153),child: TMaker(text: "00:00\nto\n00:00", fontSize: 13, fontWeight:FontWeight.w600, color: Colors.white),)),
                  Expanded(child: CMaker(alignment: Alignment.center,height: 80,color: const Color.fromARGB(255, 6, 122, 153),child: TMaker(text: "00:00\nto\n00:00", fontSize: 13, fontWeight:FontWeight.w600, color: Colors.white),)),
                  Expanded(child: CMaker(alignment: Alignment.center,height: 80,color: const Color.fromARGB(255, 6, 122, 153),child: TMaker(text: "00:00\nto\n00:00", fontSize: 13, fontWeight:FontWeight.w600, color: Colors.white),)),
                  Expanded(child: Container(alignment: Alignment.center,decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight:Radius.circular(15)),color: Color.fromARGB(255, 6, 122, 153)),height: 80,child: TMaker(text: "00:00\nto\n00:00", fontSize: 13, fontWeight:FontWeight.w600, color: Colors.white),)),
                ],),
                Row(children: [
                  Expanded(child: Container(alignment: Alignment.center,decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15)),color: Color.fromARGB(255, 255, 255, 255)),height: 60,child: TMaker(text: "Day", fontSize: 13, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 6, 122, 153)),)),
                  Expanded(child: CMaker(alignment: Alignment.center,height: 60,color: const Color.fromARGB(255, 255, 255, 255),child: TMaker(text: "Math", fontSize: 13, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 6, 122, 153),),)),
                  Expanded(child: CMaker(alignment: Alignment.center,height: 60,color: const Color.fromARGB(255, 255, 255, 255),child: TMaker(text: "Math", fontSize: 13, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 6, 122, 153),),)),
                  Expanded(child: CMaker(alignment: Alignment.center,height: 60,color: const Color.fromARGB(255, 255, 255, 255),child: TMaker(text: "Math", fontSize: 13, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 6, 122, 153),),)),
                  Expanded(child: CMaker(alignment: Alignment.center,height: 60,color: const Color.fromARGB(255, 255, 255, 255),child: TMaker(text: "Math", fontSize: 13, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 6, 122, 153),),)),
                  Expanded(child: Container(alignment: Alignment.center,decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(15)),color: Color.fromARGB(255, 255, 255, 255)),height: 60,child: TMaker(text: "Math", fontSize: 13, fontWeight:FontWeight.w600, color: const Color.fromARGB(255, 6, 122, 153),),)),
                ],),
              ],)),
              const Padding(padding:EdgeInsets.only(top: 30)),
              CMaker(
                color: Colors.white,
                boxShadow: const [
                BoxShadow(offset: Offset(1, 1),blurRadius: 6,spreadRadius: .03,color: Color.fromARGB(82, 0, 0, 0)),
              ],circularRadius: 15,width: PageWidth(context)-40,height: 130,child: Column(children: [
                Expanded(child: CMaker(child: Row(children: [
                  Expanded(child: Container()),
                  SizedBox(width: 120,child: TMaker(text: "Next Class :", fontSize: 20, fontWeight:FontWeight.w600, color:const Color.fromARGB(153, 24, 58, 60))),
                  Container(alignment: Alignment.centerLeft,width: 100,child: ListTile(title: TMaker(text: "Math", fontSize: 25, fontWeight:FontWeight.w600, color:const Color.fromARGB(153, 24, 58, 60)),subtitle: TMaker(text: "AT 00:00", fontSize: 13, fontWeight:FontWeight.w600, color:const Color.fromARGB(153, 24, 58, 60)),)),
                  Expanded(child: Container()),
                ],)),),
                Expanded(child: CMaker(alignment: Alignment.center,child: MaterialButton(
                  height: 40,
                  color: const Color.fromARGB(255, 19, 184, 230),
                onPressed: () {
                  
                },
                child: TMaker(text: "Join", fontSize: 20, fontWeight:FontWeight.w600, color:Colors.white),
                )
                ))
              ],)),
              Expanded(child: CMaker(child: Container()))
            ],))),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                BoxShadow(offset: Offset(1, 1),blurRadius: 6,spreadRadius: .03,color: Color.fromARGB(82, 0, 0, 0)),
              ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 20, right: 30),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              "kareem said",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Grade 12",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            const SecondPage(),
            const Padding(padding: EdgeInsets.only(bottom: 10))
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                BoxShadow(offset: Offset(1, 1),blurRadius: 6,spreadRadius: .03,color: Color.fromARGB(82, 0, 0, 0)),
              ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 20, right: 30),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              "kareem said",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Grade 12",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
                flex: 8,
                child: Container(
                  
                  child: const ThirdPage()
                )
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                BoxShadow(offset: Offset(1, 1),blurRadius: 6,spreadRadius: .03,color: Color.fromARGB(82, 0, 0, 0)),
              ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 20, right: 30),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              "kareem said",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Grade 12",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(flex: 8, child: Container()),
          ],
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 255, 247),
      bottomNavigationBar: CurvedNavigationBar(
          color: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color.fromARGB(255, 233, 255, 247),
          index: PageIndex,
          height: 75,
          onTap: (val) {
            setState(() {
              PageIndex = val;
            });
          },
          items: const [
            Icon(
              Icons.home,
              color: Colors.black,
            ),
            Icon(
              Icons.menu_book,
              color: Colors.black,
            ),
            Icon(
              Icons.book,
              color: Colors.black,
            ),
            Icon(
              Icons.person,
              color: Colors.black,
            ),
          ]),
      body: Pages.elementAt(PageIndex),
    );
  }
}
