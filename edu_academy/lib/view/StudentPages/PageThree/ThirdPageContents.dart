import 'dart:developer';
import 'dart:io';
import 'package:edu_academy/Data/StudentData/Schedule.dart';
import 'package:edu_academy/Data/StudentData/StudentData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/Other/StudentAppBar.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:edu_academy/view/StudentPages/HomePage.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

bool HomeWorkOpend = false;
bool HomeWorkOpend2 = false;
List Cols = [
  const Color.fromARGB(255, 142, 255, 43),
  const Color.fromARGB(255, 255, 204, 0),
  const Color.fromARGB(255, 255, 0, 0),
  const Color.fromARGB(255, 42, 226, 236),
  const Color.fromARGB(255, 42, 90, 236),
  const Color.fromARGB(255, 162, 42, 236),
  const Color.fromARGB(255, 236, 42, 145),
  const Color.fromARGB(255, 161, 255, 126)
];
List<dynamic> HomeWorks = [
  [
    "Data is loading....",
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
        "images/Logo.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [false],

      /// solve or not
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ]
      ],

      /// solve or not [data of solve]
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ],
        ['3', 'comment']
      ],

      /// solve or not [data of solve] [score,comment]
    ],
  ],
  [
    "Data is loading....",
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [false],

      /// solve or not
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ]
      ],

      /// solve or not [data of solve]
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ],
        ['score', 'comment']
      ],

      /// solve or not [data of solve] [score,comment]
    ],
  ],
  [
    "Data is loading....",
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [false],

      /// solve or not
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ]
      ],

      /// solve or not [data of solve]
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ],
        ['score', 'comment']
      ],

      /// solve or not [data of solve] [score,comment]
    ],
  ],
];
int HomeWorkIndex = 0;
bool ThirdPageThirdPage = false;
int HomeworkSelected = 0;
String HomeworkSelectedState = "";
bool StartedSoving = false;
String StudentHomeWorkAnswer = "";
bool EditSolution = false;
bool ViewSentSolution = false;
bool hw_in_list_none = false;
GlobalKey<FormState> Homeworkkey = GlobalKey();

class _ThirdPageState extends State<ThirdPage> {
  late Future<void> _dataFuture;
  final dbService = DatabaseService();
  // HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4] = [];

  @override
  void initState() {
    super.initState();
    _dataFuture = regetmessages();
  }

  regetmessages() async {
    List ggrtr = await dbService.fiGet_Hw(StudentData.grade, student_id);
    // HomeWorks.add(ggrtr);
    HomeWorks = ggrtr;
    print(ggrtr);
    print("add done");
    print(HomeWorks[HomeWorkIndex][0]);
    log("#HomeWorks $HomeWorks");
  }

