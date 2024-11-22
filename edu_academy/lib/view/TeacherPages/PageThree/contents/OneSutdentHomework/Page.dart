import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/OneSutdentHomework/contents/HomeworksBuilder.dart';
import 'package:flutter/material.dart';

class OneStudentHomework extends StatelessWidget {
  const OneStudentHomework({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      return (OneStudentHomeWorksIsLoading)
          ? CMaker(
              height: PageHeight(context) - 150,
              width: double.infinity,
              child: const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 36, 160, 209),
              )),
            )
          : CMaker(
              height: PageHeight(context) - 170,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        OneStudentHomeWorks = false;
                        GradeHomeWorkIsOppened = true;
                        OneStudentHomeWorksIsLoading = false;
                        Refresh!();
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(flex: 13, child: HomeworksBuilder(Refresh: (){Refresh!();}))
                ],
              ),
            );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      return (OneStudentHomeWorksIsLoading)
          ? CMaker(
              height: PageHeight(context) - 150,
              width: double.infinity,
              child: const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 36, 160, 209),
              )),
            )
          : CMaker(
              height: PageHeight(context) - 170,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        OneStudentHomeWorks = false;
                        GradeHomeWorkIsOppened = true;
                        OneStudentHomeWorksIsLoading = false;
                        Refresh!();
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(flex: 13, child: HomeworksBuilder(Refresh: (){Refresh!();}))
                ],
              ),
            );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return (OneStudentHomeWorksIsLoading)
          ? CMaker(
              height: PageHeight(context) - 150,
              width: double.infinity,
              child: const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 36, 160, 209),
              )),
            )
          : CMaker(
              height: PageHeight(context) - 170,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                      onTap: () {
                        OneStudentHomeWorks = false;
                        GradeHomeWorkIsOppened = true;
                        OneStudentHomeWorksIsLoading = false;
                        Refresh!();
                      },
                      child: CMaker(
                          margin: const EdgeInsets.only(left: 15),
                          height: 30,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          circularRadius: 20,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                          ))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(flex: 13, child: HomeworksBuilder(Refresh: (){Refresh!();}))
                ],
              ),
            );
    } else {
      return Container();
    }
  }
}
