import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

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
    late Widget ParentSignUpBody;
    Widget TFFS = Column(
      children: [
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 192, 192, 192)),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
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
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 192, 192, 192)),
                    borderRadius: BorderRadius.circular(30)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 192, 192, 192)),
                    borderRadius: BorderRadius.circular(30)),
                label: const Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 192, 192, 192)),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
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
              if ((!value.endsWith("@gmail.com") || !(value.length > 10)) &&
                  (!value.endsWith("@yahoo.com") || !(value.length > 10))) {
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 192, 192, 192)),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
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
              if (ParentDemoPassword != ParentDemoConfirmPassword) {
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 192, 192, 192)),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
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
              if (ParentDemoPassword != ParentDemoConfirmPassword) {
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 192, 192, 192)),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      ],
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
                bottomLeft: Radius.zero,
                topLeft: Radius.circular(10),
                topRight: Radius.circular(5000),
                bottomRight: Radius.circular(10)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: const Text(
            "Sign up",
            style: TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 8, 125, 159),
                fontWeight: FontWeight.w700),
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
        height: double.infinity,
        child: Image.asset(
          "images/Logo.png",
          fit: BoxFit.contain,
        ));
    Widget ParentWithArro = Container(
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: const Text("Parent  ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 8, 125, 159)))),
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
    Widget SignUpButton = InkWell(
      onTap: () async {
        if (true) {
          //key2.currentState!.validate()) {
          key2.currentState!.save();
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
          await dbService.fiCreate('Parent', {
            "name": ParentName,
            "phone": ParentNumber,
            "email": ParentEmail,
            "password": ParentPassword,
            "gender": "not added yet",
            "photo" : '',
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
              fontSize: 15,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w700),
        ),
      ),
    );
    if (PageWidth(context) < 550) {
      setState(() {
        ParentSignUpBody = Scaffold(
          body: Form(
            key: key2,
            child: CMaker(
              height: PageHeight(context),
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                          Color.fromARGB(255, 8, 125, 159),
                          Color.fromARGB(255, 74, 193, 241)
                        ])),
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
                        Expanded(
                            child: CMaker(
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: Logo))
                      ],
                    ),
                  ),
                  CMaker(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(bottom: 20)),
                          ParentWithArro,
                          const Padding(padding: EdgeInsets.only(bottom: 20)),
                          TFFS,
                          const Padding(padding: EdgeInsets.only(bottom: 20)),
                          CMaker(
                              alignment: Alignment.center, child: SignUpButton),
                          const Padding(padding: EdgeInsets.only(bottom: 20)),
                          CMaker(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(child: Container()),
                                  Expanded(
                                      flex: 10,
                                      child: AlreadyHaveAnAccountElements[0]),
                                  Expanded(child: Container()),
                                  Expanded(
                                      flex: 6,
                                      child: AlreadyHaveAnAccountElements[1]),
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
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      setState(() {
        ParentSignUpBody = Scaffold(
          body: Form(
            key: key2,
            child: CMaker(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 8, 125, 159),
                      Color.fromARGB(255, 74, 193, 241)
                    ]),
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          CMaker(width: 70,height: 70,child: BackButton,),
                          Expanded(
                            flex: 20,
                            child: Image.asset(
                              "images/Logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 70,height: 70,),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                    CMaker(
                        circularRadius: 20,
                        color: Colors.white,
                        height: 500,
                        width: 450,
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            ParentWithArro,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            TFFS,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                alignment: Alignment.center,
                                child: SignUpButton),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(child: Container()),
                                    Expanded(
                                        flex: 10,
                                        child: AlreadyHaveAnAccountElements[0]),
                                    Expanded(child: Container()),
                                    Expanded(
                                        flex: 6,
                                        child: AlreadyHaveAnAccountElements[1]),
                                    Expanded(child: Container()),
                                  ],
                                )),
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                          ],
                        )),
                    Expanded(flex: 2, child: Container()),
                  ],
                )),
          ),
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      setState(() {
        ParentSignUpBody = Scaffold(
          body: Form(
            key: key2,
            child: CMaker(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 8, 125, 159),
                      Color.fromARGB(255, 74, 193, 241)
                    ]),
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
                          CMaker(width: 70,height: 70,child: BackButton,),
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
                          const SizedBox(width: 70,height: 70),
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
                        width: (PageWidth(context) < 800)
                            ? PageWidth(context) / 2
                            : 400,
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            ParentWithArro,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            TFFS,
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                alignment: Alignment.center,
                                child: SignUpButton),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            CMaker(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(child: Container()),
                                    Expanded(
                                        flex: 10,
                                        child: AlreadyHaveAnAccountElements[0]),
                                    Expanded(child: Container()),
                                    Expanded(
                                        flex: 6,
                                        child: AlreadyHaveAnAccountElements[1]),
                                    Expanded(child: Container()),
                                  ],
                                )),
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                          ],
                        )),
                    Expanded(flex: 2, child: Container()),
                  ],
                )),
          ),
        );
      });
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return ParentSignUpBody;
  }
}
