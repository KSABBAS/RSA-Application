import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/Data/StudentData/StudentData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/Other/StudentAppBar.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/FirstPage/Page.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/Page.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/SubjectSelectedImage.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/SubjectSelectedName.dart';
import 'package:flutter/material.dart';
import 'package:edu_academy/view/StudentPages/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  @override
  State<SecondPage> createState() => _SecondPageState();
}

bool anySubjectSelected = false;
int index_SubjectSelected = 0;
int SubjectSelected = 0;
List<List<dynamic>> all_rec = [];
List<List<dynamic>> all_books = [];
bool OpenBooks = false;
bool OpenBook = false;
int bookOpend = 0;

  Future<void> launchURL({required String url}) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      //mj
    }
  }
final dbService = DatabaseService();

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    late Widget SecondPageContents;
    if (OpenBook) {
      //Fourth
      Widget ForthPageBackButton = IconButton(
          onPressed: () async {
            List<List<dynamic>> records_ = await dbService.fiRead_Books(
                StudentData.grade,
                "${GradesAndsubjects.Subjects[GradesAndsubjects.GradesSubjects[StudentData.grade][0]][1]}");

            setState(() {
              anySubjectSelected = false;
              OpenBooks = true;
              OpenBook = false;
              all_books = records_;
              // log(all_books.toString());
            });
          },
          icon: const Icon(Icons.arrow_back));
      Widget DownloadTheBook = CMaker(
          height: 120,
          width: (PageWidth(context) < 600) ? double.infinity : 400,
          color: const Color.fromARGB(255, 36, 160, 209),
          circularRadius: 8,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(child: Container()),
              TMaker(
                  // book name text
                  text:
                      "${(all_books[bookOpend][2].length > 10) ? all_books[bookOpend][2].substring(0, 10) + "...." : all_books[bookOpend][2]}",
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  launchURL(url: all_books[bookOpend][0]);
                  //${all_books[bookOpend][0]}
                  // in here you must add ,the download function and its animation all by yourself
                },
                child: CMaker(
                  alignment: Alignment.center,
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
      Widget BookView = CMaker(
          border: Border.all(width: .5),
          alignment: Alignment.center,
          circularRadius: 8,
          color: const Color.fromARGB(255, 217, 216, 216),
          width: (PageWidth(context) < 800) ? double.infinity : 600,
          height: (PageHeight(context) - 420),
          child:
              SfPdfViewer.network(maxZoomLevel: 20, all_books[bookOpend][0]));
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageContents = Column(
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
                      ForthPageBackButton,
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
                padding: EdgeInsets.only(bottom: 20),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0), child: DownloadTheBook),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: BookView)
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageContents = Column(
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
                      ForthPageBackButton,
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
                padding: EdgeInsets.only(bottom: 20),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0), child: DownloadTheBook),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: BookView)
            ],
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageContents = Expanded(
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
                          ForthPageBackButton,
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
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DownloadTheBook),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: BookView)
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
      Widget PressOnBookT = TMaker(
          text: "اضغط على الكتاب للعرض",
          fontSize: (PageWidth(context) < 550)
              ? 20
              : (PageHeight(context) < 900)
                  ? 30
                  : 30,
          fontWeight: FontWeight.w700,
          color: Colors.black);
      Widget PressableBooks = (all_books.isEmpty)
          ? Center(
              child: TMaker(
                  text: "لا يوجد كتب",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )
          : ListView.builder(
              itemCount: all_books.length, //all_books.length,
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
                            height: (PageWidth(context) < 550)
                                ? 50
                                : (PageHeight(context) < 900)
                                    ? 80
                                    : 80,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            circularRadius: 5,
                            color: const Color.fromARGB(255, 19, 218, 132),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            // height: 40
                            width: double.infinity,
                            child: TMaker(
                                text:
                                    "${index + 1}- ${"${(all_books[index][2].length > 15) ? all_books[index][2].substring(0, 15) + "...." : all_books[index][2]}"}", //////
                                fontSize: (PageWidth(context) < 550)
                                    ? 30
                                    : (PageHeight(context) < 900)
                                        ? 40
                                        : 40,
                                fontWeight: FontWeight.w500,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)))),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    )
                  ],
                );
              });
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageContents = Column(
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
                      thirdPageBackButton,
                      Expanded(child: Container()),
                      CMaker(
                        child: Row(
                          children: [
                            SubjectSelectedImage(),
                            const Padding(padding: EdgeInsets.only(left: 5)),
                            SubjectSelectedName()
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
                  alignment: Alignment.center, height: 70, child: PressOnBookT),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              SizedBox(
                  height: PageHeight(context) - (320), child: PressableBooks)
            ],
          );
        });
      }
      if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageContents = Column(
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
                      thirdPageBackButton,
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
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              CMaker(
                  alignment: Alignment.center, height: 70, child: PressOnBookT),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              SizedBox(
                  height: PageHeight(context) - (320), child: PressableBooks)
            ],
          );
        });
      }
      if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageContents = Expanded(
            child: CMaker(
              child: Column(
                children: [
                  const StudentAppBar(),
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
                      child: PressableBooks)
                ],
              ),
            ),
          );
        });
      }
    } else if (anySubjectSelected) {
      // second
      return WhenASebjectIsSelected(
        Refresh: () {
          setState(() {});
        },
      );
    } else {
      // first
      return AllSubjectsPage(
        Refresh: () {
          setState(() {});
        },
      );
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return SecondPageContents;
  }
}
