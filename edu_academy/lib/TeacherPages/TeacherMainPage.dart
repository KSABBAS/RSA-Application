// import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/Login/LogInPage.dart';
import 'package:edu_academy/TeacherPages/TeacherProfilePage.dart';
import 'package:edu_academy/TeacherPages/TeacherSecondPageContents.dart';
import 'package:edu_academy/TeacherPages/TeacherFirstPageContenets.dart';
import 'package:edu_academy/TeacherPages/TeacherThirdPageContents.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';
import 'package:string_extensions/string_extensions.dart';

class TeacherMainPage extends StatefulWidget {
  const TeacherMainPage({super.key});

  @override
  State<TeacherMainPage> createState() => _TeacherMainPageState();
}

GlobalKey<FormState> NewKey1 = GlobalKey();
String NewTeacherEmail = "";
String NewTeacherPhoneNumber = "";
String NewTeacherPassWord = "";
int PageIndex = 0;

String SubjectName = "Math";
List ListOfGrades = [];

List<String> Subject_techer = ['null', 'null', 'null'];
String Subject1 = "Tester";
String Subject2 = "null";
String Subject3 = "null";
XFile? Avatar;
XFile? ProfileAvatar;
int numberOfSubjects = 1;
String SubjectThatIsSelected = Subject1;
String ProfileSubjectsAvailable = "";

// data base start
String name = '';
String Teacher_Id = '';
List subjects_ = [];
String subjects_string = '';
Map<String, Map<String, List<dynamic>>> sub_data = {};

// data base end

class _TeacherMainPageState extends State<TeacherMainPage> {
  // data base start
  final dbService = DatabaseService();
  late Future<void> _dataFuture;

  void initState() {
    super.initState();
    _dataFuture = _initializeData();
  }

