import 'package:flutter/material.dart';

class StudentMobileSignUpPage extends StatefulWidget {
  const StudentMobileSignUpPage({super.key});

  @override
  State<StudentMobileSignUpPage> createState() =>
      _StudentMobileSignUpPageState();
}
var obscureText = true;
String StudentDayOfBirth = "";
String StudentMonthOfBirth = "";
String StudentYearOfBirth = "";
String StudentGender = "";
String StudentName = "";
String StudentGrade = "Grade 1";
String StudentEmail = "";
String StudentPassword = "";
String StudentConfirmPassword = "";
String StudentMobileNumber = "";
String StudentParentMobileNumber = "";
String StudentDateOfBirth = "";
int StudentAge = 6;
var now = DateTime.now();

class _StudentMobileSignUpPageState extends State<StudentMobileSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: ListView(
          children: [
            Expanded(
              child: Container(
                height: 250,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                        Color.fromARGB(255, 8, 125, 159),
                        Color.fromARGB(255, 74, 193, 241)
                      ])),
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 20),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.arrow_back)),
                                  ),
                                ),
                                Expanded(flex: 2,
                                  child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(0, 40, 20, 0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Sign up",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color:
                                                  Color.fromARGB(255, 8, 125, 159),
                                              fontWeight: FontWeight.w700),
                                        ),
                                        width: 160,
                                        height: 160,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.zero,
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(23000),
                                              bottomRight: Radius.circular(10)),
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Expanded(flex: 3,
                          child: Column(
                            children: [
                              Expanded(child: Container(),),
                              Expanded(flex: 3,
                                child: Container(
                                    height: double.infinity,
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      "images/Logo.png",
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ],
                          ))
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              height: 1050,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(children: [
                  Container(
                    child: Row(
                      children: [
                        Container(alignment: Alignment.centerLeft,child: Text("Student  ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color:Color.fromARGB(255, 8, 125, 159) ))),
                        Expanded(child: Container(height: 35,alignment: Alignment.bottomLeft,child: Icon(Icons.arrow_forward,color: Color.fromARGB(255, 8, 125, 159),))),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40)),
                  Container(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            "Full Name",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 192, 192, 192)),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            "Gardian Phone Number",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 192, 192, 192)),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "  ( If Avialabe )",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 183, 183, 183)),
                              ),
                            ],
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 192, 192, 192)),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 192, 192, 192)),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    width: 300,
                    height: 40,
                    child: TextField(
                      obscureText: obscureText,
                      decoration: InputDecoration(
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: Icon(Icons.remove_red_eye_outlined),
                          ),
                          label: Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 192, 192, 192)),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date of birth",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(flex: 5,child:Container(
                          child: TextField(
                            style: TextStyle(fontSize: 16),
                            onChanged: (value) {
                              StudentDayOfBirth = value;
                              StudentDateOfBirth =
                                  "$StudentDayOfBirth/$StudentMonthOfBirth/$StudentYearOfBirth";
                            },
                            decoration: InputDecoration(label: Text("Day",style: TextStyle(fontSize: 12),))
                          ),
                        )),
                        Text(
                          "  /  ",
                          style: TextStyle(fontSize: 30),
                        ),
                        Expanded(flex: 5,child:Container(
                          child: TextField(
                            style: TextStyle(fontSize: 16),
                            onChanged: (value) {
                              StudentMonthOfBirth = value;
                              StudentDateOfBirth =
                                  "$StudentDayOfBirth/$StudentMonthOfBirth/$StudentYearOfBirth";
                            },
                            decoration: InputDecoration(label: Text("Month",style: TextStyle(fontSize: 12))),
                          ),
                        )),
                        Text(
                          "  /  ",
                          style: TextStyle(fontSize: 30),
                        ),
                        Expanded(flex: 5,
                          child: Container(
                            child: TextField(
                              style: TextStyle(fontSize: 16),
                              onChanged: (value) {
                              StudentYearOfBirth = value;
                                StudentDateOfBirth =
                                    "$StudentDayOfBirth/$StudentMonthOfBirth/$StudentYearOfBirth";
                              },
                              decoration: InputDecoration(label: Text("Year",style: TextStyle(fontSize: 12))),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                    ],
                    ),
                  Padding(padding: EdgeInsets.only(top: 40)),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Geneder",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                      ),
                  Padding(padding: EdgeInsets.only(top: 40)),
                  Row(
                    children: [
                  Padding(padding: EdgeInsets.only(top: 40)),
                      Expanded(
                          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(96, 216, 216, 216),),child:RadioListTile(
                              activeColor: Color.fromARGB(255, 74, 193, 241),
                              title: Text("Male",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                              value: "Male",
                              groupValue: StudentGender,
                              onChanged: (val) {
                                setState(() {
                                  StudentGender = val.toString();
                                });
                              }))),
                              Padding(padding: EdgeInsets.only(left: 20)),
                      Expanded(
                          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(96, 216, 216, 216),),child:RadioListTile(
                              activeColor: Color.fromARGB(255, 74, 193, 241),
                              title: Text("Female",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                              value: "Female",
                              groupValue: StudentGender,
                              onChanged: (val) {
                                setState(() {
                                  StudentGender = val.toString();
                                });
                              })))
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Row(
                    children: [
                      Text(
                        "Grade",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Container(
                            height: 30,
                            width: 100,
                            child: DropdownButton<String>(
                                underline: Container(),
                                value: StudentGrade,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("KG 1"),
                                    value: "KG 1",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("KG 2"),
                                    value: "KG 2",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 1"),
                                    value: "Grade 1",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 2"),
                                    value: "Grade 2",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 3"),
                                    value: "Grade 3",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 4"),
                                    value: "Grade 4",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 5"),
                                    value: "Grade 5",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 6"),
                                    value: "Grade 6",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 7"),
                                    value: "Grade 7",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 8"),
                                    value: "Grade 8",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 9"),
                                    value: "Grade 9",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 10"),
                                    value: "Grade 10",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 11"),
                                    value: "Grade 11",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Grade 12"),
                                    value: "Grade 12",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("others"),
                                    value: "others",
                                  ),
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    StudentGrade = val.toString();
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 40)),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "StudentMainPage", (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "sign up",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w700),
                      ),
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 74, 193, 241),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40)),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Already have an account ? ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 206, 206, 206),
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "LogInPage");
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 74, 193, 241),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container())
                ]),
              ),
            )
          ],
        ));
  }
}