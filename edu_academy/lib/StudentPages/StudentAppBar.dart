import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/StudentPages/Notifications.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class StudentAppBar extends StatefulWidget {
  const StudentAppBar({super.key});

  @override
  State<StudentAppBar> createState() => _StudentAppBarState();
}

class _StudentAppBarState extends State<StudentAppBar> {
  @override
  Widget build(BuildContext context) {
    Widget Logo = InkWell(
        onTap: () {
          setState(() {
            PageIndex = 0;
          });
        },
        child:
            CircleAvatar(backgroundImage: Image.network(profile_data['photo'],fit:BoxFit.fitHeight,).image));
    Widget StudentNameTC = CMaker(
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
    );
    Widget StudentGradeTC = CMaker(
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
    );
    Widget Notifications = InkWell(
      onTap: () {
        Get.to(() => StudentNotificationsPage());
      },
      child: Container(
        width: 70,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        height: (PageWidth(context) < 550) ? 50 : 100,
        child: Stack(
          children: [
            Positioned(
                right: 15,
                top: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: (ThereIsNotifications)
                          ? Colors.red
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  height: 7,
                  width: 7,
                )),
            Positioned(
              right: 15,
              top: 5,
              child: Icon(
                Icons.notifications,
                size: (PageWidth(context) < 550)
                    ? 25
                    : (PageHeight(context) < 900)
                        ? 30
                        : 35,
              ),
            ),
          ],
        ),
      ),
    );
    Widget StudentAppBar = Container(
        width: double.infinity,
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
        height: 80,
        child: Row(
          children: [
            Expanded(child: SizedBox(width: 30, height: 30, child: Logo)),
            Expanded(flex: 3, child: StudentNameTC),
            Expanded(flex: 2, child: StudentGradeTC),
            Expanded(child: Notifications)
          ],
        ));
    return StudentAppBar;
  }
}