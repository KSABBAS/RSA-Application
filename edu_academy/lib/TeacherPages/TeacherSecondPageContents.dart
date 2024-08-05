import 'dart:math';

import 'package:edu_academy/StudentPages/SecondPageContents.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/StudentPages/ThirdPageContents.dart';
import 'package:edu_academy/TeacherPages/TeacherMainPage.dart';
import 'package:flutter/material.dart';

class TeacherSecondPageContents extends StatefulWidget {
  TeacherSecondPageContents(
      {super.key, required this.ListOfGrades, required this.SubjectName});
  List ListOfGrades;
  String SubjectName;
  @override
  State<TeacherSecondPageContents> createState() =>
      _TeacherSecondPageContentsState();
}

bool GradeIsOpened = false;
bool BooksAreOpened = false;
int GradeOpenedIndex = 0;
String TheMessageDuration = "for 24 hours";
String CurrentMessage = "";
String CurrentMessageTime = DateTime.now().toString();

class _TeacherSecondPageContentsState extends State<TeacherSecondPageContents> {
  final TextEditingController _MessageController = TextEditingController();
  List AllMessages = [
    // عينه للتفهيم
    ["Message", "Date", "Duration"]
  ];
  @override
  Widget build(BuildContext context) {
    late Widget SecondPageBody;
    if (BooksAreOpened) {
      print("===================================\nthird page");
      //third page
      Widget ThirdPageBackBotton = InkWell(
        onTap: () {
          setState(() {
            GradeIsOpened = true;
            BooksAreOpened = false;
          });
        },
        child: CMaker(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          child: Icon(Icons.arrow_back),
        ),
      );
      Widget ThirdPageGradeWindow = Expanded(
        child: CMaker(
            alignment: Alignment.center,
            height: 60,
            circularRadius: 20,
            width: PageWidth(context) - 150,
            margin: EdgeInsets.only(left: 20),
            color: Color.fromARGB(255, 61, 197, 255),
            child: TMaker(
                text: widget.ListOfGrades[GradeOpenedIndex][0],
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      );
      Widget BooksAndFilesWindow = CMaker(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(61, 0, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: .06)
        ],
        circularRadius: 20,
        margin: EdgeInsets.symmetric(horizontal: 15),
        color: const Color.fromARGB(255, 255, 255, 255),
        height: PageHeight(context) - 245,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 10)),
            TMaker(
                text: "Books and Files",
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 0, 0)),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            CMaker(
              circularRadius: 20,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: PageHeight(context) - 400,
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CMaker(
                        padding: EdgeInsets.only(left: 20),
                        color: Colors.white,
                        border: Border.all(),
                        circularRadius: 15,
                        alignment: Alignment.centerLeft,
                        height: 80,
                        child: Row(
                          children: [
                            TMaker(
                                textAlign: TextAlign.start,
                                text: "File number ${index + 1}",
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                            Expanded(child: Container()),
                            MaterialButton(
                              color: Colors.red,
                              onPressed: () {},
                              child: TMaker(
                                  text: "حذف",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10))
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                    ],
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            MaterialButton(
              height: 45,
              minWidth: 150,
              color: Color.fromARGB(255, 54, 244, 92),
              onPressed: () {},
              child: TMaker(
                  text: "إضافة",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )
          ],
        ),
      );
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageBody = CMaker(
              height: PageHeight(context) - 145,
              width: PageWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(children: [
                Row(
                  children: [ThirdPageBackBotton, ThirdPageGradeWindow],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                BooksAndFilesWindow
              ]));
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageBody = CMaker(
              height: PageHeight(context) - 145,
              width: PageWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(children: [
                Row(
                  children: [ThirdPageBackBotton, ThirdPageGradeWindow],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                BooksAndFilesWindow
              ]));
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageBody = CMaker(
              height: PageHeight(context) - 145,
              width: PageWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(children: [
                Row(
                  children: [ThirdPageBackBotton, ThirdPageGradeWindow],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                BooksAndFilesWindow
              ]));
        });
      }
    }
    else if (GradeIsOpened) {
      //الصفحه الثانيه
      Widget SecondPageArrowBack = InkWell(
        onTap: () {
          setState(() {
            GradeIsOpened = false;
          });
        },
        child: CMaker(
          width: 70,
          height: 50,
          alignment: Alignment.center,
          child: Icon(Icons.arrow_back),
        ),
      );
      Widget GradeName = Expanded(
        child: CMaker(
            alignment: Alignment.center,
            height: 60,
            circularRadius: 20,
            margin: EdgeInsets.only(left: 20),
            color: Color.fromARGB(255, 61, 197, 255),
            child: TMaker(
                text: widget.ListOfGrades[GradeOpenedIndex][0],
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      );
      Widget GoToBooksWindow = CMaker(
          alignment: Alignment.center,
          height: 60,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(42, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 20,
          width: PageWidth(context) - 60,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              TMaker(
                  text: "books and files",
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0)),
              Expanded(child: Container()),
              Expanded(child: Container()),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  setState(() {
                    GradeIsOpened = false;
                    BooksAreOpened = true;
                  });
                },
                child: CMaker(
                  height: 40,
                  width: 70,
                  color: Color.fromARGB(255, 54, 244, 92),
                  circularRadius: 20,
                  alignment: Alignment.center,
                  child: TMaker(
                      text: "فتح",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Expanded(child: Container()),
            ],
          ));
      Widget StudentsWindow = CMaker(
        alignment: Alignment.center,
        height: 280,
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(42, 0, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: .06)
        ],
        circularRadius: 20,
        width: PageWidth(context) - 60,
        color: Color.fromARGB(255, 255, 255, 255),
        child: CMaker(
          padding: EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: widget.ListOfGrades[GradeOpenedIndex][1].length,
              itemBuilder: (context, StudentIndex) {
                return Column(
                  children: [
                    ListTile(
                      leading: Image.asset("images/Person.png"),
                      title: TMaker(
                        textAlign: TextAlign.start,
                        text: widget.ListOfGrades[GradeOpenedIndex][1]
                                    [StudentIndex]
                                .split(" ")[0] +
                            " " +
                            widget.ListOfGrades[GradeOpenedIndex][1]
                                    [StudentIndex]
                                .split(" ")[1],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                  ],
                );
              }),
        ),
      );
      Widget AllMessagesButton = CMaker(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      child: CMaker(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.topLeft,
                          height: 100.0 + ((AllMessages.length - 1) * 70.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(42, 0, 0, 0),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: .06)
                          ],
                          circularRadius: 20,
                          width: PageWidth(context) - 60,
                          color: Color.fromARGB(255, 255, 255, 255),
                          child: ListView.builder(
                              itemCount: AllMessages.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CMaker(
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      child: TMaker(
                                          textAlign: TextAlign.start,
                                          text: AllMessages[index][0],
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    CMaker(
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      child: TMaker(
                                          textAlign: TextAlign.start,
                                          text:
                                              "Date : ${AllMessages[index][1]}",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                    )
                                  ],
                                );
                              })),
                    );
                  },
                );
              },
              child: Text("All messages")));
      Widget LastMessageWindow = CMaker(
          padding: EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          height: 120,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(42, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 20,
          width: PageWidth(context) - 60,
          color: Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            children: [
              CMaker(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: TMaker(
                    textAlign: TextAlign.start,
                    text: AllMessages[AllMessages.length - 1][0],
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              CMaker(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: TMaker(
                    textAlign: TextAlign.start,
                    text: "Date : ${AllMessages[AllMessages.length - 1][1]}",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ));
      Widget EnterAMessage = CMaker(
          alignment: Alignment.center,
          height: 250,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(42, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 20,
          width: PageWidth(context) - 60,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15),
                  child: TMaker(
                      textAlign: TextAlign.start,
                      text: "send a message to all students",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              Padding(padding: EdgeInsets.only(top: 20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _MessageController,
                  minLines: 1,
                  maxLines: 3,
                  onChanged: (value) {
                    CurrentMessage = value;
                  },
                  decoration: InputDecoration(
                      suffix: InkWell(
                          onTap: () {
                            if (CurrentMessage != "") {
                              setState(() {
                                _MessageController.clear();
                                AllMessages.add([
                                  "$CurrentMessage",
                                  "$CurrentMessageTime",
                                  "$TheMessageDuration"
                                ]);
                                CurrentMessage = "";
                                print(AllMessages);
                              });
                            }
                          },
                          child: CMaker(
                              circularRadius: 10,
                              alignment: Alignment.center,
                              width: 50,
                              height: 35,
                              color: Color.fromARGB(255, 61, 197, 255),
                              child: Icon(
                                Icons.send,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(15)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(15)),
                      label: const Text(
                        "enter a message",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 192, 192, 192)),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    DropdownButton(
                      value: TheMessageDuration,
                      items: [
                        DropdownMenuItem(
                          child: Text("for 24 hours"),
                          value: "for 24 hours",
                        ),
                        DropdownMenuItem(
                            child: Text("for 2 days"), value: "for 2 days"),
                        DropdownMenuItem(
                            child: Text(
                              "for 3 days",
                            ),
                            value: "for 3 days"),
                        DropdownMenuItem(
                            child: Text("for 4 days"), value: "for 4 days"),
                        DropdownMenuItem(
                            child: Text("for 5 days"), value: "for 5 days"),
                        DropdownMenuItem(
                            child: Text("for 6 days"), value: "for 6 days"),
                        DropdownMenuItem(
                            child: Text("for a week"), value: "for a week"),
                        DropdownMenuItem(
                            child: Text("for 2 weeks"), value: "for 2 weeks"),
                        DropdownMenuItem(
                            child: Text("for 3 weeks"), value: "for 3 weeks"),
                        DropdownMenuItem(
                            child: Text("for a month"), value: "for a month"),
                      ],
                      onChanged: (value) {
                        setState(() {
                          TheMessageDuration = value!;
                        });
                        print(TheMessageDuration);
                      },
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              Expanded(child: Container()),
            ],
          ));
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageBody = CMaker(
            width: PageWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    SecondPageArrowBack,
                    GradeName,
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 30)),
                GoToBooksWindow,
                Padding(padding: EdgeInsets.only(top: 30)),
                StudentsWindow,
                Padding(padding: EdgeInsets.only(top: 20)),
                AllMessagesButton,
                LastMessageWindow,
                Padding(padding: EdgeInsets.only(top: 20)),
                EnterAMessage,
                Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageBody = CMaker(
            width: PageWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    SecondPageArrowBack,
                    GradeName,
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 30)),
                GoToBooksWindow,
                Padding(padding: EdgeInsets.only(top: 30)),
                StudentsWindow,
                Padding(padding: EdgeInsets.only(top: 20)),
                AllMessagesButton,
                LastMessageWindow,
                Padding(padding: EdgeInsets.only(top: 20)),
                EnterAMessage,
                Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
          );
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageBody = CMaker(
            width: PageWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: (PageWidth(context) > 900)
                ? Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          SecondPageArrowBack,
                          GradeName,
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 30)),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(
                              flex: 6,
                              child: CMaker(
                                  height: PageHeight(context) - 300,
                                  child: Column(
                                    children: [
                                      Expanded(child: Container()),
                                      Expanded(child: Container()),
                                      GoToBooksWindow,
                                      Expanded(child: Container()),
                                      CMaker(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          alignment: Alignment.centerLeft,
                                          child: StudentsWindow),
                                      Expanded(child: Container()),
                                    ],
                                  ))),
                          Expanded(child: Container()),
                          Expanded(
                            flex: 6,
                            child: CMaker(
                              height: PageHeight(context) - 300,
                              child: ListView(
                                children: [
                                  AllMessagesButton,
                                  LastMessageWindow,
                                  Padding(padding: EdgeInsets.only(top: 20)),
                                  EnterAMessage,
                                ],
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          SecondPageArrowBack,
                          GradeName,
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 30)),
                      GoToBooksWindow,
                      Padding(padding: EdgeInsets.only(top: 30)),
                      StudentsWindow,
                      Padding(padding: EdgeInsets.only(top: 20)),
                      AllMessagesButton,
                      LastMessageWindow,
                      Padding(padding: EdgeInsets.only(top: 20)),
                      EnterAMessage,
                      Padding(padding: EdgeInsets.only(top: 20)),
                    ],
                  ),
          );
        });
      }
    } else {
      //الصفحه الاولى
      Widget GradesList = ListView.builder(
          itemCount: widget.ListOfGrades.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  CMaker(
                      color: Color.fromARGB(255, 255, 255, 255),
                      height: widget.ListOfGrades[index][1].length * 90.0,
                      width: double.infinity,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(70, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            spreadRadius: .06)
                      ],
                      circularRadius: 20,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          CMaker(
                              alignment: Alignment.center,
                              height: 60,
                              circularRadius: 10,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 20)),
                                  TMaker(
                                      text:
                                          "${widget.ListOfGrades[index][0]} - $SubjectThatIsSelected",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                  Expanded(flex: 10, child: Container()),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        GradeIsOpened = true;
                                        GradeOpenedIndex = index;
                                      });
                                    },
                                    child: CMaker(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      color: Color.fromARGB(255, 54, 244, 92),
                                      circularRadius: 20,
                                      child: TMaker(
                                          text: "فتح",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                ],
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 30)),
                          Expanded(
                            child: CMaker(
                              child: ListView.builder(
                                  itemCount:
                                      widget.ListOfGrades[index][1].length,
                                  itemBuilder: (context, StudentIndex) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading:
                                              Image.asset("images/Person.png"),
                                          title: TMaker(
                                            textAlign: TextAlign.start,
                                            text: widget.ListOfGrades[index][1]
                                                        [StudentIndex]
                                                    .split(" ")[0] +
                                                " " +
                                                widget.ListOfGrades[index][1]
                                                        [StudentIndex]
                                                    .split(" ")[1],
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 20),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            );
            ;
          });
      if (PageWidth(context) < 550) {
        setState(() {
          SecondPageBody = CMaker(
              height: PageHeight(context) - 165,
              width: PageWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GradesList);
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        setState(() {
          SecondPageBody = CMaker(
              height: PageHeight(context) - 145,
              width: PageWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GradesList);
        });
      } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
        setState(() {
          SecondPageBody = CMaker(
              height: PageHeight(context) - 110,
              width: PageWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GradesList);
        });
      }
    }
    return SecondPageBody;
  }
}
