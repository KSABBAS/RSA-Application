import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/Other/StudentAppBar.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/AllBooksPage/contents/PressableBooks.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/SubjectSelectedImage.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/WhenASubjectIsSelected/contents/SubjectSelectedName.dart';
import 'package:flutter/material.dart';

class AllBooksPage extends StatefulWidget {
  const AllBooksPage({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  State<AllBooksPage> createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {
  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      return Column(
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
                  IconButton(
                      onPressed: () {
                        anySubjectSelected = true;
                        OpenBooks = false;
                        OpenBook = false;
                        widget.Refresh!();
                      },
                      icon: const Icon(Icons.arrow_back)),
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
              alignment: Alignment.center,
              height: 70,
              child: TMaker(
                  text: "اضغط على الكتاب للعرض",
                  fontSize: (PageWidth(context) < 550)
                      ? 20
                      : (PageHeight(context) < 900)
                          ? 30
                          : 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          SizedBox(height: PageHeight(context) - (320), child: PressableBooks(Refresh:() {
            widget.Refresh!();
          },))
        ],
      );
    }
    if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      return Column(
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
                  IconButton(
                      onPressed: () {
                        anySubjectSelected = true;
                        OpenBooks = false;
                        OpenBook = false;
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
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          CMaker(
              alignment: Alignment.center,
              height: 70,
              child: TMaker(
                  text: "اضغط على الكتاب للعرض",
                  fontSize: (PageWidth(context) < 550)
                      ? 20
                      : (PageHeight(context) < 900)
                          ? 30
                          : 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          SizedBox(height: PageHeight(context) - (320), child: PressableBooks(Refresh:() {
            widget.Refresh!();
          },))
        ],
      );
    }
    if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return Expanded(
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
                      IconButton(
                          onPressed: () {
                            anySubjectSelected = true;
                            OpenBooks = false;
                            OpenBook = false;
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
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                  alignment: Alignment.center,
                  height: 70,
                  child: TMaker(
                      text: "اضغط على الكتاب للعرض",
                      fontSize: (PageWidth(context) < 550)
                          ? 20
                          : (PageHeight(context) < 900)
                              ? 30
                              : 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              SizedBox(
                  height: PageHeight(context) - (250), child: PressableBooks(Refresh:() {
                              widget.Refresh!();
                            },))
            ],
          ),
        ),
      );
    } else {
      //later on we can use this for reloading
      return Container();
    }
  }
}
