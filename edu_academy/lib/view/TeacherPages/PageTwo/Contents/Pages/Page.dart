import 'dart:developer';
import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/AllGrades/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/AllBooksPage/Page.dart';
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
  final dbService = DatabaseService();
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
  late Future<void> _dataFuture;

  @override
  void initState() {
    super.initState();
    // regetmessages();
  }


  @override
  Widget build(BuildContext context) {
    if (BooksAreOpened) {
      print("===================================\nthird page");
      //third page
      return AllBooksPage(Refresh:() {
        widget.Refresh!();
      },);
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
  }
}