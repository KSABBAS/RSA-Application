import 'dart:io';

import 'package:edu_academy/Login/LogInPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';
import 'package:edu_academy/TeacherPages/TeacherMainPage.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile(
      {super.key,
      required this.StudentName,
      required this.StudentEmail,
      required this.StudentGrade,
      required this.StudentNumber,
      required this.profile_photo,
      required this.StudentPassword});
  String StudentName;
  String StudentGrade;
  String StudentEmail;
  String StudentPassword;
  String StudentNumber;
  String profile_photo;
  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

bool EditMode = false;
GlobalKey<FormState> ProfileKey = GlobalKey();
String NewProfileEmail = "";
String NewProfileNumber = "";
String NewProfilePassword = "";
String Check_pass = "";

class _StudentProfileState extends State<StudentProfile> {
  bool EditMode = false;
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    // String profile_photo = widget.profile_photo;
    print("widget.profile_photo ${widget.profile_photo}");
    late Widget StudentProfileBody;
    Widget ProfilePicture = InkWell(
      onTap: () async {
        XFile? Avatar = await PhotoImageFromGalary();
        if (Avatar != null) {
          ProfileAvatar = Avatar;
          print("File(ProfileAvatar!.path) ${File(ProfileAvatar!.path)}");
          widget.profile_photo = await dbService.FiAdd_photo(
              student_id, role, File(ProfileAvatar!.path));
          // refresh
          profile_data = await dbService.FiGet_profile_data(student_id, role)
              as Map<String, dynamic>;
          setState(() {});
        }
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
            (ProfileAvatar == null && widget.profile_photo == "")
                ? const CircleAvatar(
                    backgroundImage: AssetImage("images/personDeafult.png"))
                : CircleAvatar(
                    backgroundImage:
                        Image.network((widget.profile_photo)).image,
                  ),
            Positioned(
              bottom: 6,
              right: -4,
              child: CMaker(
                border: Border.all(
                    width: 4, color: Color.fromARGB(255, 233, 255, 247)),
                height: 40,
                width: 40,
                circularRadius: 50,
                color: Color.fromARGB(255, 74, 193, 239),
                child: Icon(Icons.add, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
    Widget NameField = Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: CMaker(
              width: double.infinity,
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: "Name",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0))),
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
                  padding: EdgeInsets.only(right: 10),
                  child: TMaker(
                      text: widget.StudentName,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0))),
              Expanded(child: Container()),
            ],
          ),
        ),
      ],
    );
    Widget IdAndGradeRow = CMaker(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CMaker(
                        width: double.infinity,
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "Id",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0))),
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
                            padding: EdgeInsets.only(right: 10),
                            child: TMaker(
                                text: "12345",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CMaker(
                        width: double.infinity,
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "Grade",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0))),
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
                            padding: EdgeInsets.only(right: 10),
                            child: TMaker(
                                text: widget.StudentGrade,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
    Widget EmailField = Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: CMaker(
              width: double.infinity,
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: (EditMode) ? "Edit Email" : "Email",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0))),
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
                    initialValue: widget.StudentEmail,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 0))),
                  )
                : TMaker(
                    text: widget.StudentEmail,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 0, 0, 0))),
      ],
    );
    Widget PasswordField = Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: CMaker(
              width: double.infinity,
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: (EditMode) ? "Edit Password" : "Password",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0))),
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
                      if (value!.length < 4) {
                        return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    initialValue: widget.StudentPassword,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 0))),
                  )
                : TMaker(
                    text: widget.StudentEmail,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 0, 0, 0))),
      ],
    );
    Widget NumberField = Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: CMaker(
              width: double.infinity,
              child: TMaker(
                  textAlign: TextAlign.start,
                  text: (EditMode) ? "Edit Number" : "Number",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0))),
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
                  initialValue: widget.StudentNumber,
                  style: TextStyle(
                      fontSize: 20,
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
                          borderSide: BorderSide(width: 0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 0))),
                )
              : TMaker(
                  text: widget.StudentPassword,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ],
    );
    Widget EditAndSaveButton = InkWell(
      onTap: () {
        if (ProfileKey.currentState!.validate()) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: Text("Enter the password                  "),
                    content: CMaker(
                      height: 100,
                      alignment: Alignment.center,
                      child: TextFormField(
                        onChanged: (newValue) {
                          Check_pass = newValue;
                        },
                        obscureText: obscureText,
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
                              "Password",
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
                          child: Text(
                            "Cancel",
                          )),
                      TextButton(
                          onPressed: () async {
                            print("####Check_pass ${Check_pass}");
                            print(
                                "####widget.StudentPassword ${widget.StudentPassword}");
                            print("####EditMode ${EditMode}");
                            if (EditMode) {
                              ProfileKey.currentState!.save();
                              widget.StudentEmail = NewProfileEmail;
                              widget.StudentNumber = NewProfileNumber;
                              widget.StudentPassword = NewProfilePassword;
                              dbService.FiUpdate_profile_data(
                                  grade,
                                  "Students",
                                  student_id,
                                  widget.StudentEmail,
                                  widget.StudentNumber,
                                  widget.StudentPassword);
                              print(widget.StudentEmail);
                              print(widget.StudentNumber);
                              print(widget.StudentPassword);
                            } else {
                              if (Check_pass == widget.StudentPassword&&Check_pass !="0") {
                                print(
                                    "======================\n password id correct");
                                print(
                                    "======================$Check_pass");
                                EditMode = !EditMode;
                                print(EditMode);
                                Navigator.pop(context);
                                setState(() {});
                              }
                            }
                          },
                          child: Text(
                            "ok",
                          )),
                    ]);
              });
        }
      },
      child: CMaker(
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
        color: const Color.fromARGB(255, 233, 255, 247),
        child: Row(
          children: [
            Expanded(child: Container()),
            CMaker(
                padding: EdgeInsets.only(right: 10),
                child: TMaker(
                    text: (EditMode) ? "Save" : "Edit",
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 0, 0, 0))),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
    if (PageWidth(context) < 550) {
      setState(() {
        StudentProfileBody = Form(
          key: ProfileKey,
          child: CMaker(
            height: PageHeight(context) - 200,
            width: double.infinity,
            child: Column(children: [
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              ProfilePicture,
              Expanded(child: Container()),
              CMaker(
                  padding: EdgeInsets.all(20),
                  height: PageHeight(context) - 400,
                  width: double.infinity,
                  color: Color.fromARGB(255, 74, 193, 239),
                  circularRadius: 25,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      (!EditMode)
                          ? NameField
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? IdAndGradeRow
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      EmailField,
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      (EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (EditMode)
                          ? PasswordField
                          : Container(
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
                                  setState(() {
                                  });
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
                                    color: const Color.fromARGB(255, 233, 255, 247),
                                    padding: EdgeInsets.only(right: 10),
                                    child: TMaker(
                                        text: "Cancel",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 0, 0, 0))),
                              ),
                          )
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  )),
              Expanded(child: Container())
            ]),
          ),
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      setState(() {
        StudentProfileBody = Form(
          key: ProfileKey,
          child: CMaker(
            height: PageHeight(context) - 200,
            width: double.infinity,
            child: Column(children: [
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              ProfilePicture,
              Expanded(child: Container()),
              CMaker(
                  padding: EdgeInsets.all(20),
                  height: PageHeight(context) - 400,
                  width: double.infinity,
                  color: Color.fromARGB(255, 74, 193, 239),
                  circularRadius: 25,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      (!EditMode)
                          ? NameField
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? IdAndGradeRow
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      EmailField,
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      (EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (EditMode)
                          ? PasswordField
                          : Container(
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
                                  setState(() {
                                  });
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
                                    color: const Color.fromARGB(255, 233, 255, 247),
                                    padding: EdgeInsets.only(right: 10),
                                    child: TMaker(
                                        text: "Cancel",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 0, 0, 0))),
                              ),
                          )
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  )),
              Expanded(child: Container())
            ]),
          ),
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      setState(() {
        StudentProfileBody = Form(
          key: ProfileKey,
          child: CMaker(
            height: PageHeight(context) - 200,
            width: double.infinity,
            child: Column(children: [
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              ProfilePicture,
              Expanded(child: Container()),
              CMaker(
                  padding: EdgeInsets.all(20),
                  height: PageHeight(context) - 400,
                  width: double.infinity,
                  color: Color.fromARGB(255, 74, 193, 239),
                  circularRadius: 25,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      (!EditMode)
                          ? NameField
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? IdAndGradeRow
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (!EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      EmailField,
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      (EditMode)
                          ? const Padding(padding: EdgeInsets.only(bottom: 10))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (EditMode)
                          ? PasswordField
                          : Container(
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
                                  setState(() {
                                  });
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
                                    color: const Color.fromARGB(255, 233, 255, 247),
                                    padding: EdgeInsets.only(right: 10),
                                    child: TMaker(
                                        text: "Cancel",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 0, 0, 0))),
                              ),
                          )
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  )),
              Expanded(child: Container())
            ]),
          ),
        );
      });
    }
    return StudentProfileBody;
  }
}
