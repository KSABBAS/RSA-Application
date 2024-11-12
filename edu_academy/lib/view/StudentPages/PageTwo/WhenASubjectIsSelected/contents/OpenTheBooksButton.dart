import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/Data/StudentData/StudentData.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/SecondPageContents.dart';
import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class OpenTheBooksButton extends StatelessWidget {
  const OpenTheBooksButton({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        OverlayLoadingProgress.start(
          context,
          widget: CMaker(
            circularRadius: 15,
            color: const Color.fromARGB(198, 255, 255, 255),
            width: MediaQuery.of(context).size.width / 3.6,
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 13),
            child: const AspectRatio(
              aspectRatio: 1,
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 36, 160, 209),
              ),
            ),
          ),
        );
        List<List<dynamic>> records_ = await dbService.fiRead_Books(
            StudentData.grade,
            "${GradesAndsubjects.Subjects[SubjectSelected][1]}");
        OverlayLoadingProgress.stop();
        OpenBooks = true;
        anySubjectSelected = false;
        all_books = records_;
        Refresh!();
      },
      child: CMaker(
        circularRadius: 15,
        alignment: Alignment.center,
        width: 55,
        height: 35,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: TMaker(
            text: "فتح",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
    );
  }
}
