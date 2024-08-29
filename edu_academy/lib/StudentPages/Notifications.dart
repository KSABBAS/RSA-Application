import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/StudentPages/StudentMainPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class StudentNotificationsPage extends StatefulWidget {
  const StudentNotificationsPage({super.key});

  @override
  State<StudentNotificationsPage> createState() =>
      _StudentNotificationsPageState();
}

List<List> StudentNotiFications = [
  [
    "https://static-00.iconduck.com/assets.00/push-notifications-icon-2048x2048-wtj9rz41.png",
    "Title 1",
    "Bodytttttttttttttt",
    "Date",
    true,
  ],
  [
    "https://static-00.iconduck.com/assets.00/push-notifications-icon-2048x2048-wtj9rz41.png",
    "Title 1",
    "Body 1ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt",
    "Date",
    false,
  ],
];

class _StudentNotificationsPageState extends State<StudentNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
        showChildOpacityTransition: false,
        backgroundColor: Color.fromARGB(255, 148, 145, 129),
        color: Color.fromARGB(255, 233, 235, 231),
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 500));
          setState(() {});
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 233, 255, 247),
          body: CMaker(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                CMaker(
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: IconButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          // await Future.delayed(Duration(seconds: 1));
                          // setState(() {});
                        },
                        icon: Icon(Icons.arrow_back))),
                Expanded(
                  child: CMaker(
                    child: ListView.builder(
                      itemCount: StudentNotiFications.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            StudentNotiFications[index][4] = true;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: CMaker(
                                      height: PageHeight(context) / 2,
                                      width: PageWidth(context),
                                      child: ListView(
                                        children: [
                                          CMaker(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            alignment: Alignment.center,
                                            child: TMaker(
                                                textAlign: TextAlign.start,
                                                text:
                                                    StudentNotiFications[index]
                                                        [1],
                                                fontSize: 30,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                          CMaker(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 10),
                                            alignment: Alignment.center,
                                            child: TMaker(
                                                textAlign: TextAlign.start,
                                                text:
                                                    StudentNotiFications[index]
                                                        [2],
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                                color: const Color.fromARGB(
                                                    255, 101, 101, 101)),
                                          ),
                                        ],
                                      )),
                                );
                              },
                            );
                          },
                          child: CMaker(
                            margin: EdgeInsets.only(
                                bottom: 10,
                                right: 5,
                                left: 5,
                                top: ((index == 0) ? 10 : 0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 6,
                                  spreadRadius: .03,
                                  color: Color.fromARGB(82, 0, 0, 0)),
                            ],
                            width: double.infinity,
                            height: 100,
                            circularRadius: 10,
                            child: ListTile(
                              title: TMaker(
                                  textAlign: TextAlign.start,
                                  text: StudentNotiFications[index][1],
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    StudentNotiFications[index][0]),
                              ),
                              subtitle: TMaker(
                                  textAlign: TextAlign.start,
                                  text: (StudentNotiFications[index][2].length >
                                          20)
                                      ? StudentNotiFications[index][2]
                                              .substring(0, 20) +
                                          "....."
                                      : StudentNotiFications[index][2],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 78, 78, 78)),
                              trailing: TMaker(
                                  textAlign: TextAlign.end,
                                  text: StudentNotiFications[index][3],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 78, 78, 78)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
