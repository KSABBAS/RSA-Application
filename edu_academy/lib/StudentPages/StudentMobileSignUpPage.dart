import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/StudentPages/SecondPageContents.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class StudentMobileSignUpPage extends StatefulWidget {
  const StudentMobileSignUpPage({super.key});

  @override
  State<StudentMobileSignUpPage> createState() => _StudentMobileSignUpPageState();
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
String StudentDateOfBirth = "اختر تاريخ الميلاد";
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {
          key.currentState!.validate();
        },
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
            focusedErrorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            errorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            label: const Text(
              "الاسم كامل*",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget GardianPhoneTFF = SizedBox(
      height: 80,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {
          key.currentState!.validate();
        },
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
            focusedErrorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            errorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            label: const Text(
              "رقم هاتف ولي الامر*",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget PhoneNumberTFF = SizedBox(
      height: 80,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {
          key.currentState!.validate();
        },
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
            focusedErrorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            errorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            label: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "رقم الهاتف",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  "  ( اذا كان متوفر )",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 183, 183, 183)),
                ),
              ],
            ),
            enabledBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget EmailTFF = SizedBox(
      height: 80,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {
          key.currentState!.validate();
        },
        initialValue: StudentEmail,
        onSaved: (newValue) {
          StudentEmail = newValue!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "الحقل فارغ";
          }
          if ((!value.endsWith("@gmail.com") || !(value.length > 10)) && (!value.endsWith("@yahoo.com") || !(value.length > 10))) {
            return "صيغة الايميل ليسة صحيحة";
          }
          return null;
        },
        decoration: InputDecoration(
            focusedErrorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            errorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            label: const Text(
              "الايميل*",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget PasswordTFF = SizedBox(
      height: 80,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: StudentPassword,
        onSaved: (newValue) {
          StudentPassword = newValue!;
        },
        onChanged: (value) {
          StudentDemoPassword = value;
          key.currentState!.validate();
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
            focusedErrorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            errorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            suffix: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: const Icon(Icons.remove_red_eye_outlined),
            ),
            label: const Text(
              "الرقم السري*",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget ConfirmTFF = SizedBox(
      height: 80,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: StudentConfirmPassword,
        onSaved: (newValue) {
          StudentConfirmPassword = newValue!;
        },
        onChanged: (value) {
          StudentDemoConfirmPassword = value;
          key.currentState!.validate();
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
            focusedErrorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            errorBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            suffix: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: const Icon(Icons.remove_red_eye_outlined),
            ),
            label: const Text(
              "تأكيد كلمة السر",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            enabledBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget BirthDateTC = Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        "تاريخ الميلاد",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
    Widget BirthDateW = (kIsWeb)
        ? MyButton(
            padding: const EdgeInsets.all(10),
            buttonColor: const Color.fromARGB(255, 74, 193, 241),
            text: StudentDateOfBirth,
            onTap: () async {
              var TimeSelected = await showOmniDateTimePicker(
                context: context,
                initialDate: DateTime.now(),
                type: OmniDateTimePickerType.date,
                is24HourMode: false,
                isShowSeconds: false,
                minutesInterval: 1,
                secondsInterval: 1,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                constraints: const BoxConstraints(
                  maxWidth: 350,
                  maxHeight: 650,
                ),
                transitionBuilder: (context, anim1, anim2, child) {
                  return FadeTransition(
                    opacity: anim1.drive(
                      Tween(
                        begin: 0,
                        end: 1,
                      ),
                    ),
                    child: child,
                  );
                },
                selectableDayPredicate: (p0) {
                  if (p0 == DateTime.now()) {
                    return false;
                  } else {
                    return true;
                  }
                },
                transitionDuration: const Duration(milliseconds: 200),
                barrierDismissible: true,
              );
              StudentDayOfBirth = TimeSelected!.day.toString();
              StudentMonthOfBirth = TimeSelected.month.toString();
              StudentYearOfBirth = TimeSelected.year.toString();
              StudentDateOfBirth = "$StudentDayOfBirth / $StudentMonthOfBirth / $StudentYearOfBirth";
              setState(() {});
            })
        : TimePickerSpinnerPopUp(
            textStyle: const TextStyle(fontSize: 25),
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
                StudentDateOfBirth = "$StudentDayOfBirth/$StudentMonthOfBirth/$StudentYearOfBirth";
                print(StudentDateOfBirth);
              });
            },
          );
    Widget GenederText = Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        "النوع",
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
                "ذكر",
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
              title: const Text("انثى", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
              value: "Female",
              groupValue: StudentGender,
              onChanged: (val) {
                setState(() {
                  StudentGender = val.toString();
                });
              }))
    ];
    Widget GradeText = CMaker(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: const Text(
        "الصف",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
    Widget GradeDDB = Container(
      alignment: Alignment.center,
      child: SizedBox(
        height: 30,
        // width: 100,
        child: DropdownButton(
            underline: Container(),
            value: StudentGrade,
            items: () {
              List<DropdownMenuItem<String>> out = [];
              for (var i in GradesSubjects.keys) {
                out.add(DropdownMenuItem(value: i, child: Text(i)));
              }
              print("items out ${out}");
              return out;
            }(),
            onChanged: (val) {
              setState(() {
                StudentGrade = val.toString();
              });
            }),
      ),
    );
    Widget SignUpCircle = Container(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
          alignment: Alignment.center,
          width: 160,
          height: 160,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.zero, topLeft: Radius.circular(10), topRight: Radius.circular(5000), bottomRight: Radius.circular(10)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: const Text(
            "انشاء حساب",
            style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 8, 125, 159), fontWeight: FontWeight.w700),
          ),
        ));
    Widget BackButton = Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    );
    Widget Logo = SizedBox(
        height: 150,
        child: Image.asset(
          "images/Logo.png",
          fit: BoxFit.contain,
        ));
    Widget StudentWithArro = Container(
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: const Text("طالب  ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 8, 125, 159)))),
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
    Widget SignUpButton = InkWell(
      onTap: () async {
        if (key.currentState!.validate() &&
            StudentName != "0" &&
            StudentParentMobileNumber != "0" &&
            StudentEmail != "0" &&
            StudentPassword != "0" &&
            StudentConfirmPassword != "0") {
          key.currentState!.save();
          OverlayLoadingProgress.start(
            context,
            widget: CMaker(
              circularRadius: 15,
              color: const Color.fromARGB(198, 255, 255, 255),
              width: MediaQuery.of(context).size.width / 3.6,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 13),
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
            "photo":
                'https://firebasestorage.googleapis.com/v0/b/rsa-app-3ec3f.appspot.com/o/Profiles%2FPerson.png?alt=media&token=9a526b63-e8ff-40ec-b831-088e270a0013',
            "state": "false"
          });
          OverlayLoadingProgress.stop();
          PanaraInfoDialog.show(
            context,
            title: "تم حفظ البيانات بنجاح",
            message: "انتقل الان لصفحة تسجيل الدخول",
            buttonText: "تسجيل الدخول",
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
        decoration: BoxDecoration(color: const Color.fromARGB(255, 74, 193, 241), borderRadius: BorderRadius.circular(30)),
        child: const Text(
          "انشاء حساب",
          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w700),
        ),
      ),
    );
    List<Widget> AlreadyHaveAnAccountElements = [
      Container(
        alignment: Alignment.centerRight,
        child: const Text(
          "هل لديك حساب بالفعل؟",
          style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 206, 206, 206), fontWeight: FontWeight.w500),
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
            "تسجيل الدخول",
            style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 74, 193, 241), fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ];
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (PageWidth(context) < 550) {
      setState(() {
        StudentSignUpBody = Scaffold(
          body: Form(
            key: key,
            child: CMaker(
              height: PageHeight(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color.fromARGB(255, 8, 125, 159), Color.fromARGB(255, 74, 193, 241)])),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(children: [
                            Expanded(
                              child: Container(child: BackButton),
                            ),
                            Expanded(
                              flex: 2,
                              child: SignUpCircle,
                            ),
                          ])),
                          Expanded(child: CMaker(height: double.infinity, alignment: Alignment.center, child: Logo))
                        ],
                      ),
                    ),
                    CMaker(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            StudentWithArro,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            NameTFF,
                            GardianPhoneTFF,
                            PhoneNumberTFF,
                            EmailTFF,
                            PasswordTFF,
                            ConfirmTFF,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            BirthDateTC,
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                            CMaker(alignment: Alignment.center, child: BirthDateW),
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                            GenederText,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                height: 100,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(flex: 5, child: GenederWidgets[0]),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Expanded(flex: 5, child: GenederWidgets[1]),
                                  ],
                                )),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            GradeText,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            GradeDDB,
                            const Padding(padding: EdgeInsets.only(bottom: 60)),
                            CMaker(alignment: Alignment.center, child: SignUpButton),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(child: Container()),
                                    Expanded(flex: 10, child: AlreadyHaveAnAccountElements[0]),
                                    Expanded(child: Container()),
                                    Expanded(flex: 6, child: AlreadyHaveAnAccountElements[1]),
                                    Expanded(child: Container()),
                                  ],
                                )),
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      setState(() {
        StudentSignUpBody = Scaffold(
          body: Form(
            key: key,
            child: CMaker(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Color.fromARGB(255, 8, 125, 159), Color.fromARGB(255, 74, 193, 241)]),
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          CMaker(
                            width: 70,
                            height: 70,
                            child: BackButton,
                          ),
                          Expanded(
                            flex: 20,
                            child: Image.asset(
                              "images/Logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 70, height: 70),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                    CMaker(
                        circularRadius: 20,
                        color: Colors.white,
                        height: 800,
                        width: 450,
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              StudentWithArro,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              NameTFF,
                              GardianPhoneTFF,
                              PhoneNumberTFF,
                              EmailTFF,
                              PasswordTFF,
                              ConfirmTFF,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              BirthDateTC,
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                              CMaker(alignment: Alignment.center, child: BirthDateW),
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                              GenederText,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              CMaker(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  height: 100,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 5, child: GenederWidgets[0]),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      Expanded(flex: 5, child: GenederWidgets[1]),
                                    ],
                                  )),
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              GradeText,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              GradeDDB,
                              const Padding(padding: EdgeInsets.only(bottom: 60)),
                              CMaker(alignment: Alignment.center, child: SignUpButton),
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              CMaker(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(child: Container()),
                                      Expanded(flex: 10, child: AlreadyHaveAnAccountElements[0]),
                                      Expanded(child: Container()),
                                      Expanded(flex: 6, child: AlreadyHaveAnAccountElements[1]),
                                      Expanded(child: Container()),
                                    ],
                                  )),
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                            ],
                          ),
                        )),
                    Expanded(flex: 2, child: Container()),
                  ],
                )),
          ),
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      setState(() {
        StudentSignUpBody = Scaffold(
          body: Form(
            key: key,
            child: CMaker(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Color.fromARGB(255, 8, 125, 159), Color.fromARGB(255, 74, 193, 241)]),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          CMaker(
                            width: 70,
                            height: 70,
                            child: BackButton,
                          ),
                          (PageWidth(context) < 800)
                              ? Expanded(
                                  flex: 20,
                                  child: Image.asset(
                                    "images/Logo.png",
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Expanded(
                                  flex: 20,
                                  child: CMaker(
                                    width: 200,
                                    child: Image.asset(
                                      "images/Logo.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                          const SizedBox(width: 70, height: 70),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    CMaker(
                        circularRadius: 20,
                        color: Colors.white,
                        height: 400,
                        width: (PageWidth(context) < 800) ? PageWidth(context) / 2 : 400,
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              StudentWithArro,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              NameTFF,
                              GardianPhoneTFF,
                              PhoneNumberTFF,
                              EmailTFF,
                              PasswordTFF,
                              ConfirmTFF,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              BirthDateTC,
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                              CMaker(alignment: Alignment.center, child: BirthDateW),
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                              GenederText,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              CMaker(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  height: 100,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 5, child: GenederWidgets[0]),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      Expanded(flex: 5, child: GenederWidgets[1]),
                                    ],
                                  )),
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              GradeText,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              GradeDDB,
                              const Padding(padding: EdgeInsets.only(bottom: 60)),
                              CMaker(alignment: Alignment.center, child: SignUpButton),
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              CMaker(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(child: Container()),
                                      Expanded(flex: 10, child: AlreadyHaveAnAccountElements[0]),
                                      Expanded(child: Container()),
                                      Expanded(flex: 6, child: AlreadyHaveAnAccountElements[1]),
                                      Expanded(child: Container()),
                                    ],
                                  )),
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                            ],
                          ),
                        )),
                    Expanded(flex: 2, child: Container()),
                  ],
                )),
          ),
        );
      });
    }
    return StudentSignUpBody;
  }
}
