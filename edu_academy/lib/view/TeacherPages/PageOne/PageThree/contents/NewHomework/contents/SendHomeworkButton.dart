import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/NewHomework/Page.dart';
import 'package:edu_academy/view/TeacherPages/TeacherMainPage.dart';
import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class SendHomeworkButton extends StatelessWidget {
  const SendHomeworkButton({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (HomeworkKey.currentState!.validate()) {
          HomeworkKey.currentState!.save();
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
                  color: Colors.blue,
                ),
              ),
            ),
          );
          List<dynamic> filesList = [];
          print("HomeworkImagesLinks ${HomeworkImagesLinks}");
          if (HomeworkImagesLinks.isNotEmpty) {
            filesList = await dbService.stHwStore(HomeworkImagesLinks);
            print("filesList ${filesList}");
          }
          //fiAdd_Hw(String Grade, String Subject, String Teacher_Id, List Files_List,
          //String HomeworkTitle,, String HomeworkBody, String score)
          await dbService.fiAdd_Hw(
              TeacherData.ListOfGrades[GradeHomeWorkOppenedIndex][0],
              TeacherData.SubjectThatIsSelected,
              Teacher_Id,
              filesList,
              HomeworkTitle,
              HomeworkBody,
              score);

          OverlayLoadingProgress.stop();
          PanaraInfoDialog.show(
            context,
            title: "نجاح",
            message: "تم اضافة الواجب بنجاح",
            buttonText: "عودة",
            onTapDismiss: () {
              Navigator.pop(context);
              GradeHomeWorkIsOppened = true;
              NewHomeWork = false;
              Refresh!();
            },
            panaraDialogType: PanaraDialogType.success,
            barrierDismissible: false,
          );
        }
      },
      child: CMaker(
          width: 80,
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 61, 197, 255),
          alignment: Alignment.center,
          circularRadius: 15,
          child: TMaker(
              text: "ارسال",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white)),
    );
  }
}
