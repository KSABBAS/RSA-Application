import 'package:edu_academy/MobileView/SecondPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';

class GradesPage extends StatefulWidget {
  GradesPage(
      {super.key, required this.ListOfGrades, required this.SubjectName});
  List ListOfGrades;
  String SubjectName;
  @override
  State<GradesPage> createState() => _GradesPageState();
}

bool GradeIsOpened = false;
bool BooksAreOpened = false;
int GradeOpenedIndex = 0;
String TheMessageDuration = "for 24 hours";
String LastMessage = "";
String CurrentMessage = "";

class _GradesPageState extends State<GradesPage> {
  @override
  Widget build(BuildContext context) {
    if (BooksAreOpened) {
      //صفحة الكتب
      return CMaker(
          height: PageHeight(context) - 165,
          width: PageWidth(context),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Row(
              children: [
                InkWell(
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
                ),
                CMaker(
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
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
          ]));
    }
    if (GradeIsOpened) {
      //الصفحه الثانيه
      return CMaker(
        height: PageHeight(context) - 165,
        width: PageWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 5)),
            Row(
              children: [
                InkWell(
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
                ),
                CMaker(
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
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            InkWell(
              onTap: () {
                setState(() {
                  GradeIsOpened = false;
                  BooksAreOpened = true;
                });
              },
              child: CMaker(
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
                  child: TMaker(
                      text: "go to books and files",
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 0, 0, 0))),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
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
                child: CMaker(padding: EdgeInsets.only(top: 20),
                                      child: ListView.builder(
                                          itemCount: widget
                                              .ListOfGrades[GradeOpenedIndex][1].length,
                                          itemBuilder: (context, StudentIndex) {
                                            return CMaker(
                                                margin: EdgeInsets.only(
                                                    left: 30, bottom: 20),
                                                child: TMaker(
                                                  textAlign: TextAlign.start,
                                                  text: widget
                                                          .ListOfGrades[GradeOpenedIndex]
                                                              [1][StudentIndex]
                                                          .split(" ")[0] +
                                                      " " +
                                                      widget.ListOfGrades[GradeOpenedIndex]
                                                              [1][StudentIndex]
                                                          .split(" ")[1],
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ));
                                          }),
                                    ),),
            Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
              padding: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                height: 100,
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
                child: TMaker(text: LastMessage, fontSize: 15, fontWeight:FontWeight.w600, color:Colors.black)),
            Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                alignment: Alignment.center,
                height: 165,
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
                    Padding(padding: EdgeInsets.only(top: 10)),
                    CMaker(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 15),
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "send a message to all students",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        onChanged: (value) {
                          CurrentMessage = value;
                        },
                        decoration: InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 192, 192, 192)),
                                borderRadius: BorderRadius.circular(15)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 192, 192, 192)),
                                borderRadius: BorderRadius.circular(15)),
                            label: const Text(
                              "enter the message",
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
                                  child: Text("for 2 days"),
                                  value: "for 2 days"),
                              DropdownMenuItem(
                                  child: Text(
                                    "for 3 days",
                                  ),
                                  value: "for 3 days"),
                              DropdownMenuItem(
                                  child: Text("for 4 days"),
                                  value: "for 4 days"),
                              DropdownMenuItem(
                                  child: Text("for 5 days"),
                                  value: "for 5 days"),
                              DropdownMenuItem(
                                  child: Text("for 6 days"),
                                  value: "for 6 days"),
                              DropdownMenuItem(
                                  child: Text("for a week"),
                                  value: "for a week"),
                              DropdownMenuItem(
                                  child: Text("for 2 weeks"),
                                  value: "for 2 weeks"),
                              DropdownMenuItem(
                                  child: Text("for 3 weeks"),
                                  value: "for 3 weeks"),
                              DropdownMenuItem(
                                  child: Text("for a month"),
                                  value: "for a month"),
                            ],
                            onChanged: (value) {
                              setState(() {
                                TheMessageDuration = value!;
                              });
                              print(TheMessageDuration);
                            },
                          ),
                          Expanded(child: Container()),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  LastMessage = CurrentMessage;
                                });
                              },
                              child: CMaker(
                                  circularRadius: 10,
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 35,
                                  color: Color.fromARGB(255, 61, 197, 255),
                                  child: Icon(
                                    Icons.send,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  )))
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      );
    } else {
      //الصفحه الاولى
      return CMaker(
          height: PageHeight(context) - 165,
          width: PageWidth(context),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              itemCount: widget.ListOfGrades.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              GradeIsOpened = true;
                              GradeOpenedIndex = index;
                            });
                          },
                          child: CMaker(
                              color: Color.fromARGB(255, 255, 255, 255),
                              height:
                                  widget.ListOfGrades[index][1].length * 90.0,
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
                                      circularRadius: 20,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      width: double.infinity,
                                      color: Color.fromARGB(255, 61, 197, 255),
                                      child: TMaker(
                                          text: widget.ListOfGrades[index][0],
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                  Padding(padding: EdgeInsets.only(bottom: 30)),
                                  Expanded(
                                    child: CMaker(
                                      child: ListView.builder(
                                          itemCount: widget
                                              .ListOfGrades[index][1].length,
                                          itemBuilder: (context, StudentIndex) {
                                            return CMaker(
                                                margin: EdgeInsets.only(
                                                    left: 30, bottom: 20),
                                                child: TMaker(
                                                  textAlign: TextAlign.start,
                                                  text: widget
                                                          .ListOfGrades[index]
                                                              [1][StudentIndex]
                                                          .split(" ")[0] +
                                                      " " +
                                                      widget.ListOfGrades[index]
                                                              [1][StudentIndex]
                                                          .split(" ")[1],
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ));
                                          }),
                                    ),
                                  )
                                ],
                              ))),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      )
                    ],
                  ),
                );
              }));
    }
  }
}
