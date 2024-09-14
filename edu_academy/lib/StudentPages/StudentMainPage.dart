import 'dart:developer';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/StudentPages/FirstPageContents.dart';
import 'package:edu_academy/StudentPages/Notifications.dart';
import 'package:edu_academy/StudentPages/ProfilePageContents.dart';
import 'package:edu_academy/StudentPages/SecondPageContents.dart';
import 'package:edu_academy/StudentPages/ThirdPageContents.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

bool AccountActivation = true;
int PageIndex = 0;

String name = "loading....";
String grade = "loading....";
String student_id = '';
String role = '';
GlobalKey<FormState> NewKey = GlobalKey();
String NewEmail = "";
String NewPassWord = "";
String NewPhoneNumber = "";
List<List> TableData = [
  ["الوقت//التاريخ", "الحصة الاولى", "الحصة الثانية", "الحصة الثالثة", "الحصة الرابعه", "الحصة الخامسة"],
  ["الاثنين", "Soon", "Soon", "Soon", "Soon", "Soon"],
  ["الثلاثاء", "Soon", "Soon", "Soon", "Soon", "Soon"],
  ["الاربعاء", "Soon", "Soon", "Soon", "Soon", "Soon"],
  ["الخميس", "Soon", "Soon", "Soon", "Soon", "Soon"],
  ["الجمعة", "Soon", "Soon", "Soon", "Soon", "Soon"],
  ["السبت", "Soon", "Soon", "Soon", "Soon", "Soon"],
  ["الاحد", "Soon", "Soon", "Soon", "Soon", "Soon"],
];
Map<String, dynamic> profile_data = {};

bool ThereIsNotifications = () {
  bool result = false;
  for (int i = 0; StudentNotiFications.length != i; i++) {
    if (StudentNotiFications[i][4] == false) {
      result = true;
      break;
    }
  }
  print(result);
  return result;
}();

