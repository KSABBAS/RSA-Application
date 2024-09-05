import 'package:edu_academy/AdminPages/AdminMainPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/StudentPages/SecondPageContents.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_off_switch/on_off_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminSocendPageContenets extends StatefulWidget {
  AdminSocendPageContenets({super.key, required this.AdminName});
  String AdminName;
  @override
  State<AdminSocendPageContenets> createState() =>
      _AdminSocendPageContenetsState();
}

bool stringToBool(String value) {
  print("stringToBool ${value} ${value.toLowerCase() == 'true'}");
  return value.toLowerCase() == 'true';
}

bool TeacherOpend = false;
int TeacherSelected = 0;
// bool TeacherState = ;
String TeacherSubject1 = "null";
String TeacherSubject2 = "null";
String TeacherSubject3 = "null";

class _AdminSocendPageContenetsState extends State<AdminSocendPageContenets> {
  final dbService = DatabaseService();
  @override
  Teacher_data() async {
    var da_ = await dbService.FiGet_all_users_data("Teacher");
    Teachers = [];
    for (var i in da_) {
      Teachers.add([
        i['photo'],
        i['name'],
        i['email'],
        i['phone'],
        i['state'],
        i.id,
        [i['Subject1'], i['Subject2'], i['Subject3']]
      ]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    late Widget SecondPageBody;
    Widget Logo = InkWell(onTap: () {}, child: Image.asset("images/Book.png"));
    Widget StudentNameTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        widget.AdminName,
        style: TextStyle(
            fontSize: (PageWidth(context) < 550)
                ? 17
                : (PageHeight(context) < 900)
                    ? 20
                    : 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 5, 123, 151)),
      ),
    );
    Widget StateTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        "Admin",
        style: TextStyle(
            fontSize: (PageWidth(context) < 550)
                ? 17
                : (PageHeight(context) < 900)
                    ? 20
                    : 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 89, 89, 87)),
      ),
    );
    Widget LogOutButton = InkWell(
      onTap: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
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
    );
    if (TeacherOpend) {
      SecondPageBody = CMaker(
          child: Column(
        children: [
          Container(
              width: double.infinity,
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
              height: 80,
              child: Row(
                children: [
                  Expanded(child: SizedBox(width: 30, height: 30, child: Logo)),
                  Expanded(flex: 3, child: StudentNameTC),
                  Expanded(flex: 2, child: StateTC),
                  Expanded(child: LogOutButton)
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          CMaker(
              height: 70,
              width: double.infinity,
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          Teacher_data();
                          TeacherOpend = false;
                        });
                      },
                      child: CMaker(
                          height: 50,
                          width: 50,
                          circularRadius: 50,
                          child: Icon(Icons.arrow_back))),
                  Expanded(child: Container()),
                  TMaker(
                      text: "Informations",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  Expanded(child: Container()),
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(
              child: CMaker(
            margin: EdgeInsetsDirectional.only(bottom: 20, start: 20, end: 20),
            width: double.infinity,
            color: Colors.white,
            circularRadius: 20,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 6,
                  spreadRadius: .03,
                  color: Color.fromARGB(82, 0, 0, 0)),
            ],
            child: ListView(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                CMaker(
                  height: 130,
                  width: 130,
                  child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(Teachers[TeacherSelected][0])),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                CMaker(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TMaker(
                      text: Teachers[TeacherSelected][1],
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                CMaker(
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                              text: Teachers[TeacherSelected][2],
                              fontSize: (PageWidth(context) < 550)
                                  ? 20
                                  : (PageHeight(context) < 900)
                                      ? 40
                                      : 40,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                CMaker(
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                              text: Teachers[TeacherSelected][3],
                              fontSize: (PageWidth(context) < 550)
                                  ? 20
                                  : (PageHeight(context) < 900)
                                      ? 40
                                      : 40,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                CMaker(
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                              text: Teachers[TeacherSelected][5],
                              fontSize: (PageWidth(context) < 550)
                                  ? 20
                                  : (PageHeight(context) < 900)
                                      ? 40
                                      : 40,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                (Teachers[TeacherSelected][6][0] != "null")
                    ? InkWell(
                        onTap: () {
                          Get.to(() => ChangeSubjectsAndGrades(
                              TeacherSelected: TeacherSelected,
                              TeacherSubject: TeacherSubject1));
                        },
                        child: CMaker(
                          margin:
                              EdgeInsets.only(bottom: 20, right: 20, left: 20),
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
                                      text: () {
                                        String out = '';
                                        for (var i in Teachers[TeacherSelected]
                                            [6]) {
                                          if (i == "null") continue;
                                          print("1# i $i");
                                          out = out + "${i[0]}";
                                          for (var j
                                              in (i as List).sublist(1)) {
                                            out = out + "\n -$j";
                                          }
                                          out = out + "\n";
                                        }
                                        print("1# out $out");
                                        return out;
                                      }(),
                                      fontSize: (PageWidth(context) < 550)
                                          ? 20
                                          : (PageHeight(context) < 900)
                                              ? 40
                                              : 40,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                              Expanded(child: Container()),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                (Teachers[TeacherSelected][6][1] != "null")
                    ? InkWell(
                        onTap: () {
                          Get.to(() => ChangeSubjectsAndGrades(
                              TeacherSelected: TeacherSelected,
                              TeacherSubject: TeacherSubject2));
                        },
                        child: CMaker(
                          margin:
                              EdgeInsets.only(bottom: 20, right: 20, left: 20),
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
                                      text: () {
                                        String out = '';
                                        for (var i in Teachers[TeacherSelected]
                                            [6]) {
                                          if (i == "null") continue;
                                          print("1# i $i");
                                          out = out + "${i[0]}";
                                          for (var j
                                              in (i as List).sublist(1)) {
                                            out = out + "\n -$j";
                                          }
                                          out = out + "\n";
                                        }
                                        print("1# out $out");
                                        return out;
                                      }(),
                                      fontSize: (PageWidth(context) < 550)
                                          ? 20
                                          : (PageHeight(context) < 900)
                                              ? 40
                                              : 40,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                              Expanded(child: Container()),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                (Teachers[TeacherSelected][6][2] != "null")
                    ? InkWell(
                        onTap: () {
                          Get.to(() => ChangeSubjectsAndGrades(
                              TeacherSelected: TeacherSelected,
                              TeacherSubject: TeacherSubject3));
                        },
                        child: CMaker(
                          margin:
                              EdgeInsets.only(bottom: 20, right: 20, left: 20),
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
                                      text: () {
                                        String out = '';
                                        for (var i in Teachers[TeacherSelected]
                                            [6]) {
                                          if (i == "null") continue;
                                          print("1# i $i");
                                          out = out + "${i[0]}";
                                          for (var j
                                              in (i as List).sublist(1)) {
                                            out = out + "\n -$j";
                                          }
                                          out = out + "\n";
                                        }
                                        print("1# out $out");
                                        return out;
                                      }(),
                                      fontSize: (PageWidth(context) < 550)
                                          ? 20
                                          : (PageHeight(context) < 900)
                                              ? 40
                                              : 40,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                              Expanded(child: Container()),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                CMaker(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CMaker(
                    margin: EdgeInsets.symmetric(horizontal: 20),
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
                    width: 250,
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        CMaker(
                            padding: EdgeInsets.only(right: 10),
                            child: TMaker(
                                text: "Activate",
                                fontSize: (PageWidth(context) < 550)
                                    ? 20
                                    : (PageHeight(context) < 900)
                                        ? 40
                                        : 40,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                        Expanded(child: Container()),
                        OnOffSwitch(
                          value: () {
                            return stringToBool(Teachers[TeacherSelected][4]);
                          }(),
                          onChanged: (bool newValue) async {
                            await dbService.FiChange_state(
                                'Teacher',
                                Teachers[TeacherSelected][5],
                                stringToBool(Teachers[TeacherSelected][4]));
                            setState(() {
                              Teacher_data();
                              // TeacherState = newValue;
                            });
                          },
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 40)),
              ],
            ),
          )),
        ],
      ));
    } else {
      SecondPageBody = CMaker(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
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
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(width: 30, height: 30, child: Logo)),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StateTC),
                      Expanded(child: LogOutButton)
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CMaker(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Colors.white,
                      alignment: Alignment.center,
                      circularRadius: 20,
                      height: 70,
                      width: 200,
                      child: TMaker(
                          text: "Teachers",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black))),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CMaker(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Colors.white,
                      alignment: Alignment.center,
                      circularRadius: 20,
                      height: 70,
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          TMaker(
                              text: "Number : ${Teachers.length}",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                          Expanded(child: Container()),
                          TMaker(
                              text: () {
                                int conter = 0;
                                for (var i in Teachers) {
                                  if (i[4] == 'true') conter += 1;
                                }
                                return "Active : $conter";
                              }(),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 65, 215, 54)),
                          Expanded(child: Container()),
                        ],
                      ))),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(
                child: CMaker(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CMaker(
                        padding: const EdgeInsets.only(top: 20),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(82, 0, 0, 0)),
                        ],
                        color: Colors.white,
                        alignment: Alignment.center,
                        circularRadius: 20,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: Teachers.length, // items
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  TeacherOpend = true;
                                  TeacherSelected = index;
                                });
                              },
                              child: CMaker(
                                  circularRadius: 20,
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 6,
                                        spreadRadius: .03,
                                        color: Color.fromARGB(82, 0, 0, 0)),
                                  ],
                                  height: 80,
                                  alignment: Alignment.center,
                                  color: Color.fromARGB(255, 233, 255, 247),
                                  margin: const EdgeInsets.only(
                                      bottom: 30, right: 20, left: 20),
                                  child: ListTile(
                                    leading: CMaker(
                                        height: 70,
                                        width: 70,
                                        child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                Teachers[index][0]))),
                                    title: TMaker(
                                        text: Teachers[index][1]
                                            .split(' ')
                                            .take(2)
                                            .join(' '),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    trailing: TMaker(
                                        text:
                                            "${(stringToBool(Teachers[index][4])) ? 'Active' : 'Inactive '}",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: (stringToBool(
                                                Teachers[index][4]))
                                            ? Color.fromARGB(255, 73, 213, 31)
                                            : const Color.fromARGB(
                                                255, 224, 9, 9)),
                                  )),
                            );
                          },
                        ))),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ));
    }
    return SecondPageBody;
  }
}

