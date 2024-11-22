import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/Page.dart';
import 'package:flutter/material.dart';


class SendSolutionButton extends StatelessWidget {
  const SendSolutionButton({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          if (ScoreKey.currentState!.validate()) {
            ScoreKey.currentState!.save();
            print("/tاضف درجة");
            print(await dbService.FiAdd_score_and_comment(
                Grade_selected,
                TeacherData.SubjectThatIsSelected,
                solved_hw_student[HomeworkSelected][0], // hw id
                student_selected_list[1], // st id
                TeacherComment,
                GrantedScore));
            TeacherFunctions(
              SetStateCallback: () => Refresh!(),
            ).solved_hw_student_re();
            ViewSentSolution = false;
            OneStudentHomeWorks = true;
            Refresh!();
          }
        },
        child: CMaker(
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            circularRadius: 20,
            child: CMaker(
              width: 80,
              padding: const EdgeInsets.all(10),
              circularRadius: 20,
              color: const Color.fromARGB(255, 22, 177, 255),
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 30,
              ),
            )));
  }
}
