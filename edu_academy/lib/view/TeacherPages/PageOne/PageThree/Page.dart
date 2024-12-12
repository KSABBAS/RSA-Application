import 'dart:io';

import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/AllGrades/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/AllHomeworks/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/NewHomework/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/OneGradeIsOpened/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/OneGradeIsOpened/contents/GradeTitle.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/OneHomeworkOpened/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/OneSutdentHomework/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/ViewSentSolution/Page.dart';
import 'package:edu_academy/view/TeacherPages/TeacherMainPage.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TeacherThirdPageContents extends StatefulWidget {
  TeacherThirdPageContents(
      {super.key, required this.ListOfGrades, required this.SubjectName});
  List ListOfGrades;
  String SubjectName;
  @override
  State<TeacherThirdPageContents> createState() =>
      _TeacherThirdPageContentsState();
}

bool GradeHomeWorkIsOppened = false;
int GradeHomeWorkOppenedIndex = 0;
bool NewHomeWork = false;
GlobalKey<FormState> HomeworkKey = GlobalKey();
GlobalKey<FormState> ScoreKey = GlobalKey();
bool AllhomeWorks = false;
bool OneStudentHomeWorks = false;
bool AllHomeworksAndOneIsOpened = false;
int IsOpendIndex = 0;
String Grade_selected = '';

int HomeWorkIndex = 0;
int HomeworkSelected = 0;
String HomeworkSelectedState = "";
bool ViewSentSolution = false;
String GrantedScore = "";
String TeacherComment = "";
List student_selected_list = [];
List<dynamic> solved_hw_student = [];

late bool OneStudentHomeWorksIsLoading;
late bool AllHomeWorksLoading;

final dbService = DatabaseService();

class _TeacherThirdPageContentsState extends State<TeacherThirdPageContents> {
  @override
  Widget build(BuildContext context) {
    late Widget ThirdPageBody;
    if (AllHomeworksAndOneIsOpened) {
      // third page
      return OneHomeworkOpened(
        Refresh: () {
          setState(() {});
        },
      );
    } else if (AllhomeWorks) {
      return AllHomeworks(Refresh: () {
        setState(() {});
      });
    } else if (NewHomeWork) {
      return NewHomework(Refresh: () {
        setState(() {});
      });
    } else if (ViewSentSolution) {
      return SentSolutionView(
        Refresh: () {
          setState(() {});
        },
      );
    } else if (OneStudentHomeWorks) {
      // Student homeworks
      return OneStudentHomework(Refresh: () {
        setState(() {});
      });
    } else if (GradeHomeWorkIsOppened) {
      // الصفحه الثانية
      return OneGradeHomeworkIsOpened(Refresh: () {
        setState(() {});
      });
    } else {
      // الصفحة الاولى
      return ThirdPageAllGrades(Refresh: () {
        setState(() {});
      });
    }
  }
}
