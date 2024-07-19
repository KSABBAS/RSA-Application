import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/MobileView/SecondPage.dart';
import 'package:edu_academy/MobileView/ThirdPage.dart';
import 'package:flutter/material.dart';

class TeacherMainPage extends StatefulWidget {
  const TeacherMainPage({super.key});

  @override
  State<TeacherMainPage> createState() => _TeacherMainPageState();
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

class _TeacherMainPageState extends State<TeacherMainPage> {
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
                    BoxShadow(
                        blurRadius: 10,
                        color: Color.fromARGB(115, 0, 0, 0))
                  ],
                  color: Color.fromARGB(255, 213, 212, 208),
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
                              color: const Color.fromARGB(255, 213, 212, 208),
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
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Color.fromARGB(115, 0, 0, 0))
                  ],
                  color: Color.fromARGB(255, 213, 212, 208),
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
                              color: const Color.fromARGB(255, 213, 212, 208),
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
                    BoxShadow(
                        blurRadius: 10,
                        color: Color.fromARGB(115, 0, 0, 0))
                  ],
                  color: Color.fromARGB(255, 213, 212, 208),
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
                              color: const Color.fromARGB(255, 213, 212, 208),
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
                    BoxShadow(
                        blurRadius: 10,
                        color: Color.fromARGB(115, 0, 0, 0))
                  ],
                  color: Color.fromARGB(255, 213, 212, 208),
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
                              color: const Color.fromARGB(255, 213, 212, 208),
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
      bottomNavigationBar: CurvedNavigationBar(
          color: const Color.fromARGB(255, 213, 212, 208),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
