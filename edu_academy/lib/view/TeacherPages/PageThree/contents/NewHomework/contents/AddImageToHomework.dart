import 'dart:io';

import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageThree/contents/NewHomework/Page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AddImageToHomework extends StatelessWidget {
  const AddImageToHomework({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return CMaker(
          margin: const EdgeInsets.only(left: 20),
          height: 50,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              InkWell(
                onTap: () async {
                  print("kIsWeb $kIsWeb");
                  if (kIsWeb) {
                    await TeacherFunctions(
                      SetStateCallback: () => Refresh!()
                    ).pickImageFromGallery();
                  } else {
                    XFile? Image = await PickImageFromGalary();
                    if (Image != null) {
                      HomeworkImagesLinks.add(File(Image.path));
                      Refresh!();
                    }
                  }
                },
                child: CMaker(
                    circularRadius: 15,
                    height: 60,
                    color: Colors.white,
                    width: 150,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(61, 0, 0, 0),
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: .06)
                    ],
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        TMaker(
                            text: "اضف صورة",
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                        Expanded(child: Container()),
                        const Icon(Icons.photo_library),
                        Expanded(child: Container()),
                      ],
                    )),
              ),
              const Padding(padding: EdgeInsets.only(left: 20)),
            ],
          ));
  }
}