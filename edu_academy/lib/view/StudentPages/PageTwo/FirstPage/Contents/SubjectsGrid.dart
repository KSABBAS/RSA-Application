import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/Data/StudentData/StudentData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class SubjectsGrid extends StatefulWidget {
  const SubjectsGrid({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  State<SubjectsGrid> createState() => _SubjectsGridState();
}

class _SubjectsGridState extends State<SubjectsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: (GradesAndsubjects.GradesSubjects[StudentData.grade]
                as List<dynamic>)
            .length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (PageWidth(context) < 550)
                ? 2
                : (PageHeight(context) >= 900)
                    ? 3
                    : (PageWidth(context) > 550 && PageWidth(context) < 700)
                        ? 2
                        : (PageWidth(context) >= 700 &&
                                PageWidth(context) < 900)
                            ? 3
                            : (PageWidth(context) >= 900 &&
                                    PageWidth(context) < 1200)
                                ? 4
                                : 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              OverlayLoadingProgress.start(
                context,
                widget: CMaker(
                  circularRadius: 15,
                  color: const Color.fromARGB(198, 255, 255, 255),
                  width: MediaQuery.of(context).size.width / 3.6,
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 13),
                  child: const AspectRatio(
                    aspectRatio: 1,
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 36, 160, 209),
                    ),
                  ),
                ),
              );
              List<List<dynamic>> records = await dbService.fiRead_Records(
                  StudentData.grade,
                  "${GradesAndsubjects.Subjects[GradesAndsubjects.GradesSubjects[StudentData.grade][index]][1]}");
              OverlayLoadingProgress.stop();
              SubjectSelected =
                  GradesAndsubjects.GradesSubjects[StudentData.grade][index];
              anySubjectSelected = true;
              all_rec = records;
              widget.Refresh!();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      GradesAndsubjects.SubjectsColors[GradesAndsubjects
                          .GradesSubjects[StudentData.grade][index]][0],
                      GradesAndsubjects.SubjectsColors[GradesAndsubjects
                          .GradesSubjects[StudentData.grade][index]][1],
                    ]),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${GradesAndsubjects.Subjects[GradesAndsubjects.GradesSubjects[StudentData.grade][index]][1]}",
                      style: TextStyle(
                          fontSize: (PageWidth(context) < 550)
                              ? 17
                              : (PageHeight(context) < 900)
                                  ? 20
                                  : 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Image.network(GradesAndsubjects.Subjects[
                            GradesAndsubjects.GradesSubjects[StudentData.grade]
                                [index]][0])),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
