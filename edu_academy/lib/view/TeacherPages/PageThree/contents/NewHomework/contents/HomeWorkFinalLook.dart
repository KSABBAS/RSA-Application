import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/NewHomework/Page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class HomeWorkFinalLook extends StatelessWidget {
  const HomeWorkFinalLook({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          CMaker(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: TMaker(
                  text: HomeworkTitle,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          CMaker(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: HomeworkBody,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 86, 86, 86))),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          CMaker(
            height: (HomeworkImagesLinks.length % 2 == 0)
                ? HomeworkImagesLinks.length * 80
                : (HomeworkImagesLinks.length + 1) * 80,
            width: double.infinity,
            child: GridView.builder(
              itemCount: HomeworkImagesLinks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                      HomeworkImagesLinks.removeAt(index);
                    Refresh!();
                  },
                  child: (kIsWeb)
                      ? Image.memory(
                          HomeworkImagesLinks[index],
                          fit: BoxFit.fitWidth,
                        )
                      : Image.file(
                          HomeworkImagesLinks[index],
                          fit: BoxFit.fitWidth,
                        ),
                );
              },
            ),
          )
        ],
      );
  }
}