  Future<void> pickImageFromGallery() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        PlatformFile file = result.files.single;
        // Access file data as Uint8List
        Uint8List fileBytes = file.bytes!;
        setState(() {
          HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].add(fileBytes);
          print("##4 done added in list ");
        });
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // regetmessages();
    late Widget ThirdPageContents;
    Widget HomeworkSubjectName = CMaker(
      width: double.infinity,
      alignment: Alignment.center,
      child: CMaker(
          boxShadow: const [
            BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(58, 0, 0, 0)),
          ],
          circularRadius: 20,
          color: const Color.fromARGB(255, 36, 160, 209),
          alignment: Alignment.center,
          height: 70,
          width: 150,
          child: TMaker(
              text: HomeWorks[HomeWorkIndex][0] as String,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 255, 255, 255))),
    );
    if (ThirdPageThirdPage) {
      Widget ThirdPageHomeworkBody = CMaker(
          circularRadius: 17,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 233, 255, 247),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TMaker(
              text: "${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][2]}",
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color.fromARGB(255, 0, 0, 0)));
      Widget ThirdPageHomeworkTitle = CMaker(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: TMaker(
              text: "${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][1]}",
              fontSize: (PageWidth(context) < 550)
                  ? 15
                  : (PageHeight(context) < 900)
                      ? 25
                      : 25,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 255, 255, 255)));
      Widget HomeworkImages = CMaker(
        color: const Color.fromARGB(255, 255, 255, 255),
        circularRadius: 25,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: (PageWidth(context) >= 550)
            ? (PageHeight(context) > 900)
                ? 400
                : 300
            : 250,
        width: double.infinity,
        child: (HomeWorks[HomeWorkIndex][HomeworkSelected + 1][3].length == 0)
            ? Center(
                child: TMaker(text: "No Files", fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
              )
            : GridView.builder(
                itemCount: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][3].length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InstaImageViewer(
                    backgroundColor: const Color.fromARGB(255, 233, 255, 247),
                    child: Image.network(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][3][index]),
                  );
                }),
      );
      Widget HomeworkStudentImages = CMaker(
        color: const Color.fromARGB(255, 255, 255, 255),
        circularRadius: 25,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: (HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].length == 0) ? 0 : 230,
        width: double.infinity,
        child: GridView.builder(
            itemCount: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InstaImageViewer(
                  backgroundColor: const Color.fromARGB(255, 233, 255, 247),
                  child: (!kIsWeb) ?Image(
                    image: Image.file(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4][index]).image,
                  ): Image.memory(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4][index]));
            }),
      );
      Widget StarsOf10 = CMaker(
          circularRadius: 20,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TMaker(text: "9/10 ⭐", fontSize: 20, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 36, 160, 209)));
      Widget TeacherHomeworkNotes = InkWell(
          onTap: () {},
          child: CMaker(
              circularRadius: 20,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TMaker(text: "الملاحظات", fontSize: 20, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 36, 160, 209))));
      Widget StudentHomeWorkBody = SizedBox(
        height: 210,
        child: Form(
          key: Homeworkkey,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "الحقل فارغ";
              }
              return null;
            },
            onSaved: (value) {
              StudentHomeWorkAnswer = value!;
            },
            maxLines: 8,
            decoration: InputDecoration(
                hintText: "اكتب هنا",
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
          ),
        ),
      );
      //Third
      if (HomeworkSelectedState == "غير محلول") {
        if (StartedSoving) {
          if (PageWidth(context) < 550) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          StartedSoving = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                circularRadius: 25,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: StudentHomeWorkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          child: CMaker(
                                            height: 200,
                                            child: Row(
                                              children: [
                                                Expanded(child: Container()),
                                                InkWell(
                                                      onTap: () async {
                                                        if (kIsWeb) {
                                                          pickImageFromGallery();
                                                        } else {
                                                          var Camera = await PhotoImageFromCamera();
                                                          if (Camera != null) {
                                                            HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].add(File(Camera.path));
                                                            print("#Camera# ${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]}");
                                                          }
                                                        }
                                                        setState(() {});
                                                        Get.back();
                                                      },
                                                      child: CMaker(
                                                          padding: const EdgeInsets.all(20),
                                                          color: const Color.fromARGB(255, 233, 255, 247),
                                                          circularRadius: 15,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                                offset: Offset(1, 1),
                                                                blurRadius: 6,
                                                                spreadRadius: .03,
                                                                color: Color.fromARGB(58, 0, 0, 0)),
                                                          ],
                                                          child:
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                      Icons.camera_alt,
                                                      color: Colors.black,
                                                    ),
                                                    Padding(padding:EdgeInsets.only(left: 20)),
                                                                  TMaker(text: "Camera", fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                                                                ],
                                                              )),
                                                    ),
                                                Expanded(child: Container()),
                                                    InkWell(
                                                      onTap: () async {
                                                        if (kIsWeb) {
                                                          pickImageFromGallery();
                                                        } else {
                                                          var Galary = await PhotoImageFromGalary();
                                                          if (Galary != null) {
                                                            HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].add(File(Galary.path));
                                                            print("#Galary# ${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]}");
                                                          }
                                                        }
                                                        setState(() {});
                                                        Get.back();
                                                      },
                                                      child: CMaker(
                                                          padding: const EdgeInsets.all(20),
                                                          color: const Color.fromARGB(255, 233, 255, 247),
                                                          circularRadius: 15,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                                offset: Offset(1, 1),
                                                                blurRadius: 6,
                                                                spreadRadius: .03,
                                                                color: Color.fromARGB(58, 0, 0, 0)),
                                                          ],
                                                          child:
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                      Icons.image,
                                                      color: Colors.black,
                                                    ),
                                                    Padding(padding:EdgeInsets.only(left: 20)),
                                                                  TMaker(text: "Galary", fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                                                                ],
                                                              )),
                                                    ),
                                                Expanded(child: Container()),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    setState(() {});
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 22, 255, 111),
                                      child: TMaker(
                                          text: "رفع صورة",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(255, 71, 69, 69))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            HomeworkStudentImages,
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () async {
                                    print(
                                        "HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4] ${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]}"); // hw files
                                    print(" StudentHomeWorkAnswer $StudentHomeWorkAnswer"); // hw solve body
                                    print(
                                        "HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8] ${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8]}"); // hw id
                                    print("student_id $student_id");
                                    // hw id,student_id,hw solve body,hw files
                                    OverlayLoadingProgress.start(context,
                                        widget: CMaker(
                                            circularRadius: 15,
                                            color: const Color.fromARGB(198, 255, 255, 255),
                                            width: MediaQuery.of(context).size.width / 3.6,
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 13),
                                            child: const AspectRatio(
                                              aspectRatio: 1,
                                              child: CircularProgressIndicator(
                                                color: Colors.blue,
                                              ),
                                            )));
                                    print(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]);
                                    if (HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].length != 0) {
                                      HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4] =
                                          await dbService.stsolveStore(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]);
                                    }

                                    await dbService.FiAdd_Solve([
                                      StudentData.grade,
                                      HomeWorks[HomeWorkIndex][HomeworkSelected],
                                      HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8],
                                      HomeWorks[HomeWorkIndex][0]
                                    ], student_id, StudentHomeWorkAnswer, HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]);
                                    await regetmessages();
                                    OverlayLoadingProgress.stop();
                                    PanaraInfoDialog.show(
                                      context,
                                      title: "Success",
                                      message: "Now you are good to go",
                                      buttonText: "Okay",
                                      onTapDismiss: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                          StartedSoving = false;
                                          HomeWorkOpend = true;
                                          ThirdPageThirdPage = false;
                                        });
                                      },
                                      panaraDialogType: PanaraDialogType.success,
                                      barrierDismissible: false,
                                    );
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 233, 255, 247),
                                      child:
                                          TMaker(text: "ارسال", fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 0, 0))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          StartedSoving = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                circularRadius: 25,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: StudentHomeWorkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () async {
                                    HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].add(File((await PhotoImageFromGalary()).path));
                                    setState(() {});
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 22, 255, 111),
                                      child: TMaker(
                                          text: "رفع صورة", fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 71, 69, 69))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            HomeworkStudentImages,
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () async {
                                    print(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]); // hw files
                                    print(StudentHomeWorkAnswer); // hw solve body
                                    print(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8]); // hw id
                                    print(student_id);
                                    // hw id,student_id,hw solve body,hw files
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
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    );
                                    dbService.FiAdd_Solve([
                                      StudentData.grade,
                                      HomeWorks[HomeWorkIndex][HomeworkSelected],
                                      HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8],
                                      HomeWorks[HomeWorkIndex][0]
                                    ], student_id, StudentHomeWorkAnswer, HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]);
                                    OverlayLoadingProgress.stop();
                                    PanaraInfoDialog.show(
                                      context,
                                      title: "Success",
                                      message: "Now you are good to go",
                                      buttonText: "Okay",
                                      onTapDismiss: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                          regetmessages();
                                          StartedSoving = false;
                                          HomeWorkOpend = true;
                                          ThirdPageThirdPage = false;
                                        });
                                      },
                                      panaraDialogType: PanaraDialogType.success,
                                      barrierDismissible: false,
                                    );
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 233, 255, 247),
                                      child:
                                          TMaker(text: "ارسال", fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 0, 0))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
            setState(() {
              ThirdPageContents = Expanded(
                child: CMaker(
                  child: Column(children: [
                    const StudentAppBar(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            StartedSoving = false;
                          });
                        },
                        child: CMaker(
                            margin: const EdgeInsets.only(left: 15),
                            height: 30,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            circularRadius: 20,
                            child: const Icon(
                              Icons.arrow_back,
                              size: 28,
                            ))),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    HomeworkSubjectName,
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Expanded(
                        flex: 13,
                        child: CMaker(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          circularRadius: 20,
                          color: const Color.fromARGB(255, 36, 160, 209),
                          child: Row(
                            children: [
                              Expanded(
                                  child: CMaker(
                                      child: ListView(
                                children: [
                                  const Padding(padding: EdgeInsets.only(top: 20)),
                                  HomeworkImages,
                                  const Padding(padding: EdgeInsets.only(top: 20)),
                                  HomeworkStudentImages,
                                  const Padding(padding: EdgeInsets.only(top: 20)),
                                ],
                              ))),
                              Expanded(
                                  child: CMaker(
                                child: ListView(
                                  children: [
                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                    ThirdPageHomeworkTitle,
                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                    CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                                    const Padding(padding: EdgeInsets.only(top: 40)),
                                    CMaker(
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(10),
                                        circularRadius: 25,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                        child: StudentHomeWorkBody),
                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                    CMaker(
                                        height: 70,
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          onTap: () async {
                                            HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].add(File((await PhotoImageFromGalary()).path));
                                            setState(() {});
                                          },
                                          child: CMaker(
                                              circularRadius: 17,
                                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                              color: const Color.fromARGB(255, 22, 255, 111),
                                              child: TMaker(
                                                  text: "رفع صورة",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color.fromARGB(255, 71, 69, 69))),
                                        )),
                                    const Padding(padding: EdgeInsets.only(top: 30)),
                                    CMaker(
                                        height: 70,
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          onTap: () async {
                                            print(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]); // hw files
                                            print(StudentHomeWorkAnswer); // hw solve body
                                            print(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8]); // hw id
                                            print(student_id);
                                            // hw id,student_id,hw solve body,hw files
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
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            );
                                            dbService.FiAdd_Solve([
                                              StudentData.grade,
                                              HomeWorks[HomeWorkIndex][HomeworkSelected],
                                              HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8],
                                              HomeWorks[HomeWorkIndex][0]
                                            ], student_id, StudentHomeWorkAnswer, HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]);
                                            OverlayLoadingProgress.stop();
                                            PanaraInfoDialog.show(
                                              context,
                                              title: "Success",
                                              message: "Now you are good to go",
                                              buttonText: "Okay",
                                              onTapDismiss: () {
                                                setState(() {
                                                  Navigator.of(context).pop();
                                                  StartedSoving = false;
                                                  HomeWorkOpend = true;
                                                  ThirdPageThirdPage = false;
                                                });
                                              },
                                              panaraDialogType: PanaraDialogType.success,
                                              barrierDismissible: false,
                                            );
                                          },
                                          child: CMaker(
                                              circularRadius: 17,
                                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                              color: const Color.fromARGB(255, 233, 255, 247),
                                              child: TMaker(
                                                  text: "ارسال",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color.fromARGB(255, 0, 0, 0))),
                                        )),
                                    const Padding(padding: EdgeInsets.only(top: 30)),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        )),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                  ]),
                ),
              );
            });
          }
        } else {
          if (PageWidth(context) < 550) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          HomeWorkOpend = true;
                          ThirdPageThirdPage = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      StartedSoving = true;
                                    });
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 233, 255, 247),
                                      child: TMaker(
                                          text: "بدء الحل", fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 0, 0))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          HomeWorkOpend = true;
                          ThirdPageThirdPage = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      StartedSoving = true;
                                    });
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 233, 255, 247),
                                      child: TMaker(
                                          text: "بدء الحل", fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 0, 0))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
            setState(() {
              ThirdPageContents = Expanded(
                child: CMaker(
                  child: Column(
                    children: [
                      const StudentAppBar(),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              HomeWorkOpend = true;
                              ThirdPageThirdPage = false;
                            });
                          },
                          child: CMaker(
                              margin: const EdgeInsets.only(left: 15),
                              height: 30,
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              circularRadius: 20,
                              child: const Icon(
                                Icons.arrow_back,
                                size: 28,
                              ))),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      HomeworkSubjectName,
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Expanded(
                          flex: 13,
                          child: CMaker(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            circularRadius: 20,
                            color: const Color.fromARGB(255, 36, 160, 209),
                            child: Row(
                              children: [
                                Expanded(child: Center(child: HomeworkImages)),
                                Expanded(
                                  child: CMaker(
                                      child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(),
                                      ),
                                      ThirdPageHomeworkTitle,
                                      const Padding(padding: EdgeInsets.only(top: 20)),
                                      CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                                      const Padding(padding: EdgeInsets.only(top: 40)),
                                      CMaker(
                                          height: 70,
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                StartedSoving = true;
                                              });
                                            },
                                            child: CMaker(
                                                circularRadius: 17,
                                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                                color: const Color.fromARGB(255, 233, 255, 247),
                                                child: TMaker(
                                                    text: "بدء الحل",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromARGB(255, 0, 0, 0))),
                                          )),
                                      const Padding(padding: EdgeInsets.only(top: 30)),
                                      Expanded(
                                        child: Container(),
                                      ),
                                    ],
                                  )),
                                )
                              ],
                            ),
                          )),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                    ],
                  ),
                ),
              );
            });
          }
        }
      } else if (HomeworkSelectedState == "في انتظار التصحيح") {
        if (EditSolution) {
          if (PageWidth(context) < 550) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          EditSolution = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                circularRadius: 25,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: StudentHomeWorkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () async {
                                    HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].add(File((await PhotoImageFromGalary()).path));
                                    setState(() {});
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 22, 255, 111),
                                      child: TMaker(
                                          text: "رفع صورة",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(255, 71, 69, 69))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            HomeworkStudentImages,
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () async {
                                    print(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]); // hw files
                                    print(StudentHomeWorkAnswer); // hw solve body
                                    print(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8]); // hw id
                                    print(student_id);
                                    // hw id,student_id,hw solve body,hw files
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
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    );
                                    dbService.FiAdd_Solve([
                                      StudentData.grade,
                                      HomeWorks[HomeWorkIndex][HomeworkSelected],
                                      HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8],
                                      HomeWorks[HomeWorkIndex][0]
                                    ], student_id, StudentHomeWorkAnswer, HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]);
                                    OverlayLoadingProgress.stop();
                                    PanaraInfoDialog.show(
                                      context,
                                      title: "Success",
                                      message: "Now you are good to go",
                                      buttonText: "Okay",
                                      onTapDismiss: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                          regetmessages();
                                          StartedSoving = false;
                                          HomeWorkOpend = true;
                                          ThirdPageThirdPage = false;
                                        });
                                      },
                                      panaraDialogType: PanaraDialogType.success,
                                      barrierDismissible: false,
                                    );
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 233, 255, 247),
                                      child:
                                          TMaker(text: "ارسال", fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 0, 0))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          EditSolution = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                circularRadius: 25,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: StudentHomeWorkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () async {
                                    HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].add(File((await PhotoImageFromGalary()).path));
                                    setState(() {});
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 22, 255, 111),
                                      child: TMaker(
                                          text: "رفع صورة", fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 71, 69, 69))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            HomeworkStudentImages,
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () async {
                                    // print(HomeWorks[HomeWorkIndex]
                                    //     [HomeworkSelected + 1][4]); // hw files
                                    // print(
                                    //     StudentHomeWorkAnswer); // hw solve body
                                    // print(HomeWorks[HomeWorkIndex]
                                    //     [HomeworkSelected + 1][8]); // hw id
                                    // print(student_id);
                                    // hw id,student_id,hw solve body,hw files
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
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    );
                                    dbService.FiAdd_Solve([
                                      StudentData.grade,
                                      HomeWorks[HomeWorkIndex][HomeworkSelected],
                                      HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8],
                                      HomeWorks[HomeWorkIndex][0]
                                    ], student_id, StudentHomeWorkAnswer, HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]);
                                    OverlayLoadingProgress.stop();
                                    PanaraInfoDialog.show(
                                      context,
                                      title: "Success",
                                      message: "Now you are good to go",
                                      buttonText: "Okay",
                                      onTapDismiss: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                          regetmessages();
                                          StartedSoving = false;
                                          HomeWorkOpend = true;
                                          ThirdPageThirdPage = false;
                                        });
                                      },
                                      panaraDialogType: PanaraDialogType.success,
                                      barrierDismissible: false,
                                    );
                                  },
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 233, 255, 247),
                                      child:
                                          TMaker(text: "ارسال", fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 0, 0))),
                                )),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
            setState(() {
              ThirdPageContents = Expanded(
                child: CMaker(
                  child: Column(
                    children: [
                      const StudentAppBar(),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              EditSolution = false;
                            });
                          },
                          child: CMaker(
                              margin: const EdgeInsets.only(left: 15),
                              height: 30,
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              circularRadius: 20,
                              child: const Icon(
                                Icons.arrow_back,
                                size: 28,
                              ))),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      HomeworkSubjectName,
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Expanded(
                          flex: 13,
                          child: CMaker(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            circularRadius: 20,
                            color: const Color.fromARGB(255, 36, 160, 209),
                            child: Row(
                              children: [
                                Expanded(child: Center(child: HomeworkImages)),
                                Expanded(
                                  child: CMaker(
                                      child: ListView(
                                    children: [
                                      const Padding(padding: EdgeInsets.only(top: 20)),
                                      ThirdPageHomeworkTitle,
                                      const Padding(padding: EdgeInsets.only(top: 20)),
                                      CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                                      const Padding(padding: EdgeInsets.only(top: 40)),
                                      CMaker(
                                          margin: const EdgeInsets.all(10),
                                          padding: const EdgeInsets.all(10),
                                          circularRadius: 25,
                                          color: const Color.fromARGB(255, 255, 255, 255),
                                          child: StudentHomeWorkBody),
                                      const Padding(padding: EdgeInsets.only(top: 20)),
                                      CMaker(
                                          height: 70,
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () async {
                                              HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4].add(File((await PhotoImageFromGalary()).path));
                                              setState(() {});
                                            },
                                            child: CMaker(
                                                circularRadius: 17,
                                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                                color: const Color.fromARGB(255, 22, 255, 111),
                                                child: TMaker(
                                                    text: "رفع صورة",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromARGB(255, 71, 69, 69))),
                                          )),
                                      const Padding(padding: EdgeInsets.only(top: 30)),
                                      HomeworkStudentImages,
                                      const Padding(padding: EdgeInsets.only(top: 30)),
                                      CMaker(
                                          height: 70,
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () async {
                                              print(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]); // hw files
                                              print(StudentHomeWorkAnswer); // hw solve body
                                              print(HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8]); // hw id
                                              print(student_id);
                                              // hw id,student_id,hw solve body,hw files
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
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              );
                                              dbService.FiAdd_Solve([
                                                StudentData.grade,
                                                HomeWorks[HomeWorkIndex][HomeworkSelected],
                                                HomeWorks[HomeWorkIndex][HomeworkSelected + 1][8],
                                                HomeWorks[HomeWorkIndex][0]
                                              ], student_id, StudentHomeWorkAnswer, HomeWorks[HomeWorkIndex][HomeworkSelected + 1][4]);
                                              OverlayLoadingProgress.stop();
                                              PanaraInfoDialog.show(
                                                context,
                                                title: "Success",
                                                message: "Now you are good to go",
                                                buttonText: "Okay",
                                                onTapDismiss: () {
                                                  setState(() {
                                                    Navigator.of(context).pop();
                                                    regetmessages();
                                                    StartedSoving = false;
                                                    HomeWorkOpend = true;
                                                    ThirdPageThirdPage = false;
                                                  });
                                                },
                                                panaraDialogType: PanaraDialogType.success,
                                                barrierDismissible: false,
                                              );
                                            },
                                            child: CMaker(
                                                circularRadius: 17,
                                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                                color: const Color.fromARGB(255, 233, 255, 247),
                                                child: TMaker(
                                                    text: "ارسال",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromARGB(255, 0, 0, 0))),
                                          )),
                                      const Padding(padding: EdgeInsets.only(top: 30)),
                                    ],
                                  )),
                                )
                              ],
                            ),
                          )),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                    ],
                  ),
                ),
              );
            });
          }
        } else if (ViewSentSolution) {
          if (PageWidth(context) < 550) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ViewSentSolution = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                circularRadius: 25,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: TMaker(
                                    text: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][2],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            HomeworkStudentImages,
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ViewSentSolution = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                circularRadius: 25,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: TMaker(
                                    text: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][2],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            HomeworkStudentImages,
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
            setState(() {
              ThirdPageContents = Expanded(
                child: CMaker(
                  child: Column(
                    children: [
                      const StudentAppBar(),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              ViewSentSolution = false;
                            });
                          },
                          child: CMaker(
                              margin: const EdgeInsets.only(left: 15),
                              height: 30,
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              circularRadius: 20,
                              child: const Icon(
                                Icons.arrow_back,
                                size: 28,
                              ))),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      HomeworkSubjectName,
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Expanded(
                          flex: 13,
                          child: CMaker(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            circularRadius: 20,
                            color: const Color.fromARGB(255, 36, 160, 209),
                            child: Row(
                              children: [
                                Expanded(child: Center(child: HomeworkImages)),
                                Expanded(
                                  child: CMaker(
                                      child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(),
                                      ),
                                      const Padding(padding: EdgeInsets.only(top: 20)),
                                      ThirdPageHomeworkTitle,
                                      const Padding(padding: EdgeInsets.only(top: 20)),
                                      CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                                      const Padding(padding: EdgeInsets.only(top: 40)),
                                      CMaker(
                                          margin: const EdgeInsets.all(10),
                                          padding: const EdgeInsets.all(10),
                                          circularRadius: 25,
                                          color: const Color.fromARGB(255, 255, 255, 255),
                                          child: TMaker(
                                              text: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][2],
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                      const Padding(padding: EdgeInsets.only(top: 30)),
                                      HomeworkStudentImages,
                                      const Padding(padding: EdgeInsets.only(top: 30)),
                                      Expanded(
                                        child: Container(),
                                      ),
                                    ],
                                  )),
                                )
                              ],
                            ),
                          )),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                    ],
                  ),
                ),
              );
            });
          }
        } else {
          if (PageWidth(context) < 550) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          HomeWorkOpend = true;
                          ThirdPageThirdPage = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                CMaker(
                                    height: 70,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          EditSolution = true;
                                        });
                                      },
                                      child: CMaker(
                                          circularRadius: 17,
                                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                          color: const Color.fromARGB(255, 233, 255, 247),
                                          child: TMaker(
                                              text: "تعديل الحل (soon)",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(255, 0, 0, 0))),
                                    )),
                                Expanded(
                                  child: Container(),
                                ),
                                CMaker(
                                    height: 70,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          ViewSentSolution = true;
                                        });
                                      },
                                      child: CMaker(
                                          circularRadius: 17,
                                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                          color: const Color.fromARGB(255, 233, 255, 247),
                                          child: TMaker(
                                              text: "عرض الحل",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(255, 0, 0, 0))),
                                    )),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          HomeWorkOpend = true;
                          ThirdPageThirdPage = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                CMaker(
                                    height: 70,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          EditSolution = true;
                                        });
                                      },
                                      child: CMaker(
                                          circularRadius: 17,
                                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                          color: const Color.fromARGB(255, 233, 255, 247),
                                          child: TMaker(
                                              text: "تعديل الحل",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(255, 0, 0, 0))),
                                    )),
                                Expanded(
                                  child: Container(),
                                ),
                                CMaker(
                                    height: 70,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          ViewSentSolution = true;
                                        });
                                      },
                                      child: CMaker(
                                          circularRadius: 17,
                                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                          color: const Color.fromARGB(255, 233, 255, 247),
                                          child: TMaker(
                                              text: "عرض الحل",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(255, 0, 0, 0))),
                                    )),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
            setState(() {
              ThirdPageContents = Expanded(
                child: CMaker(
                  child: Column(
                    children: [
                      const StudentAppBar(),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              HomeWorkOpend = true;
                              ThirdPageThirdPage = false;
                            });
                          },
                          child: CMaker(
                              margin: const EdgeInsets.only(left: 15),
                              height: 30,
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              circularRadius: 20,
                              child: const Icon(
                                Icons.arrow_back,
                                size: 28,
                              ))),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      HomeworkSubjectName,
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Expanded(
                        flex: 13,
                        child: CMaker(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            circularRadius: 20,
                            color: const Color.fromARGB(255, 36, 160, 209),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CMaker(
                                    child: HomeworkImages,
                                  ),
                                ),
                                Expanded(
                                    child: CMaker(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(),
                                      ),
                                      ThirdPageHomeworkTitle,
                                      const Padding(padding: EdgeInsets.only(top: 20)),
                                      CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                                      const Padding(padding: EdgeInsets.only(top: 40)),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(),
                                          ),
                                          CMaker(
                                              height: 70,
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    EditSolution = true;
                                                  });
                                                },
                                                child: CMaker(
                                                    circularRadius: 17,
                                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                                    color: const Color.fromARGB(255, 233, 255, 247),
                                                    child: TMaker(
                                                        text: "تعديل الحل",
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600,
                                                        color: const Color.fromARGB(255, 0, 0, 0))),
                                              )),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          CMaker(
                                              height: 70,
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    ViewSentSolution = true;
                                                  });
                                                },
                                                child: CMaker(
                                                    circularRadius: 17,
                                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                                    color: const Color.fromARGB(255, 233, 255, 247),
                                                    child: TMaker(
                                                        text: "عرض الحل",
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600,
                                                        color: const Color.fromARGB(255, 0, 0, 0))),
                                              )),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              );
            });
          }
        }
      } else {
        if (ViewSentSolution) {
          if (PageWidth(context) < 550) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ViewSentSolution = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                circularRadius: 25,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: TMaker(
                                    text: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][2],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            HomeworkStudentImages,
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ViewSentSolution = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            CMaker(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                circularRadius: 25,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: TMaker(
                                    text: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][2],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            HomeworkStudentImages,
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
            setState(() {
              ThirdPageContents = Expanded(
                child: CMaker(
                  child: Column(
                    children: [
                      const StudentAppBar(),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              ViewSentSolution = false;
                            });
                          },
                          child: CMaker(
                              margin: const EdgeInsets.only(left: 15),
                              height: 30,
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              circularRadius: 20,
                              child: const Icon(
                                Icons.arrow_back,
                                size: 28,
                              ))),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      HomeworkSubjectName,
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Expanded(
                          flex: 13,
                          child: CMaker(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            circularRadius: 20,
                            color: const Color.fromARGB(255, 36, 160, 209),
                            child: Row(
                              children: [
                                Expanded(child: Center(child: HomeworkImages)),
                                Expanded(
                                    child: CMaker(
                                        child: Column(
                                  children: [
                                    Expanded(child: Container()),
                                    ThirdPageHomeworkTitle,
                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                    CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                                    const Padding(padding: EdgeInsets.only(top: 40)),
                                    CMaker(
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(10),
                                        circularRadius: 25,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                        child: TMaker(
                                            text: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][2],
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    const Padding(padding: EdgeInsets.only(top: 30)),
                                    HomeworkStudentImages,
                                    Expanded(child: Container()),
                                  ],
                                ))),
                              ],
                            ),
                          )),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                    ],
                  ),
                ),
              );
            });
          }
        } else {
          if (PageWidth(context) < 550) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          HomeWorkOpend = true;
                          ThirdPageThirdPage = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                CMaker(
                                  height: 70,
                                  alignment: Alignment.center,
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 233, 255, 247),
                                      child: TMaker(
                                          text:
                                              "${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][7][2][0]} / ${HomeWorks[HomeWorkIndex][HomeworkSelected + 1][6]}",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(255, 0, 0, 0))),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                CMaker(
                                    height: 70,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          ViewSentSolution = true;
                                        });
                                      },
                                      child: CMaker(
                                          circularRadius: 17,
                                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                          color: const Color.fromARGB(255, 233, 255, 247),
                                          child: TMaker(
                                              text: "عرض الحل",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(255, 0, 0, 0))),
                                    )),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
            setState(() {
              ThirdPageContents = Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          HomeWorkOpend = true;
                          ThirdPageThirdPage = false;
                        });
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                      flex: 13,
                      child: CMaker(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 20,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ThirdPageHomeworkTitle,
                            HomeworkImages,
                            const Padding(padding: EdgeInsets.only(top: 40)),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                CMaker(
                                  height: 70,
                                  alignment: Alignment.center,
                                  child: CMaker(
                                      circularRadius: 17,
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                      color: const Color.fromARGB(255, 233, 255, 247),
                                      child: TMaker(
                                          text: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][7][2][0],
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(255, 0, 0, 0))),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                CMaker(
                                    height: 70,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          ViewSentSolution = true;
                                        });
                                      },
                                      child: CMaker(
                                          circularRadius: 17,
                                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                          color: const Color.fromARGB(255, 233, 255, 247),
                                          child: TMaker(
                                              text: "عرض الحل",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(255, 0, 0, 0))),
                                    )),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            });
          } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
            setState(() {
              ThirdPageContents = Expanded(
                child: CMaker(
                  child: Column(
                    children: [
                      const StudentAppBar(),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              HomeWorkOpend = true;
                              ThirdPageThirdPage = false;
                            });
                          },
                          child: CMaker(
                              margin: const EdgeInsets.only(left: 15),
                              height: 30,
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              circularRadius: 20,
                              child: const Icon(
                                Icons.arrow_back,
                                size: 28,
                              ))),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      HomeworkSubjectName,
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Expanded(
                        flex: 13,
                        child: CMaker(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            circularRadius: 20,
                            color: const Color.fromARGB(255, 36, 160, 209),
                            child: Row(
                              children: [
                                Expanded(child: Center(child: HomeworkImages)),
                                Expanded(
                                    child: CMaker(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(),
                                      ),
                                      ThirdPageHomeworkTitle,
                                      const Padding(padding: EdgeInsets.only(top: 20)),
                                      CMaker(height: 100, alignment: Alignment.center, child: ThirdPageHomeworkBody),
                                      const Padding(padding: EdgeInsets.only(top: 40)),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(),
                                          ),
                                          CMaker(
                                            height: 70,
                                            alignment: Alignment.center,
                                            child: CMaker(
                                                circularRadius: 17,
                                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                                color: const Color.fromARGB(255, 233, 255, 247),
                                                child: TMaker(
                                                    text: HomeWorks[HomeWorkIndex][HomeworkSelected + 1][7][2][0],
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromARGB(255, 0, 0, 0))),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          CMaker(
                                              height: 70,
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    ViewSentSolution = true;
                                                  });
                                                },
                                                child: CMaker(
                                                    circularRadius: 17,
                                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                                    color: const Color.fromARGB(255, 233, 255, 247),
                                                    child: TMaker(
                                                        text: "عرض الحل",
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600,
                                                        color: const Color.fromARGB(255, 0, 0, 0))),
                                              )),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                )),
                                const Padding(padding: EdgeInsets.only(top: 20)),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              );
            });
          }
        }
      }
    } else if (HomeWorkOpend) {
      // Second
      Widget SecondPageArrowBack = InkWell(
          onTap: () {
            setState(() {
              regetmessages();
              HomeWorkOpend = false;
              ThirdPageThirdPage = false;
            });
          },
          child: CMaker(
              margin: const EdgeInsets.only(left: 15),
              height: 30,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              circularRadius: 20,
              child: const Icon(
                Icons.arrow_back,
                size: 28,
              )));
      Widget HomeWorksBuilder = (!(HomeWorks[HomeWorkIndex].length - 1 == 0))
          ? CMaker(
              padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
              circularRadius: 25,
              margin: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
              width: double.infinity,
              color: const Color.fromARGB(255, 36, 160, 209),
              child: ListView.builder(
                  itemCount: HomeWorks[HomeWorkIndex].length - 1,
                  itemBuilder: (context, index) {
                    return CMaker(
                      boxShadow: const [
                        BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(58, 0, 0, 0)),
                      ],
                      padding: const EdgeInsets.all(10),
                      circularRadius: 25,
                      margin: const EdgeInsets.only(bottom: 30),
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: () {
                            // hw coloring status
                            if (!(HomeWorks[HomeWorkIndex][index + 1][7][0] == false)) {
                              if (!(HomeWorks[HomeWorkIndex][index + 1][7].length == 2)) {
                                if (HomeWorks[HomeWorkIndex][index + 1][7][2][0] == HomeWorks[HomeWorkIndex][index + 1][6]) {
                                  return [
                                    // full mark
                                    const Color.fromARGB(255, 160, 253, 55),
                                    const Color.fromARGB(255, 255, 255, 255),
                                  ];
                                } else {
                                  return [
                                    // not full mark
                                    const Color.fromARGB(255, 160, 253, 55),
                                    const Color.fromARGB(255, 255, 255, 255),
                                  ];
                                }
                              } else {
                                return [
                                  // في انتظار التصحيح
                                  const Color.fromARGB(255, 82, 55, 255),
                                  const Color.fromARGB(255, 255, 255, 255),
                                ];
                              }
                            } else {
                              return [
                                // غير محلول
                                const Color.fromARGB(255, 255, 59, 59),
                                const Color.fromARGB(255, 255, 255, 255),
                              ];
                            }
                          }()), // white change to full marked theme
                      height: 120,
                      width: double.infinity,
                      child: Row(
                        children: [
                          CMaker(
                            width: 140,
                            child: Column(
                              children: [
                                Expanded(child: CMaker(child: Container())),
                                CMaker(
                                    circularRadius: 15,
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    color: (HomeWorks[HomeWorkIndex][index + 1][7][0] == false)
                                        ? const Color.fromARGB(255, 249, 84, 84)
                                        : (HomeWorks[HomeWorkIndex][index + 1][7].length == 2)
                                            ? const Color.fromARGB(255, 66, 133, 241)
                                            : const Color.fromARGB(255, 32, 222, 32),
                                    child: TMaker(
                                        text: (HomeWorks[HomeWorkIndex][index + 1][7][0] == false)
                                            ? "غير محلول"
                                            : (HomeWorks[HomeWorkIndex][index + 1][7].length == 2)
                                                ? "في انتظار التصحيح"
                                                : "${HomeWorks[HomeWorkIndex][index + 1][7][2][0]} / ${HomeWorks[HomeWorkIndex][index + 1][6]}",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white)),
                                Expanded(child: CMaker(child: Container())),
                                (!(HomeWorks[HomeWorkIndex][index + 1][7][0] == false))
                                    ? !(HomeWorks[HomeWorkIndex][index + 1][7].length == 2)
                                        ? !(HomeWorks[HomeWorkIndex][index + 1][7][2][1] == "")
                                            ? InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Dialog(
                                                        child: CMaker(
                                                            circularRadius: 20,
                                                            padding: const EdgeInsets.all(20),
                                                            child: TMaker(
                                                                textAlign: TextAlign.start,
                                                                text: HomeWorks[HomeWorkIndex][index + 1][7][2][1],
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w800,
                                                                color: const Color.fromARGB(255, 0, 0, 0))),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: CMaker(
                                                    circularRadius: 20,
                                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                    color: const Color.fromARGB(255, 235, 218, 118),
                                                    child: TMaker(
                                                        text: (HomeWorks[HomeWorkIndex][index + 1][7][2][1].length > 8)
                                                            ? HomeWorks[HomeWorkIndex][index + 1][7][2][1].substring(0, 8) + "..."
                                                            : HomeWorks[HomeWorkIndex][index + 1][7][2][1],
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w800,
                                                        color: const Color.fromARGB(255, 0, 0, 0))),
                                              )
                                            : Container()
                                        : Container()
                                    : Container(),
                                Expanded(child: CMaker(child: Container())),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      HomeWorkOpend = false;
                                      ThirdPageThirdPage = true;
                                      HomeworkSelected = index;
                                      HomeworkSelectedState = (HomeWorks[HomeWorkIndex][index + 1][7][0] == false)
                                          ? "غير محلول"
                                          : (HomeWorks[HomeWorkIndex][index + 1][7].length == 2)
                                              ? "في انتظار التصحيح"
                                              : HomeWorks[HomeWorkIndex][index + 1][7][2][0];
                                    });
                                  },
                                  child: (HomeWorks[HomeWorkIndex][index + 1][7][0] == false)
                                      ? CMaker(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          circularRadius: 20,
                                          color: const Color.fromARGB(255, 235, 218, 118),
                                          margin: const EdgeInsets.symmetric(horizontal: 15),
                                          height: 40,
                                          child: TMaker(
                                              text: "عرض", fontSize: 18, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 0, 0)))
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Expanded(
                            flex: 5,
                            child: CMaker(
                                height: double.infinity,
                                padding: const EdgeInsets.only(right: 10),
                                child: TMaker(
                                    textAlign: TextAlign.end,
                                    text: "${HomeWorks[HomeWorkIndex][index + 1][2]}",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 0, 0, 0))),
                          ),
                        ],
                      ),
                    );
                  }))
          : CMaker(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: CMaker(
                  height: 200,
                  width: 300,
                  alignment: Alignment.center,
                  circularRadius: 20,
                  color: const Color.fromARGB(255, 36, 160, 209),
                  child: const Text(
                    "لا يوجد واجبات مضافة",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 255, 255, 255)),
                  )),
            );
      if (PageWidth(context) < 550) {
        setState(() {
          ThirdPageContents = CMaker(
            child: Column(
              children: [
                const StudentAppBar(),
                const Padding(padding: EdgeInsets.only(top: 20)),
                SecondPageArrowBack,
                const Padding(padding: EdgeInsets.only(top: 20)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(flex: 13, child: HomeWorksBuilder)
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          ThirdPageContents = CMaker(
            child: Column(
              children: [
                const StudentAppBar(),
                const Padding(padding: EdgeInsets.only(top: 20)),
                SecondPageArrowBack,
                const Padding(padding: EdgeInsets.only(bottom: 30)),
                HomeworkSubjectName,
                const Padding(padding: EdgeInsets.only(bottom: 30)),
                Expanded(flex: 13, child: HomeWorksBuilder)
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          ThirdPageContents = Expanded(
            child: CMaker(
              child: Column(
                children: [
                  const StudentAppBar(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  SecondPageArrowBack,
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  HomeworkSubjectName,
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  Expanded(flex: 13, child: HomeWorksBuilder)
                ],
              ),
            ),
          );
        });
      }
    } else {
      // First
      Widget StudentFullScadual = CMaker(
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: StudentSchedule.TableData[0].length,
            itemBuilder: (context, ColumnIndex) {
              return CMaker(
                  width: (PageWidth(context) > 550 && PageHeight(context) < 900)
                      ? (PageWidth(context) < 1200)
                          ? (PageWidth(context) - 164.5) / StudentSchedule.TableData[0].length
                          : (PageWidth(context) - 379) / StudentSchedule.TableData[0].length
                      : (PageWidth(context) - 41) / StudentSchedule.TableData[0].length,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: StudentSchedule.TableData.length,
                    itemBuilder: (context, RowIndex) {
                      return CMaker(
                          height: (200) / StudentSchedule.TableData.length,
                          child: Container(
                              decoration: BoxDecoration(
                                border: const Border(right: BorderSide(), bottom: BorderSide()),
                                borderRadius: BorderRadius.only(
                                  topLeft: ("$ColumnIndex $RowIndex" == "0 0") ? const Radius.circular(10) : const Radius.circular(0),
                                  bottomLeft: ("$ColumnIndex $RowIndex" == "0 ${StudentSchedule.TableData.length - 1}")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  topRight: ("$ColumnIndex $RowIndex" == "${StudentSchedule.TableData[0].length - 1} 0")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  bottomRight: ("$ColumnIndex $RowIndex" == "${StudentSchedule.TableData[0].length - 1} ${StudentSchedule.TableData.length - 1}")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                ),
                                color: (ColumnIndex == 0 || RowIndex == 0) ? const Color.fromARGB(255, 36, 160, 209) : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: TMaker(
                                  text: "${StudentSchedule.TableData[RowIndex][ColumnIndex]}",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: (ColumnIndex == 0 || RowIndex == 0)
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : const Color.fromARGB(255, 0, 0, 0))));
                    },
                  ));
            },
          ));
      Widget HomeWorksWidget = CMaker(
        alignment: Alignment.center,
        circularRadius: 8,
        margin: const EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
        width: double.infinity,
        height: (PageHeight(context) - ((PageWidth(context) > 550 && PageHeight(context) < 900) ? 350 : 420)),
        boxShadow: const [
          BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
        ],
        color: const Color.fromARGB(255, 36, 160, 209),
        child: Column(
          children: [
            CMaker(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: CMaker(
                    circularRadius: 20,
                    height: 25,
                    width: 80,
                    color: const Color.fromARGB(255, 233, 255, 247),
                    margin: const EdgeInsets.only(top: 20, bottom: 15, right: 10),
                    alignment: Alignment.center,
                    child: TMaker(text: "الواجبات", fontSize: 15, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 20, 206, 61)))),
            CMaker(
              height: PageHeight(context) - ((PageWidth(context) > 550 && PageHeight(context) < 900) ? 410 : 480),
              child: ListView.builder(
                  itemCount: HomeWorks.length,
                  itemBuilder: (context, index) {
                    int hwConter = 0;
                    if ((HomeWorks[index]).length > 1) {
                      for (int i = 0; i < (HomeWorks[index]).length; i++) {
                        if (i == 0) continue;
                        if (HomeWorks[index][i][7][0] == false) hwConter += 1;
                      }
                    }
                    print("hw_conter $hwConter");
                    return CMaker(
                      circularRadius: 10,
                      color: const Color.fromARGB(255, 233, 255, 247),
                      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                      width: double.infinity,
                      height: 95,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Container()),
                              TMaker(
                                  text: "${HomeWorks[index][0]}",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              Container(
                                margin: const EdgeInsets.only(right: 5, left: 10),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: () {
                                      if (hwConter > 0) {
                                        return const Color.fromARGB(255, 255, 2, 2);
                                      } else {
                                        return const Color.fromARGB(255, 108, 219, 110);
                                      }
                                    }()),
                              )
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 2)),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    HomeWorkIndex = index;
                                    HomeWorkOpend = true;
                                  });
                                },
                                child: CMaker(
                                  margin: const EdgeInsets.only(left: 7, bottom: 2),
                                  alignment: Alignment.center,
                                  color: const Color.fromARGB(255, 36, 160, 209),
                                  circularRadius: 10,
                                  height: 30,
                                  width: 60,
                                  child: TMaker(
                                      text: "تصفح", fontSize: 15, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255)),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              CMaker(
                                padding: const EdgeInsets.only(right: 10),
                                child: TMaker(
                                    text: () {
                                      if (hwConter > 0) {
                                        return "واجب غير محلول : $hwConter";
                                      } else {
                                        return "جميع الواجبات محلوله ✨";
                                      }
                                    }(),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: (hwConter > 0) ? const Color.fromARGB(255, 255, 36, 36) : const Color.fromARGB(255, 108, 219, 110)),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
      if (PageWidth(context) < 550) {
        setState(() {
          ThirdPageContents = Column(
            children: [
              Container(
                child: Column(
                  children: [
                    const StudentAppBar(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(boxShadow: const [
                      BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
                    ], margin: const EdgeInsets.symmetric(horizontal: 20), child: StudentFullScadual)
                  ],
                ),
              ),
              HomeWorksWidget
            ],
          );
        });
      }
      if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          ThirdPageContents = Column(
            children: [
              Container(
                child: Column(
                  children: [
                    const StudentAppBar(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(boxShadow: const [
                      BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
                    ], margin: const EdgeInsets.symmetric(horizontal: 20), child: StudentFullScadual)
                  ],
                ),
              ),
              HomeWorksWidget
            ],
          );
        });
      }
      if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          ThirdPageContents = Expanded(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      const StudentAppBar(),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      CMaker(boxShadow: const [
                        BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
                      ], margin: const EdgeInsets.symmetric(horizontal: 20), child: StudentFullScadual)
                    ],
                  ),
                ),
                HomeWorksWidget
              ],
            ),
          );
        });
      }
    }
    print(HomeworkSelected);
    return ThirdPageContents;
  }
}
