// import 'dart:convert';
import 'dart:developer';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/view/TeacherPages/Notifications.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/PageOne/Page.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/PageTwo/Page.dart';
import 'package:edu_academy/view/TeacherPages/TeacherProfilePage.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/SecondPage.dart';
import 'package:edu_academy/view/TeacherPages/TeacherThirdPageContents.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

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

XFile? Avatar;
XFile? ProfileAvatar;

String ProfileSubjectsAvailable = "";
// data base start
String Teacher_Id = '';
List subjects_ = [];
String subjects_string = '';
Map<String, Map<String, List<dynamic>>> sub_data = {};
String Teacher_role = '';

bool stringToBool(String value) {
  print("stringToBool $value ${value.toLowerCase() == 'true'}");
  return value.toLowerCase() == 'true';
}

// data base end
bool ThereIsNotifications = () {
  bool result = false;
  for (int i = 0; TeacherNotiFications.length != i; i++) {
    if (TeacherNotiFications[i][4] == false) {
      result = true;
      break;
    }
  }
  print(result);
  return result;
}();

bool TeacherMainPageIsLoading = true;

class _TeacherMainPageState extends State<TeacherMainPage> {
  bool ConnectedToInternet = true;
  // TeacherData.ListOfGrades = [];
  // data base start
  final dbService = DatabaseService();
  late Future<void> _dataFuture;

