import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

int PageIndex = 0;

class _StudentMainPageState extends State<StudentMainPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(color: Color.fromARGB(255, 74, 193, 241),borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        
                          height: 50,
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "kareem said",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Grade 12",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(color: Color.fromARGB(255, 74, 193, 241),borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(flex: 8, child: Container()),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(color: Color.fromARGB(255, 74, 193, 241),borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        
                          height: 50,
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "kareem said",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Grade 12",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(color: Color.fromARGB(255, 74, 193, 241),borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(flex: 8, child: Container()),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(color: Color.fromARGB(255, 74, 193, 241),borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        
                          height: 50,
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "kareem said",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Grade 12",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(color: Color.fromARGB(255, 74, 193, 241),borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(flex: 8, child: Container()),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(color: Color.fromARGB(255, 74, 193, 241),borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        
                          height: 50,
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                PageIndex = 0;
                                });
                              },
                              child: Image.asset("images/Book.png")))),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "kareem said",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Grade 12",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(color: Color.fromARGB(255, 74, 193, 241),borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: Icon(Icons.notifications),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(flex: 8, child: Container()),
          ],
        ),
      ),
      
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(255, 74, 193, 241),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          index: PageIndex,
          height: 60,
          onTap: (val) {
            setState(() {
              PageIndex = val;
            });
          },
          items: [
            Icon(
                  Icons.home,
                  color: Colors.black,
                ),
            Icon(
                  Icons.book,
                  color: Colors.black,
                ),
            Icon(
                  Icons.menu_book,
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
