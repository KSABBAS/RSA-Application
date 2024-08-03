// import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/StudentPages/FirstPageContents.dart';
import 'package:edu_academy/StudentPages/SecondPage.dart';
import 'package:edu_academy/StudentPages/StudentMobileSignUpPage.dart';
import 'package:edu_academy/StudentPages/ThirdPage.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

int PageIndex = 0;

String name = '';
String grade = "";
GlobalKey<FormState> NewKey = GlobalKey();
String NewEmail = "";
String NewPassWord = "";
String NewPhoneNumber = "";

class _StudentMainPageState extends State<StudentMainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? items = prefs.getStringList('id');
      log(items.toString());
      if (items != null && items.isNotEmpty) {
        setState(() {
          name = items[2].split("-")[0];
          name = "${name.split(" ")[0]} ${name.split(" ")[1]}".toTitleCase;
          grade = items[2].split("-")[1];
          // userData = jsonDecode(items[2]) as Map<String, dynamic>;
        });
      }
    });
  }

  XFile? Avatar = null;
  XFile? ProfileAvatar = null;
  @override
  String UpdatedPassword = "";
  Widget build(BuildContext context) {
    late Widget StudentMainPageBody;
    List<Widget> Pages = [
      Container(
        child: StudentFirstMainPage(),
      ),
      Container(
        child: SecondPage()
      ),
      Container(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(82, 0, 0, 0)),
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Container(
                      width: 70,
                      height: 50,
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              PageIndex = 0;
                            });
                          },
                          child: Image.asset("images/Book.png"))),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              grade,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 70,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 8, child: Container(child: const ThirdPage())),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        ),
      ),
      Container(
        child: ListView(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(82, 0, 0, 0)),
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Container(
                      width: 70,
                      height: 50,
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              PageIndex = 0;
                            });
                          },
                          child: Image.asset("images/Book.png"))),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 123, 151)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CMaker(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              grade,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 89, 89, 87)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove("id");
                      Navigator.pushReplacementNamed(context, "SplashView");
                    },
                    child: Container(
                      width: 70,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      child: const Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
            ),
            CMaker(
              height: PageHeight(context) - 200,
              width: double.infinity,
              child: Column(children: [
                InkWell(
                  onTap: () async {
                    XFile? Avatar = await PhotoImageFromGalary();
                    if (Avatar != null) {
                      ProfileAvatar = Avatar;
                      setState(() {});
                    }
                  },
                  child: CMaker(
                    circularRadius: 130,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(69, 0, 0, 0)),
                    ],
                    alignment: Alignment.center,
                    width: 160,
                    height: 160,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        (ProfileAvatar == null)
                            ? CircleAvatar(
                                backgroundImage:
                                    AssetImage("images/personDeafult.png"))
                            : CircleAvatar(
                                backgroundImage:
                                    Image.file(File(ProfileAvatar!.path)).image,
                              ),
                        Positioned(
                          bottom: 6,
                          right: -4,
                          child: CMaker(
                            border: Border.all(
                                width: 4,
                                color: Color.fromARGB(255, 233, 255, 247)),
                            height: 40,
                            width: 40,
                            circularRadius: 50,
                            color: const Color.fromARGB(255, 36, 160, 209),
                            child: Icon(Icons.add, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                CMaker(
                    padding: EdgeInsets.all(20),
                    height: PageHeight(context) - 400,
                    width: double.infinity,
                    color: Color.fromARGB(255, 36, 160, 209),
                    circularRadius: 25,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CMaker(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 6,
                                spreadRadius: .03,
                                color: Color.fromARGB(58, 0, 0, 0)),
                          ],
                          padding: const EdgeInsets.all(10),
                          circularRadius: 25,
                          margin: const EdgeInsets.only(bottom: 30),
                          color: Color.fromARGB(255, 79, 183, 145),
                          // height: 80,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              CMaker(
                                  padding: EdgeInsets.only(right: 10),
                                  child: TMaker(
                                      text: "Kareem said hassan",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                              Expanded(child: Container()),
                            ],
                          ),
                        ),
                        CMaker(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 6,
                                spreadRadius: .03,
                                color: Color.fromARGB(58, 0, 0, 0)),
                          ],
                          padding: const EdgeInsets.all(10),
                          circularRadius: 25,
                          margin: const EdgeInsets.only(bottom: 30),
                          color: const Color.fromARGB(255, 233, 255, 247),
                          // height: 80,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              CMaker(
                                  padding: EdgeInsets.only(right: 10),
                                  child: TMaker(
                                      text: "Grade 12",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                              Expanded(child: Container()),
                            ],
                          ),
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      "Enter the password                  "),
                                  content: CMaker(
                                    height: 60,
                                    alignment: Alignment.center,
                                    child: TextField(
                                      obscureText: obscureText,
                                      decoration: InputDecoration(
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 192, 192, 192)),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 192, 192, 192)),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          label: const Text(
                                            "Password",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 192, 192, 192)),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          focusedBorder:
                                              OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                    title: Text(
                                                        "What do you wanna Change ?"),
                                                    content: Container(
                                                      height: 100,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text("enter the new Email Adress"),
                                                                            content:
                                                                                CMaker(
                                                                              height: 80,
                                                                              alignment: Alignment.center,
                                                                              child: Form(
                                                                                key: NewKey,
                                                                                child: TextFormField(
                                                                                  onSaved: (newValue) {
                                                                                    NewEmail = newValue!;
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
                                                                                      focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                      errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                      label: const Text(
                                                                                        "New Email",
                                                                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            actions: [
                                                                              TextButton(
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Text("Cancel")),
                                                                              TextButton(
                                                                                  onPressed: () async {
                                                                                    if (NewKey.currentState!.validate()) {
                                                                                      NewKey.currentState!.save();
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
                                                                                      await Future.delayed(Duration(seconds: 2));
                                                                                      //edit the Email in the database if there is no one else using it and return true or false
                                                                                      OverlayLoadingProgress.stop();
                                                                                      if (true) {
                                                                                        PanaraInfoDialog.show(
                                                                                          context,
                                                                                          title: "Success",
                                                                                          message: "The email has changed",
                                                                                          buttonText: "Okay",
                                                                                          onTapDismiss: () {
                                                                                            Navigator.pop(context);
                                                                                            Navigator.pop(context);
                                                                                            setState(() {});
                                                                                          },
                                                                                          panaraDialogType: PanaraDialogType.success,
                                                                                          barrierDismissible: false,
                                                                                        );
                                                                                      } else {
                                                                                        PanaraInfoDialog.show(
                                                                                          context,
                                                                                          title: "Sorry",
                                                                                          message: "Somthing went wrong",
                                                                                          buttonText: "Okay",
                                                                                          onTapDismiss: () {
                                                                                            Navigator.pop(context);
                                                                                            NewEmail = "";
                                                                                          },
                                                                                          panaraDialogType: PanaraDialogType.error,
                                                                                          barrierDismissible: true,
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                  child: Text("Ok")),
                                                                            ],
                                                                          );
                                                                        });
                                                                  },
                                                                  child: CMaker(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          60,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          144,
                                                                          30,
                                                                          210),
                                                                      circularRadius:
                                                                          20,
                                                                      child: TMaker(
                                                                          text:
                                                                              "Email",
                                                                          fontSize:
                                                                              25,
                                                                          fontWeight: FontWeight
                                                                              .w800,
                                                                          color:
                                                                              Colors.white)))),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          20)),
                                                          InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            "enter the new Password"),
                                                                        content:
                                                                            CMaker(
                                                                          height:
                                                                              80,
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              Form(
                                                                            key:
                                                                                NewKey,
                                                                            child:
                                                                                CMaker(
                                                                              height: 80,
                                                                              child: TextFormField(
                                                                                onSaved: (newValue) {
                                                                                  NewPassWord = newValue!;
                                                                                },
                                                                                validator: (value) {
                                                                                  if (value!.length < 4) {
                                                                                    return "يجب ان يكون الرقم السرى اكبر من 3 (حروف او ارقام)";
                                                                                  }
                                                                                  return null;
                                                                                },
                                                                                obscureText: obscureText,
                                                                                decoration: InputDecoration(
                                                                                    focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                    errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
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
                                                                                    enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromARGB(255, 192, 192, 192)), borderRadius: BorderRadius.circular(30)),
                                                                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        actions: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Text("Cancel")),
                                                                          TextButton(
                                                                              onPressed: () async {
                                                                                if (NewKey.currentState!.validate()) {
                                                                                  NewKey.currentState!.save();
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
                                                                                  await Future.delayed(Duration(seconds: 2));
                                                                                  //edit the Email in the database if there is no one else using it and return true or false
                                                                                  OverlayLoadingProgress.stop();
                                                                                  if (true) {
                                                                                    PanaraInfoDialog.show(
                                                                                      context,
                                                                                      title: "Success",
                                                                                      message: "The password has changed",
                                                                                      buttonText: "Okay",
                                                                                      onTapDismiss: () {
                                                                                        Navigator.pop(context);
                                                                                        Navigator.pop(context);
                                                                                        setState(() {});
                                                                                      },
                                                                                      panaraDialogType: PanaraDialogType.success,
                                                                                      barrierDismissible: false,
                                                                                    );
                                                                                  } else {
                                                                                    PanaraInfoDialog.show(
                                                                                      context,
                                                                                      title: "Sorry",
                                                                                      message: "Somthing went wrong",
                                                                                      buttonText: "Okay",
                                                                                      onTapDismiss: () {
                                                                                        Navigator.pop(context);
                                                                                        NewEmail = "";
                                                                                      },
                                                                                      panaraDialogType: PanaraDialogType.error,
                                                                                      barrierDismissible: true,
                                                                                    );
                                                                                  }
                                                                                }
                                                                              },
                                                                              child: Text("Ok")),
                                                                        ],
                                                                      );
                                                                    });
                                                              },
                                                              child: CMaker(
                                                                  alignment: Alignment
                                                                      .center,
                                                                  height: 60,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          144,
                                                                          30,
                                                                          210),
                                                                  circularRadius:
                                                                      20,
                                                                  child: TMaker(
                                                                      text:
                                                                          "Password",
                                                                      fontSize:
                                                                          25,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      color: Colors
                                                                          .white))),
                                                        ],
                                                      ),
                                                    ));
                                              });
                                        },
                                        child: Text("Ok"))
                                  ],
                                );
                              },
                            );
                          },
                          child: CMaker(
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 6,
                                  spreadRadius: .03,
                                  color: Color.fromARGB(58, 0, 0, 0)),
                            ],
                            padding: const EdgeInsets.all(10),
                            circularRadius: 25,
                            margin: const EdgeInsets.only(bottom: 30),
                            color: const Color.fromARGB(255, 233, 255, 247),
                            height: 80,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                CMaker(
                                    padding: EdgeInsets.only(right: 10),
                                    child: TMaker(
                                        text: "Email",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                                Expanded(flex: 3, child: Container()),
                                TMaker(
                                    text: "k***4@gmail.com",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios_outlined)
                              ],
                            ),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text(
                                          "Enter the password                  "),
                                      content: CMaker(
                                        height: 60,
                                        alignment: Alignment.center,
                                        child: TextField(
                                          obscureText: obscureText,
                                          decoration: InputDecoration(
                                              focusedErrorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 192, 192, 192)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 192, 192, 192)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              label: const Text(
                                                "Password",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color.fromARGB(255, 192, 192, 192)),
                                                  borderRadius: BorderRadius.circular(30)),
                                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Cancel",
                                            )),
                                        TextButton(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "enter the new Number"),
                                                      content: CMaker(
                                                        height: 80,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Form(
                                                          key: NewKey,
                                                          child: TextFormField(
                                                            onSaved:
                                                                (newValue) {
                                                              NewPhoneNumber =
                                                                  newValue!;
                                                            },
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "الحقل فارغ";
                                                              }
                                                              if (!value.startsWith(
                                                                      "01") &&
                                                                  !value.startsWith(
                                                                      "05")) {
                                                                return "الرقم يجب ان يبدا الرقمين 01 او 05";
                                                              }
                                                              if (value.startsWith(
                                                                      "01") &&
                                                                  value.length !=
                                                                      11) {
                                                                return "الرقم يجب ان يكون 11 رقم";
                                                              }
                                                              if (value.startsWith(
                                                                      "05") &&
                                                                  value.length !=
                                                                      10) {
                                                                return "الرقم يجب ان يكون 10 رقم";
                                                              }
                                                              return null;
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                        borderSide: const BorderSide(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                192,
                                                                                192,
                                                                                192)),
                                                                        borderRadius: BorderRadius.circular(
                                                                            30)),
                                                                    errorBorder: OutlineInputBorder(
                                                                        borderSide: const BorderSide(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                192,
                                                                                192,
                                                                                192)),
                                                                        borderRadius: BorderRadius.circular(
                                                                            30)),
                                                                    label:
                                                                        const Text(
                                                                      "New Number",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    enabledBorder: OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(color: Color.fromARGB(255, 192, 192, 192)),
                                                                        borderRadius: BorderRadius.circular(30)),
                                                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                                          ),
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child:
                                                                Text("Cancel")),
                                                        TextButton(
                                                            onPressed:
                                                                () async {
                                                              if (NewKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                NewKey
                                                                    .currentState!
                                                                    .save();
                                                                OverlayLoadingProgress
                                                                    .start(
                                                                  context,
                                                                  widget:
                                                                      CMaker(
                                                                    circularRadius:
                                                                        15,
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        198,
                                                                        255,
                                                                        255,
                                                                        255),
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        3.6,
                                                                    padding: EdgeInsets.all(
                                                                        MediaQuery.of(context).size.width /
                                                                            13),
                                                                    child:
                                                                        const AspectRatio(
                                                                      aspectRatio:
                                                                          1,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: Colors
                                                                            .blue,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                                await Future.delayed(
                                                                    Duration(
                                                                        seconds:
                                                                            2));
                                                                //edit the Email in the database if there is no one else using it and return true or false
                                                                OverlayLoadingProgress
                                                                    .stop();
                                                                if (true) {
                                                                  PanaraInfoDialog
                                                                      .show(
                                                                    context,
                                                                    title:
                                                                        "Success",
                                                                    message:
                                                                        "the number has changed",
                                                                    buttonText:
                                                                        "Okay",
                                                                    onTapDismiss:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      Navigator.pop(
                                                                          context);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .success,
                                                                    barrierDismissible:
                                                                        false,
                                                                  );
                                                                } else {
                                                                  PanaraInfoDialog
                                                                      .show(
                                                                    context,
                                                                    title:
                                                                        "Sorry",
                                                                    message:
                                                                        "Somthing went wrong",
                                                                    buttonText:
                                                                        "Okay",
                                                                    onTapDismiss:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      NewEmail =
                                                                          "";
                                                                    },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .error,
                                                                    barrierDismissible:
                                                                        true,
                                                                  );
                                                                }
                                                              }
                                                            },
                                                            child: Text("Ok")),
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Text(
                                              "ok",
                                            )),
                                      ]);
                                });
                          },
                          child: CMaker(
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 6,
                                  spreadRadius: .03,
                                  color: Color.fromARGB(58, 0, 0, 0)),
                            ],
                            padding: const EdgeInsets.all(10),
                            circularRadius: 25,
                            margin: const EdgeInsets.only(bottom: 30),
                            color: const Color.fromARGB(255, 233, 255, 247),
                            height: 80,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                CMaker(
                                    padding: EdgeInsets.only(right: 10),
                                    child: TMaker(
                                        text: "Phone",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                                Expanded(flex: 3, child: Container()),
                                TMaker(
                                    text: "+2010**83",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios_outlined)
                              ],
                            ),
                          ),
                        )),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                flex: 3,
                                child: CMaker(
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 6,
                                        spreadRadius: .03,
                                        color: Color.fromARGB(58, 0, 0, 0)),
                                  ],
                                  padding: const EdgeInsets.all(10),
                                  circularRadius: 25,
                                  margin: const EdgeInsets.only(bottom: 30),
                                  color:
                                      const Color.fromARGB(255, 233, 255, 247),
                                  height: 80,
                                  child: Row(
                                    children: [
                                      Expanded(child: Container()),
                                      CMaker(
                                          padding: EdgeInsets.only(right: 10),
                                          child: TMaker(
                                              text: "Rate us",
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0))),
                                      Expanded(child: Container()),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                        )
                      ],
                    ))
              ]),
            )
          ],
        ),
      ),
    ];
    if (PageWidth(context) < 550) {
      StudentMainPageBody = Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        bottomNavigationBar: CurvedNavigationBar(
            color: const Color.fromARGB(255, 255, 255, 255),
            backgroundColor: const Color.fromARGB(255, 233, 255, 247),
            index: PageIndex,
            height: 75,
            onTap: (val) {
              setState(() {
                PageIndex = val;
              });
            },
            items: const [
              Icon(
                Icons.home,
                color: Colors.black,
              ),
              Icon(
                Icons.menu_book,
                color: Colors.black,
              ),
              Icon(
                Icons.book,
                color: Colors.black,
              ),
              Icon(
                Icons.person,
                color: Colors.black,
              ),
            ]),
        body: Pages.elementAt(PageIndex),
      );
    } else if (PageHeight(context) >= 550 && PageHeight(context) < 900) {
      StudentMainPageBody = Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        body: Row(
          children: [
            SideBarAnimated(
              dividerColor: Color.fromARGB(255, 0, 0, 0),
              sideBarColor: const Color.fromARGB(255, 36, 160, 209),
              selectedIconColor: Colors.white,
              hoverColor: Color.fromARGB(255, 255, 255, 255),
              unselectedIconColor: Colors.black,
              unSelectedTextColor: Colors.black,
              sideBarWidth: 300,
              onTap: (s) {
                setState(() {
                PageIndex = s;
                });
              },
              widthSwitch: (PageWidth(context)>600&&PageWidth(context)<900)?800:1200,
              mainLogoImage: 'images/Logo.png',
              sidebarItems: [
                SideBarItem(
                  iconSelected: Icons.home_rounded,
                  text: 'Home',
                ),
                SideBarItem(
                  iconSelected: Icons.menu_book,
                  text: 'Subjects',
                ),
                SideBarItem(
                  iconSelected: Icons.book,
                  text: 'Homework',
                ),
                SideBarItem(
                  iconSelected: Icons.person,
                  text: 'Profile',
                ),
              ],
            ),
            Pages.elementAt(PageIndex),
          ],
        ),
      );
    } else if (PageHeight(context) >= 550 && PageHeight(context) >= 900) {
      StudentMainPageBody = Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        bottomNavigationBar: CurvedNavigationBar(
            color: const Color.fromARGB(255, 255, 255, 255),
            backgroundColor: const Color.fromARGB(255, 233, 255, 247),
            index: PageIndex,
            height: 75,
            onTap: (val) {
              setState(() {
                PageIndex = val;
              });
            },
            items: const [
              Icon(
                Icons.home,
                color: Colors.black,
              ),
              Icon(
                Icons.menu_book,
                color: Colors.black,
              ),
              Icon(
                Icons.book,
                color: Colors.black,
              ),
              Icon(
                Icons.person,
                color: Colors.black,
              ),
            ]),
        body: Pages.elementAt(PageIndex),
      );
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return StudentMainPageBody;
  }
}
