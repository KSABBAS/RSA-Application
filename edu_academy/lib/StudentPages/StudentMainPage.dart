// import 'dart:convert';
import 'dart:developer';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/StudentPages/FirstPageContents.dart';
import 'package:edu_academy/StudentPages/ProfilePageContents.dart';
import 'package:edu_academy/StudentPages/SecondPageContents.dart';
import 'package:edu_academy/StudentPages/ThirdPageContents.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_extensions/string_extensions.dart';
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
List<List> TableData = [
  ["","arabic","English","math","geo","other"],
  ["السبت","1","2","3","4","5"],
  ["الاحد","1","2","3","4","5"],
  ["الاثنين","1","2","3","4","5"],
  ["الثلاثاء","1","2","3","4","5"],
  ["الاربعاء","1","2","3","4","5"],
  ["الخميس","1","2","3","4","5"],
  ["الجمعة","1","2","3","4","5"],
];
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

  XFile? Avatar;
  XFile? ProfileAvatar;
  @override
  String UpdatedPassword = "";
  @override
  Widget build(BuildContext context) {
    late Widget StudentMainPageBody;
    List<Widget> Pages = [
      Container(
        child: const StudentFirstMainPage(),
      ),
      Container(
        child: const SecondPage()
      ),
      Container(
        child: const ThirdPage(),
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
                      child: CMaker(
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
              StudentProfile(StudentName: "Kareem said hassan",StudentGrade: "Grade 12",StudentEmail: "kreemsaid234@gmail.com",StudentNumber: "01065866283",StudentPassword: "1234",)
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
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      StudentMainPageBody = Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        body: Row(
          children: [
            SideBarAnimated(
              dividerColor: const Color.fromARGB(255, 0, 0, 0),
              sideBarColor: const Color.fromARGB(255, 36, 160, 209),
              selectedIconColor: Colors.white,
              hoverColor: const Color.fromARGB(255, 255, 255, 255),
              unselectedIconColor: Colors.black,
              unSelectedTextColor: Colors.black,
              sideBarWidth: 300,
              onTap: (s) {
                setState(() {
                PageIndex = s;
                });
              },
              sideBarAnimationDuration: Duration(milliseconds: 500),
              widthSwitch: 1200,
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
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
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
