import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/Data/StudentData/StudentData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/Other/StudentAppBar.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/BookIsOpened/contents/BookView.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/BookIsOpened/contents/DownloadBook.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/SubjectSelectedImage.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/SubjectSelectedName.dart';
import 'package:flutter/material.dart';
class BookIsOpened extends StatefulWidget {
  const BookIsOpened({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  State<BookIsOpened> createState() => _BookIsOpenedState();
}

class _BookIsOpenedState extends State<BookIsOpened> {
  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
          return Column(
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
                      IconButton(
          onPressed: () async {
            List<List<dynamic>> records_ = await dbService.fiRead_Books(
                StudentData.grade,
                "${GradesAndsubjects.Subjects[GradesAndsubjects.GradesSubjects[StudentData.grade][0]][1]}");

              anySubjectSelected = false;
              OpenBooks = true;
              OpenBook = false;
              all_books = records_;
              // log(all_books.toString());
          widget.Refresh!();
          },
          icon: const Icon(Icons.arrow_back)),
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
                  padding: const EdgeInsets.all(15.0), child: DownloadBook()),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: BookView())
            ],
          );
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
          return Column(
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
                      IconButton(
          onPressed: () async {
            List<List<dynamic>> records_ = await dbService.fiRead_Books(
                StudentData.grade,
                "${GradesAndsubjects.Subjects[GradesAndsubjects.GradesSubjects[StudentData.grade][0]][1]}");

              anySubjectSelected = false;
              OpenBooks = true;
              OpenBook = false;
              all_books = records_;
              // log(all_books.toString());
          widget.Refresh!();
          },
          icon: const Icon(Icons.arrow_back)),
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
                  padding: const EdgeInsets.all(15.0), child: DownloadBook()),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: BookView())
            ],
          );
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
          return Expanded(
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
                          IconButton(
          onPressed: () async {
            List<List<dynamic>> records_ = await dbService.fiRead_Books(
                StudentData.grade,
                "${GradesAndsubjects.Subjects[GradesAndsubjects.GradesSubjects[StudentData.grade][0]][1]}");

              anySubjectSelected = false;
              OpenBooks = true;
              OpenBook = false;
              all_books = records_;
              // log(all_books.toString());
          widget.Refresh!();
          },
          icon: const Icon(Icons.arrow_back)),
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
                      child: DownloadBook()),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: BookView())
                ],
              ),
            ),
          );
      }else {
      //later on we can use this for reloading
      return Container();
    }
  }
}