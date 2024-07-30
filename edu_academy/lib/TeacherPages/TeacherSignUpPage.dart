import 'package:edu_academy/StudentPages/SecondPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class TeacherSignUpPage extends StatefulWidget {
  const TeacherSignUpPage({super.key});

  @override
  State<TeacherSignUpPage> createState() => _TeacherSignUpPageState();
}

var obscureText = true;

String TeacherName = "";
String TeacherNumber = "";
String TeacherEmail = "";
String TeacherPassword = "";
String TeacherConfirmPassword = "";
String TeacherGeneder = "";
String TeacherDayOfBirth = "";
String TeacherDateOfBirth = "";
String TeacherMonthOfBirth = "";
String TeacherYearOfBirth = "";
String TeacherSubject1 = "null";
String TeacherSubject2 = "null";
String TeacherSubject3 = "null";
// bool SecondDropdownVisible = false;
// bool ThirdDropdownVisible = false;
GlobalKey<FormState> key3 = GlobalKey();
var forDateInput = DateTime.now().subtract(const Duration(days: 1926));
class _TeacherSignUpPageState extends State<TeacherSignUpPage> {
  bool SecondDropdownVisible = false;
  bool ThirdDropdownVisible = false;
  String TeacherDemoPassword = "";
  String TeacherDemoConfirmPassword = "";
  final dbService = DatabaseService();
  List<DropdownMenuItem<String>>? SubjectsMaker(String TeacherSubjectNumber) {
      List<DropdownMenuItem<String>>? list = [
        DropdownMenuItem(
            value: "null",
            child: CMaker(child: TMaker(text:"null", fontSize: 20, fontWeight:FontWeight.w600, color:Colors.black)),
          ),
      ];
      for (int i = 0; i < Subjects.length; i++) {
        list.add(
          DropdownMenuItem(
            value: Subjects[i][1],
            child: CMaker(child: TMaker(text: Subjects[i][1], fontSize: 20, fontWeight:FontWeight.w600, color:Colors.black)),
          ),
        );
      }
      return list;
    }
  @override
  Widget build(BuildContext context) {
    


    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Form(
          key: key3,
          child: ListView(
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
                                                topRight:
                                                    Radius.circular(23000),
                                                bottomRight:
                                                    Radius.circular(10)),
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
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  height: PageHeight(context) +800,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.bottomLeft,
                                child: const Text("Teacher  ",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 8, 125, 159)))),
                            Container(
                                height: 15,
                                alignment: Alignment.bottomLeft,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromARGB(255, 8, 125, 159),
                                )),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          onSaved: (newValue) {
                            TeacherName = newValue!;
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
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              label: const Text(
                                "Full Name",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
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
                            TeacherNumber = newValue!;
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
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              label: const Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
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
                            TeacherEmail = newValue!;
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
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              label: const Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
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
                            TeacherPassword = newValue!;
                          },
                          onChanged: (value) {
                            TeacherDemoPassword = value;
                          },
                          validator: (value) {
                            if (value!.length < 4) {
                              return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
                            }
                            if (TeacherDemoPassword !=
                                TeacherDemoConfirmPassword) {
                              return "الكلمتان السريتان غير متشابهتان";
                            }
                            return null;
                          },
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                child:
                                    const Icon(Icons.remove_red_eye_outlined),
                              ),
                              label: const Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
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
                            TeacherConfirmPassword = newValue!;
                          },
                          onChanged: (value) {
                            TeacherDemoConfirmPassword = value;
                          },
                          validator: (value) {
                            if (value!.length < 4) {
                              return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
                            }
                            if (TeacherDemoPassword !=
                                TeacherDemoConfirmPassword) {
                              return "الكلمتان السريتان غير متشابهتان";
                            }
                            return null;
                          },
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                child:
                                    const Icon(Icons.remove_red_eye_outlined),
                              ),
                              label: const Text(
                                "Confirm Password",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
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
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Expanded(child: Container()),
                        TimePickerSpinnerPopUp(
                          minTime: DateTime.now().subtract(const Duration(days: 36525)),
                          maxTime: DateTime.now().subtract(const Duration(days: 1824)),
                          textStyle: TextStyle(fontSize: 25),
                          iconSize: 40,
                          mode: CupertinoDatePickerMode.date,
                          initTime: forDateInput,
                          onChange: (dateTime) {
                            setState(() {
                              forDateInput=dateTime;
                              TeacherDayOfBirth = dateTime.day.toString();
                              TeacherMonthOfBirth = dateTime.month.toString();
                              TeacherYearOfBirth = dateTime.year.toString();
                              TeacherDateOfBirth =
                                "$TeacherDayOfBirth/$TeacherMonthOfBirth/$TeacherYearOfBirth";
                              print(TeacherDateOfBirth);
                            });
                          },
                        ),
                        Expanded(child: Container()),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Geneder",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromARGB(96, 216, 216, 216),
                                  ),
                                  child: RadioListTile(
                                      activeColor: const Color.fromARGB(
                                          255, 74, 193, 241),
                                      title: const Text(
                                        "Male",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      value: "Male",
                                      groupValue: TeacherGeneder,
                                      onChanged: (val) {
                                        setState(() {
                                          TeacherGeneder = val.toString();
                                        });
                                      }))),
                          const Padding(padding: EdgeInsets.only(left: 20)),
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromARGB(96, 216, 216, 216),
                                  ),
                                  child: RadioListTile(
                                      activeColor: const Color.fromARGB(
                                          255, 74, 193, 241),
                                      title: const Text("Female",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500)),
                                      value: "Female",
                                      groupValue: TeacherGeneder,
                                      onChanged: (val) {
                                        setState(() {
                                          TeacherGeneder = val.toString();
                                        });
                                      })))
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Select subject",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(child: Container()),
                      CMaker(
                        height: 300,
                        child: Column(
                          children: [
            Expanded(child: Container()),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Subject one",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(child: Container()),
                DropdownButton<String>(
                  items: SubjectsMaker(TeacherSubject1),
                  value: TeacherSubject1,
                  onChanged: (s1) {
                    setState(() {
                      TeacherSubject1 =s1!.toString();
                    });
                  },
                ),
              ],
            ),
            Expanded(child: Container()),
            Visibility(
              visible: SecondDropdownVisible,
              replacement: ElevatedButton(
              onPressed: () {
                setState(() {
                  SecondDropdownVisible = true;
                });
              },
              child: const Text("Show the second subject (if u need)"),
            ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Subject two",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(child: Container()),
                  DropdownButton<String>(
                    items: SubjectsMaker(TeacherSubject2),
                    value: TeacherSubject2,
                    onChanged: (s2) {
                      setState(() {
                        TeacherSubject2 = s2!.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Visibility (
              visible: ThirdDropdownVisible,
              replacement: SecondDropdownVisible ?ElevatedButton(
              onPressed: () {
                setState(() {
                  ThirdDropdownVisible = true;
                });
              },
              child: const Text("Show the third subject"),
            ) : const SizedBox.shrink(),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Subject three",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(child: Container()),
                  DropdownButton<String>(
                    items: SubjectsMaker(TeacherSubject3),
                    value: TeacherSubject3,
                    onChanged: (s3) {
                      setState(() {
                        TeacherSubject3 = s3!.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            
          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        height: 210,
                        child: TextField(
                          maxLines: 8,
                          decoration: InputDecoration(
                              hintText: "Tell us a preif about yourself",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () async {
                          if (key3.currentState!.validate()) {
                            key3.currentState!.save();
                            OverlayLoadingProgress.start(
                              context,
                              widget: CMaker(
                                circularRadius: 15,
                                color: const Color.fromARGB(198, 255, 255, 255),
                                width: MediaQuery.of(context).size.width / 3.6,
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width / 13),
                                child: const AspectRatio(
                                  aspectRatio: 1,
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            );
                            await dbService.fiCreate('Teacher', {
                              "name": TeacherName,
                              "phone": TeacherNumber,
                              "email": TeacherEmail,
                              "password": TeacherPassword,
                              "birth_date": TeacherDateOfBirth,
                              "gender": TeacherGeneder,
                              "Subject1": [TeacherSubject1],
                              "Subject2": (TeacherSubject2 == "null") ? TeacherSubject2 : [TeacherSubject2],
                              "Subject3": (TeacherSubject3 == "null") ? TeacherSubject3 : [TeacherSubject3],
                              "Description": "TeachertDescription",
                              "state": "false"
                            });
                            OverlayLoadingProgress.stop();
                            PanaraInfoDialog.show(
                              context,
                              title: "Done that save correct",
                              message: "Now you can click LogIn",
                              buttonText: "Go to Login",
                              onTapDismiss: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              panaraDialogType: PanaraDialogType.success,
                              barrierDismissible: false,
                            );
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
                                fontSize: 20,
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
              )
            ],
          ),
        ));
  }
}
