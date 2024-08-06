// import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/Login/LogInPage.dart';
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
      Expanded(
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
                    Expanded(
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
      Expanded(
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
                    Expanded(
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
      Expanded(
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
                    Expanded(
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
      Container(
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
              Expanded(
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
                                        color: Color.fromARGB(255, 89, 89, 87)),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: Subject2,
                                  child: Text(
                                    Subject2,
                                    style: const TextStyle(
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
                                        color: Color.fromARGB(255, 89, 89, 87)),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: Subject2,
                                  child: Text(
                                    Subject2,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 89, 89, 87)),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: Subject3,
                                  child: Text(
                                    Subject3,
                                    style: const TextStyle(
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
        const Padding(
          padding: EdgeInsets.only(bottom: 40),
        ),
        CMaker(
          height: PageHeight(context) - 200,
          width: double.infinity,
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  XFile? Avatar = await PhotoImageFromGalary();
                  if (Avatar != null) {
                    ProfileAvatar = Avatar;
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
                      (ProfileAvatar == null)
                          ? const CircleAvatar(
                              backgroundImage:
                                  AssetImage("images/personDeafult.png"))
                          : CircleAvatar(
                              backgroundImage:
                                  Image.file(File(ProfileAvatar!.path)).image,
                            ),
                      Positioned(
                        bottom: 6,
                        right: -4,
                        child: CMaker(
                          border: Border.all(
                              width: 4,
                              color: const Color.fromARGB(255, 233, 255, 247)),
                          height: 40,
                          width: 40,
                          circularRadius: 50,
                          color: const Color.fromARGB(255, 36, 160, 209),
                          child: const Icon(Icons.add, size: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              CMaker(
                  padding: const EdgeInsets.all(20),
                  height: PageHeight(context) - 400,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 36, 160, 209),
                  circularRadius: 25,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Expanded(
                          child: CMaker(
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(58, 0, 0, 0)),
                        ],
                        padding: const EdgeInsets.all(10),
                        circularRadius: 25,
                        margin: const EdgeInsets.only(bottom: 30),
                        color: const Color.fromARGB(255, 233, 255, 247),
                        height: 80,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            CMaker(
                                padding: const EdgeInsets.only(right: 10),
                                child: TMaker(
                                    text: "Kareem said hassan",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 0, 0, 0))),
                            Expanded(child: Container()),
                          ],
                        ),
                      )),
                      Expanded(
                          child: CMaker(
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(58, 0, 0, 0)),
                        ],
                        padding: const EdgeInsets.all(10),
                        circularRadius: 25,
                        margin: const EdgeInsets.only(bottom: 30),
                        color: const Color.fromARGB(255, 233, 255, 247),
                        height: 80,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            CMaker(
                                padding: const EdgeInsets.only(right: 10),
                                child: TMaker(
                                    text: ProfileSubjectsAvailable,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 0, 0, 0))),
                            Expanded(child: Container()),
                          ],
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                    "Enter the password                  "),
                                content: CMaker(
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: TextField(
                                    obscureText: obscureText,
                                    decoration: InputDecoration(
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 192, 192, 192)),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 192, 192, 192)),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        label: const Text(
                                          "Password",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 192, 192, 192)),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Cancel",
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                  title: const Text(
                                                      "What do you wanna Change ?"),
                                                  content: SizedBox(
                                                    height: 100,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text("enter the new Email Adress"),
                                                                          content:
                                                                              CMaker(
                                                                            height:
                                                                                80,
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Form(
                                                                              key: NewKey1,
                                                                              child: TextFormField(
                                                                                onSaved: (newValue) {
                                                                                  NewTeacherEmail = newValue!;
                                                                                },
                                                                                validator: (value) {
                                                                                  if (value!.isEmpty) {
                                                                                    return "الحقل فارغ";
                                                                                  }
                                                                                  if ((!value.endsWith("@gmail.com") || !(value.length > 10)) && (!value.endsWith("@yahoo.com") || !(value.length > 10))) {
                                                                                    return "صيغة الايميل ليسة صحيحة";
                                                                                  }
                                                                                  return null;
                                                                                },
                                                                                decoration: InputDecoration(
                                                                                    focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                    errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                    label: const Text(
                                                                                      "New Email",
                                                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                    enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: const Text("Cancel")),
                                                                            TextButton(
                                                                                onPressed: () async {
                                                                                  if (NewKey1.currentState!.validate()) {
                                                                                    NewKey1.currentState!.save();
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
                                                                                    await Future.delayed(const Duration(seconds: 2));
                                                                                    //edit the Email in the database if there is no one else using it and return true or false
                                                                                    OverlayLoadingProgress.stop();
                                                                                    if (true) {
                                                                                      PanaraInfoDialog.show(
                                                                                        context,
                                                                                        title: "Success",
                                                                                        message: "The email has changed",
                                                                                        buttonText: "Okay",
                                                                                        onTapDismiss: () {
                                                                                          Navigator.pop(context);
                                                                                          Navigator.pop(context);
                                                                                          setState(() {});
                                                                                        },
                                                                                        panaraDialogType: PanaraDialogType.success,
                                                                                        barrierDismissible: false,
                                                                                      );
                                                                                    } else {
                                                                                      PanaraInfoDialog.show(
                                                                                        context,
                                                                                        title: "Sorry",
                                                                                        message: "Somthing went wrong",
                                                                                        buttonText: "Okay",
                                                                                        onTapDismiss: () {
                                                                                          Navigator.pop(context);
                                                                                          NewTeacherEmail = "";
                                                                                        },
                                                                                        panaraDialogType: PanaraDialogType.error,
                                                                                        barrierDismissible: true,
                                                                                      );
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: const Text("Ok")),
                                                                          ],
                                                                        );
                                                                      });
                                                                },
                                                                child: CMaker(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 60,
                                                                    color:
                                                                        const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            144,
                                                                            30,
                                                                            210),
                                                                    circularRadius:
                                                                        20,
                                                                    child: TMaker(
                                                                        text:
                                                                            "Email",
                                                                        fontSize:
                                                                            25,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w800,
                                                                        color: Colors
                                                                            .white)))),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20)),
                                                        Expanded(
                                                            child: InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text("enter the new Password"),
                                                                          content:
                                                                              CMaker(
                                                                            height:
                                                                                80,
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Form(
                                                                              key: NewKey1,
                                                                              child: CMaker(
                                                                                height: 80,
                                                                                child: TextFormField(
                                                                                  onSaved: (newValue) {
                                                                                    NewTeacherPassWord = newValue!;
                                                                                  },
                                                                                  validator: (value) {
                                                                                    if (value!.length < 4) {
                                                                                      return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
                                                                                    }
                                                                                    return null;
                                                                                  },
                                                                                  obscureText: obscureText,
                                                                                  decoration: InputDecoration(
                                                                                      focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                      errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                      suffix: InkWell(
                                                                                        onTap: () {
                                                                                          setState(() {
                                                                                            obscureText = !obscureText;
                                                                                          });
                                                                                        },
                                                                                        child: const Icon(Icons.remove_red_eye_outlined),
                                                                                      ),
                                                                                      label: const Text(
                                                                                        "Password",
                                                                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: const Text("Cancel")),
                                                                            TextButton(
                                                                                onPressed: () async {
                                                                                  if (NewKey1.currentState!.validate()) {
                                                                                    NewKey1.currentState!.save();
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
                                                                                    await Future.delayed(const Duration(seconds: 2));
                                                                                    //edit the Email in the database if there is no one else using it and return true or false
                                                                                    OverlayLoadingProgress.stop();
                                                                                    if (true) {
                                                                                      PanaraInfoDialog.show(
                                                                                        context,
                                                                                        title: "Success",
                                                                                        message: "The password has changed",
                                                                                        buttonText: "Okay",
                                                                                        onTapDismiss: () {
                                                                                          Navigator.pop(context);
                                                                                          Navigator.pop(context);
                                                                                          setState(() {});
                                                                                        },
                                                                                        panaraDialogType: PanaraDialogType.success,
                                                                                        barrierDismissible: false,
                                                                                      );
                                                                                    } else {
                                                                                      PanaraInfoDialog.show(
                                                                                        context,
                                                                                        title: "Sorry",
                                                                                        message: "Somthing went wrong",
                                                                                        buttonText: "Okay",
                                                                                        onTapDismiss: () {
                                                                                          Navigator.pop(context);
                                                                                          NewTeacherEmail = "";
                                                                                        },
                                                                                        panaraDialogType: PanaraDialogType.error,
                                                                                        barrierDismissible: true,
                                                                                      );
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: const Text("Ok")),
                                                                          ],
                                                                        );
                                                                      });
                                                                },
                                                                child: CMaker(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 60,
                                                                    color:
                                                                        const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            144,
                                                                            30,
                                                                            210),
                                                                    circularRadius:
                                                                        20,
                                                                    child: TMaker(
                                                                        text:
                                                                            "Password",
                                                                        fontSize:
                                                                            25,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w800,
                                                                        color: Colors
                                                                            .white)))),
                                                      ],
                                                    ),
                                                  ));
                                            });
                                      },
                                      child: const Text("Ok"))
                                ],
                              );
                            },
                          );
                        },
                        child: CMaker(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 6,
                                spreadRadius: .03,
                                color: Color.fromARGB(58, 0, 0, 0)),
                          ],
                          padding: const EdgeInsets.all(10),
                          circularRadius: 25,
                          margin: const EdgeInsets.only(bottom: 30),
                          color: const Color.fromARGB(255, 233, 255, 247),
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              CMaker(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: TMaker(
                                      text: "Email",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                              Expanded(flex: 3, child: Container()),
                              TMaker(
                                  text: "k***4@gmail.com",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              Expanded(child: Container()),
                              const Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: const Text(
                                        "Enter the password                  "),
                                    content: CMaker(
                                      height: 60,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        obscureText: obscureText,
                                        decoration: InputDecoration(
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 192, 192, 192)),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 192, 192, 192)),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            label: const Text(
                                              "Password",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 192, 192, 192)),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Cancel",
                                          )),
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        "enter the new Number"),
                                                    content: CMaker(
                                                      height: 80,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Form(
                                                        key: NewKey1,
                                                        child: TextFormField(
                                                          onSaved: (newValue) {
                                                            NewTeacherPhoneNumber =
                                                                newValue!;
                                                          },
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "الحقل فارغ";
                                                            }
                                                            if (!value
                                                                    .startsWith(
                                                                        "01") &&
                                                                !value
                                                                    .startsWith(
                                                                        "05")) {
                                                              return "الرقم يجب ان يبدا الرقمين 01 او 05";
                                                            }
                                                            if (value
                                                                    .startsWith(
                                                                        "01") &&
                                                                value.length !=
                                                                    11) {
                                                              return "الرقم يجب ان يكون 11 رقم";
                                                            }
                                                            if (value
                                                                    .startsWith(
                                                                        "05") &&
                                                                value.length !=
                                                                    10) {
                                                              return "الرقم يجب ان يكون 10 رقم";
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              192,
                                                                              192,
                                                                              192)),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30)),
                                                                  errorBorder: OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              192,
                                                                              192,
                                                                              192)),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30)),
                                                                  label:
                                                                      const Text(
                                                                    "New Number",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                                                                      borderRadius: BorderRadius.circular(30)),
                                                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                                        ),
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              "Cancel")),
                                                      TextButton(
                                                          onPressed: () async {
                                                            if (NewKey1
                                                                .currentState!
                                                                .validate()) {
                                                              NewKey1
                                                                  .currentState!
                                                                  .save();
                                                              OverlayLoadingProgress
                                                                  .start(
                                                                context,
                                                                widget: CMaker(
                                                                  circularRadius:
                                                                      15,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      198,
                                                                      255,
                                                                      255,
                                                                      255),
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3.6,
                                                                  padding: EdgeInsets.all(
                                                                      MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          13),
                                                                  child:
                                                                      const AspectRatio(
                                                                    aspectRatio:
                                                                        1,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: Colors
                                                                          .blue,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          2));
                                                              //edit the Email in the database if there is no one else using it and return true or false
                                                              OverlayLoadingProgress
                                                                  .stop();
                                                              if (true) {
                                                                PanaraInfoDialog
                                                                    .show(
                                                                  context,
                                                                  title:
                                                                      "Success",
                                                                  message:
                                                                      "the number has changed",
                                                                  buttonText:
                                                                      "Okay",
                                                                  onTapDismiss:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  panaraDialogType:
                                                                      PanaraDialogType
                                                                          .success,
                                                                  barrierDismissible:
                                                                      false,
                                                                );
                                                              } else {
                                                                PanaraInfoDialog
                                                                    .show(
                                                                  context,
                                                                  title:
                                                                      "Sorry",
                                                                  message:
                                                                      "Somthing went wrong",
                                                                  buttonText:
                                                                      "Okay",
                                                                  onTapDismiss:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    NewTeacherEmail =
                                                                        "";
                                                                  },
                                                                  panaraDialogType:
                                                                      PanaraDialogType
                                                                          .error,
                                                                  barrierDismissible:
                                                                      true,
                                                                );
                                                              }
                                                            }
                                                          },
                                                          child:
                                                              const Text("Ok")),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: const Text(
                                            "ok",
                                          )),
                                    ]);
                              });
                        },
                        child: CMaker(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 6,
                                spreadRadius: .03,
                                color: Color.fromARGB(58, 0, 0, 0)),
                          ],
                          padding: const EdgeInsets.all(10),
                          circularRadius: 25,
                          margin: const EdgeInsets.only(bottom: 30),
                          color: const Color.fromARGB(255, 233, 255, 247),
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              CMaker(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: TMaker(
                                      text: "Phone",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                              Expanded(flex: 3, child: Container()),
                              TMaker(
                                  text: "+2010**83",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              Expanded(child: Container()),
                              const Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      )),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                              flex: 3,
                              child: CMaker(
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 6,
                                      spreadRadius: .03,
                                      color: Color.fromARGB(58, 0, 0, 0)),
                                ],
                                padding: const EdgeInsets.all(10),
                                circularRadius: 25,
                                margin: const EdgeInsets.only(bottom: 30),
                                color: const Color.fromARGB(255, 233, 255, 247),
                                height: 80,
                                child: Row(
                                  children: [
                                    Expanded(child: Container()),
                                    CMaker(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: TMaker(
                                            text: "Rate us",
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0))),
                                    Expanded(child: Container()),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ]))
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
