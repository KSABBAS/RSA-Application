import 'package:flutter/material.dart';
import 'package:edu_academy/service/Databse_Service.dart';

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

String StudentName = "";
String StudentParentMobileNumber = "";
String StudentMobileNumber = "";
String StudentEmail = "";
String StudentPassword = "";
String StudentConfirmPassword = ""; // add to desgin
String StudentDateOfBirth = "";
String StudentGender = "";
String StudentGrade = "Choose";

var now = DateTime.now();

class _StudentMobileSignUpPageState extends State<StudentMobileSignUpPage> {
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: ListView(
          children: [
            Expanded(
              child: SizedBox(
                height: 250,
                child: Container(
                  decoration: const BoxDecoration(
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
                                    padding: const EdgeInsets.only(left: 20),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.arrow_back)),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 40, 20, 0),
                                        alignment: Alignment.center,
                                        width: 160,
                                        height: 160,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.zero,
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(23000),
                                              bottomRight: Radius.circular(10)),
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        child: const Text(
                                          "Sign up",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Color.fromARGB(
                                                  255, 8, 125, 159),
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 3,
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
            const Padding(padding: EdgeInsets.only(top: 40)),
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
                        Container(
                            alignment: Alignment.centerLeft,
                            child: const Text("Student  ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 8, 125, 159)))),
                        Expanded(
                            child: Container(
                                height: 35,
                                alignment: Alignment.bottomLeft,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromARGB(255, 8, 125, 159),
                                ))),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        StudentName = value;
                      },
                      decoration: InputDecoration(
                          label: const Text(
                            "Full Name",
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
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        StudentParentMobileNumber = value;
                      },
                      decoration: InputDecoration(
                          label: const Text(
                            "Parent Phone Number",
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
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        StudentMobileNumber = value;
                      },
                      decoration: InputDecoration(
                          label: const Row(
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
                                    color: Color.fromARGB(255, 183, 183, 183)),
                              ),
                            ],
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 192, 192, 192)),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        StudentEmail = value;
                      },
                      decoration: InputDecoration(
                          label: const Text(
                            "Email",
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
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        StudentPassword = value;
                      },
                      obscureText: obscureText,
                      decoration: InputDecoration(
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
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Date of birth",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                          flex: 5,
                          child: Container(
                            child: TextField(
                                style: const TextStyle(fontSize: 16),
                                onChanged: (value) {
                                  StudentDayOfBirth = value;
                                  StudentDateOfBirth =
                                      "$StudentDayOfBirth/$StudentMonthOfBirth/$StudentYearOfBirth";
                                },
                                decoration: const InputDecoration(
                                    label: Text(
                                  "Day",
                                  style: TextStyle(fontSize: 12),
                                ))),
                          )),
                      const Text(
                        "  /  ",
                        style: TextStyle(fontSize: 30),
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                            child: TextField(
                              style: const TextStyle(fontSize: 16),
                              onChanged: (value) {
                                StudentMonthOfBirth = value;
                                StudentDateOfBirth =
                                    "$StudentDayOfBirth/$StudentMonthOfBirth/$StudentYearOfBirth";
                              },
                              decoration: const InputDecoration(
                                  label: Text("Month",
                                      style: TextStyle(fontSize: 12))),
                            ),
                          )),
                      const Text(
                        "  /  ",
                        style: TextStyle(fontSize: 30),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          child: TextField(
                            style: const TextStyle(fontSize: 16),
                            onChanged: (value) {
                              StudentYearOfBirth = value;
                              StudentDateOfBirth =
                                  "$StudentDayOfBirth/$StudentMonthOfBirth/$StudentYearOfBirth";
                            },
                            decoration: const InputDecoration(
                                label: Text("Year",
                                    style: TextStyle(fontSize: 12))),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Geneder",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 40)),
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(96, 216, 216, 216),
                              ),
                              child: RadioListTile(
                                  activeColor:
                                      const Color.fromARGB(255, 74, 193, 241),
                                  title: const Text(
                                    "Male",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  value: "Male",
                                  groupValue: StudentGender,
                                  onChanged: (val) {
                                    setState(() {
                                      StudentGender = val.toString();
                                    });
                                  }))),
                      const Padding(padding: EdgeInsets.only(left: 20)),
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(96, 216, 216, 216),
                              ),
                              child: RadioListTile(
                                  activeColor:
                                      const Color.fromARGB(255, 74, 193, 241),
                                  title: const Text("Female",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500)),
                                  value: "Female",
                                  groupValue: StudentGender,
                                  onChanged: (val) {
                                    setState(() {
                                      StudentGender = val.toString();
                                    });
                                  })))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Row(
                    children: [
                      const Text(
                        "Grade",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 30,
                            width: 100,
                            child: DropdownButton(
                                underline: Container(),
                                value: StudentGrade,
                                items: const [
                                  DropdownMenuItem(
                                    value: "Choose",
                                    child: Text("Choose"),
                                  ),
                                  DropdownMenuItem(
                                    value: "KG 1",
                                    child: Text("KG 1"),
                                  ),
                                  DropdownMenuItem(
                                    value: "KG 2",
                                    child: Text("KG 2"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 1",
                                    child: Text("Grade 1"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 2",
                                    child: Text("Grade 2"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 3",
                                    child: Text("Grade 3"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 4",
                                    child: Text("Grade 4"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 5",
                                    child: Text("Grade 5"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 6",
                                    child: Text("Grade 6"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 7",
                                    child: Text("Grade 7"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 8",
                                    child: Text("Grade 8"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 9",
                                    child: Text("Grade 9"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 10",
                                    child: Text("Grade 10"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 11",
                                    child: Text("Grade 11"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Grade 12",
                                    child: Text("Grade 12"),
                                  ),
                                  DropdownMenuItem(
                                    value: "others",
                                    child: Text("others"),
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
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  InkWell(
                    onTap: () {
                      dbService.rlCreate('Students', {
                        "name": StudentName,
                        "phone": StudentMobileNumber,
                        "par_phone": StudentParentMobileNumber,
                        "email": StudentEmail,
                        "password": StudentPassword,
                        "birth_date": StudentDateOfBirth,
                        "gender": StudentGender,
                        "grade": StudentGrade,
                        "state": true
                      });
                      // Navigator.pushNamedAndRemoveUntil(context, "StudentMainPage", (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 74, 193, 241),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "sign up",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "Already have an account ? ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 206, 206, 206),
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "LogInPage");
                            },
                            child: const Text(
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