class ChangeSubjectsAndGrades extends StatefulWidget {
  ChangeSubjectsAndGrades(
      {super.key, required this.TeacherSelected, required this.TeacherSubject});
  int TeacherSelected;
  String TeacherSubject;
  @override
  State<ChangeSubjectsAndGrades> createState() =>
      _ChangeSubjectsAndGradesState();
}

class _ChangeSubjectsAndGradesState extends State<ChangeSubjectsAndGrades> {
  List<DropdownMenuItem<String>>? SubjectsMaker(String TeacherSubjectNumber) {
    List<DropdownMenuItem<String>>? list = [
      DropdownMenuItem(
        value: "null",
        child: CMaker(
            child: TMaker(
                text: "null",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
    ];
    for (int i = 0; i < Subjects.length; i++) {
      list.add(
        DropdownMenuItem(
          value: Subjects[i][1],
          child: CMaker(
              child: TMaker(
                  text: Subjects[i][1],
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
      );
    }
    return list;
  }

  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          CMaker(
              height: PageHeight(context),
              color: Colors.white,
              circularRadius: 20,
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  CMaker(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: DropdownButton<String>(
                      items: SubjectsMaker(widget.TeacherSubject),
                      value: widget.TeacherSubject,
                      onChanged: (s1) {
                        widget.TeacherSubject = s1!.toString();
                        setState(() {
                        });
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  CMaker(
                      height: 600,
                      child: ListView.builder(
                        itemCount: GradesSubjects.keys.length -
                            ((GradesSubjects.keys.length / 2).floor()),
                        itemBuilder: (context, index) {
                          bool SelectedCheckBoxGrade = false;
                          return Row(
                            children: [
                              Expanded(
                                  child: CMaker(
                                margin:
                                    EdgeInsets.only(right: 7, left: 20, bottom: 20),
                                circularRadius: 15,
                                color: const Color.fromARGB(255, 233, 255, 247),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: CheckboxListTile(
                                    title: Text(
                                        "${GradesSubjects.keys.elementAt(index * 2)}"),
                                    value: check
                                    // (){
                                    //   for(int i=1;i<Teachers[TeacherSelected][6][0].length;i++){
                                    //     if(int.parse(Teachers[TeacherSelected][6][0][i].split(" ")[1])==(index*2)+1){
                                    //       return true;
                                    //     }
                                    //   }
                                    //   return false;
                                    // }()
                                    ,
                                    onChanged: (newValue) {
                                      setState(() {
                                        check = newValue!;
                                      });
                                      print("=========================" +
                                          "$SelectedCheckBoxGrade");
                                    }),
                              )),
                              (GradesSubjects.keys.length.isEven)
                                  ?Expanded(
                                  child: CMaker(
                                margin:
                                    EdgeInsets.only(right: 7, left: 20, bottom: 20),
                                circularRadius: 15,
                                color: const Color.fromARGB(255, 233, 255, 247),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: CheckboxListTile(
                                    title: Text(
                                        "${GradesSubjects.keys.elementAt((index * 2)+1)}"),
                                    value: check
                                    // () {
                                                //   for (int i = 1;
                                                //       i <
                                                //           Teachers[widget
                                                //                       .TeacherSelected]
                                                //                   [6][0]
                                                //               .length;
                                                //       i++) {
                                                //     if (int.parse(Teachers[widget
                                                //                     .TeacherSelected]
                                                //                 [6][0][i]
                                                //             .split(" ")[1]) ==
                                                //         (index * 2) + 2) {
                                                //       return true;
                                                //     }
                                                //   }
                                                //   return false;
                                                // }(),
                                    ,
                                    onChanged: (newValue) {
                                      setState(() {
                                        check = newValue!;
                                      });
                                      print("=========================" +
                                          "$SelectedCheckBoxGrade");
                                    }),
                              ))
                                  : Expanded(child: Container()),
                            ],
                          );
                        },
                      )),
                      Padding(padding:EdgeInsets.only(bottom: 150)),
                ],
              )),
        Positioned(bottom: 60,right: (PageWidth(context)-300)/2,child: CMaker(width: 300,child: Row(children: [
          Expanded(child: MyButton(onTap: () {
            
          }, buttonHeight: 70,buttonColor: Colors.red,text: "Cancel")),
          Padding(padding:EdgeInsets.only(left: 20)),
          Expanded(child: MyButton(onTap: () {
            
          },buttonHeight: 70,buttonColor: const Color.fromARGB(255, 27, 255, 42),text: "Ok")),
        ],)))
        ],
      ),
    );
  }
}
