import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/Data/StudentData/StudentData.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/StudentPages/Other/StudentAppBar.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/AllBooksPage/Page.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/BookIsOpened/Page.dart';
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (OpenBook) {
      //Fourth
      return BookIsOpened(
        Refresh: () {
          setState(() {});
        },
      );
    } else if (OpenBooks) {
      // third
      return AllBooksPage(
        Refresh: () {
          setState(() {});
        },
      );
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
  }
}
