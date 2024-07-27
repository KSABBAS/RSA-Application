import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  @override
  State<SecondPage> createState() => _SecondPageState();
}

List<List<Color>> col = [
  [
    const Color.fromARGB(255, 9, 220, 206),
    const Color.fromARGB(255, 146, 206, 22)
  ],
  [
    const Color.fromARGB(255, 247, 68, 110),
    const Color.fromARGB(255, 148, 80, 225)
  ],
  [
    const Color.fromARGB(255, 214, 128, 12),
    const Color.fromARGB(255, 254, 197, 44)
  ],
  [
    const Color.fromARGB(255, 248, 67, 114),
    const Color.fromARGB(255, 248, 152, 68)
  ],
  [
    const Color.fromARGB(255, 254, 165, 41),
    const Color.fromARGB(255, 251, 99, 26)
  ],
  [
    const Color.fromARGB(255, 31, 229, 175),
    const Color.fromARGB(255, 55, 114, 242)
  ],
  [
    const Color.fromARGB(255, 9, 220, 206),
    const Color.fromARGB(255, 146, 206, 22)
  ],
  [
    const Color.fromARGB(255, 247, 68, 110),
    const Color.fromARGB(255, 148, 80, 225)
  ],
  [
    const Color.fromARGB(255, 214, 128, 12),
    const Color.fromARGB(255, 254, 197, 44)
  ],
  [
    const Color.fromARGB(255, 248, 67, 114),
    const Color.fromARGB(255, 248, 152, 68)
  ],
  [
    const Color.fromARGB(255, 254, 165, 41),
    const Color.fromARGB(255, 251, 99, 26)
  ],
  [
    const Color.fromARGB(255, 31, 229, 175),
    const Color.fromARGB(255, 55, 114, 242)
  ],
  [
    const Color.fromARGB(255, 9, 220, 206),
    const Color.fromARGB(255, 146, 206, 22)
  ],
  [
    const Color.fromARGB(255, 247, 68, 110),
    const Color.fromARGB(255, 148, 80, 225)
  ],
  [
    const Color.fromARGB(255, 214, 128, 12),
    const Color.fromARGB(255, 254, 197, 44)
  ],
  [
    const Color.fromARGB(255, 248, 67, 114),
    const Color.fromARGB(255, 248, 152, 68)
  ],
  [
    const Color.fromARGB(255, 254, 165, 41),
    const Color.fromARGB(255, 251, 99, 26)
  ],
  [
    const Color.fromARGB(255, 31, 229, 175),
    const Color.fromARGB(255, 55, 114, 242)
  ],
  [
    const Color.fromARGB(255, 9, 220, 206),
    const Color.fromARGB(255, 146, 206, 22)
  ],
  [
    const Color.fromARGB(255, 247, 68, 110),
    const Color.fromARGB(255, 148, 80, 225)
  ],
  [
    const Color.fromARGB(255, 214, 128, 12),
    const Color.fromARGB(255, 254, 197, 44)
  ],
  [
    const Color.fromARGB(255, 248, 67, 114),
    const Color.fromARGB(255, 248, 152, 68)
  ],
  [
    const Color.fromARGB(255, 254, 165, 41),
    const Color.fromARGB(255, 251, 99, 26)
  ],
  [
    const Color.fromARGB(255, 31, 229, 175),
    const Color.fromARGB(255, 55, 114, 242)
  ],
  [
    const Color.fromARGB(255, 9, 220, 206),
    const Color.fromARGB(255, 146, 206, 22)
  ],
  [
    const Color.fromARGB(255, 247, 68, 110),
    const Color.fromARGB(255, 148, 80, 225)
  ],
  [
    const Color.fromARGB(255, 214, 128, 12),
    const Color.fromARGB(255, 254, 197, 44)
  ],
  [
    const Color.fromARGB(255, 248, 67, 114),
    const Color.fromARGB(255, 248, 152, 68)
  ],
  [
    const Color.fromARGB(255, 254, 165, 41),
    const Color.fromARGB(255, 251, 99, 26)
  ],
  [
    const Color.fromARGB(255, 31, 229, 175),
    const Color.fromARGB(255, 55, 114, 242)
  ],
  [
    const Color.fromARGB(255, 9, 220, 206),
    const Color.fromARGB(255, 146, 206, 22)
  ],
  [
    const Color.fromARGB(255, 214, 128, 12),
    const Color.fromARGB(255, 254, 197, 44)
  ],
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
  ["images/SubjectsIcons/اكتشف.png", "اكتشف"],
  ["images/SubjectsIcons/عربي.png", "عربي"],
];