class _StudentMainPageState extends State<StudentMainPage> {
  bool ConnectedToInternet = true;
  final dbService = DatabaseService();
  bool isLoading = true;
  late Future<void> dataFuture;
  @override
  void initState() {
    super.initState();
    final listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          print("================================\nConnected");
          setState(() {
            ConnectedToInternet = true;
          });
          break;
        case InternetStatus.disconnected:
          print("================================\nDisconnected");
          setState(() {
            ConnectedToInternet = false;
          });
          break;
      }
    });
    fetch();
  }
  bool stringToBool(String value) {
  print("stringToBool ${value} ${value.toLowerCase() == 'true'}");
  return value.toLowerCase() == 'true';
}
  regetmessages() async {
    List ggrtr = await dbService.fiGet_Hw(grade, student_id);
    // HomeWorks.add(ggrtr);
    HomeWorks = ggrtr;
    print(ggrtr);
    print("add done");
    print(HomeWorks[HomeWorkIndex][0]);
    log("#HomeWorks ${HomeWorks}");
  }

  Future<void> fetch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = await prefs.getStringList('id');

    print("==================\n=================\n" + items.toString());
    if (items != null && items.isNotEmpty) {
      name = items[2].split("-")[0];
      name = "${name.split(" ")[0]} ${name.split(" ")[1]}".toTitleCase;
      grade = items[2].split("-")[1];
      student_id = items[0].toString().split("#")[1];
      role = items[0].toString().split("#")[0];
      // userData = jsonDecode(items[2]) as Map<String, dynamic>;
    }
    print("student_id $student_id");
    print("role $role");
    print(name);
    print(grade);
    profile_data = await dbService.FiGet_profile_data(student_id, "${role}s") as Map<String, dynamic>;
    print("teacher_profile_data $profile_data");
    AccountActivation = stringToBool(profile_data['state']);
    await regetmessages();
    setState(() {
      isLoading = false;
    });
  }

  // hh@gmail.com  1234
  XFile? Avatar;
  XFile? ProfileAvatar;
  @override
  String UpdatedPassword = "";
  @override
  Widget build(BuildContext context) {
    ThereIsNotifications = () {
      bool result = false;
      for (int i = 0; StudentNotiFications.length != i; i++) {
        if (StudentNotiFications[i][4] == false) {
          result = true;
          break;
        }
      }
      print(result);
      return result;
    }();
    print("start........build");
    print("ThereIsNotifications $ThereIsNotifications");
    late Widget StudentMainPageBody;
    List<Widget> Pages = [
      Container(
        child: const StudentFirstMainPage(),
      ),
      Container(child: const SecondPage()),
      Container(
        child: const ThirdPage(),
      ),
      Builder(builder: (context) {
        return (PageWidth(context) < 550)
            ? Container(
                child: ListView(
                  children: [
                    Container(
                      height: 80,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
                          ],
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                      child: Row(
                        children: [
                          Expanded(
                            child: CMaker(
                              height: 30,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      PageIndex = 0;
                                    });
                                  },
                                  child: CircleAvatar(backgroundImage: NetworkImage(profile_data['photo']))),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: CMaker(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CMaker(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        name,
                                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 5, 123, 151)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: CMaker(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        grade,
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 89, 89, 87)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.remove("id");
                                Navigator.pushReplacementNamed(context, "SplashView");
                              },
                              child: Container(
                                width: 70,
                                padding: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
                                height: 50,
                                child: const Icon(Icons.logout),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                    StudentProfile(
                      StudentName: profile_data['name'],
                      StudentGrade: profile_data['grade'],
                      StudentEmail: profile_data['email'],
                      StudentNumber: profile_data['phone'],
                      StudentPassword: profile_data['password'],
                      profile_photo: profile_data['photo'],
                    )
                  ],
                ),
              )
            : (PageWidth(context) >= 550 && PageHeight(context) >= 900)
                ? Container(
                    child: ListView(
                      children: [
                        Container(
                          height: 70,
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
                              ],
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
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
                                      child: CircleAvatar(backgroundImage: NetworkImage(profile_data['photo'])))),
                              Expanded(
                                child: CMaker(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CMaker(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            name,
                                            style:
                                                const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 5, 123, 151)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: CMaker(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            grade,
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 89, 89, 87)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.remove("id");
                                  Navigator.pushReplacementNamed(context, "SplashView");
                                },
                                child: Container(
                                  width: 70,
                                  padding: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
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
                        StudentProfile(
                          StudentName: profile_data['name'],
                          StudentGrade: profile_data['grade'],
                          StudentEmail: profile_data['email'],
                          StudentNumber: profile_data['phone'],
                          StudentPassword: profile_data['password'],
                          profile_photo: profile_data['photo'],
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
                                  ],
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                              height: 80,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  PageIndex = 0;
                                                });
                                              },
                                              child: CircleAvatar(backgroundImage: NetworkImage(profile_data['photo']))))),
                                  Expanded(
                                      flex: 3,
                                      child: CMaker(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                              fontSize: (PageWidth(context) < 550)
                                                  ? 17
                                                  : (PageHeight(context) < 900)
                                                      ? 20
                                                      : 20,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromARGB(255, 5, 123, 151)),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: CMaker(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          grade,
                                          style: TextStyle(
                                              fontSize: (PageWidth(context) < 550)
                                                  ? 17
                                                  : (PageHeight(context) < 900)
                                                      ? 20
                                                      : 20,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromARGB(255, 89, 89, 87)),
                                        ),
                                      )),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                                        prefs.remove("id");
                                        Navigator.pushReplacementNamed(context, "SplashView");
                                      },
                                      child: Container(
                                        width: 70,
                                        padding: const EdgeInsets.only(top: 10),
                                        decoration:
                                            BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
                                        height: 50,
                                        child: const Icon(Icons.logout),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40),
                          ),
                          StudentProfile(
                            StudentName: profile_data['name'],
                            StudentGrade: profile_data['grade'],
                            StudentEmail: profile_data['email'],
                            StudentNumber: profile_data['phone'],
                            StudentPassword: profile_data['password'],
                            profile_photo: profile_data['photo'],
                          ),
                        ],
                      ),
                    ),
                  );
      })
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
                // regetmessages();
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
        body: (AccountActivation)
            ? Pages.elementAt(PageIndex)
            : Stack(
                children: [
                  Opacity(
                    opacity: .4,
                    child: Pages.elementAt(PageIndex),
                  ),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      height: PageHeight(context) - 90,
                      color: const Color.fromARGB(168, 137, 137, 137),
                      child: CMaker(
                        alignment: Alignment.center,
                        circularRadius: 20,
                        width: PageWidth(context) / 1.5,
                        height: PageHeight(context) / 5,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(child: Container()),
                            TMaker(text: "Your Account Is Not Activated", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () async {
                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.remove("id");
                                Navigator.pushReplacementNamed(context, "SplashView");
                              },
                              child: CMaker(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: CMaker(
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    circularRadius: 15,
                                    color: Color.fromARGB(255, 74, 193, 241),
                                    child: TMaker(
                                        text: "Log Out", fontSize: 20, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255)),
                                  )),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      )),
                ],
              ),
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
              sideBarAnimationDuration: const Duration(milliseconds: 500),
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
            (AccountActivation)
                ? Pages.elementAt(PageIndex)
                : Stack(
                    children: [
                      Opacity(
                        opacity: .4,
                        child: Pages.elementAt(PageIndex),
                      ),
                      CMaker(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: PageHeight(context) - 90,
                          color: const Color.fromARGB(168, 137, 137, 137),
                          child: CMaker(
                            alignment: Alignment.center,
                            circularRadius: 20,
                            width: PageWidth(context) / 1.5,
                            height: PageHeight(context) / 5,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Expanded(child: Container()),
                                TMaker(text: "Your Account Is Not Activated", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
                                Expanded(child: Container()),
                                InkWell(
                                  onTap: () async {
                                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.remove("id");
                                    Navigator.pushReplacementNamed(context, "SplashView");
                                  },
                                  child: CMaker(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: CMaker(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        circularRadius: 15,
                                        color: Color.fromARGB(255, 74, 193, 241),
                                        child: TMaker(
                                            text: "Log Out",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromARGB(255, 255, 255, 255)),
                                      )),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          )),
                    ],
                  ),
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
        body: (AccountActivation)
            ? Pages.elementAt(PageIndex)
            : Stack(
                children: [
                  Opacity(
                    opacity: .4,
                    child: Pages.elementAt(PageIndex),
                  ),
                  CMaker(
                      width: double.infinity,
                      alignment: Alignment.center,
                      height: PageHeight(context) - 90,
                      color: const Color.fromARGB(168, 137, 137, 137),
                      child: CMaker(
                        alignment: Alignment.center,
                        circularRadius: 20,
                        width: PageWidth(context) / 1.5,
                        height: PageHeight(context) / 5,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(child: Container()),
                            TMaker(text: "Your Account Is Not Activated", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () async {
                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.remove("id");
                                Navigator.pushReplacementNamed(context, "SplashView");
                              },
                              child: CMaker(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: CMaker(
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    circularRadius: 15,
                                    color: Color.fromARGB(255, 74, 193, 241),
                                    child: TMaker(
                                        text: "Log Out", fontSize: 20, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255)),
                                  )),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      )),
                ],
              ),
      );
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (ConnectedToInternet) {
      return (isLoading)
          ? const Scaffold(
              backgroundColor: Color.fromARGB(255, 233, 255, 247),
              body: Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 74, 193, 241),
              )))
          : Scaffold(
              backgroundColor: Color.fromARGB(255, 74, 193, 241),
              body: LiquidPullToRefresh(
                  showChildOpacityTransition: false,
                  backgroundColor: Color.fromARGB(255, 74, 193, 241),
                  color: const Color.fromARGB(255, 233, 255, 247),
                  onRefresh: () async {
                    await fetch();
                    await regetmessages();
                    await Future.delayed(Duration(milliseconds: 500));
                    setState(() {
                      
                    });
                  },
                  child: StudentMainPageBody));
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        body: Center(
            child: CMaker(
                height: 150,
                width: 270,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
                ],
                circularRadius: 20,
                alignment: Alignment.center,
                child: TMaker(text: "You aren't connected to internet", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black))),
      );
    }
  }
}
