import 'package:edu_academy/Data/StudentData/GradesAndSubjects.dart';
import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class TeacherSignUpPage extends StatefulWidget {
  const TeacherSignUpPage({super.key});

  @override
  State<TeacherSignUpPage> createState() => _TeacherSignUpPageState();
}

var obscureText = true;

String TeacherConfirmPassword = "";

// String TeacherSubject1 = "null";
// String TeacherSubject2 = "null";
// String TeacherSubject3 = "null";
// String TeacherData.TeacherDescription = "";
bool SecondDropdownVisible = false;
bool ThirdDropdownVisible = false;
GlobalKey<FormState> key3 = GlobalKey();
var forDateInput = DateTime.now().subtract(const Duration(days: 1926));

class _TeacherSignUpPageState extends State<TeacherSignUpPage> {
  bool SecondDropdownVisible = false;
  bool ThirdDropdownVisible = false;
  String TeacherDemoPassword = "";
  String TeacherDemoConfirmPassword = "";
  final TextEditingController _MessageController = TextEditingController();
  final dbService = DatabaseService();
  List<DropdownMenuItem<String>>? SubjectsMaker(String TeacherSubjectNumber) {
    List<DropdownMenuItem<String>>? list = [
      DropdownMenuItem(
        value: "null",
        child: CMaker(child: TMaker(text: "null", fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
      ),
    ];
    for (int i = 0; i < GradesAndsubjects.Subjects.length; i++) {
      list.add(
        DropdownMenuItem(
          value: GradesAndsubjects.Subjects[i][1],
          child: CMaker(child: TMaker(text: GradesAndsubjects.Subjects[i][1], fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    late Widget TeacherSignUpBody;
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
    Widget TeacherWithArrow = Container(
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: const Text("معلم  ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 8, 125, 159)))),
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
    List<Widget> AlreadyHaveAnAccountElements = [
      Container(
        alignment: Alignment.centerRight,
        child: const Text(
          "هل تلمك حساب؟",
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
            "تسجيل دخول",
            style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 74, 193, 241), fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ];
    Widget NameTFF = SizedBox(
        height: 80,
        child: TextFormField(
          onSaved: (newValue) {
            TeacherData.name = newValue!;
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
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              label: const Text(
                "الاسم كامل",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ));
    Widget PhoneTFF = SizedBox(
        height: 80,
        child: TextFormField(
          onSaved: (newValue) {
            TeacherData.number = newValue!;
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
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              label: const Text(
                "رقم الهاتف",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ));
    Widget EmailTFF = SizedBox(
        height: 80,
        child: TextFormField(
          onSaved: (newValue) {
            TeacherData.email = newValue!;
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
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              label: const Text(
                "الايميل",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ));
    Widget PasswordTFF = SizedBox(
        height: 80,
        child: TextFormField(
          onSaved: (newValue) {
            TeacherData.password = newValue!;
          },
          onChanged: (value) {
            TeacherDemoPassword = value;
          },
          validator: (value) {
            if (value!.length < 4) {
              return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
            }
            if (TeacherDemoPassword != TeacherDemoConfirmPassword) {
              return "الكلمتان السريتان غير متشابهتان";
            }
            return null;
          },
          obscureText: obscureText,
          decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              suffix: InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: const Icon(Icons.remove_red_eye_outlined),
              ),
              label: const Text(
                "الرقم السري",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ));
    Widget ConfirmTFF = SizedBox(
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
            if (TeacherDemoPassword != TeacherDemoConfirmPassword) {
              return "الكلمتان السريتان غير متشابهتان";
            }
            return null;
          },
          obscureText: obscureText,
          decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
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
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ));
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
            text: TeacherData.TeacherDateOfBirth,
            onTap: () async {
              var TimeSelected = await showOmniDateTimePicker(
                context: context,
                initialDate: DateTime.now(),
                // firstDate: DateTime.now().subtract(const Duration(days: 36525)),
                // lastDate: DateTime.now().subtract(
                //   const Duration(days: 1824),
                // ),
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
              TeacherData.TeacherDayOfBirth = TimeSelected!.day.toString();
              TeacherData.TeacherMonthOfBirth = TimeSelected.month.toString();
              TeacherData.TeacherYearOfBirth = TimeSelected.year.toString();
              TeacherData.TeacherDateOfBirth = "$TeacherData.TeacherDayOfBirth / $TeacherData.TeacherMonthOfBirth / $TeacherData.TeacherYearOfBirth";
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
                TeacherData.TeacherDayOfBirth = dateTime.day.toString();
                TeacherData.TeacherMonthOfBirth = dateTime.month.toString();
                TeacherData.TeacherYearOfBirth = dateTime.year.toString();
                TeacherData.TeacherDateOfBirth = "$TeacherData.TeacherDayOfBirth/$TeacherData.TeacherMonthOfBirth/$TeacherData.TeacherYearOfBirth";
                print(TeacherData.TeacherDateOfBirth);
              });
            },
          );
    Widget GenederTC = Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        "النوع",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
    List<Widget> GenederWidegts = [
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
              groupValue: TeacherData.TeacherGeneder,
              onChanged: (val) {
                setState(() {
                  TeacherData.TeacherGeneder = val.toString();
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
              groupValue: TeacherData.TeacherGeneder,
              onChanged: (val) {
                setState(() {
                  TeacherData.TeacherGeneder = val.toString();
                });
              }))
    ];
    Widget SubjectsTC = Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        "اختر المادة",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
    Widget SubjectsWidgets = CMaker(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "المادة الاولى",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(child: Container()),
                DropdownButton<String>(
                  items: SubjectsMaker(TeacherData.Subject1),
                  value: TeacherData.Subject1,
                  onChanged: (s1) {
                    setState(() {
                      TeacherData.Subject1 = s1!.toString();
                    });
                  },
                ),
              ],
            ),
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
              child: const Text("اظهر خانت اضافة المادة الثانية"),
            ),
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "المادة الثانيه",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(child: Container()),
                  DropdownButton<String>(
                    items: SubjectsMaker(TeacherData.Subject2),
                    value: TeacherData.Subject2,
                    onChanged: (s2) {
                      setState(() {
                        TeacherData.Subject2 = s2!.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          Visibility(
            visible: ThirdDropdownVisible,
            replacement: SecondDropdownVisible
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ThirdDropdownVisible = true;
                      });
                    },
                    child: const Text("اظهر خانت اضافة المادة الثالثة"),
                  )
                : const SizedBox.shrink(),
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "المادة الثالثة",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(child: Container()),
                  DropdownButton<String>(
                    items: SubjectsMaker(TeacherData.Subject3),
                    value: TeacherData.Subject3,
                    onChanged: (s3) {
                      setState(() {
                        TeacherData.Subject3 = s3!.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
    Widget BreefWidge = SizedBox(
      height: 210,
      child: TextField(
        controller: _MessageController,
        maxLines: 8,
        onChanged: (newValue) {
          TeacherData.TeacherDescription = newValue;
        },
        decoration: InputDecoration(
            hintText: "اخبرنا اكثر عن نفسك",
            enabledBorder:
                OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
    Widget SignUpButton = InkWell(
      onTap: () async {
        if (key3.currentState!.validate()) {
          key3.currentState!.save();
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
          await dbService.fiCreate('Teacher', {
            "name": TeacherData.name,
            "phone": TeacherData.number,
            "email": TeacherData.email.toLowerCase(),
            "password": TeacherData.password,
            "birth_date": TeacherData.TeacherDateOfBirth,
            "gender": TeacherData.TeacherGeneder,
            "Subject1": [TeacherData.Subject1],
            "Subject2": (TeacherData.Subject2 == "null") ? TeacherData.Subject2 : [TeacherData.Subject2],
            "Subject3": (TeacherData.Subject3 == "null") ? TeacherData.Subject3 : [TeacherData.Subject3],
            "Description": TeacherData.TeacherDescription,
            "photo":
                'https://firebasestorage.googleapis.com/v0/b/rsa-app-3ec3f.appspot.com/o/Profiles%2FPerson.png?alt=media&token=9a526b63-e8ff-40ec-b831-088e270a0013',
            "state": "false"
          });
          OverlayLoadingProgress.stop();
          _MessageController.clear();
          PanaraInfoDialog.show(
            context,
            title: "تم حفظ البيانات بنجاح",
            message: "الان يمكنك تسجيل الدخول ",
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
    if (PageWidth(context) < 550) {
      setState(() {
        TeacherSignUpBody = Scaffold(
          body: Form(
            key: key3,
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
                            TeacherWithArrow,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            NameTFF,
                            PhoneTFF,
                            EmailTFF,
                            PasswordTFF,
                            ConfirmTFF,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            BirthDateTC,
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                            CMaker(alignment: Alignment.center, child: BirthDateW),
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                            GenederTC,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                height: 100,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(flex: 5, child: GenederWidegts[0]),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Expanded(flex: 5, child: GenederWidegts[1]),
                                  ],
                                )),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            SubjectsWidgets,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            BreefWidge,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
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
        TeacherSignUpBody = Scaffold(
          body: Form(
            key: key3,
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
                              TeacherWithArrow,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              NameTFF,
                              PhoneTFF,
                              EmailTFF,
                              PasswordTFF,
                              ConfirmTFF,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              BirthDateTC,
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                              CMaker(alignment: Alignment.center, child: BirthDateW),
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                              GenederTC,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              CMaker(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  height: 100,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 5, child: GenederWidegts[0]),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      Expanded(flex: 5, child: GenederWidegts[1]),
                                    ],
                                  )),
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              SubjectsWidgets,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              BreefWidge,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
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
        TeacherSignUpBody = Scaffold(
          body: Form(
            key: key3,
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
                              TeacherWithArrow,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              NameTFF,
                              PhoneTFF,
                              EmailTFF,
                              PasswordTFF,
                              ConfirmTFF,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              BirthDateTC,
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                              CMaker(alignment: Alignment.center, child: BirthDateW),
                              const Padding(padding: EdgeInsets.only(bottom: 40)),
                              GenederTC,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              CMaker(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  height: 100,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 5, child: GenederWidegts[0]),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      Expanded(flex: 5, child: GenederWidegts[1]),
                                    ],
                                  )),
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              SubjectsWidgets,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                              BreefWidge,
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return TeacherSignUpBody;
  }
}
