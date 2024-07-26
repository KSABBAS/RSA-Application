import 'package:edu_academy/MobileView/TeacherMainPage.dart';
import 'package:edu_academy/MobileView/ThirdPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';

class TeacherHomeWorkPage extends StatefulWidget {
  TeacherHomeWorkPage(
    {super.key, required this.ListOfGrades, required this.SubjectName});
  List ListOfGrades;
  String SubjectName;
  @override
  State<TeacherHomeWorkPage> createState() => _TeacherHomeWorkPageState();
}

bool GradeHomeWorkIsOppened = false;
int GradeHomeWorkOppenedIndex = 0;

class _TeacherHomeWorkPageState extends State<TeacherHomeWorkPage> {
  @override
  Widget build(BuildContext context) {
    if (GradeHomeWorkIsOppened) {
      // الصفحه الثانية
      return CMaker(
        height: 730,
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      GradeHomeWorkIsOppened = false;
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
                        text: "Grade ${GradeHomeWorkOppenedIndex + 1} Homework",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            
                  CMaker(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(61, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            spreadRadius: .06)
                      ],
                      circularRadius: 20,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                      height: 450,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: ListView.builder(
                        itemCount: ListOfGrades.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CMaker(
                                height: 70,
                                alignment: Alignment.center,
                                child: ListTile(
                                    trailing: Column(
                                      children: [
                                        TMaker(
                                                  text: "State",
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color.fromARGB(255, 0, 0, 0)),
                                        Padding(padding: EdgeInsets.only(bottom: 5)),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                            });
                                          },
                                          child: CMaker(
                                            circularRadius: 15,
                                            alignment: Alignment.center,
                                              height: 30,
                                              width: 80,
                                              color: Color.fromARGB(255, 159, 211, 211),
                                              child: TMaker(
                                                  text: "check",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),),
                                      ],
                                    ),
                                    subtitle: TMaker(textAlign: TextAlign.start,text: "Last solved : 00:00", fontSize: 15, fontWeight:FontWeight.w600, color:const Color.fromARGB(119, 0, 0, 0)),
                                    leading: Image.asset("images/Person.png"),
                                    title: TMaker(
                                        textAlign: TextAlign.start,
                                        text: widget.ListOfGrades[GradeHomeWorkOppenedIndex]
                                                    [1][index]
                                                .split(" ")[0] ,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 0, 0, 0),
                                      ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20),),
                            ],
                          );
                        },
                      )),
                      Padding(padding: EdgeInsets.only(bottom: 30),),
                      InkWell(
                        onTap: () {
                          
                        },
                        child: CMaker(
                          height: 70,
                          boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(61, 0, 0, 0),
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              spreadRadius: .06)
                        ],
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          circularRadius: 15,
                          child: Row(children: [
                            Expanded(flex:2,child:Container()),
                          TMaker(
                            text: "Edit old Homworks",
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                            Expanded(child:Container()),
                            Icon(Icons.edit),
                            Expanded(flex:2,child:Container()),
                                          ],)),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10),),
                      InkWell(
                        onTap: () {
                          
                        },
                        child: CMaker(
                          height: 70,
                          boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(61, 0, 0, 0),
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              spreadRadius: .06)
                        ],
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          circularRadius: 15,
                          child: Row(children: [
                            Expanded(flex:2,child:Container()),
                          TMaker(
                            text: "Add new Homworks",
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                            Expanded(child:Container()),
                            Icon(Icons.edit_document),
                            Expanded(flex:2,child:Container()),
                                          ],)),
                      ),
                ],
        ),
      );
    } else {
      // الصفحة الاولى
      return Column(
        children: [
          CMaker(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(61, 0, 0, 0),
                    offset: Offset(2, 2),
                    blurRadius: 10,
                    spreadRadius: .06)
              ],
              circularRadius: 13,
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: TMaker(
                  text: "Homeworks",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          CMaker(
              margin: EdgeInsets.symmetric(horizontal: 20),
              circularRadius: 20,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(61, 0, 0, 0),
                    offset: Offset(2, 2),
                    blurRadius: 10,
                    spreadRadius: .06)
              ],
              height: PageHeight(context) - 265,
              padding: EdgeInsets.only(top: 20),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: CMaker(
                height: PageHeight(context) - 350,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CMaker(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(61, 0, 0, 0),
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                  spreadRadius: .06)
                            ],
                            circularRadius: 15,
                            color: Color.fromARGB(255, 233, 255, 247),
                            height: 70,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 20)),
                                TMaker(
                                    text: "Grade ${index + 1}",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                Expanded(child: Container()),
                                MaterialButton(
                                  height: 35,
                                  minWidth: 50,
                                  color: Color.fromARGB(255, 54, 244, 92),
                                  onPressed: () {
                                    setState(() {
                                      GradeHomeWorkIsOppened = true;
                                      GradeHomeWorkOppenedIndex = index;
                                    });
                                  },
                                  child: TMaker(
                                      text: "فتح",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Padding(padding: EdgeInsets.only(right: 20)),
                              ],
                            )),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                      ],
                    );
                  },
                ),
              ))
        ],
      );
    }
  }
}
