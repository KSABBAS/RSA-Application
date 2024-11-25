import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/NewHomework/contents/AddImageToHomework.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/NewHomework/contents/BodyTFF.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/NewHomework/contents/HomeWorkFinalLook.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/NewHomework/contents/ScoreTFF.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/NewHomework/contents/SendHomeworkButton.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/NewHomework/contents/TitleTFF.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/OneGradeIsOpened/contents/GradeTitle.dart';
import 'package:flutter/material.dart';

String HomeworkTitle = "";
String HomeworkBody = "";
List<dynamic> HomeworkImagesLinks = [];
String score = '0';
class NewHomework extends StatelessWidget {
  const NewHomework({super.key, required this.Refresh});
  final Function()? Refresh;
  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
        return Form(
          key: HomeworkKey,
          child: CMaker(
            height: PageHeight(context) - 180,
            child: ListView(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [InkWell(
        onTap: () {
            GradeHomeWorkIsOppened = true;
            NewHomeWork = false;
          Refresh!();
        },
        child: CMaker(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back),
        ),
      ), GradeTitle()],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                TitleTFF(Refresh: (){Refresh!();},),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                BodyTFF(Refresh:(){Refresh!();}),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                ScoreTFF(Refresh:(){Refresh!();}),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                AddImageToHomework(Refresh: () {Refresh!();},),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                CMaker(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CMaker(
                        width: 140,
                        height: 70,
                        alignment: Alignment.bottomCenter,
                        child: TMaker(
                            text: "شكل الواجب النهائي",
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.black))),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                CMaker(
                    width: double.infinity,
                    height: 200,
                    child: CMaker(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(61, 0, 0, 0),
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              spreadRadius: .06)
                        ],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 15,
                        padding: const EdgeInsets.all(15),
                        child: HomeWorkFinalLook(Refresh:(){Refresh!();}))),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                CMaker(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CMaker(width: 80, child: SendHomeworkButton(Refresh:(){Refresh!();}))),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          ),
        );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        return Form(
          key: HomeworkKey,
          child: CMaker(
            height: PageHeight(context) - 180,
            child: ListView(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [InkWell(
        onTap: () {
            GradeHomeWorkIsOppened = true;
            NewHomeWork = false;
          Refresh!();
        },
        child: CMaker(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back),
        ),
      ), GradeTitle()],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                TitleTFF(Refresh: (){Refresh!();},),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                BodyTFF(Refresh:(){Refresh!();}),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                ScoreTFF(Refresh:(){Refresh!();}),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                AddImageToHomework(Refresh: () {Refresh!();},),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                CMaker(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CMaker(
                        width: 140,
                        height: 70,
                        alignment: Alignment.bottomCenter,
                        child: TMaker(
                            text: "شكل الواجب النهائي",
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.black))),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                CMaker(
                    width: double.infinity,
                    height: 300,
                    child: CMaker(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(61, 0, 0, 0),
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              spreadRadius: .06)
                        ],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        circularRadius: 15,
                        padding: const EdgeInsets.all(15),
                        child: HomeWorkFinalLook(Refresh:(){Refresh!();}))),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                CMaker(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CMaker(width: 80, child: SendHomeworkButton(Refresh:(){Refresh!();}))),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          ),
        );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        return Form(
          key: HomeworkKey,
          child: CMaker(
              height: PageHeight(context) - 180,
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    children: [InkWell(
        onTap: () {
            GradeHomeWorkIsOppened = true;
            NewHomeWork = false;
          Refresh!();
        },
        child: CMaker(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back),
        ),
      ), GradeTitle()],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  TitleTFF(Refresh: (){Refresh!();},),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  BodyTFF(Refresh:(){Refresh!();}),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ScoreTFF(Refresh:(){Refresh!();}),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  AddImageToHomework(Refresh: () {Refresh!();},),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: CMaker(
                          width: 140,
                          height: 70,
                          alignment: Alignment.bottomCenter,
                          child: TMaker(
                              text: "شكل الواجب النهائي",
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      height: 200,
                      child: CMaker(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(61, 0, 0, 0),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: .06)
                          ],
                          color: const Color.fromARGB(255, 255, 255, 255),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          circularRadius: 15,
                          padding: const EdgeInsets.all(15),
                          child: HomeWorkFinalLook(Refresh:(){Refresh!();}))),
                  //   (PageWidth(context) < 900)
                  //       ? Column(
                  //           children: [
                  //             TitleTFF(Refresh: (){Refresh!();},),
                  //             const Padding(
                  //                 padding: EdgeInsets.only(bottom: 20)),
                  //             BodyTFF(Refresh:(){Refresh!();}),
                  //             const Padding(
                  //                 padding: EdgeInsets.only(bottom: 20)),
                  //             ScoreTFF(Refresh:(){Refresh!();}),
                  //             const Padding(
                  //                 padding: EdgeInsets.only(bottom: 20)),
                  //             AddImageToHomework(Refresh: () {Refresh!();},),
                  //             const Padding(
                  //                 padding: EdgeInsets.only(bottom: 20)),
                  //                 CMaker(width: double.infinity,alignment: Alignment.center,child: CMaker(width: 140,height: 70,alignment: Alignment.bottomCenter,child: TMaker(text: "Final Look", fontSize: 28, fontWeight:FontWeight.w700, color:Colors.black))),
                  // const Padding(padding: EdgeInsets.only(bottom: 20)),
                  //             HomeWorkFinalLook(Refresh:(){Refresh!();}),
                  //           ],
                  //         )
                  //       :
                  // Row(
                  //           children: [
                  //             CMaker(width: double.infinity,alignment: Alignment.center,child: CMaker(width: 140,height: 70,alignment: Alignment.bottomCenter,child: TMaker(text: "Final Look", fontSize: 28, fontWeight:FontWeight.w700, color:Colors.black))),
                  // const Padding(padding: EdgeInsets.only(bottom: 20)),
                  //             Expanded(
                  //               flex: 10,
                  //               child: CMaker(
                  //                   height: 400,
                  //                   child: CMaker(
                  //                       boxShadow: const [
                  //                         BoxShadow(
                  //                             color:
                  //                                 Color.fromARGB(61, 0, 0, 0),
                  //                             offset: Offset(2, 2),
                  //                             blurRadius: 10,
                  //                             spreadRadius: .06)
                  //                       ],
                  //                       color: const Color.fromARGB(
                  //                           255, 255, 255, 255),
                  //                       alignment: Alignment.center,
                  //                       margin: const EdgeInsets.symmetric(
                  //                           horizontal: 20),
                  //                       circularRadius: 15,
                  //                       padding: const EdgeInsets.all(15),
                  //                       child: HomeWorkFinalLook(Refresh:(){Refresh!();}))),
                  //             ),
                  //             Expanded(child: Container()),
                  //             Expanded(
                  //               flex: 10,
                  //               child: CMaker(
                  //                 height: PageHeight(context) - 200,
                  //                 child: ListView(children: [
                  //                   TitleTFF(Refresh: (){Refresh!();},),
                  //                   const Padding(
                  //                       padding: EdgeInsets.only(bottom: 20)),
                  //                   BodyTFF(Refresh:(){Refresh!();}),
                  //                   const Padding(
                  //                       padding: EdgeInsets.only(bottom: 20)),
                  //                   AddImageToHomework(Refresh: () {Refresh!();},),
                  //                 ]),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: SendHomeworkButton(Refresh:(){Refresh!();})),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              )),
        );
    } else {
      return Container();
    }
  }
}