Map<String, dynamic> GradesSubjects = {
  'Grade 1': [30, 7, 14, 29]
};

bool anySubjectSelected = false;
int index_SubjectSelected = 0;
int SubjectSelected = 0;
List<List<dynamic>> all_rec = [];
List<List<dynamic>> all_books = [];
bool OpenBooks = false;
bool OpenBook = false;
int bookOpend = 0;

class _SecondPageState extends State<SecondPage> {
  final dbService = DatabaseService();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchURL({required String url}) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      //mj
    }
  }

  @override
  Widget build(BuildContext context) {
    if (anySubjectSelected) {
      // second
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
                        color: const Color.fromARGB(255, 96, 123, 137),
                      ),
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
                    onPressed: () async {
                      List<List<dynamic>> records_ =
                          await dbService.fiRead_Books(
                              grade, "${Subjects[SubjectSelected][1]}");
                      setState(() {
                        OpenBooks = true;
                        anySubjectSelected = false;
                        all_books = records_;
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
                itemCount: all_rec.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CMaker(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      circularRadius: 15,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 15),
                      color: const Color.fromARGB(255, 6, 122, 153),
                      height: 60,
                      child: Row(
                        children: [
                          MaterialButton(
                            minWidth: 70,
                            onPressed: () {
                              _launchURL(url: all_rec[index][0]);
                            },
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
                                  text: "التاريخ : ${all_rec[index][1]}",
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
                        color: const Color.fromARGB(255, 104, 202, 255),
                      ),
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
                itemCount: all_books.length,
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
                              bookOpend = index;
                            });
                          },
                          child: CMaker(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              circularRadius: 5,
                              color: const Color.fromARGB(255, 217, 216, 216),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              // height: 40
                              width: double.infinity,
                              child: TMaker(
                                  text:
                                      "${index + 1}- ${all_books[index][2]}\ndate:${all_books[index][1]}", //////
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(
                                      255, 55, 114, 242)))),
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
      //first
      return Column(
        children: [
          CMaker(
            height: 50,
            child: Expanded(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        List<
                            List<
                                dynamic>> records_ = await dbService.fiRead_Books(
                            grade,
                            "${Subjects[GradesSubjects[grade][0]][1]}");

                        setState(() {
                          anySubjectSelected = false;
                          OpenBooks = true;
                          OpenBook = false;
                          all_books = records_;
                          // log(all_books.toString());
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
                        color: const Color.fromARGB(255, 104, 202, 255),
                      ),
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
                        text: "${bookOpend + 1}- ${all_books[bookOpend][2]}",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CMaker(
              border: Border.all(width: .5),
              alignment: Alignment.center,
              circularRadius: 8,
              color: const Color.fromARGB(255, 217, 216, 216),
              width: double.infinity,
              height: (PageHeight(context) - 380),
              child: TMaker(
                  text: "file view \n ${all_books[bookOpend][0]}",
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          )
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
                color: const Color.fromARGB(255, 104, 202, 255),
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
                  itemCount: (GradesSubjects[grade] as List<dynamic>).length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        List<List<dynamic>> records =
                            await dbService.fiRead_Records(grade,
                                "${Subjects[GradesSubjects[grade][index]][1]}");
                        setState(() {
                          SubjectSelected = GradesSubjects[grade][index];
                          anySubjectSelected = true;
                          all_rec = records;
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
                                col[GradesSubjects[grade][index]][0],
                                col[GradesSubjects[grade][index]][1],
                              ]),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${Subjects[GradesSubjects[grade][index]][1]} $index",
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
                                  child: Image.asset(
                                      Subjects[GradesSubjects[grade][index]]
                                          [0])),
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
