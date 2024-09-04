import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edu_academy/AdminPages/AdminFirstPageContents.dart';
import 'package:edu_academy/AdminPages/AdminSocendPageContenets.dart';
import 'package:edu_academy/AdminPages/AdminThirdPageContents.dart';
import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

int PageIndex = 0;
List<List> Teachers = [];
List<List> Students = [];

class _AdminMainPageState extends State<AdminMainPage> {
  final dbService = DatabaseService();

  bool ConnectedToInternet = true;
  @override
  void initState() {
    super.initState();
    final listener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
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
    Teacher_data();
    Students_data_();
  }

  @override
  Teacher_data() async {
    var da_ = await dbService.FiGet_all_users_data("Teacher");
    Teachers = [];
    for (var i in da_) {
      Teachers.add([
        i['photo'],
        i['name'],
        i['email'],
        i['phone'],
        i['state'],
        i.id,
        [i['Subject1'], i['Subject2'], i['Subject3']]
      ]);
    }
    print("##Teachers $Teachers");
    // Teachers.sort((a, b) => b[4].compareTo(a[4]));
  }

  @override
  Students_data_() async {
    var da_ = await dbService.FiGet_all_users_data("Students");
    Students = [];
    for (var i in da_) {
      Students.add([
        i['photo'],
        i['name'],
        i['email'],
        i['phone'],
        i['state'],
        i.id,
      ]);
    }
    // Students.sort((a, b) => b[4].compareTo(a[4]));
  }

  @override
  Widget build(BuildContext context) {
    late Widget AdmintMainPageBody;
    List<Widget> Pages = [
      AdminFirstPageContents(AdminName: "Kareem said"),
      AdminSocendPageContenets(
        AdminName: "Kareem said",
      ),
      AdminThirdPageContenets(AdminName: "Kareem said"),
    ];
    if (PageWidth(context) < 550) {
      AdmintMainPageBody = Scaffold(
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
                Icons.table_view,
                color: Colors.black,
              ),
              Icon(
                Icons.school,
                color: Colors.black,
              ),
              Icon(
                Icons.book,
                color: Colors.black,
              ),
            ]),
        body: Pages.elementAt(PageIndex),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      AdmintMainPageBody = Scaffold(
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
                  iconSelected: Icons.table_view,
                  text: 'Tables',
                ),
                SideBarItem(
                  iconSelected: Icons.school,
                  text: 'Teachers',
                ),
                SideBarItem(
                  iconSelected: Icons.book,
                  text: 'Students',
                ),
              ],
            ),
            Pages.elementAt(PageIndex),
          ],
        ),
      );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      AdmintMainPageBody = Scaffold(
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
                Icons.table_view,
                color: Colors.black,
              ),
              Icon(
                Icons.school,
                color: Colors.black,
              ),
              Icon(
                Icons.book,
                color: Colors.black,
              ),
            ]),
        body: Pages.elementAt(PageIndex),
      );
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (ConnectedToInternet) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 74, 193, 241),
        body: LiquidPullToRefresh(
            showChildOpacityTransition: false,
            backgroundColor: Color.fromARGB(255, 74, 193, 241),
            color: const Color.fromARGB(255, 233, 255, 247),
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 500));
              setState(() {});
            },
            child: AdmintMainPageBody),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        body: Center(
            child: CMaker(
                height: 150,
                width: 270,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 6,
                      spreadRadius: .03,
                      color: Color.fromARGB(82, 0, 0, 0)),
                ],
                circularRadius: 20,
                alignment: Alignment.center,
                child: TMaker(
                    text: "You aren't connected to internet",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black))),
      );
    }
  }
}
