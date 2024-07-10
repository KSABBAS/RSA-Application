import 'package:flutter/material.dart';

class TeacherSignUpPage extends StatefulWidget {
  const TeacherSignUpPage({super.key});

  @override
  State<TeacherSignUpPage> createState() => _TeacherSignUpPageState();
}

var obscureText = true;
String TeacherGeneder = "";
String TeacherDayOfBirth = "";
String TeacherDateOfBirth = "";
String TeacherMonthOfBirth = "";
String TeacherYearOfBirth = "";

class _TeacherSignUpPageState extends State<TeacherSignUpPage> {
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
                                Expanded(flex: 2,
                                  child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
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
                                              color:
                                                  Color.fromARGB(255, 8, 125, 159),
                                              fontWeight: FontWeight.w700),
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
            Expanded(child:Container()),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 1050,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(children: [
                    Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(alignment: Alignment.bottomLeft,child: const Text("Teacher  ",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color:Color.fromARGB(255, 8, 125, 159) ))),
                              Container(height: 15,alignment: Alignment.bottomLeft,child: const Icon(Icons.arrow_forward,color: Color.fromARGB(255, 8, 125, 159),)),
                            ],
                          ),
                        ),
                    Expanded(child:Container()),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            label: const Text(
                              "Full Name",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
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
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            label: const Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
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
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            label: const Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
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
                              child: const Icon(Icons.remove_red_eye_outlined),
                            ),
                            label: const Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
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
                          style:
                              TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(flex: 5,child:Container(
                          child: TextField(
                            style: const TextStyle(fontSize: 16),
                            onChanged: (value) {
                              TeacherDayOfBirth = value;
                              TeacherDateOfBirth =
                                  "$TeacherDayOfBirth/$TeacherMonthOfBirth/$TeacherYearOfBirth";
                            },
                            decoration: const InputDecoration(label: Text("Day",style: TextStyle(fontSize: 12),))
                          ),
                        )),
                        const Text(
                          "  /  ",
                          style: TextStyle(fontSize: 30),
                        ),
                        Expanded(flex: 5,child:Container(
                          child: TextField(
                            style: const TextStyle(fontSize: 16),
                            onChanged: (value) {
                              TeacherMonthOfBirth = value;
                              TeacherDateOfBirth =
                                  "$TeacherDayOfBirth/$TeacherMonthOfBirth/$TeacherYearOfBirth";
                            },
                            decoration: const InputDecoration(label: Text("Month",style: TextStyle(fontSize: 12))),
                          ),
                        )),
                        const Text(
                          "  /  ",
                          style: TextStyle(fontSize: 30),
                        ),
                        Expanded(flex: 5,
                          child: Container(
                            child: TextField(
                              style: const TextStyle(fontSize: 16),
                              onChanged: (value) {
                              TeacherYearOfBirth = value;
                                TeacherDateOfBirth =
                                    "$TeacherDayOfBirth/$TeacherMonthOfBirth/$TeacherYearOfBirth";
                              },
                              decoration: const InputDecoration(label: Text("Year",style: TextStyle(fontSize: 12))),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                    ],
                    ),
                    Expanded(child:Container()),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Geneder",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ),
                    Expanded(child:Container()),
                    Row(
                      children: [
                        Expanded(
                            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(96, 216, 216, 216),),child:RadioListTile(
                                activeColor: const Color.fromARGB(255, 74, 193, 241),
                                title: const Text("Male",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                                value: "Male",
                                groupValue: TeacherGeneder,
                                onChanged: (val) {
                                  setState(() {
                                    TeacherGeneder = val.toString();
                                  });
                                }))),
                                const Padding(padding: EdgeInsets.only(left: 20)),
                        Expanded(
                            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(96, 216, 216, 216),),child:RadioListTile(
                                activeColor: const Color.fromARGB(255, 74, 193, 241),
                                title: const Text("Female",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                value: "Female",
                                groupValue: TeacherGeneder,
                                onChanged: (val) {
                                  setState(() {
                                    TeacherGeneder = val.toString();
                                  });
                                })))
                      ],
                    ),
                    Expanded(child:Container()),
                    SizedBox(
                      height:210,
                      child: TextField(
                        maxLines: 8,
                        decoration: InputDecoration(
                            hintText:
                              "Tell us a preif about yourself",
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 192, 192, 192)),
                                borderRadius: BorderRadius.circular(30)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    Expanded(child:Container()),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "StudentMainPage", (route) => false);
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
                    Expanded(child:Container()),
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
            )
          ],
        ));
  }
}
