import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

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
  'Grade 1': [30, 7, 14, 29],
  'Grade 2': [30, 7, 14, 29],
  'Grade 3': [30, 7, 14, 29],
  'Grade 4': [30, 20, 8, 26, 17, 7, 14],
  'Grade 5': [30, 20, 8, 26, 17, 7, 14],
  'Grade 6': [30, 20, 8, 26, 17, 7, 14],
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
    late Widget SecondPageContents;
    Widget SubjectSelectedImage = Image.asset(Subjects[SubjectSelected][0]);
    Widget SubjectSelectedName = TMaker(
      text: Subjects[SubjectSelected][1],
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: const Color.fromARGB(255, 96, 123, 137),
    );
    Widget Logo = InkWell(
        onTap: () {
          setState(() {
            PageIndex = 0;
          });
        },
        child: CircleAvatar(backgroundImage:NetworkImage(profile_data['photo'])));
    Widget StudentNameTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        name,
        style: TextStyle(
            fontSize: (PageWidth(context) < 550)
                ? 17
                : (PageHeight(context) < 900)
                    ? 20
                    : 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 5, 123, 151)),
      ),
    );
    Widget StudentGradeTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        grade,
        style: TextStyle(
            fontSize: (PageWidth(context) < 550)
                ? 17
                : (PageHeight(context) < 900)
                    ? 20
                    : 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 89, 89, 87)),
      ),
    );
    Widget Notifications = InkWell(
      onTap: () {},
      child: Container(
        width: 70,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        height: (PageWidth(context) < 550) ? 50 : 100,
        child: Icon(
          Icons.notifications,
          size: (PageWidth(context) < 550)
              ? 25
              : (PageHeight(context) < 900)
                  ? 30
                  : 35,
        ),
      ),
    );
    if (OpenBook) {
      //Fourth
      Widget ForthPageBackButton = IconButton(
          onPressed: () async {
            List<List<dynamic>> records_ = await dbService.fiRead_Books(
                grade, "${Subjects[GradesSubjects[grade][0]][1]}");

            setState(() {
              anySubjectSelected = false;
              OpenBooks = true;
              OpenBook = false;
              all_books = records_;
              // log(all_books.toString());
            });
          },
          icon: const Icon(Icons.arrow_back));
      Widget DownloadTheBook=CMaker(
                height: 120,
                width: (PageWidth(context)<600)?double.infinity:400,
                color: const Color.fromARGB(255, 36, 160, 209),
                circularRadius: 8,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    TMaker(
                        text: "hi${bookOpend + 1}- ${all_books[bookOpend][2]}",
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                          // in here you must add ,the download function and its animation all by yourself
                        },
                      child: CMaker(
                        alignment:Alignment.center,
                        circularRadius: 25,
                        width: 100,
                        height: 50,
                        color: const Color.fromARGB(255, 18, 207, 60),
                        child: TMaker(
                            text: "تنزيل",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ));
      Widget BookView=CMaker(
              border: Border.all(width: .5),
              alignment: Alignment.center,
              circularRadius: 8,
              color: const Color.fromARGB(255, 217, 216, 216),
              width: (PageWidth(context)<800)?double.infinity:600,
              height: (PageHeight(context) - 390),
              child: TMaker(
                  text: "file view \n ${all_books[bookOpend][0]}",
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            );
      if(PageWidth(context)<550){
        setState((){
        SecondPageContents = Column(
        children: [
          Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(child: Logo),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
          const Padding(padding: EdgeInsets.only(bottom: 20),),
          CMaker(
                height: 50,
                child: CMaker(
                  height: double.infinity,
                  width: double.infinity,
                  child: Row(
                    children: [
                      ForthPageBackButton,
                      Expanded(child: Container()),
                      Row(
                        children: [
                          SubjectSelectedImage,
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          SubjectSelectedName
                        ],
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              ),
          const Padding(padding: EdgeInsets.only(bottom: 20),),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DownloadTheBook
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BookView
          )
        ],
      );
        });
      }else if(PageWidth(context) >= 550 && PageHeight(context) >= 900){
        setState((){
        SecondPageContents = Column(
        children: [
          Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(child: Logo),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
          const Padding(padding: EdgeInsets.only(bottom: 20),),
          CMaker(
                height: 50,
                child: CMaker(
                  height: double.infinity,
                  width: double.infinity,
                  child: Row(
                    children: [
                      ForthPageBackButton,
                      Expanded(child: Container()),
                      Row(
                        children: [
                          SubjectSelectedImage,
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          SubjectSelectedName
                        ],
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              ),
          const Padding(padding: EdgeInsets.only(bottom: 20),),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DownloadTheBook
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BookView
          )
        ],
      );
        });
      }else if(PageWidth(context) >= 550 && PageHeight(context) < 900){
        setState((){
        SecondPageContents = Expanded(
          child: CMaker(
            child: Column(
            children: [
              Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 6,
                                spreadRadius: .03,
                                color: Color.fromARGB(82, 0, 0, 0)),
                          ],
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(child: Logo),
                          Expanded(flex: 3, child: StudentNameTC),
                          Expanded(flex: 2, child: StudentGradeTC),
                          Expanded(child: Notifications)
                        ],
                      )),
              const Padding(padding: EdgeInsets.only(bottom: 20),),
              CMaker(
                    height: 50,
                    child: CMaker(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ForthPageBackButton,
                          Expanded(child: Container()),
                          Row(
                            children: [
                              SubjectSelectedImage,
                              const Padding(padding: EdgeInsets.only(left: 5)),
                              SubjectSelectedName
                            ],
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                    ),
                  ),
              const Padding(padding: EdgeInsets.only(bottom: 20),),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DownloadTheBook
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BookView
              )
            ],
                  ),
          ),
        );
        });
      }
    } else if (OpenBooks) {
      // third
      Widget thirdPageBackButton = IconButton(
          onPressed: () {
            setState(() {
              anySubjectSelected = true;
              OpenBooks = false;
              OpenBook = false;
            });
          },
          icon: const Icon(Icons.arrow_back));
      Widget PressOnBookT=TMaker(
                  text: "اضغط على الكتاب للعرض",
                  fontSize: (PageWidth(context) < 550)? 20: (PageHeight(context) < 900)? 30: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black);
      Widget PressableBooks=ListView.builder(
                itemCount: all_books.length,//all_books.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                          onTap: () {
                            OverlayLoadingProgress.start(
                              context,
                              widget: CMaker(
                                circularRadius: 15,
                                color: const Color.fromARGB(198, 255, 255, 255),
                                width: MediaQuery.of(context).size.width / 3.6,
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width / 13),
                                child: const AspectRatio(
                                  aspectRatio: 1,
                                  child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 36, 160, 209),
                                  ),
                                ),
                              ),
                            );
                            // add database action here
                            OverlayLoadingProgress.stop();
                            setState(() {
                              OpenBook = true;
                              OpenBooks = false;
                              anySubjectSelected = false;
                              bookOpend = index;
                            });
                          },
                          child: CMaker(
                            height: (PageWidth(context) < 550)? 50: (PageHeight(context) < 900)? 80: 80,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              circularRadius: 5,
                              color: const Color.fromARGB(255, 19, 218, 132),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              // height: 40
                              width: double.infinity,
                              child: TMaker(
                                  text:
                                      "$index${index + 1}- ${all_books[index][2]}\ndate:${all_books[index][1]}", //////
                                  fontSize: (PageWidth(context) < 550)? 20: (PageHeight(context) < 900)? 30: 30,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 255, 255, 255)))),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      )
                    ],
                  );
                });
      if(PageWidth(context)<550){
        setState(() {
        SecondPageContents = Column(
        children: [
        Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(child: Logo),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                CMaker(
                height: 50,
                child: CMaker(
                  height: double.infinity,
                  width: double.infinity,
                  child: Row(
                    children: [
                      thirdPageBackButton,
                      Expanded(child: Container()),
                      CMaker(
                        child: Row(
                          children: [
                            SubjectSelectedImage,
                            const Padding(padding: EdgeInsets.only(left: 5)),
                            SubjectSelectedName
                          ],
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
          CMaker(
              alignment: Alignment.center,
              height: 70,
              child: PressOnBookT),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          SizedBox(
            height: PageHeight(context) - (320),
            child: PressableBooks
          )
        ],
      );
        });
      }
      if(PageWidth(context) >= 550 && PageHeight(context) >= 900){
        setState(() {
        SecondPageContents = Column(
        children: [
        Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(child: Logo),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                CMaker(
                height: 50,
                child: CMaker(
                  height: double.infinity,
                  width: double.infinity,
                  child: Row(
                    children: [
                      thirdPageBackButton,
                      Expanded(child: Container()),
                      Row(
                        children: [
                          SubjectSelectedImage,
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          SubjectSelectedName
                        ],
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
          CMaker(
              alignment: Alignment.center,
              height: 70,
              child: PressOnBookT),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          SizedBox(
            height: PageHeight(context) - (320),
            child: PressableBooks
          )
        ],
      );
        });
      }
      if(PageWidth(context) >= 550 && PageHeight(context) < 900){
        setState(() {
        SecondPageContents = Expanded(
          child: CMaker(
            child: Column(
            children: [
            Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 6,
                                spreadRadius: .03,
                                color: Color.fromARGB(82, 0, 0, 0)),
                          ],
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(child: Logo),
                          Expanded(flex: 3, child: StudentNameTC),
                          Expanded(flex: 2, child: StudentGradeTC),
                          Expanded(child: Notifications)
                        ],
                      )),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    CMaker(
                  height: 50,
                  child: CMaker(
                    height: double.infinity,
                    width: double.infinity,
                    child: Row(
                      children: [
                        thirdPageBackButton,
                        Expanded(child: Container()),
                        Row(
                          children: [
                            SubjectSelectedImage,
                            const Padding(padding: EdgeInsets.only(left: 5)),
                            SubjectSelectedName
                          ],
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                  ),
                ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                  alignment: Alignment.center,
                  height: 70,
                  child: PressOnBookT),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              SizedBox(
                height: PageHeight(context) - (250),
                child: PressableBooks
              )
            ],
                  ),
          ),
        );
        });
      }
    } else if (anySubjectSelected) {
      // second
      Widget SecondPageBackButton = IconButton(
          onPressed: () {
            setState(() {
              anySubjectSelected = false;
              OpenBooks = false;
              OpenBook = false;
            });
          },
          icon: const Icon(Icons.arrow_back));
      Widget OpenTheBooksButton = InkWell(
        onTap: () async {
          OverlayLoadingProgress.start(
            context,
            widget: CMaker(
              circularRadius: 15,
              color: const Color.fromARGB(198, 255, 255, 255),
              width: MediaQuery.of(context).size.width / 3.6,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 13),
              child: const AspectRatio(
                aspectRatio: 1,
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 36, 160, 209),
                ),
              ),
            ),
          );
          List<List<dynamic>> records_ = await dbService.fiRead_Books(
              grade, "${Subjects[SubjectSelected][1]}");
          OverlayLoadingProgress.stop();
          setState(() {
            OpenBooks = true;
            anySubjectSelected = false;
            all_books = records_;
          });
        },
        child: CMaker(
          circularRadius: 15,
          alignment: Alignment.center,
          width: 55,
          height: 35,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: TMaker(
              text: "فتح",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      );
      Widget OpenTheBooksTC = CMaker(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: TMaker(
              text: "عرض الكتب",
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white));
      Widget RecoredeLessonsImage = Image.asset("images/webinar.png");
      Widget RecoredeLessonsT = TMaker(
          text: "الحصص المسجلة",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(255, 54, 54, 54));
      Widget LessonsListView = ListView.builder(
          itemCount: all_rec.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return CMaker(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                circularRadius: 15,
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                color: const Color.fromARGB(255, 19, 218, 132),
                height: 90,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _launchURL(url: all_rec[index][0]);
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
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageContents = Column(
            children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(child: Logo),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                height: 50,
                child: CMaker(
                  height: double.infinity,
                  width: double.infinity,
                  child: Row(
                    children: [
                      SecondPageBackButton,
                      Expanded(child: Container()),
                      Row(
                        children: [
                          SubjectSelectedImage,
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          SubjectSelectedName
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
                      OpenTheBooksButton,
                      Expanded(child: OpenTheBooksTC)
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              CMaker(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      RecoredeLessonsImage,
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      RecoredeLessonsT,
                      Expanded(child: Container())
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              SizedBox(
                  height: PageHeight(context) - (380), child: LessonsListView),
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageContents = Column(
            children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(child: Logo),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StudentGradeTC),
                      Expanded(child: Notifications)
                    ],
                  )),
          const Padding(padding: EdgeInsets.only(bottom: 20),),
              CMaker(
                height: 50,
                child: CMaker(
                  height: double.infinity,
                  width: double.infinity,
                  child: Row(
                    children: [
                      SecondPageBackButton,
                      Expanded(child: Container()),
                      Row(
                        children: [
                          SubjectSelectedImage,
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          SubjectSelectedName
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
                      OpenTheBooksButton,
                      Expanded(child: OpenTheBooksTC)
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              CMaker(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      RecoredeLessonsImage,
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      RecoredeLessonsT,
                      Expanded(child: Container())
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              SizedBox(
                  height: PageHeight(context) - (380), child: LessonsListView),
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageContents =Expanded(
            child: CMaker(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(82, 0, 0, 0)),
                        ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(child: Logo),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
            const Padding(padding: EdgeInsets.only(bottom: 20),),
                  CMaker(
                    height: 50,
                    child: CMaker(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SecondPageBackButton,
                          Expanded(child: Container()),
                          Row(
                            children: [
                              SubjectSelectedImage,
                              const Padding(padding: EdgeInsets.only(left: 5)),
                              SubjectSelectedName
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
                          OpenTheBooksButton,
                          Expanded(child: OpenTheBooksTC)
                        ],
                      )),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  CMaker(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          RecoredeLessonsImage,
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          RecoredeLessonsT,
                          Expanded(child: Container())
                        ],
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  SizedBox(
                      height: PageHeight(context) - (380),
                      child: LessonsListView),
                ],
              ),
            ),
          );
        });
      }
    } else {
      // first
      Widget GridBooksTitleC = Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: (PageWidth(context) < 550)? 50: (PageHeight(context) < 900)? 70: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 36, 160, 209),
        ),
        child: Text(
          "الكتب الدراسية",
          style: TextStyle(
              fontSize: (PageWidth(context) < 550)
                  ? 30
                  : (PageHeight(context) < 900)
                      ? 40
                      : 30,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w600),
        ),
      );
      Widget GridViewWidget = Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          itemCount: (GradesSubjects[grade] as List<dynamic>).length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (PageWidth(context) < 550)
                  ? 2
                  : (PageHeight(context) >= 900)
                      ? 3
                      : (PageWidth(context) > 550 && PageWidth(context) < 700)
                          ? 2
                          : (PageWidth(context) >= 700 &&
                                  PageWidth(context) < 900)
                              ? 3
                              : (PageWidth(context) >= 900 &&
                                      PageWidth(context) < 1200)
                                  ? 4
                                  : 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                OverlayLoadingProgress.start(
                  context,
                  widget: CMaker(
                    circularRadius: 15,
                    color: const Color.fromARGB(198, 255, 255, 255),
                    width: MediaQuery.of(context).size.width / 3.6,
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 13),
                    child: const AspectRatio(
                      aspectRatio: 1,
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 36, 160, 209),
                      ),
                    ),
                  ),
                );
                List<List<dynamic>> records = await dbService.fiRead_Records(
                    grade, "${Subjects[GradesSubjects[grade][index]][1]}");
                OverlayLoadingProgress.stop();
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
                        style: TextStyle(
                            fontSize: (PageWidth(context) < 550)
                                ? 17
                                : (PageHeight(context) < 900)
                                    ? 20
                                    : 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                              Subjects[GradesSubjects[grade][index]][0])),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageContents =SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(82, 0, 0, 0)),
                        ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                SizedBox(width: 30, height: 30, child: Logo)),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                CMaker(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: GridBooksTitleC,
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(child: GridViewWidget),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
          );
        });
      }
      if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageContents = SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(82, 0, 0, 0)),
                        ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(child: Logo),
                        Expanded(flex: 3, child: StudentNameTC),
                        Expanded(flex: 2, child: StudentGradeTC),
                        Expanded(child: Notifications)
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                CMaker(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: GridBooksTitleC,
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(child: GridViewWidget),
              ],
            ),
          );
        });
      }
      if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageContents =Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 6,
                                spreadRadius: .03,
                                color: Color.fromARGB(82, 0, 0, 0)),
                          ],
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      height: 80,
                      child: Row(
                        children: [
                          Expanded(
                              child:
                                  SizedBox(width: 30, height: 30, child: Logo)),
                          Expanded(flex: 3, child: StudentNameTC),
                          Expanded(flex: 2, child: StudentGradeTC),
                          Expanded(child: Notifications)
                        ],
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  CMaker(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: GridBooksTitleC,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(child: GridViewWidget),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              ),
            ),
          );
        });
      }
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return SecondPageContents;
  }
}
