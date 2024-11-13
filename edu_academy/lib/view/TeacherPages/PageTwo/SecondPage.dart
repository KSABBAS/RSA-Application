import 'dart:developer';
import 'dart:io';
import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';
import 'package:mime/mime.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TeacherSecondPageContents extends StatefulWidget {
  TeacherSecondPageContents(
      {super.key, required this.ListOfGrades, required this.SubjectName});
  List ListOfGrades;
  String SubjectName;
  @override
  State<TeacherSecondPageContents> createState() =>
      _TeacherSecondPageContentsState();
}

bool GradeIsOpened = false;
bool BooksAreOpened = false;
int GradeOpenedIndex = 0;
String TheMessageDuration = "for 24 hours";
String CurrentMessage = "";
String CurrentMessageTime = DateFormat('MMMM dd, HH:mm').format(DateTime.now());
List<List<dynamic>> Books_data = [];
Object? realTimeValues;

class _TeacherSecondPageContentsState extends State<TeacherSecondPageContents> {
  final dbService = DatabaseService();
  late bool BooksAreLoading = true;
  late Future<void> _dataFuture;

  final TextEditingController _MessageController = TextEditingController();
  List AllMessages = [
    // عينه للتفهيم
    ["Messgae", "Time", "Duration"] // ارسالة الثالثة التجريبية
  ];

  @override
  void initState() {
    super.initState();
    // regetmessages();
  }

  books_load() async {
    BooksAreLoading = true;
    setState(() {});
    print("#### ${widget.ListOfGrades[GradeOpenedIndex][0]}");
    print("#### $TeacherData.SubjectThatIsSelected");
    var booksData0 = await dbService.fiRead_Books(
        widget.ListOfGrades[GradeOpenedIndex][0],
        TeacherData.SubjectThatIsSelected);
    print("Books_data $Books_data");
    setState(() {
      Books_data = booksData0;
      BooksAreLoading = false;
    });
  }

  regetmessages() async {
    //GradeOpenedIndex
    try {
      String grades_ =
          widget.ListOfGrades[GradeOpenedIndex][0].contains('(Lang)')
              ? widget.ListOfGrades[GradeOpenedIndex][0]
                  .replaceAll('(Lang)', '')
                  .trim()
              : widget.ListOfGrades[GradeOpenedIndex][0];
      final real = FirebaseDatabase.instance;
      final allMes = real
          .ref("Messages")
          .child(grades_)
          .child(TeacherData.SubjectThatIsSelected);
      print("grades_ $grades_");
      allMes.onValue.listen(
        (event) {
          setState(() {
            try {
              realTimeValues = event.snapshot.value;
              print("realTimeValues $realTimeValues");
              Map map = realTimeValues as Map;
              print("map $map");
              print("map.keys ${map.keys}");
              AllMessages = [];
              for (var i in map.keys) {
                AllMessages.add([map[i][0], map[i][1], map[i][2]]);
                print("map AllMessages $AllMessages");
              }
              if (AllMessages.isEmpty)
                AllMessages = [
                  ["Messgae", "Time", "Duration"]
                ];
              AllMessages.sort((a, b) => b[1].compareTo(a[1]));
              AllMessages = AllMessages.reversed.toList();
            } catch (e) {
              AllMessages = [
                ["Messgae", "Time", "Duration"]
              ];
              print("listen map $e");
            }
          });
        },
      );
    } catch (e) {
      log("e $e");
    }
  }

