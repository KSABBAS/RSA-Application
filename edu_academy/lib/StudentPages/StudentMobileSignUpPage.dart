import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

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
GlobalKey<FormState> key = GlobalKey();
var forDateInput = DateTime.now().subtract(const Duration(days: 1926));

class _StudentMobileSignUpPageState extends State<StudentMobileSignUpPage> {
  String StudentDemoPassword = "";
  String StudentDemoConfirmPassword = "";
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    late Widget StudentSignUpBody;
    Widget NameTFF = SizedBox(
      height: 80,
      child: TextFormField(
        initialValue: StudentName,
        onSaved: (newValue) {
          StudentName = newValue!;
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
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            label: const Text(
              "Full Name",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget GardianPhoneTFF = SizedBox(
      height: 80,
      child: TextFormField(
        initialValue: StudentParentMobileNumber,
        onSaved: (newValue) {
          StudentParentMobileNumber = newValue!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "الحقل فارغ";
          }
          if (!value.startsWith("01") && !value.startsWith("05")) {
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
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            label: const Text(
              "Gardian Phone Number",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget PhoneNumberTFF = SizedBox(
      height: 80,
      child: TextFormField(
        initialValue: StudentMobileNumber,
        onSaved: (newValue) {
          StudentMobileNumber = newValue!;
        },
        validator: (value) {
          if (value!.isNotEmpty) {
            if (!value.startsWith("01") && !value.startsWith("05")) {
              return "الرقم يجب ان يبدا الرقمين 01 او 05";
            }
            if (value.startsWith("01") && value.length != 11) {
              return "الرقم يجب ان يكون 11 رقم";
            }
            if (value.startsWith("05") && value.length != 10) {
              return "الرقم يجب ان يكون 10 رقم";
            }
          }
          return null;
        },
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            label: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget EmailTFF = SizedBox(
      height: 80,
      child: TextFormField(
        initialValue: StudentEmail,
        onSaved: (newValue) {
          StudentEmail = newValue!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "الحقل فارغ";
          }
          if ((!value.endsWith("@gmail.com") || !(value.length > 10)) &&
              (!value.endsWith("@yahoo.com") || !(value.length > 10))) {
            return "صيغة الايميل ليسة صحيحة";
          }
          return null;
        },
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            label: const Text(
              "Email",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget PasswordTFF = SizedBox(
      height: 80,
      child: TextFormField(
        initialValue: StudentPassword,
        onSaved: (newValue) {
          StudentPassword = newValue!;
        },
        onChanged: (value) {
          StudentDemoPassword = value;
        },
        validator: (value) {
          if (value!.length < 4) {
            return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
          }
          if (StudentDemoPassword != StudentDemoConfirmPassword) {
            return "الكلمتان السريتان غير متشابهتان";
          }
          return null;
        },
        obscureText: obscureText,
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget ConfirmTFF = SizedBox(
      height: 80,
      child: TextFormField(
        initialValue: StudentConfirmPassword,
        onSaved: (newValue) {
          StudentConfirmPassword = newValue!;
        },
        onChanged: (value) {
          StudentDemoConfirmPassword = value;
        },
        validator: (value) {
          if (value!.length < 4) {
            return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
          }
          if (StudentDemoPassword != StudentDemoConfirmPassword) {
            return "الكلمتان السريتان غير متشابهتان";
          }
          return null;
        },
        obscureText: obscureText,
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget BirthDateTC = Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        "Date of birth",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
    Widget BirthDateW = TimePickerSpinnerPopUp(
      textStyle: TextStyle(fontSize: 25),
      iconSize: 40,
      minTime: DateTime.now().subtract(const Duration(days: 36525)),
      maxTime: DateTime.now().subtract(const Duration(days: 1824)),
      mode: CupertinoDatePickerMode.date,
      initTime: forDateInput,
      onChange: (dateTime) {
        setState(() {
          forDateInput = dateTime;
          StudentDayOfBirth = dateTime.day.toString();
          StudentMonthOfBirth = dateTime.month.toString();
          StudentYearOfBirth = dateTime.year.toString();
          StudentDateOfBirth =
              "$StudentDayOfBirth/$StudentMonthOfBirth/$StudentYearOfBirth";
          print(StudentDateOfBirth);
        });
      },
    );
    Widget GenederText = Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        "Geneder",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
    List<Widget> GenederWidgets = [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(96, 216, 216, 216),
          ),
          child: RadioListTile(
              activeColor: const Color.fromARGB(255, 74, 193, 241),
              title: const Text(
                "Male",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
              value: "Male",
              groupValue: StudentGender,
              onChanged: (val) {
                setState(() {
                  StudentGender = val.toString();
                });
              })),
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(96, 216, 216, 216),
          ),
          child: RadioListTile(
              activeColor: const Color.fromARGB(255, 74, 193, 241),
              title: const Text("Female",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
              value: "Female",
              groupValue: StudentGender,
              onChanged: (val) {
                setState(() {
                  StudentGender = val.toString();
                });
              }))
    ];
    Widget GradeText = CMaker(width: double.infinity,alignment: Alignment.centerLeft,
      child: Text(
        "Grade",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
    Widget GradeDDB = Container(
      alignment: Alignment.center,
      child: SizedBox(
        height: 30,
        width: 100,
        child: DropdownButton(
            underline: Container(),
            value: StudentGrade,
            items: const [
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
    );
    Widget SignUpCircle=Container(
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
                                                    Radius.circular(5000),
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
                                        ));
    Widget BackButton=Container(
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 20),
                                      child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.arrow_back)),
                                    );
    Widget Logo=Container(
                                          height: double.infinity,
                                          child: Image.asset(
                                            "images/Logo.png",
                                            fit: BoxFit.contain,
                                          ));
    Widget StudentWithArro=Container(
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: const Text("Student  ",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 8, 125, 159)))),
                            Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    height: 5,
                                    alignment: Alignment.bottomLeft,
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Color.fromARGB(255, 8, 125, 159),
                                    ))),
                          ],
                        ),
                      );
    Widget SignUpButton=InkWell(
                        onTap: () async {
                          if (key.currentState!.validate()) {
                            key.currentState!.save();
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
                            await dbService.fiCreate('Students', {
                              "name": StudentName,
                              "phone": StudentMobileNumber,
                              "par_phone": StudentParentMobileNumber,
                              "email": StudentEmail,
                              "password": StudentPassword,
                              "birth_date": StudentDateOfBirth,
                              "gender": StudentGender,
                              "grade": StudentGrade,
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
                      );
    List <Widget>AlreadyHaveAnAccountElements=[Container(
                                alignment: Alignment.centerRight,
                                child: const Text(
                                  "Already have an account ? ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 206, 206, 206),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
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
                              ];
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    print(PageWidth(context));
    if (PageWidth(context) < 550) {
      setState(() {
        StudentSignUpBody = Scaffold(
          body: Form(
            key: key,
            child: CMaker(
              height: PageHeight(context),
              child: ListView(children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                        Color.fromARGB(255, 8, 125, 159),
                        Color.fromARGB(255, 74, 193, 241)
                      ])),
                      child: Row(children: [
                        Expanded(child: Column(children: [
                          Expanded(child: Container(child:BackButton),),
                          Expanded(flex: 2,child: SignUpCircle,),
                        ]
                        )),
                        Expanded(child: CMaker(height: double.infinity,alignment:Alignment.center,child: Logo))
                      ],),
                  ),
                  CMaker(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                  const Padding(padding:EdgeInsets.only(bottom: 20)),
                  StudentWithArro,
                  const Padding(padding:EdgeInsets.only(bottom: 20)),
                  NameTFF,
                  GardianPhoneTFF,
                  PhoneNumberTFF,
                  EmailTFF,
                  PasswordTFF,
                  ConfirmTFF,
                  const Padding(padding:EdgeInsets.only(bottom: 20)),
                  BirthDateTC,
                  const Padding(padding:EdgeInsets.only(bottom: 40)),
                  // BirthDateW,
                  const Padding(padding:EdgeInsets.only(bottom: 40)),
                  GenederText,
                  const Padding(padding:EdgeInsets.only(bottom: 20)),
                  CMaker(padding: EdgeInsets.symmetric(horizontal: 20),height: 100,width: double.infinity,child: Row(children: [
                    Expanded(flex: 5,child: GenederWidgets[0]),
                    Expanded(child: Container(),),
                    Expanded(flex: 5,child: GenederWidgets[1]),
                  ],)),
                  const Padding(padding:EdgeInsets.only(bottom: 20)),
                  GradeText,
                  const Padding(padding:EdgeInsets.only(bottom: 20)),
                  GradeDDB,
                  const Padding(padding:EdgeInsets.only(bottom: 60)),
                  SignUpButton,
                  const Padding(padding:EdgeInsets.only(bottom: 20)),
                  CMaker(width: double.infinity,child: Row(children: [
                    Expanded(child: Container()),
                    Expanded(flex: 10,child: AlreadyHaveAnAccountElements[0]),
                    Expanded(child: Container()),
                    Expanded(flex: 6,child: AlreadyHaveAnAccountElements[1]),
                    Expanded(child: Container()),
                  ],)),
                  const Padding(padding:EdgeInsets.only(bottom: 40)),
                  ],))
              ],),
            ),
          ),
        );
      });
    } else if (PageWidth(context) >= 550&&PageHeight(context)>900) {
      setState(() {
        StudentSignUpBody = Scaffold(
          body: Form(
            key: key,
            child: CMaker(
              alignment: Alignment.center,
              width: double.infinity,
              height:double.infinity,
              gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                        Color.fromARGB(255, 8, 125, 159),
                        Color.fromARGB(255, 74, 193, 241)
                      ]),
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Expanded(flex: 3,child: Image.asset(
                                            "images/Logo.png",
                                            fit: BoxFit.contain,
                                          ),),
                  CMaker(circularRadius: 20,
                  color: Colors.white,
                  height: 800,
                  width: 450,
                  padding: EdgeInsets.only(top: 20,right: 20,left: 20),
                  child: ListView(children: [
                    const Padding(padding:EdgeInsets.only(bottom: 20)),
                      StudentWithArro,
                    const Padding(padding:EdgeInsets.only(bottom: 20)),
                      NameTFF,
                      GardianPhoneTFF,
                      PhoneNumberTFF,
                      EmailTFF,
                      PasswordTFF,
                      ConfirmTFF,
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      BirthDateTC,
                      const Padding(padding:EdgeInsets.only(bottom: 40)),
                      // BirthDateW,
                      const Padding(padding:EdgeInsets.only(bottom: 40)),
                      GenederText,
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      CMaker(padding: EdgeInsets.symmetric(horizontal: 20),height: 100,width: double.infinity,child: Row(children: [
                        Expanded(flex: 5,child: GenederWidgets[0]),
                        Expanded(child: Container(),),
                        Expanded(flex: 5,child: GenederWidgets[1]),
                      ],)),
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      GradeText,
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      GradeDDB,
                      const Padding(padding:EdgeInsets.only(bottom: 60)),
                      SignUpButton,
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      CMaker(width: double.infinity,child: Row(children: [
                        Expanded(child: Container()),
                        Expanded(flex: 10,child: AlreadyHaveAnAccountElements[0]),
                        Expanded(child: Container()),
                        Expanded(flex: 6,child: AlreadyHaveAnAccountElements[1]),
                        Expanded(child: Container()),
                      ],)),
                      const Padding(padding:EdgeInsets.only(bottom: 40)),
                              ],)),
                      Expanded(flex: 2,child: Container()),
                ],
              )),
          ),
        );
      });
    }else if (PageWidth(context) >= 550&&PageHeight(context)<700&&PageHeight(context)<900) {
      setState(() {
        StudentSignUpBody = Scaffold(
          body: Form(
            key: key,
            child: CMaker(
              alignment: Alignment.center,
              width: double.infinity,
              height:double.infinity,
              gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                        Color.fromARGB(255, 8, 125, 159),
                        Color.fromARGB(255, 74, 193, 241)
                      ]),
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Expanded(flex: 3,child: Image.asset(
                                            "images/Logo.png",
                                            fit: BoxFit.contain,
                                          ),),
                  CMaker(circularRadius: 20,
                  color: Colors.white,
                  height: 500,
                  width: 400,
                  padding: EdgeInsets.only(top: 20,right: 20,left: 20),
                  child: ListView(children: [
                    const Padding(padding:EdgeInsets.only(bottom: 20)),
                      StudentWithArro,
                    const Padding(padding:EdgeInsets.only(bottom: 20)),
                      NameTFF,
                      GardianPhoneTFF,
                      PhoneNumberTFF,
                      EmailTFF,
                      PasswordTFF,
                      ConfirmTFF,
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      BirthDateTC,
                      const Padding(padding:EdgeInsets.only(bottom: 40)),
                      // BirthDateW,
                      const Padding(padding:EdgeInsets.only(bottom: 40)),
                      GenederText,
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      CMaker(padding: EdgeInsets.symmetric(horizontal: 20),height: 100,width: double.infinity,child: Row(children: [
                        Expanded(flex: 5,child: GenederWidgets[0]),
                        Expanded(child: Container(),),
                        Expanded(flex: 5,child: GenederWidgets[1]),
                      ],)),
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      GradeText,
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      GradeDDB,
                      const Padding(padding:EdgeInsets.only(bottom: 60)),
                      SignUpButton,
                      const Padding(padding:EdgeInsets.only(bottom: 20)),
                      CMaker(width: double.infinity,child: Row(children: [
                        Expanded(child: Container()),
                        Expanded(flex: 10,child: AlreadyHaveAnAccountElements[0]),
                        Expanded(child: Container()),
                        Expanded(flex: 6,child: AlreadyHaveAnAccountElements[1]),
                        Expanded(child: Container()),
                      ],)),
                      const Padding(padding:EdgeInsets.only(bottom: 40)),
                              ],)),
                      Expanded(flex: 2,child: Container()),
                ],
              )),
          ),
        );
      });
    }
    return StudentSignUpBody;
  }
}
