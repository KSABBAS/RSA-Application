import 'dart:io';

import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/Data/TeacherData/TeacherFunctions.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/TeacherMainPage.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TeacherProfilePage extends StatefulWidget {
  TeacherProfilePage(
      {super.key,
      required this.TeacherName,
      required this.TeacherEmail,
      required this.ProfileSubjectsAvailable,
      required this.TeacherNumber,
      required this.TeacherPhoto,
      required this.TeacherPassword});
  String TeacherName;
  String ProfileSubjectsAvailable;
  String TeacherEmail;
  String TeacherPassword;
  String TeacherNumber;
  String TeacherPhoto;

  @override
  State<TeacherProfilePage> createState() => _TeacherProfilePageState();
}

bool EditMode = false;
GlobalKey<FormState> ProfileKey = GlobalKey();
String NewProfileEmail = "";
String NewProfileNumber = "";
String NewProfilePassword = "";

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    late Widget TeacherProfileBody;
    Widget ProfilePicture = InkWell(
      onTap: () async {
        if (kIsWeb) {
          var imageData =
              await TeacherFunctions(SetStateCallback: () => setState(() {})).web_pick_file();
          widget.TeacherPhoto =
              await dbService.FiAdd_photo0(Teacher_Id, Teacher_role, imageData);
        } else {
          XFile? Avatar = await PickImageFromGalary();
          if (Avatar != null) {
            final dbService = DatabaseService();
            ProfileAvatar = Avatar;
            widget.TeacherPhoto = await dbService.FiAdd_photo(
                Teacher_Id, Teacher_role, File(ProfileAvatar!.path));
          }
        }
        // refresh
        TeacherData.teacher_profile_data =
            await dbService.FiGet_profile_data(Teacher_Id, Teacher_role)
                as Map<String, dynamic>;
        setState(() {});
      },
      child: CMaker(
        circularRadius: 130,
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 6,
              spreadRadius: .03,
              color: Color.fromARGB(69, 0, 0, 0)),
        ],
        alignment: Alignment.center,
        width: 160,
        height: 160,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircleAvatar(
              backgroundImage: Image.network(widget.TeacherPhoto).image,
            ),
            Positioned(
              bottom: 6,
              right: -4,
              child: CMaker(
                border: Border.all(
                    width: 4, color: const Color.fromARGB(255, 233, 255, 247)),
                height: 40,
                width: 40,
                circularRadius: 50,
                color: const Color.fromARGB(255, 74, 193, 239),
                child: const Icon(Icons.add, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
    Widget NameField = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CMaker(
              width: double.infinity,
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: "الاسم",
                  fontSize: (PageWidth(context) < 550)
                      ? 20
                      : (PageHeight(context) < 900)
                          ? 30
                          : 30,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0))),
        ),
        CMaker(
          height: (PageWidth(context) < 550)
              ? 60
              : (PageHeight(context) < 900)
                  ? 80
                  : 80,
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 6,
                spreadRadius: .03,
                color: Color.fromARGB(58, 0, 0, 0)),
          ],
          circularRadius: 20,
          color: const Color.fromARGB(255, 233, 255, 247),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(child: Container()),
              CMaker(
                  padding: const EdgeInsets.only(right: 10),
                  child: TMaker(
                      text: widget.TeacherName,
                      fontSize: (PageWidth(context) < 550)
                          ? 20
                          : (PageHeight(context) < 900)
                              ? 30
                              : 30,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0))),
              Expanded(child: Container()),
            ],
          ),
        ),
      ],
    );
    Widget IdField = Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CMaker(
            width: double.infinity,
            child: TMaker(
                textAlign: TextAlign.start,
                text: "الرقم السري",
                fontSize: (PageWidth(context) < 550)
                    ? 20
                    : (PageHeight(context) < 900)
                        ? 30
                        : 30,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 0, 0, 0))),
      ),
      CMaker(
          height: (PageWidth(context) < 550)
              ? 60
              : (PageHeight(context) < 900)
                  ? 80
                  : 80,
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 6,
                spreadRadius: .03,
                color: Color.fromARGB(58, 0, 0, 0)),
          ],
          circularRadius: 20,
          color: const Color.fromARGB(255, 233, 255, 247),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(child: Container()),
              CMaker(
                  padding: const EdgeInsets.only(right: 10),
                  child: TMaker(
                      text: widget.TeacherPassword,
                      fontSize: (PageWidth(context) < 550)
                          ? 20
                          : (PageHeight(context) < 900)
                              ? 30
                              : 30,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0))),
              Expanded(child: Container()),
            ],
          ))
    ]);
    Widget SubjectsField = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CMaker(
              width: double.infinity,
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: "المواد",
                  fontSize: (PageWidth(context) < 550)
                      ? 20
                      : (PageHeight(context) < 900)
                          ? 30
                          : 30,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0))),
        ),
        CMaker(
          height: (PageWidth(context) < 550)
              ? 60
              : (PageHeight(context) < 900)
                  ? 80
                  : 80,
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 6,
                spreadRadius: .03,
                color: Color.fromARGB(58, 0, 0, 0)),
          ],
          circularRadius: 20,
          color: const Color.fromARGB(255, 233, 255, 247),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(child: Container()),
              CMaker(
                  padding: const EdgeInsets.only(right: 10),
                  child: TMaker(
                      text: widget.ProfileSubjectsAvailable,
                      fontSize: (PageWidth(context) < 550)
                          ? 20
                          : (PageHeight(context) < 900)
                              ? 30
                              : 30,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0))),
              Expanded(child: Container()),
            ],
          ),
        ),
      ],
    );
    Widget EmailField = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CMaker(
              width: double.infinity,
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: (EditMode) ? "تعديل الايميل" : "الايميل",
                  fontSize: (PageWidth(context) < 550)
                      ? 20
                      : (PageHeight(context) < 900)
                          ? 30
                          : 30,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0))),
        ),
        CMaker(
            alignment: Alignment.center,
            height: (PageWidth(context) < 550)
                ? 60
                : (PageHeight(context) < 900)
                    ? 80
                    : 80,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 6,
                  spreadRadius: .03,
                  color: Color.fromARGB(58, 0, 0, 0)),
            ],
            circularRadius: 20,
            color: const Color.fromARGB(255, 233, 255, 247),
            width: double.infinity,
            child: (EditMode)
                ? TextFormField(
                    onSaved: (newValue) {
                      NewProfileEmail = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الحقل فارغ";
                      }
                      if ((!value.endsWith("@gmail.com") ||
                              !(value.length > 10)) &&
                          (!value.endsWith("@yahoo.com") ||
                              !(value.length > 10))) {
                        return "صيغة الايميل ليسة صحيحة";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    initialValue: widget.TeacherEmail,
                    style: TextStyle(
                        fontSize: (PageWidth(context) < 550)
                            ? 20
                            : (PageHeight(context) < 900)
                                ? 30
                                : 30,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(width: 0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(width: 0))),
                  )
                : TMaker(
                    text: widget.TeacherEmail,
                    fontSize: (PageWidth(context) < 550)
                        ? 20
                        : (PageHeight(context) < 900)
                            ? 30
                            : 30,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 0, 0, 0))),
      ],
    );
    Widget PasswordField = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CMaker(
              width: double.infinity,
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: (EditMode) ? "تغيير الرقم السري" : "الرقم السري",
                  fontSize: (PageWidth(context) < 550)
                      ? 20
                      : (PageHeight(context) < 900)
                          ? 30
                          : 30,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0))),
        ),
        CMaker(
            alignment: Alignment.center,
            height: (PageWidth(context) < 550)
                ? 60
                : (PageHeight(context) < 900)
                    ? 80
                    : 80,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 6,
                  spreadRadius: .03,
                  color: Color.fromARGB(58, 0, 0, 0)),
            ],
            circularRadius: 20,
            color: const Color.fromARGB(255, 233, 255, 247),
            width: double.infinity,
            child: (EditMode)
                ? TextFormField(
                    onSaved: (newValue) {
                      NewProfilePassword = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الحقل فارغ";
                      }
                      if (value.length < 4) {
                        return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    initialValue: widget.TeacherPassword,
                    style: TextStyle(
                        fontSize: (PageWidth(context) < 550)
                            ? 20
                            : (PageHeight(context) < 900)
                                ? 30
                                : 30,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(width: 0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(width: 0))),
                  )
                : TMaker(
                    text: widget.TeacherEmail,
                    fontSize: (PageWidth(context) < 550)
                        ? 20
                        : (PageHeight(context) < 900)
                            ? 40
                            : 40,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 0, 0, 0))),
      ],
    );
    Widget NumberField = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CMaker(
              width: double.infinity,
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: (EditMode) ? "تعديل رقم الهاتف" : "رقم الهاتف",
                  fontSize: (PageWidth(context) < 550)
                      ? 20
                      : (PageHeight(context) < 900)
                          ? 30
                          : 30,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0))),
        ),
        CMaker(
          alignment: Alignment.center,
          height: (PageWidth(context) < 550)
              ? 60
              : (PageHeight(context) < 900)
                  ? 80
                  : 80,
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 6,
                spreadRadius: .03,
                color: Color.fromARGB(58, 0, 0, 0)),
          ],
          circularRadius: 20,
          color: const Color.fromARGB(255, 233, 255, 247),
          width: double.infinity,
          child: (EditMode)
              ? TextFormField(
                  onSaved: (newValue) {
                    NewProfileNumber = newValue!;
                  },
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      if (!value.startsWith("01") && !value.startsWith("05")) {
                        return "الرقم يجب ان يبدا الرقمين 01 او 05";
                      }
                      if (value.startsWith("01") && value.length != 11) {
                        return "الرقم يجب ان يكون 11 رقم";
                      }
                      if (value.startsWith("05") && value.length != 10) {
                        return "الرقم يجب ان يكون 10 رقم";
                      }
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  initialValue: widget.TeacherNumber,
                  style: TextStyle(
                      fontSize: (PageWidth(context) < 550)
                          ? 20
                          : (PageHeight(context) < 900)
                              ? 30
                              : 30,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(width: 0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(width: 0))),
                )
              : TMaker(
                  text: widget.TeacherPassword,
                  fontSize: (PageWidth(context) < 550)
                      ? 20
                      : (PageHeight(context) < 900)
                          ? 30
                          : 30,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ],
    );
    Widget EditAndSaveButton = InkWell(
      onTap: () {
        if (ProfileKey.currentState!.validate()) {
          //ProfileKey.currentState!.validate()
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: const Text("ادخل رقم الرقم السري                  "),
                    content: CMaker(
                      height: 100,
                      alignment: Alignment.center,
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 192, 192, 192)),
                                borderRadius: BorderRadius.circular(30)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 192, 192, 192)),
                                borderRadius: BorderRadius.circular(30)),
                            label: const Text(
                              "الرقم السري",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 192, 192, 192)),
                                borderRadius: BorderRadius.circular(30)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "الغاء",
                          )),
                      TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            if (EditMode) {
                              ProfileKey.currentState!.save();
                              widget.TeacherEmail = NewProfileEmail;
                              widget.TeacherNumber = NewProfileNumber;
                              widget.TeacherPassword = NewProfilePassword;
                              print(widget.TeacherEmail);
                              print(widget.TeacherNumber);
                              print(widget.TeacherPassword);
                            }
                            setState(() {
                              EditMode = !EditMode;
                            });
                          },
                          child: const Text(
                            "تم",
                          )),
                    ]);
              });
        }
      },
      child: CMaker(
        width: 220,
        height: (PageWidth(context) < 550)
            ? 60
            : (PageHeight(context) < 900)
                ? 80
                : 80,
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 6,
              spreadRadius: .03,
              color: Color.fromARGB(58, 0, 0, 0)),
        ],
        circularRadius: 25,
        color: const Color.fromARGB(255, 233, 255, 247),
        child: Row(
          children: [
            Expanded(child: Container()),
            CMaker(
                padding: const EdgeInsets.only(right: 10),
                child: TMaker(
                    text: (EditMode) ? "حفظ" : "تعديل (قريبا)",
                    fontSize: (PageWidth(context) < 550)
                        ? 25
                        : (PageHeight(context) < 900)
                            ? 40
                            : 40,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 0, 0, 0))),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
    if (PageWidth(context) < 550) {
      setState(() {
        TeacherProfileBody = Form(
          key: ProfileKey,
          child: CMaker(
            height: PageHeight(context) - 200,
            width: double.infinity,
            child: Column(children: [
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              ProfilePicture,
              Expanded(child: Container()),
              CMaker(
                  padding: const EdgeInsets.all(20),
                  height: PageHeight(context) - 400,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 74, 193, 239),
                  circularRadius: 25,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      (!EditMode)
                          ? NameField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? IdField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? SubjectsField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      EmailField,
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      (EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (EditMode)
                          ? PasswordField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      NumberField,
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      CMaker(
                          width: double.infinity,
                          height: 80,
                          alignment: Alignment.center,
                          child: EditAndSaveButton),
                      (EditMode)
                          ? CMaker(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  EditMode = false;
                                  setState(() {});
                                },
                                child: CMaker(
                                    alignment: Alignment.center,
                                    width: 170,
                                    height: (PageWidth(context) < 550)
                                        ? 60
                                        : (PageHeight(context) < 900)
                                            ? 80
                                            : 80,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 6,
                                          spreadRadius: .03,
                                          color: Color.fromARGB(58, 0, 0, 0)),
                                    ],
                                    circularRadius: 25,
                                    color: const Color.fromARGB(
                                        255, 233, 255, 247),
                                    padding: const EdgeInsets.only(right: 10),
                                    child: TMaker(
                                        text: "الغاء",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  )),
              Expanded(child: Container()),
            ]),
          ),
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      setState(() {
        TeacherProfileBody = Form(
          key: ProfileKey,
          child: CMaker(
            height: PageHeight(context) - 200,
            width: double.infinity,
            child: Column(children: [
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              ProfilePicture,
              Expanded(child: Container()),
              CMaker(
                  padding: const EdgeInsets.all(20),
                  height: PageHeight(context) - 400,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 74, 193, 239),
                  circularRadius: 25,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      (!EditMode)
                          ? NameField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? IdField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? SubjectsField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      EmailField,
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      (EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (EditMode)
                          ? PasswordField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      NumberField,
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      CMaker(
                          width: double.infinity,
                          height: 80,
                          alignment: Alignment.center,
                          child: EditAndSaveButton),
                      (EditMode)
                          ? CMaker(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  EditMode = false;
                                  setState(() {});
                                },
                                child: CMaker(
                                    alignment: Alignment.center,
                                    width: 170,
                                    height: (PageWidth(context) < 550)
                                        ? 60
                                        : (PageHeight(context) < 900)
                                            ? 80
                                            : 80,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 6,
                                          spreadRadius: .03,
                                          color: Color.fromARGB(58, 0, 0, 0)),
                                    ],
                                    circularRadius: 25,
                                    color: const Color.fromARGB(
                                        255, 233, 255, 247),
                                    padding: const EdgeInsets.only(right: 10),
                                    child: TMaker(
                                        text: "الغاء",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  )),
              Expanded(child: Container()),
            ]),
          ),
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      setState(() {
        TeacherProfileBody = Form(
          key: ProfileKey,
          child: CMaker(
            height: PageHeight(context) - 140,
            width: double.infinity,
            child: Column(children: [
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              ProfilePicture,
              Expanded(child: Container()),
              CMaker(
                  padding: const EdgeInsets.all(20),
                  height: PageHeight(context) - 320,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 74, 193, 239),
                  circularRadius: 25,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      (!EditMode)
                          ? NameField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? IdField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? SubjectsField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      EmailField,
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      (EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      (EditMode)
                          ? PasswordField
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      NumberField,
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      CMaker(
                          width: double.infinity,
                          height: 80,
                          alignment: Alignment.center,
                          child: EditAndSaveButton),
                      (EditMode)
                          ? CMaker(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  EditMode = false;
                                  setState(() {});
                                },
                                child: CMaker(
                                    alignment: Alignment.center,
                                    width: 170,
                                    height: (PageWidth(context) < 550)
                                        ? 60
                                        : (PageHeight(context) < 900)
                                            ? 80
                                            : 80,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 6,
                                          spreadRadius: .03,
                                          color: Color.fromARGB(58, 0, 0, 0)),
                                    ],
                                    circularRadius: 25,
                                    color: const Color.fromARGB(
                                        255, 233, 255, 247),
                                    padding: const EdgeInsets.only(right: 10),
                                    child: TMaker(
                                        text: "الغاء",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  )),
              Expanded(child: Container()),
            ]),
          ),
        );
      });
    }
    return TeacherProfileBody;
  }
}