  pick_file() async {
    File? file;
    FilePickerResult? result;
    String? name = '';
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false);
    if (result != null) {
      file = File(result.files.single.path!);
      name = result.files.first.name;
      print("#-file $file");
      return [file, name] as List<dynamic>;
    }
  }

  Future<List<dynamic>?> webPickFile() async {
    Uint8List? file;
    String? name;
    String? contentType;
    FilePickerResult? result;

    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null) {
      file = result.files.single.bytes;
      name = result.files.single.name;

      contentType = lookupMimeType(name);

      print('Selected file name: $name');
      print('Content Type: $contentType');

      return [
        [file, name, contentType]
      ] as List<dynamic>;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    late Widget SecondPageBody;
    if (BooksAreOpened) {
      print("===================================\nthird page");
      //third page
      Widget ThirdPageBackBotton = InkWell(
        onTap: () {
          setState(() {
            GradeIsOpened = true;
            BooksAreOpened = false;
          });
        },
        child: CMaker(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back),
        ),
      );
      Widget ThirdPageGradeWindow = Expanded(
        child: CMaker(
            alignment: Alignment.center,
            height: 60,
            circularRadius: 20,
            width: PageWidth(context) - 150,
            margin: const EdgeInsets.only(left: 20),
            color: const Color.fromARGB(255, 61, 197, 255),
            child: TMaker(
                text: widget.ListOfGrades[GradeOpenedIndex][0],
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      );
      Widget BooksAndFilesWindow = CMaker(
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(61, 0, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: .06)
        ],
        circularRadius: 20,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        color: const Color.fromARGB(255, 255, 255, 255),
        height: PageHeight(context) - 245,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            TMaker(
                text: "الكتب و الملفات",
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 0, 0)),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            CMaker(
              circularRadius: 20,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: PageHeight(context) - 400,
              child: ListView.builder(
                itemCount: Books_data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CMaker(
                        padding: const EdgeInsets.only(left: 20),
                        color: Colors.white,
                        border: Border.all(),
                        circularRadius: 15,
                        alignment: Alignment.centerLeft,
                        height: 100,
                        child: Row(
                          children: [
                            TMaker(
                                textAlign: TextAlign.start,
                                text:
                                    "${(Books_data[index][2].length > 10) ? Books_data[index][2].substring(0, 10) + "...." : Books_data[index][2]}",
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                            Expanded(child: Container()),
                            Column(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                MaterialButton(
                                  color: const Color.fromARGB(255, 54, 244, 92),
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          child: CMaker(
                                              height: 500,
                                              child: CMaker(
                                                  border: Border.all(width: .5),
                                                  alignment: Alignment.center,
                                                  circularRadius: 8,
                                                  color: const Color.fromARGB(
                                                      255, 217, 216, 216),
                                                  width:
                                                      (PageWidth(context) < 800)
                                                          ? double.infinity
                                                          : 600,
                                                  height: (PageHeight(context) -
                                                      420),
                                                  child: SfPdfViewer.network(
                                                      maxZoomLevel: 20,
                                                      "https://firebasestorage.googleapis.com/v0/b/rsa-app-3ec3f.appspot.com/o/Homeworks%2Fmy%20cv.pdf?alt=media&token=d53a8812-ca0a-4ac5-8d62-1ca8044db90e"))),
                                        );
                                      },
                                    );
                                  },
                                  child: TMaker(
                                      text: "فتح",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                MaterialButton(
                                  color: Colors.red,
                                  onPressed: () async {
                                    // delete
                                    PanaraInfoDialog.show(
                                      context,
                                      title: "تمهل",
                                      message: "هل تريد حذف هذا الملف؟",
                                      buttonText: "حذف",
                                      onTapDismiss: () async {
                                        print("book deleted");
                                        await dbService.FiDelete_books_file(
                                            widget.ListOfGrades[
                                                GradeOpenedIndex][0],
                                            TeacherData.SubjectThatIsSelected,
                                            Books_data[index][3]);
                                        books_load();
                                        Navigator.pop(context);
                                      },
                                      panaraDialogType:
                                          PanaraDialogType.warning,
                                      barrierDismissible: true,
                                    );
                                  },
                                  child: TMaker(
                                      text: "حذف",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(right: 10))
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                    ],
                  );
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            MaterialButton(
              height: 45,
              minWidth: 150,
              color: const Color.fromARGB(255, 54, 244, 92),
              onPressed: () async {
                var files;
                if (kIsWeb) {
                  print("Platform web");
                  files = await webPickFile();
                } else {
                  print("Platform notweb");
                  files = await pick_file();
                }
                if (files != null) {
                  List<dynamic>? fileLinks;
                  if (kIsWeb) {
                    log(files.toString());
                    // print([files]);
                    print("Platform web stBookStore  isweb: true");
                    fileLinks = await dbService.stBookStore(files);
                  } else {
                    fileLinks = await dbService.stBookStore([files]);
                  }

                  print("file_links $fileLinks");
                  try {
                    // print("widget.ListOfGrades[GradeOpenedIndex][0] ${widget.ListOfGrades[GradeOpenedIndex][0]}");
                    // print("TeacherData.SubjectThatIsSelected ${TeacherData.SubjectThatIsSelected}");
                    // print("fileLinks?[0] ${fileLinks?[0]}");
                    // // print("files ${files}");
                    // print("files?[1] ${files?[0][1]}");
                    await dbService.FiAdd_book_file(
                        widget.ListOfGrades[GradeOpenedIndex][0],
                        TeacherData.SubjectThatIsSelected,
                        fileLinks?[0],
                        files?[0][1]);
                    PanaraInfoDialog.show(
                      context,
                      title: "نجاح",
                      message: "تم اضافة الكتاب بنجاح",
                      buttonText: "تم",
                      onTapDismiss: () async {
                        Navigator.pop(context);
                        await books_load();
                      },
                      panaraDialogType: PanaraDialogType.warning,
                      barrierDismissible: false,
                    );
                  } catch (e) {
                    log("fileLinks0 ${e.toString()}");
                    PanaraInfoDialog.show(
                      context,
                      title: "خطأ",
                      message: "يوجد خطأ اثناء رفع الكتاب ",
                      buttonText: "تم",
                      onTapDismiss: () async {
                        Navigator.pop(context);
                        await books_load();
                      },
                      panaraDialogType: PanaraDialogType.error,
                      barrierDismissible: false,
                    );
                  }
                }
              },
              child: TMaker(
                  text: " (Only PDF) إضافة",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )
          ],
        ),
      );
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageBody = (BooksAreLoading)
              ? CMaker(
                  height: PageHeight(context) - 150,
                  width: double.infinity,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 36, 160, 209),
                  )),
                )
              : CMaker(
                  height: PageHeight(context) - 145,
                  width: PageWidth(context),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(children: [
                    Row(
                      children: [ThirdPageBackBotton, ThirdPageGradeWindow],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    BooksAndFilesWindow
                  ]));
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageBody = (BooksAreLoading)
              ? CMaker(
                  height: PageHeight(context) - 150,
                  width: double.infinity,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 36, 160, 209),
                  )),
                )
              : CMaker(
                  height: PageHeight(context) - 145,
                  width: PageWidth(context),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(children: [
                    Row(
                      children: [ThirdPageBackBotton, ThirdPageGradeWindow],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    BooksAndFilesWindow
                  ]));
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageBody = (BooksAreLoading)
              ? CMaker(
                  height: PageHeight(context) - 150,
                  width: double.infinity,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 36, 160, 209),
                  )),
                )
              : CMaker(
                  height: PageHeight(context) - 145,
                  width: PageWidth(context),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(children: [
                    Row(
                      children: [ThirdPageBackBotton, ThirdPageGradeWindow],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    BooksAndFilesWindow
                  ]));
        });
      }
    } else if (GradeIsOpened) {
      //الصفحه الثانيه
      Widget SecondPageArrowBack = InkWell(
        onTap: () {
          setState(() {
            GradeIsOpened = false;
          });
        },
        child: CMaker(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back),
        ),
      );
      Widget GradeName = Expanded(
        child: CMaker(
            alignment: Alignment.center,
            height: 60,
            circularRadius: 20,
            margin: const EdgeInsets.only(left: 20),
            color: const Color.fromARGB(255, 61, 197, 255),
            child: TMaker(
                text: widget.ListOfGrades[GradeOpenedIndex][0],
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      );
      Widget GoToBooksWindow = CMaker(
          //9
          alignment: Alignment.center,
          height: 60,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(42, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 20,
          width: PageWidth(context) - 60,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 20)),
              TMaker(
                  text: "الكتب و الملفات",
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0)),
              Expanded(child: Container()),
              Expanded(child: Container()),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  setState(() {
                    // open books button
                    books_load();
                    GradeIsOpened = false;
                    BooksAreOpened = true;
                  });
                },
                child: CMaker(
                  height: 40,
                  width: 70,
                  color: const Color.fromARGB(255, 54, 244, 92),
                  circularRadius: 20,
                  alignment: Alignment.center,
                  child: TMaker(
                      text: "فتح",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Expanded(child: Container()),
            ],
          ));
      Widget StudentsWindow = CMaker(
        alignment: Alignment.center,
        height: 280,
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(42, 0, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: .06)
        ],
        circularRadius: 20,
        width: PageWidth(context) - 60,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: CMaker(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: widget.ListOfGrades[GradeOpenedIndex][1].length,
              itemBuilder: (context, StudentIndex) {
                return Column(
                  children: [
                    ListTile(
                      leading: CMaker(
                          height: 70,
                          width: 70,
                          child: CircleAvatar(
                              backgroundImage: Image.network(
                                      widget.ListOfGrades[GradeOpenedIndex][1]
                                          [StudentIndex][2])
                                  .image)),
                      title: TMaker(
                        textAlign: TextAlign.start,
                        text:
                            '${widget.ListOfGrades[GradeOpenedIndex][1][StudentIndex][0]}',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                  ],
                );
              }),
        ),
      );
      Widget AllMessagesButton = CMaker(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () async {
                await regetmessages();
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      child: CMaker(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.topLeft,
                          height: 100.0 + ((AllMessages.length - 1) * 70.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(42, 0, 0, 0),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: .06)
                          ],
                          circularRadius: 20,
                          width: PageWidth(context) - 60,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: ListView.builder(
                              itemCount: AllMessages.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CMaker(
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      child: TMaker(
                                          textAlign: TextAlign.start,
                                          text: AllMessages[index][0],
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    CMaker(
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      child: TMaker(
                                          textAlign: TextAlign.start,
                                          text:
                                              "التاريخ : ${AllMessages[index][1]}",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                    )
                                  ],
                                );
                              })),
                    );
                  },
                );
              },
              child: const Text("كل الرسائل")));
      Widget LastMessageWindow = CMaker(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          height: 120,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(42, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 20,
          width: PageWidth(context) - 60,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            children: [
              CMaker(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: TMaker(
                    textAlign: TextAlign.start,
                    text: AllMessages[AllMessages.length - 1][0],
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              CMaker(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: TMaker(
                    textAlign: TextAlign.start,
                    text: "التاريخ : ${AllMessages[AllMessages.length - 1][1]}",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ));
      Widget EnterAMessage = CMaker(
          alignment: Alignment.center,
          height: 250,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(42, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 20,
          width: PageWidth(context) - 60,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 15),
                  child: TMaker(
                      textAlign: TextAlign.start,
                      text: "ارسل رسالة لكل الطلاب",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _MessageController,
                  minLines: 1,
                  maxLines: 3,
                  onChanged: (value) {
                    CurrentMessage = value;
                  },
                  decoration: InputDecoration(
                      suffix: InkWell(
                          onTap: () async {
                            if (CurrentMessage != "") {
                              print(
                                  "CurrentMessage !=  ${CurrentMessage != ""}");
                              //widget.ListOfGrades[GradeOpenedIndex][0]
                              //widget.ListOfGrades[GradeHomeWorkOppenedIndex][0]
                              print(
                                  "widget.ListOfGrades[GradeOpenedIndex][0] ${widget.ListOfGrades[GradeOpenedIndex][0]} ");
                              print(
                                  "TeacherData.SubjectThatIsSelected ${TeacherData.SubjectThatIsSelected} ");
                              // AllMessages.add([
                              //   CurrentMessage,
                              //   CurrentMessageTime,
                              //   TheMessageDuration
                              // ]);
                              //rePublicMessages_Send(String sub, String Grade,String messgae,String date,String duration)
                              await dbService.rePublicMessages_Send(
                                  TeacherData.SubjectThatIsSelected,
                                  widget.ListOfGrades[GradeOpenedIndex][0],
                                  CurrentMessage,
                                  CurrentMessageTime,
                                  TheMessageDuration,
                                  TeacherData.name);
                              CurrentMessage = "";
                              _MessageController.clear();
                              print("AllMessages ${AllMessages}");
                              setState(() {});
                            }
                          },
                          child: CMaker(
                              circularRadius: 10,
                              alignment: Alignment.center,
                              width: 50,
                              height: 35,
                              color: const Color.fromARGB(255, 61, 197, 255),
                              child: const Icon(
                                Icons.send,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(15)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(15)),
                      label: const Text(
                        "ادخل الرسالة",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    DropdownButton(
                      value: TheMessageDuration,
                      items: const [
                        DropdownMenuItem(
                          value: "for 24 hours",
                          child: Text("for 24 hours"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          TheMessageDuration = value!;
                        });
                      },
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              Expanded(child: Container()),
            ],
          ));
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageBody = CMaker(
            width: PageWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    SecondPageArrowBack,
                    GradeName,
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 30)),
                GoToBooksWindow,
                const Padding(padding: EdgeInsets.only(top: 30)),
                StudentsWindow,
                const Padding(padding: EdgeInsets.only(top: 20)),
                AllMessagesButton,
                LastMessageWindow,
                const Padding(padding: EdgeInsets.only(top: 20)),
                EnterAMessage,
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageBody = CMaker(
            width: PageWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    SecondPageArrowBack,
                    GradeName,
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 30)),
                GoToBooksWindow,
                const Padding(padding: EdgeInsets.only(top: 30)),
                StudentsWindow,
                const Padding(padding: EdgeInsets.only(top: 20)),
                AllMessagesButton,
                LastMessageWindow,
                const Padding(padding: EdgeInsets.only(top: 20)),
                EnterAMessage,
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageBody = CMaker(
            width: PageWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: (PageWidth(context) > 900)
                ? Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          SecondPageArrowBack,
                          GradeName,
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 30)),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(
                              flex: 6,
                              child: CMaker(
                                  height: PageHeight(context) - 220,
                                  child: ListView(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 30)),
                                      CMaker(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        alignment: Alignment.centerLeft,
                                        child: GoToBooksWindow,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 20)),
                                      CMaker(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          alignment: Alignment.centerLeft,
                                          child: StudentsWindow),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 20)),
                                    ],
                                  ))),
                          Expanded(child: Container()),
                          Expanded(
                            flex: 6,
                            child: CMaker(
                              height: PageHeight(context) - 220,
                              child: ListView(
                                children: [
                                  CMaker(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    alignment: Alignment.centerLeft,
                                    child: AllMessagesButton,
                                  ),
                                  CMaker(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    alignment: Alignment.centerLeft,
                                    child: LastMessageWindow,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  CMaker(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    alignment: Alignment.centerLeft,
                                    child: EnterAMessage,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          SecondPageArrowBack,
                          GradeName,
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 30)),
                      GoToBooksWindow,
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      StudentsWindow,
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      AllMessagesButton,
                      LastMessageWindow,
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      EnterAMessage,
                      const Padding(padding: EdgeInsets.only(top: 20)),
                    ],
                  ),
          );
        });
      }
    } else {
      //الصفحه الاولى
      Widget GradesList = ListView.builder(
          itemCount: widget.ListOfGrades.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CMaker(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      height: (() {
                        try {
                          return widget.ListOfGrades[index][1][0].length *
                              100.0;
                        } catch (e) {
                          return 2.0 * 100.0;
                        }
                      }()),
                      width: double.infinity,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(70, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            spreadRadius: .06)
                      ],
                      circularRadius: 20,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          CMaker(
                              alignment: Alignment.center,
                              height: 60,
                              circularRadius: 10,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  TMaker(
                                      text:
                                          "${widget.ListOfGrades[index][0]} - ${TeacherData.SubjectThatIsSelected}",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                  Expanded(flex: 10, child: Container()),
                                  InkWell(
                                    onTap: () async {
                                      GradeIsOpened = true;
                                      GradeOpenedIndex = index;
                                      await regetmessages();
                                      setState(() {});
                                    },
                                    child: CMaker(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      color: const Color.fromARGB(
                                          255, 54, 244, 92),
                                      circularRadius: 20,
                                      child: TMaker(
                                          text: "فتح",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                ],
                              )),
                          const Padding(padding: EdgeInsets.only(bottom: 30)),
                          Expanded(
                            child: (!(widget.ListOfGrades[index][1].length ==
                                    0))
                                ? ListView.builder(
                                    itemCount:
                                        widget.ListOfGrades[index][1].length,
                                    itemBuilder: (context, StudentIndex) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            leading: CMaker(
                                                height: 70,
                                                width: 70,
                                                child: CircleAvatar(
                                                    backgroundImage: Image.network(
                                                            widget.ListOfGrades[
                                                                    index][1][
                                                                StudentIndex][2])
                                                        .image)),
                                            title: TMaker(
                                              textAlign: TextAlign.start,
                                              text: widget.ListOfGrades[index]
                                                      [1][StudentIndex][0]
                                                  .toString(),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0),
                                            ),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                          ),
                                        ],
                                      );
                                    })
                                : const Text(
                                    "لا يوجد طلاب مضافة",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                          ),
                        ],
                      )),
                ],
              ),
            );
          });
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageBody = CMaker(
              height: PageHeight(context) - 165,
              width: PageWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GradesList);
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageBody = CMaker(
              height: PageHeight(context) - 145,
              width: PageWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GradesList);
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageBody = CMaker(
              height: PageHeight(context) - 110,
              width: PageWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GradesList);
        });
      }
    }
    return SecondPageBody;
  }
}