  Future<void> _initializeData() async {
    print("start .. _initializeData ");
    print("ListOfGrades $ListOfGrades");


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = await prefs.getStringList('id');
    log(items.toString());
    if (items != null && items.isNotEmpty) {
      setState(() {
        print("start .. setState");
        name = items[2].split("-")[0];
        name = "${name.split(" ")[0]} ${name.split(" ")[1]}".toTitleCase;
        // start subject as list to use or add a name
        subjects_ = items[2].split("-").sublist(1);
        subjects_.removeWhere((item) => item == 'null');
        print("subjects_ $subjects_");
        Teacher_Id = items[0].split("#")[1];
        subjects_string = items[2]
            .split('-')
            .sublist(1)
            .map((subject) =>
                subject.replaceAll(RegExp(r"[\[\]']"), '').split(', ')[0])
            .where((subject) => subject != 'null')
            .join('-');
        print("subjects_string $subjects_string");
        print("subjects_ $subjects_");
      });
      Map<String, Map<String, List<dynamic>>> data0 =
          await dbService.fiGrades_and_Students(Teacher_Id, subjects_);
      setState(() {
        sub_data = data0 as Map<String, Map<String, List<dynamic>>>;
        int index_ = 0;
        for (String i in sub_data.keys) {
          Subject_techer[index_] = i;
          index_++;
        }
        Subject1 = Subject_techer[0];
        Subject2 = Subject_techer[1];
        Subject3 = Subject_techer[2];
        print("sub_data $sub_data");
        print("Subject_techer $Subject_techer");
        print(
            "sub_data[SubjectThatIsSelected]!.keys ${sub_data[SubjectThatIsSelected]}");

        for (var i in sub_data[SubjectThatIsSelected]!.keys) {
          print("i $i");
          print("ii ${sub_data[SubjectThatIsSelected]![i]}");
          List gg = [];
          for (var j in sub_data[SubjectThatIsSelected]![i]!) {
            print("j$j");
            gg.add(j);
          }
          print("gg $gg");
          ListOfGrades.add([i, gg]);
          gg = [];
          print("ListOfGrades $ListOfGrades");
        }
        // for (var i in sub_data[SubjectThatIsSelected]!.keys) {
        //   print(i);
        // }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("start .. build ");

    late Widget TeacherMainPageBody;
    if (Subject2.toString() != "null" && Subject3.toString() == "null") {
      ProfileSubjectsAvailable =
          "${Subject1.toString()} - ${Subject2.toString()}";
    } else if (Subject2.toString() == "null" && Subject3.toString() == "null") {
      ProfileSubjectsAvailable = Subject1.toString();
    } else {
      ProfileSubjectsAvailable =
          "${Subject1.toString()} - ${Subject2.toString()} - ${Subject3.toString()}";
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    List<Widget> Pages = [
      CMaker(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 70,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(82, 0, 0, 0)),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        height: 50,
                        padding: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                PageIndex = 0;
                              });
                            },
                            child: Image.asset("images/Book.png"))),
                    CMaker(
                      width: PageWidth(context)-150,
                      child: Row(
                        children: [
                          Expanded(
                            child: CMaker(
                              padding: const EdgeInsets.only(bottom: 13),
                              alignment: Alignment.bottomCenter,
                              child: const Text(
                                "kareem said",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 5, 123, 151)),
                              ),
                            ),
                          ),
                          Expanded(child: Builder(
                            builder: (context) {
                              if (Subject1 != "null" &&
                                  Subject2 == "null" &&
                                  Subject3 == "null") {
                                numberOfSubjects = 1;
                                return CMaker(
                                  padding: const EdgeInsets.only(bottom: 13),
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    Subject1,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 89, 89, 87)),
                                  ),
                                );
                              }
                              if (Subject1 != "null" &&
                                  Subject2 != "null" &&
                                  Subject3 == "null") {
                                numberOfSubjects = 2;
                                return CMaker(
                                  alignment: Alignment.bottomCenter,
                                  child: DropdownButton(
                                    underline: const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                                    value: SubjectThatIsSelected,
                                    items: [
                                      DropdownMenuItem(
                                        value: Subject1,
                                        child: Text(
                                          Subject1,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Subject2,
                                        child: Text(
                                          Subject2,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        SubjectThatIsSelected =
                                            value.toString();
                                      });
                                    },
                                  ),
                                );
                              } else {
                                numberOfSubjects = 3;
                                return CMaker(
                                  alignment: Alignment.bottomCenter,
                                  child: DropdownButton(
                                    underline: const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                                    value: SubjectThatIsSelected,
                                    items: [
                                      DropdownMenuItem(
                                        value: Subject1,
                                        child: Text(
                                          Subject1,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Subject2,
                                        child: Text(
                                          Subject2,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Subject3,
                                        child: Text(
                                          Subject3,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        SubjectThatIsSelected =
                                            value.toString();
                                      });
                                    },
                                  ),
                                );
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 70,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        child: const Icon(Icons.notifications),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              const TeacherFirstPageContenets()
            ],
          ),
        ),
      ),
      CMaker(
        height: double.infinity,
            width: double.infinity,
        child: SizedBox(
          height: PageHeight(context) + 300,
          child: ListView(
            shrinkWrap: false,
            children: [
              Container(
                height: 70,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(82, 0, 0, 0)),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        height: 50,
                        padding: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                PageIndex = 0;
                              });
                            },
                            child: Image.asset("images/Book.png"))),
                    CMaker(
                      width: PageWidth(context)-150,
                      child: Row(
                        children: [
                          Expanded(
                            child: CMaker(
                              padding: const EdgeInsets.only(bottom: 13),
                              alignment: Alignment.bottomCenter,
                              child: const Text(
                                "kareem said",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 5, 123, 151)),
                              ),
                            ),
                          ),
                          Expanded(child: Builder(
                            builder: (context) {
                              if (Subject1 != "null" &&
                                  Subject2 == "null" &&
                                  Subject3 == "null") {
                                numberOfSubjects = 1;
                                return CMaker(
                                  padding: const EdgeInsets.only(bottom: 13),
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    Subject1,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 89, 89, 87)),
                                  ),
                                );
                              }
                              if (Subject1 != "null" &&
                                  Subject2 != "null" &&
                                  Subject3 == "null") {
                                numberOfSubjects = 2;
                                return CMaker(
                                  alignment: Alignment.bottomCenter,
                                  child: DropdownButton(
                                    underline: const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                                    value: SubjectThatIsSelected,
                                    items: [
                                      DropdownMenuItem(
                                        value: Subject1,
                                        child: Text(
                                          Subject1,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Subject2,
                                        child: Text(
                                          Subject2,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      ListOfGrades = [];
                                      _dataFuture = _initializeData();
                                      setState(() {
                                        SubjectThatIsSelected =
                                            value.toString();
                                      });
                                    },
                                  ),
                                );
                              } else {
                                numberOfSubjects = 3;
                                return CMaker(
                                  alignment: Alignment.bottomCenter,
                                  child: DropdownButton(
                                    underline: const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                                    value: SubjectThatIsSelected,
                                    items: [
                                      DropdownMenuItem(
                                        value: Subject1,
                                        child: Text(
                                          Subject1,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Subject2,
                                        child: Text(
                                          Subject2,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Subject3,
                                        child: Text(
                                          Subject3,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        SubjectThatIsSelected =
                                            value.toString();
                                      });
                                    },
                                  ),
                                );
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 70,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        child: const Icon(Icons.notifications),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              TeacherSecondPageContents(
                ListOfGrades:
                    ListOfGrades, // put the list of grades and its students from the database here
                SubjectName: SubjectName, // put the teacher subject here
              ),
            ],
          ),
        ),
      ),
      CMaker(
        height: double.infinity,
            width: double.infinity,
        child: Container(
          child: ListView(
            children: [
              Container(
                height: 70,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(82, 0, 0, 0)),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        height: 50,
                        padding: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                PageIndex = 0;
                              });
                            },
                            child: Image.asset("images/Book.png"))),
                    CMaker(
                      width: PageWidth(context)-150,
                      child: Row(
                        children: [
                          Expanded(
                            child: CMaker(
                              padding: const EdgeInsets.only(bottom: 13),
                              alignment: Alignment.bottomCenter,
                              child: const Text(
                                "kareem said",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 5, 123, 151)),
                              ),
                            ),
                          ),
                          Expanded(child: Builder(
                            builder: (context) {
                              if (Subject1 != "null" &&
                                  Subject2 == "null" &&
                                  Subject3 == "null") {
                                numberOfSubjects = 1;
                                return CMaker(
                                  padding: const EdgeInsets.only(bottom: 13),
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    Subject1,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 89, 89, 87)),
                                  ),
                                );
                              }
                              if (Subject1 != "null" &&
                                  Subject2 != "null" &&
                                  Subject3 == "null") {
                                numberOfSubjects = 2;
                                return CMaker(
                                  alignment: Alignment.bottomCenter,
                                  child: DropdownButton(
                                    underline: const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                                    value: SubjectThatIsSelected,
                                    items: [
                                      DropdownMenuItem(
                                        value: Subject1,
                                        child: Text(
                                          Subject1,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Subject2,
                                        child: Text(
                                          Subject2,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        SubjectThatIsSelected =
                                            value.toString();
                                      });
                                    },
                                  ),
                                );
                              } else {
                                numberOfSubjects = 3;
                                return CMaker(
                                  alignment: Alignment.bottomCenter,
                                  child: DropdownButton(
                                    underline: const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                                    value: SubjectThatIsSelected,
                                    items: [
                                      DropdownMenuItem(
                                        value: Subject1,
                                        child: Text(
                                          Subject1,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Subject2,
                                        child: Text(
                                          Subject2,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Subject3,
                                        child: Text(
                                          Subject3,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        SubjectThatIsSelected =
                                            value.toString();
                                      });
                                    },
                                  ),
                                );
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 70,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        child: const Icon(Icons.notifications),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              TeacherThirdPageContents(
                ListOfGrades: ListOfGrades,
                SubjectName: SubjectName,
              )
            ],
          ),
        ),
      ),
      CMaker(
        height: double.infinity,
            width: double.infinity,
        child: Container(
            child: ListView(children: [
          Container(
            height: 70,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 6,
                      spreadRadius: .03,
                      color: Color.fromARGB(82, 0, 0, 0)),
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Row(
              children: [
                Container(
                    width: 70,
                    height: 50,
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            PageIndex = 0;
                          });
                        },
                        child: Image.asset("images/Book.png"))),
                CMaker(
                  width:PageWidth(context)-150,
                  child: Row(
                    children: [
                      Expanded(
                        child: CMaker(
                          padding: EdgeInsets.only(bottom: 13),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "kareem said",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 5, 123, 151)),
                          ),
                        ),
                      ),
                      Expanded(child: Builder(
                        builder: (context) {
                          if (Subject1 != "null" &&
                              Subject2 == "null" &&
                              Subject3 == "null") {
                            numberOfSubjects = 1;
                            return CMaker(
                              padding: EdgeInsets.only(bottom: 13),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${Subject1}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 89, 89, 87)),
                              ),
                            );
                          }
                          if (Subject1 != "null" &&
                              Subject2 != "null" &&
                              Subject3 == "null") {
                            numberOfSubjects = 2;
                            return CMaker(
                              alignment: Alignment.bottomCenter,
                              child: DropdownButton(
                                underline: Container(
                                  height: 0,
                                  width: 0,
                                ),
                                value: SubjectThatIsSelected,
                                items: [
                                  DropdownMenuItem(
                                    value: Subject1,
                                    child: Text(
                                      "${Subject1}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 89, 89, 87)),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: Subject2,
                                    child: Text(
                                      "${Subject2}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 89, 89, 87)),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    SubjectThatIsSelected = value.toString();
                                  });
                                },
                              ),
                            );
                          } else {
                            numberOfSubjects = 3;
                            return CMaker(
                              alignment: Alignment.bottomCenter,
                              child: DropdownButton(
                                underline: Container(
                                  height: 0,
                                  width: 0,
                                ),
                                value: SubjectThatIsSelected,
                                items: [
                                  DropdownMenuItem(
                                    value: Subject1,
                                    child: Text(
                                      "${Subject1}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 89, 89, 87)),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: Subject2,
                                    child: Text(
                                      "${Subject2}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 89, 89, 87)),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: Subject3,
                                    child: Text(
                                      "${Subject3}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 89, 89, 87)),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    SubjectThatIsSelected = value.toString();
                                  });
                                },
                              ),
                            );
                          }
                        },
                      )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove("id");
                    Navigator.pushReplacementNamed(context, "SplashView");
                  },
                  child: Container(
                    width: 70,
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    child: const Icon(Icons.logout),
                  ),
                ),
              ],
            ),
          ),
          TeacherProfilePage(TeacherName: "kareem said hassan", TeacherEmail: "kareemsaid234@gmail.com", ProfileSubjectsAvailable: ProfileSubjectsAvailable, TeacherNumber: "01006270833", TeacherPassword: "1234")
        ])),
      )
    ];

    if (PageWidth(context) < 550) {
      TeacherMainPageBody = Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        bottomNavigationBar: CurvedNavigationBar(
            color: const Color.fromARGB(255, 255, 255, 255),
            backgroundColor: const Color.fromARGB(255, 233, 255, 247),
            index: PageIndex,
            height: 75,
            onTap: (val) {
              setState(() {
                PageIndex = val;
              });
            },
            items: const [
              Icon(
                Icons.home,
                color: Colors.black,
              ),
              Icon(
                Icons.school,
                color: Colors.black,
              ),
              Icon(
                Icons.book,
                color: Colors.black,
              ),
              Icon(
                Icons.person,
                color: Colors.black,
              ),
            ]),
        body: Pages.elementAt(PageIndex),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      TeacherMainPageBody = Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        body: Row(
          children: [
            SideBarAnimated(
              dividerColor: const Color.fromARGB(255, 0, 0, 0),
              sideBarColor: const Color.fromARGB(255, 36, 160, 209),
              selectedIconColor: Colors.white,
              hoverColor: const Color.fromARGB(255, 255, 255, 255),
              unselectedIconColor: Colors.black,
              unSelectedTextColor: Colors.black,
              sideBarWidth: 300,
              onTap: (s) {
                setState(() {
                  PageIndex = s;
                });
              },
              widthSwitch:
                  (PageWidth(context) > 600 && PageWidth(context) < 900)
                      ? 800
                      : 1200,
              mainLogoImage: 'images/Logo.png',
              sidebarItems: [
                SideBarItem(
                  iconSelected: Icons.home_rounded,
                  text: 'Home',
                ),
                SideBarItem(
                  iconSelected: Icons.school,
                  text: 'Grades',
                ),
                SideBarItem(
                  iconSelected: Icons.book,
                  text: 'Homework',
                ),
                SideBarItem(
                  iconSelected: Icons.person,
                  text: 'Profile',
                ),
              ],
            ),
            Pages.elementAt(PageIndex),
          ],
        ),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      TeacherMainPageBody = Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        bottomNavigationBar: CurvedNavigationBar(
            color: const Color.fromARGB(255, 255, 255, 255),
            backgroundColor: const Color.fromARGB(255, 233, 255, 247),
            index: PageIndex,
            height: 75,
            onTap: (val) {
              setState(() {
                PageIndex = val;
              });
            },
            items: const [
              Icon(
                Icons.home,
                color: Colors.black,
              ),
              Icon(
                Icons.school,
                color: Colors.black,
              ),
              Icon(
                Icons.book,
                color: Colors.black,
              ),
              Icon(
                Icons.person,
                color: Colors.black,
              ),
            ]),
        body: Pages.elementAt(PageIndex),
      );
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return TeacherMainPageBody;
  }
}
