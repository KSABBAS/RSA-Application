import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:edu_academy/MobileView/SecondPage.dart';
// import 'package:edu_academy/MobileView/ThirdPage.dart';
import 'package:flutter/material.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

int PageIndex = 0;

class _AdminMainPageState extends State<AdminMainPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          color: const Color.fromARGB(255, 213, 212, 208),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
}
