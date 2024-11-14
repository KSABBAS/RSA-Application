import 'dart:developer';
import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/AllGrades/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/OneGradeOpened/Page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

bool GradeIsOpened = false;
bool BooksAreOpened = false;
int GradeOpenedIndex = 0;
String TheMessageDuration = "for 24 hours";
String CurrentMessage = "";
String CurrentMessageTime = DateFormat('MMMM dd, HH:mm').format(DateTime.now());
List<List<dynamic>> Books_data = [];
class TeacherSecondPageContents extends StatefulWidget {
  TeacherSecondPageContents(
      {super.key, required this.ListOfGrades, required this.SubjectName,required this.Refresh});
  final Function()? Refresh;
  List ListOfGrades;
  String SubjectName;
Object? realTimeValues;
  @override
  State<TeacherSecondPageContents> createState() =>
      _TeacherSecondPageContentsState();
}


  late bool BooksAreLoading = true;
class _TeacherSecondPageContentsState extends State<TeacherSecondPageContents> {
  final dbService = DatabaseService();
  late Future<void> _dataFuture;

  @override
  void initState() {
    super.initState();
    // regetmessages();
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
                                        TeacherFunctions(SetStateCallback:() => setState(() {
                                        }),).books_load();
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
                  files = await TeacherFunctions(SetStateCallback: () => setState(() {}),).webPickFile();
                } else {
                  print("Platform notweb");
                  files = await TeacherFunctions(SetStateCallback: () => setState(() {}),).pick_file();
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
                        await TeacherFunctions(SetStateCallback: () => setState(() {}),).books_load();
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
                        await TeacherFunctions(SetStateCallback: () => setState(() {}),).books_load();
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
      return OneGradeIsOpended(Refresh:() {
        widget.Refresh!();
      },);
    } else {
      //الصفحه الاولى
      return AllGrades(Refresh: () {
        widget.Refresh!();
      },);
    }
    return SecondPageBody;
  }
}