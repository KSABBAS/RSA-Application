import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';

class ParentSignUpPage extends StatefulWidget {
  const ParentSignUpPage({super.key});
  @override
  State<ParentSignUpPage> createState() => _ParentSignUpPageState();
}

String ParentName = "";
String ParentNumber = "";
String ParentEmail = "";
String ParentPassword = "";
String ParentConfirmPassword = "";

var obscureText = true;
List ll = [2.2];
GlobalKey<FormState> key2 = GlobalKey();

class _ParentSignUpPageState extends State<ParentSignUpPage> {
  String ParentDemoPassword = "";
  String ParentDemoConfirmPassword = "";
  final dbService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    final Sheigt = MediaQuery.of(context).size.height;
    ll.add(Sheigt);
    double Sheight = ll[1];
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Form(
          key: key2,
          child: ListView(
            children: [
              SizedBox(
                height: Sheight / 3,
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
                            flex: 1,
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
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: PageHeight(context) - 50,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.bottomLeft,
                                child: const Text("Student Parent  ",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 8, 125, 159)))),
                            Container(
                                margin: const EdgeInsets.only(top: 13),
                                height: 3,
                                alignment: Alignment.bottomLeft,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromARGB(255, 8, 125, 159),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    SizedBox(
                      height: 80,
                      child: TextFormField(
                        onSaved: (newValue) {
                          ParentName = newValue!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "الحقل فارغ";
                          }
                          if (value.split(" ").length < 3) {
                            return "الاسم يجب ان يكون ثلاثى او رباعى";
                          }
                          return null;
                        },
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
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    SizedBox(
                      height: 80,
                      child: TextFormField(
                        onSaved: (newValue) {
                          ParentNumber = newValue!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "الحقل فارغ";
                          }
                          if (!value.startsWith("01") &&
                              !value.startsWith("05")) {
                            return "الرقم يجب ان يبدا الرقمين 01 او 05";
                          }
                          if (value.startsWith("01") && value.length != 11) {
                            return "الرقم يجب ان يكون 11 رقم";
                          }
                          if (value.startsWith("05") && value.length != 10) {
                            return "الرقم يجب ان يكون 10 رقم";
                          }
                          return null;
                        },
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
                              "Phone Number",
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
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    SizedBox(
                      height: 80,
                      child: TextFormField(
                        onSaved: (newValue) {
                          ParentEmail = newValue!;
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
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    SizedBox(
                      height: 80,
                      child: TextFormField(
                        onSaved: (newValue) {
                          ParentPassword = newValue!;
                        },
                        onChanged: (value) {
                          ParentDemoPassword = value;
                        },
                        validator: (value) {
                          if (value!.length < 4) {
                            return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
                          }
                          if (ParentDemoPassword !=
                              ParentDemoConfirmPassword) {
                            return "الكلمتان السريتان غير متشابهتان";
                          }
                          return null;
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
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    SizedBox(
                      height: 80,
                      child: TextFormField(
                        onSaved: (newValue) {
                          ParentConfirmPassword = newValue!;
                        },
                        onChanged: (value) {
                          ParentDemoConfirmPassword = value;
                        },
                        validator: (value) {
                          if (value!.length < 4) {
                            return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
                          }
                          if (ParentDemoPassword !=
                              ParentDemoConfirmPassword) {
                            return "الكلمتان السريتان غير متشابهتان";
                          }
                          return null;
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
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: const Icon(Icons.remove_red_eye_outlined),
                            ),
                            label: const Text(
                              "Confirm Password",
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
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        if (key2.currentState!.validate()) {
                          key2.currentState!.save();
                          dbService.rlCreate('Parent', {
                            "name": ParentName,
                            "phone": ParentNumber,
                            "email": ParentEmail,
                            "password": ParentPassword,
                            "gender": "not added yet",
                            "state": true
                          });
                          Navigator.pushNamedAndRemoveUntil(
                              context, "ParentMainPage", (route) => false);
                        }
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
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
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
              ),
            ],
          ),
        ));
  }
}
