import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/contents/AllBooksPage/contents/BooksAndFilesWindow.dart';
import 'package:flutter/material.dart';

class AllBooksPage extends StatelessWidget {
  const AllBooksPage({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      return (BooksAreLoading)
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
                  children: [
                    InkWell(
                      onTap: () {
                        GradeIsOpened = true;
                        BooksAreOpened = false;
                        Refresh!();
                      },
                      child: CMaker(
                        width: 70,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Expanded(
        child: CMaker(
            alignment: Alignment.center,
            height: 60,
            circularRadius: 20,
            width: PageWidth(context) - 150,
            margin: const EdgeInsets.only(left: 20),
            color: const Color.fromARGB(255, 61, 197, 255),
            child: TMaker(
                text: TeacherData.ListOfGrades[GradeOpenedIndex][0],
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                BooksAndFilesWindow(Refresh: () {
                  Refresh!();
                },)
              ]));
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      return (BooksAreLoading)
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
                  children: [
                    InkWell(
                      onTap: () {
                        GradeIsOpened = true;
                        BooksAreOpened = false;
                        Refresh!();
                      },
                      child: CMaker(
                        width: 70,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Expanded(
        child: CMaker(
            alignment: Alignment.center,
            height: 60,
            circularRadius: 20,
            width: PageWidth(context) - 150,
            margin: const EdgeInsets.only(left: 20),
            color: const Color.fromARGB(255, 61, 197, 255),
            child: TMaker(
                text: TeacherData.ListOfGrades[GradeOpenedIndex][0],
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                BooksAndFilesWindow(Refresh: () {
                  Refresh!();
                },)
              ]));
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return (BooksAreLoading)
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
                  children: [
                    InkWell(
                      onTap: () {
                        GradeIsOpened = true;
                        BooksAreOpened = false;
                        Refresh!();
                      },
                      child: CMaker(
                        width: 70,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Expanded(
        child: CMaker(
            alignment: Alignment.center,
            height: 60,
            circularRadius: 20,
            width: PageWidth(context) - 150,
            margin: const EdgeInsets.only(left: 20),
            color: const Color.fromARGB(255, 61, 197, 255),
            child: TMaker(
                text: TeacherData.ListOfGrades[GradeOpenedIndex][0],
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                BooksAndFilesWindow(Refresh: () {
                  Refresh!();
                },)
              ]));
    } else {
      return Container();
    }
  }
}