  @override
  void initState() {
    super.initState();
    final listener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          print("================================\nConnected");
          setState(() {
            ConnectedToInternet = true;
          });
          break;
        case InternetStatus.disconnected:
          print("================================\nDisconnected");
          setState(() {
            ConnectedToInternet = false;
          });
          break;
      }
    });
    _dataFuture = _initializeData();
  }

  Future<void> _initializeData() async {
    GradesAndsubjects.GradesSubjects = await dbService.FiGet_allSub_indexs();
    GradesAndsubjects.Subjects = await dbService.FiGet_allSub_data();
    TeacherData.ListOfGrades = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = await prefs.getStringList('id');
    if (items != null && items.isNotEmpty) {
      TeacherData.name = items[2].split("-")[0];
      TeacherData.name =
          "${TeacherData.name.split(" ")[0]} ${TeacherData.name.split(" ")[1]}"
              .toTitleCase;
      // start subject as list to use or add a name
      subjects_ = items[2].split("-").sublist(1);
      subjects_.removeWhere((item) => item == 'null');
      Teacher_Id = items[0].split("#")[1];
      Teacher_role = items[0].toString().split("#")[0];
      TeacherData.teacher_profile_data =
          await dbService.FiGet_profile_data(Teacher_Id, Teacher_role)
              as Map<String, dynamic>;
      TeacherData.AccountActivation =
          stringToBool(TeacherData.teacher_profile_data['state']);
      subjects_string = items[2]
          .split('-')
          .sublist(1)
          .map((subject) =>
              subject.replaceAll(RegExp(r"[\[\]']"), '').split(', ')[0])
          .where((subject) => subject != 'null')
          .join('-');
      Map<String, Map<String, List<dynamic>>> data0 =
          await dbService.fiGrades_and_Students(Teacher_Id, subjects_);
      sub_data = data0;
      int index_ = 0;

      for (String i in sub_data.keys) {
        TeacherData.TeacherSubjects[index_] = i;
        index_++;
      }
      TeacherData.Subject1 = TeacherData.TeacherSubjects[0];
      TeacherData.Subject2 = TeacherData.TeacherSubjects[1];
      TeacherData.Subject3 = TeacherData.TeacherSubjects[2];
      print("sub_data $sub_data");
      print("TeacherData.TeacherSubjects $TeacherData.TeacherSubjects");
      print(
          "sub_data[SubjectThatIsSelected]!.keys ${sub_data[TeacherData.SubjectThatIsSelected]}");
      if (sub_data.isNotEmpty) {
        for (var i in sub_data[TeacherData.SubjectThatIsSelected]!.keys) {
          print("i $i");
          print("ii ${sub_data[TeacherData.SubjectThatIsSelected]![i]}");
          List gg = [];
          for (var j in sub_data[TeacherData.SubjectThatIsSelected]![i]!) {
            gg.add(j);
          }
          TeacherData.ListOfGrades.add([i, gg]);
          gg = [];
        }
      }
      // for (var i in sub_data[TeacherData.SubjectThatIsSelected]!.keys) {
      //   print(i);
      // }

      setState(() {
        TeacherMainPageIsLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThereIsNotifications = () {
      bool result = false;
      for (int i = 0; TeacherNotiFications.length != i; i++) {
        if (TeacherNotiFications[i][4] == false) {
          result = true;
          break;
        }
      }
      print(result);
      return result;
    }();
    print("start .. build ");

    late Widget TeacherMainPageBody;
    if (TeacherData.Subject2.toString() != "null" &&
        TeacherData.Subject3.toString() == "null") {
      ProfileSubjectsAvailable =
          "${TeacherData.Subject1.toString()} - ${TeacherData.Subject2.toString()}";
    } else if (TeacherData.Subject2.toString() == "null" &&
        TeacherData.Subject3.toString() == "null") {
      ProfileSubjectsAvailable = TeacherData.Subject1.toString();
    } else {
      ProfileSubjectsAvailable =
          "${TeacherData.Subject1.toString()} - ${TeacherData.Subject2.toString()} - ${TeacherData.Subject3.toString()}";
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    List<Widget> Pages = [
      PageOne(Refresh: () {
        setState(() {});
      }, InitData: () {
        _initializeData();
      }),
      PageTwo(
        Refresh: () {
          setState(() {});
        },
        InitData: () {
          _initializeData();
        },
      ),
          (PageWidth(context) >= 550 && PageHeight(context) < 900)
          ? Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      height: 80,
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
                          Expanded(
                            child: Container(
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
                          ),
                          Expanded(
                            flex: 5,
                            child: CMaker(
                              height: 80,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CMaker(
                                      padding:
                                          const EdgeInsets.only(bottom: 13),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        TeacherData.name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 5, 123, 151)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Builder(
                                        builder: (context) {
                                          if (TeacherData.Subject1 != "null" &&
                                              TeacherData.Subject2 == "null" &&
                                              TeacherData.Subject3 == "null") {
                                            TeacherData.numberOfSubjects = 1;
                                            return CMaker(
                                              padding: const EdgeInsets.only(
                                                  bottom: 13),
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                TeacherData.Subject1,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 89, 89, 87)),
                                              ),
                                            );
                                          }
                                          if (TeacherData.Subject1 != "null" &&
                                              TeacherData.Subject2 != "null" &&
                                              TeacherData.Subject3 == "null") {
                                            TeacherData.numberOfSubjects = 2;
                                            return CMaker(
                                              alignment: Alignment.bottomCenter,
                                              child: DropdownButton(
                                                underline: const SizedBox(
                                                  height: 0,
                                                  width: 0,
                                                ),
                                                value: TeacherData
                                                    .SubjectThatIsSelected,
                                                items: [
                                                  DropdownMenuItem(
                                                    value: TeacherData.Subject1,
                                                    child: Text(
                                                      TeacherData.Subject1,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              255, 89, 89, 87)),
                                                    ),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: TeacherData.Subject2,
                                                    child: Text(
                                                      TeacherData.Subject2,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              255, 89, 89, 87)),
                                                    ),
                                                  ),
                                                ],
                                                onChanged: (value) {
                                                  setState(() {
                                                    TeacherData
                                                            .SubjectThatIsSelected =
                                                        value.toString();
                                                    _initializeData();
                                                  });
                                                },
                                              ),
                                            );
                                          } else {
                                            TeacherData.numberOfSubjects = 3;
                                            return CMaker(
                                              alignment: Alignment.bottomCenter,
                                              child: DropdownButton(
                                                underline: const SizedBox(
                                                  height: 0,
                                                  width: 0,
                                                ),
                                                value: TeacherData
                                                    .SubjectThatIsSelected,
                                                items: [
                                                  DropdownMenuItem(
                                                    value: TeacherData.Subject1,
                                                    child: Text(
                                                      TeacherData.Subject1,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              255, 89, 89, 87)),
                                                    ),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: TeacherData.Subject2,
                                                    child: Text(
                                                      TeacherData.Subject2,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              255, 89, 89, 87)),
                                                    ),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: TeacherData.Subject3,
                                                    child: Text(
                                                      TeacherData.Subject3,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              255, 89, 89, 87)),
                                                    ),
                                                  ),
                                                ],
                                                onChanged: (value) {
                                                  setState(() {
                                                    TeacherData
                                                            .SubjectThatIsSelected =
                                                        value.toString();
                                                    _initializeData();
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
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              Get.to(() => const TeacherNotificationsPage());
                            },
                            child: Container(
                              width: 70,
                              padding: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10)),
                              height: (PageWidth(context) < 550) ? 50 : 100,
                              child: Stack(
                                children: [
                                  Positioned(
                                      right: 15,
                                      top: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: (ThereIsNotifications)
                                                ? Colors.red
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 7,
                                        width: 7,
                                      )),
                                  Positioned(
                                    right: 15,
                                    top: 10,
                                    child: Icon(
                                      Icons.notifications,
                                      size: (PageWidth(context) < 550)
                                          ? 25
                                          : (PageHeight(context) < 900)
                                              ? 30
                                              : 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    TeacherThirdPageContents(
                      ListOfGrades: TeacherData.ListOfGrades,
                      SubjectName: SubjectName,
                    )
                  ],
                ),
              ),
            )
          : Container(
              child: ListView(
                children: [
                  Container(
                    height: 80,
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
                        Expanded(
                          child: Container(
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
                        ),
                        Expanded(
                          flex: 5,
                          child: CMaker(
                            height: 80,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: CMaker(
                                    padding: const EdgeInsets.only(bottom: 13),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      TeacherData.teacher_profile_data["name"],
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(255, 5, 123, 151)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        if (TeacherData.Subject1 != "null" &&
                                            TeacherData.Subject2 == "null" &&
                                            TeacherData.Subject3 == "null") {
                                          TeacherData.numberOfSubjects = 1;
                                          return CMaker(
                                            padding: const EdgeInsets.only(
                                                bottom: 13),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              TeacherData.Subject1,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 89, 89, 87)),
                                            ),
                                          );
                                        }
                                        if (TeacherData.Subject1 != "null" &&
                                            TeacherData.Subject2 != "null" &&
                                            TeacherData.Subject3 == "null") {
                                          TeacherData.numberOfSubjects = 2;
                                          return CMaker(
                                            alignment: Alignment.bottomCenter,
                                            child: DropdownButton(
                                              underline: const SizedBox(
                                                height: 0,
                                                width: 0,
                                              ),
                                              value: TeacherData
                                                  .SubjectThatIsSelected,
                                              items: [
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject1,
                                                  child: Text(
                                                    TeacherData.Subject1,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject2,
                                                  child: Text(
                                                    TeacherData.Subject2,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  TeacherData
                                                          .SubjectThatIsSelected =
                                                      value.toString();
                                                  _initializeData();
                                                });
                                              },
                                            ),
                                          );
                                        } else {
                                          TeacherData.numberOfSubjects = 3;
                                          return CMaker(
                                            alignment: Alignment.bottomCenter,
                                            child: DropdownButton(
                                              underline: const SizedBox(
                                                height: 0,
                                                width: 0,
                                              ),
                                              value: TeacherData
                                                  .SubjectThatIsSelected,
                                              items: [
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject1,
                                                  child: Text(
                                                    TeacherData.Subject1,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject2,
                                                  child: Text(
                                                    TeacherData.Subject2,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject3,
                                                  child: Text(
                                                    TeacherData.Subject3,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  TeacherData
                                                          .SubjectThatIsSelected =
                                                      value.toString();
                                                  _initializeData();
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
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Get.to(() => const TeacherNotificationsPage());
                          },
                          child: Container(
                            width: 70,
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10)),
                            height: (PageWidth(context) < 550) ? 50 : 100,
                            child: Stack(
                              children: [
                                Positioned(
                                    right: 15,
                                    top: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: (ThereIsNotifications)
                                              ? Colors.red
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 7,
                                      width: 7,
                                    )),
                                Positioned(
                                  right: 15,
                                  top: 10,
                                  child: Icon(
                                    Icons.notifications,
                                    size: (PageWidth(context) < 550)
                                        ? 25
                                        : (PageHeight(context) < 900)
                                            ? 30
                                            : 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  TeacherThirdPageContents(
                    ListOfGrades: TeacherData.ListOfGrades,
                    SubjectName: SubjectName,
                  )
                ],
              ),
            ),
      (PageWidth(context) >= 550 && PageHeight(context) < 900)
          ? Expanded(
              child: Container(
                  child: ListView(children: [
                Container(
                    height: 80,
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
                        Expanded(
                          child: Container(
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
                        ),
                        Expanded(
                          flex: 5,
                          child: CMaker(
                            height: 80,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: CMaker(
                                    padding: const EdgeInsets.only(bottom: 13),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      TeacherData.name,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(255, 5, 123, 151)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        if (TeacherData.Subject1 != "null" &&
                                            TeacherData.Subject2 == "null" &&
                                            TeacherData.Subject3 == "null") {
                                          TeacherData.numberOfSubjects = 1;
                                          return CMaker(
                                            padding: const EdgeInsets.only(
                                                bottom: 13),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              TeacherData.Subject1,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 89, 89, 87)),
                                            ),
                                          );
                                        }
                                        if (TeacherData.Subject1 != "null" &&
                                            TeacherData.Subject2 != "null" &&
                                            TeacherData.Subject3 == "null") {
                                          TeacherData.numberOfSubjects = 2;
                                          return CMaker(
                                            alignment: Alignment.bottomCenter,
                                            child: DropdownButton(
                                              underline: const SizedBox(
                                                height: 0,
                                                width: 0,
                                              ),
                                              value: TeacherData
                                                  .SubjectThatIsSelected,
                                              items: [
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject1,
                                                  child: Text(
                                                    TeacherData.Subject1,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject2,
                                                  child: Text(
                                                    TeacherData.Subject2,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  TeacherData
                                                          .SubjectThatIsSelected =
                                                      value.toString();
                                                  _initializeData();
                                                });
                                              },
                                            ),
                                          );
                                        } else {
                                          TeacherData.numberOfSubjects = 3;
                                          return CMaker(
                                            alignment: Alignment.bottomCenter,
                                            child: DropdownButton(
                                              underline: const SizedBox(
                                                height: 0,
                                                width: 0,
                                              ),
                                              value: TeacherData
                                                  .SubjectThatIsSelected,
                                              items: [
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject1,
                                                  child: Text(
                                                    TeacherData.Subject1,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject2,
                                                  child: Text(
                                                    TeacherData.Subject2,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject3,
                                                  child: Text(
                                                    TeacherData.Subject3,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  TeacherData
                                                          .SubjectThatIsSelected =
                                                      value.toString();
                                                  _initializeData();
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
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("id");
                              Navigator.pushReplacementNamed(
                                  context, "SplashView");
                            },
                            child: Container(
                              width: 70,
                              padding: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 50,
                              child: const Icon(Icons.logout),
                            ),
                          ),
                        )
                      ],
                    )),
                TeacherProfilePage(
                    TeacherName: TeacherData.teacher_profile_data["name"],
                    TeacherEmail: TeacherData.teacher_profile_data["email"],
                    ProfileSubjectsAvailable: ProfileSubjectsAvailable,
                    TeacherNumber: TeacherData.teacher_profile_data["phone"],
                    TeacherPhoto: TeacherData.teacher_profile_data["photo"],
                    TeacherPassword:
                        TeacherData.teacher_profile_data["password"])
              ])),
            )
          : Container(
              child: ListView(children: [
              Container(
                height: 80,
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
                    Expanded(
                      child: Container(
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
                    ),
                    Expanded(
                      flex: 5,
                      child: CMaker(
                        height: 80,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CMaker(
                                padding: const EdgeInsets.only(bottom: 13),
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  TeacherData.teacher_profile_data["name"],
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 5, 123, 151)),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Builder(
                                  builder: (context) {
                                    if (TeacherData.Subject1 != "null" &&
                                        TeacherData.Subject2 == "null" &&
                                        TeacherData.Subject3 == "null") {
                                      TeacherData.numberOfSubjects = 1;
                                      return CMaker(
                                        padding:
                                            const EdgeInsets.only(bottom: 13),
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          TeacherData.Subject1,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 89, 89, 87)),
                                        ),
                                      );
                                    }
                                    if (TeacherData.Subject1 != "null" &&
                                        TeacherData.Subject2 != "null" &&
                                        TeacherData.Subject3 == "null") {
                                      TeacherData.numberOfSubjects = 2;
                                      return CMaker(
                                        alignment: Alignment.bottomCenter,
                                        child: DropdownButton(
                                          underline: const SizedBox(
                                            height: 0,
                                            width: 0,
                                          ),
                                          value:
                                              TeacherData.SubjectThatIsSelected,
                                          items: [
                                            DropdownMenuItem(
                                              value: TeacherData.Subject1,
                                              child: Text(
                                                TeacherData.Subject1,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 89, 89, 87)),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: TeacherData.Subject2,
                                              child: Text(
                                                TeacherData.Subject2,
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
                                              TeacherData
                                                      .SubjectThatIsSelected =
                                                  value.toString();
                                              _initializeData();
                                            });
                                          },
                                        ),
                                      );
                                    } else {
                                      TeacherData.numberOfSubjects = 3;
                                      return CMaker(
                                        alignment: Alignment.bottomCenter,
                                        child: DropdownButton(
                                          underline: const SizedBox(
                                            height: 0,
                                            width: 0,
                                          ),
                                          value:
                                              TeacherData.SubjectThatIsSelected,
                                          items: [
                                            DropdownMenuItem(
                                              value: TeacherData.Subject1,
                                              child: Text(
                                                TeacherData.Subject1,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 89, 89, 87)),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: TeacherData.Subject2,
                                              child: Text(
                                                TeacherData.Subject2,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 89, 89, 87)),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: TeacherData.Subject3,
                                              child: Text(
                                                TeacherData.Subject3,
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
                                              TeacherData
                                                      .SubjectThatIsSelected =
                                                  value.toString();
                                              _initializeData();
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
                    ),
                    Expanded(
                      child: InkWell(
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
                    )
                  ],
                ),
              ),
              TeacherProfilePage(
                  TeacherName: TeacherData.teacher_profile_data["name"],
                  TeacherEmail: TeacherData.teacher_profile_data["email"],
                  ProfileSubjectsAvailable: ProfileSubjectsAvailable,
                  TeacherNumber: TeacherData.teacher_profile_data["phone"],
                  TeacherPhoto: TeacherData.teacher_profile_data["photo"],
                  TeacherPassword: TeacherData.teacher_profile_data["password"])
            ])),
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
          body: (TeacherData.AccountActivation)
              ? Pages.elementAt(PageIndex)
              : LiquidPullToRefresh(
                  showChildOpacityTransition: false,
                  backgroundColor: const Color.fromARGB(255, 74, 193, 241),
                  color: const Color.fromARGB(255, 233, 255, 247),
                  onRefresh: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    setState(() {
                      _initializeData();
                    });
                  },
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: .4,
                        child: Pages.elementAt(PageIndex),
                      ),
                      CMaker(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: PageHeight(context) - 90,
                          color: const Color.fromARGB(168, 137, 137, 137),
                          child: CMaker(
                            alignment: Alignment.center,
                            circularRadius: 20,
                            width: PageWidth(context) / 1.5,
                            height: PageHeight(context) / 5,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Expanded(child: Container()),
                                TMaker(
                                    text: "Your Account Is Not Activated",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                                Expanded(child: Container()),
                                InkWell(
                                  onTap: () async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.remove("id");
                                    Navigator.pushReplacementNamed(
                                        context, "SplashView");
                                  },
                                  child: CMaker(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: CMaker(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        circularRadius: 15,
                                        color: const Color.fromARGB(
                                            255, 74, 193, 241),
                                        child: TMaker(
                                            text: "Log Out",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                      )),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          )),
                    ],
                  ),
                ));
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
            (TeacherData.AccountActivation)
                ? Pages.elementAt(PageIndex)
                : LiquidPullToRefresh(
                    showChildOpacityTransition: false,
                    backgroundColor: const Color.fromARGB(255, 74, 193, 241),
                    color: const Color.fromARGB(255, 233, 255, 247),
                    onRefresh: () async {
                      await Future.delayed(const Duration(milliseconds: 500));
                      setState(() {
                        _initializeData();
                      });
                    },
                    child: Expanded(
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: .2,
                            child: Pages.elementAt(PageIndex),
                          ),
                          CMaker(
                              width: double.infinity,
                              alignment: Alignment.center,
                              height: PageHeight(context) - 90,
                              child: CMaker(
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 6,
                                      spreadRadius: .03,
                                      color: Color.fromARGB(82, 0, 0, 0)),
                                ],
                                alignment: Alignment.center,
                                circularRadius: 20,
                                width: PageWidth(context) / 1.5,
                                height: PageHeight(context) / 5,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Expanded(child: Container()),
                                    TMaker(
                                        text: "Your Account Is Not Activated",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    Expanded(child: Container()),
                                    InkWell(
                                      onTap: () async {
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.remove("id");
                                        Navigator.pushReplacementNamed(
                                            context, "SplashView");
                                      },
                                      child: CMaker(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: CMaker(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            circularRadius: 15,
                                            color: const Color.fromARGB(
                                                255, 74, 193, 241),
                                            child: TMaker(
                                                text: "Log Out",
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          )),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
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
          body: (TeacherData.AccountActivation)
              ? Pages.elementAt(PageIndex)
              : LiquidPullToRefresh(
                  showChildOpacityTransition: false,
                  backgroundColor: const Color.fromARGB(255, 74, 193, 241),
                  color: const Color.fromARGB(255, 233, 255, 247),
                  onRefresh: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    setState(() {
                      _initializeData();
                    });
                  },
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: .4,
                        child: Pages.elementAt(PageIndex),
                      ),
                      CMaker(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: PageHeight(context) - 90,
                          color: const Color.fromARGB(168, 137, 137, 137),
                          child: CMaker(
                            alignment: Alignment.center,
                            circularRadius: 20,
                            width: PageWidth(context) / 1.5,
                            height: PageHeight(context) / 5,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Expanded(child: Container()),
                                TMaker(
                                    text: "Your Account Is Not Activated",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                                Expanded(child: Container()),
                                InkWell(
                                  onTap: () async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.remove("id");
                                    Navigator.pushReplacementNamed(
                                        context, "SplashView");
                                  },
                                  child: CMaker(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: CMaker(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        circularRadius: 15,
                                        color: const Color.fromARGB(
                                            255, 74, 193, 241),
                                        child: TMaker(
                                            text: "Log Out",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                      )),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          )),
                    ],
                  ),
                ));
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (ConnectedToInternet) {
      print("====================================\nConnected to internet");
      return (TeacherMainPageIsLoading)
          ? const Scaffold(
              backgroundColor: Color.fromARGB(255, 233, 255, 247),
              body: Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 74, 193, 241),
              )))
          : Scaffold(
              backgroundColor: const Color.fromARGB(255, 74, 193, 241),
              body: LiquidPullToRefresh(
                  showChildOpacityTransition: false,
                  backgroundColor: const Color.fromARGB(255, 74, 193, 241),
                  color: const Color.fromARGB(255, 233, 255, 247),
                  onRefresh: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    setState(() {
                      _initializeData();
                    });
                  },
                  child: TeacherMainPageBody),
            );
    } else {
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 233, 255, 247),
          body: LiquidPullToRefresh(
            showChildOpacityTransition: false,
            backgroundColor: const Color.fromARGB(255, 74, 193, 241),
            color: const Color.fromARGB(255, 233, 255, 247),
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 500));
              setState(() {
                _initializeData();
              });
            },
            child: Center(
                child: CMaker(
                    height: 150,
                    width: 270,
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(82, 0, 0, 0)),
                    ],
                    circularRadius: 20,
                    alignment: Alignment.center,
                    child: TMaker(
                        text: "You aren't connected to internet",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black))),
          ));
    }
  }
}
