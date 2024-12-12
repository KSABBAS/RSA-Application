import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/ViewSentSolution/contents/AddComment.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/ViewSentSolution/contents/AddScore.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/ViewSentSolution/contents/Answer/Images.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/ViewSentSolution/contents/Answer/Title.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/ViewSentSolution/contents/Homework/HomeworkBody.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/ViewSentSolution/contents/Homework/HomeworkImages.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/ViewSentSolution/contents/Homework/HomeworkTitle.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/ViewSentSolution/contents/SendButton.dart';
import 'package:flutter/material.dart';

class SentSolutionView extends StatelessWidget {
  const SentSolutionView({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      return CMaker(
        height: PageHeight(context) - 170,
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            InkWell(
                onTap: () {
                  ViewSentSolution = false;
                  OneStudentHomeWorks = true;
                  Refresh!();
                },
                child: CMaker(
                    margin: const EdgeInsets.only(left: 20),
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    circularRadius: 20,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28,
                    ))),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 6,
                      spreadRadius: .03,
                      color: Color.fromARGB(58, 0, 0, 0)),
                ],
                circularRadius: 15,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 420,
                color: Colors.white,
                width: double.infinity,
                child: ListView(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    TMaker(
                        text: "واجب",
                        fontSize: (PageWidth(context) < 550)
                            ? 30
                            : (PageHeight(context) < 900)
                                ? 35
                                : 35,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(
                        height: 100,
                        alignment: Alignment.center,
                        child: ThirdPageHomeworkTitle()),
                    ThirdPageHomeworkBody(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    HomeworkImages(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    TMaker(
                        text: "حل الطالب",
                        fontSize: (PageWidth(context) < 550)
                            ? 30
                            : (PageHeight(context) < 900)
                                ? 35
                                : 35,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: HomeworkAnswerTitle()),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    HomeworkAnswerImages(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                  ],
                )),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              circularRadius: 20,
              color: const Color.fromARGB(255, 36, 160, 209),
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CMaker(
                        padding: const EdgeInsets.all(10),
                        circularRadius: 30,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: AddComment(),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          AddScore(),
                          Expanded(child: Container()),
                          SendSolutionButton(Refresh: () {
                            Refresh!();
                          }),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                        ],
                      )),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
          ],
        ),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      return CMaker(
        height: PageHeight(context) - 170,
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            InkWell(
                onTap: () {
                  ViewSentSolution = false;
                  OneStudentHomeWorks = true;
                  Refresh!();
                },
                child: CMaker(
                    margin: const EdgeInsets.only(left: 20),
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    circularRadius: 20,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28,
                    ))),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 6,
                      spreadRadius: .03,
                      color: Color.fromARGB(58, 0, 0, 0)),
                ],
                circularRadius: 15,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 420,
                color: Colors.white,
                width: double.infinity,
                child: ListView(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    TMaker(
                        text: "واجب",
                        fontSize: (PageWidth(context) < 550)
                            ? 30
                            : (PageHeight(context) < 900)
                                ? 35
                                : 35,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(
                        height: 100,
                        alignment: Alignment.center,
                        child: ThirdPageHomeworkTitle()),
                    ThirdPageHomeworkBody(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    HomeworkImages(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    TMaker(
                        text: "حل الطالب",
                        fontSize: (PageWidth(context) < 550)
                            ? 30
                            : (PageHeight(context) < 900)
                                ? 35
                                : 35,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: HomeworkAnswerTitle()),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    HomeworkAnswerImages(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                  ],
                )),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              circularRadius: 20,
              color: const Color.fromARGB(255, 36, 160, 209),
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CMaker(
                        padding: const EdgeInsets.all(10),
                        circularRadius: 30,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: AddComment(),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          AddScore(),
                          Expanded(child: Container()),
                          SendSolutionButton(Refresh: () {
                            Refresh!();
                          }),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                        ],
                      )),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
          ],
        ),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return CMaker(
        height: PageHeight(context) - 170,
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            InkWell(
                onTap: () {
                  ViewSentSolution = false;
                  OneStudentHomeWorks = true;
                  Refresh!();
                },
                child: CMaker(
                    margin: const EdgeInsets.only(left: 20),
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    circularRadius: 20,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28,
                    ))),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 6,
                      spreadRadius: .03,
                      color: Color.fromARGB(58, 0, 0, 0)),
                ],
                circularRadius: 15,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 420,
                color: Colors.white,
                width: double.infinity,
                child: ListView(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    TMaker(
                        text: "الواجب",
                        fontSize: (PageWidth(context) < 550)
                            ? 30
                            : (PageHeight(context) < 900)
                                ? 35
                                : 35,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(
                        height: 100,
                        alignment: Alignment.center,
                        child: ThirdPageHomeworkTitle()),
                    ThirdPageHomeworkBody(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    HomeworkImages(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                  ],
                )),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 6,
                      spreadRadius: .03,
                      color: Color.fromARGB(58, 0, 0, 0)),
                ],
                circularRadius: 15,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 420,
                color: Colors.white,
                width: double.infinity,
                child: ListView(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    TMaker(
                        text: "حل الطالب",
                        fontSize: (PageWidth(context) < 550)
                            ? 30
                            : (PageHeight(context) < 900)
                                ? 35
                                : 35,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    CMaker(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: HomeworkAnswerTitle()),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    HomeworkAnswerImages(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                  ],
                )),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              circularRadius: 20,
              color: const Color.fromARGB(255, 36, 160, 209),
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CMaker(
                        padding: const EdgeInsets.all(10),
                        circularRadius: 30,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: AddComment(),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          AddScore(),
                          Expanded(child: Container()),
                          SendSolutionButton(Refresh: () {
                            Refresh!();
                          }),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                        ],
                      )),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
