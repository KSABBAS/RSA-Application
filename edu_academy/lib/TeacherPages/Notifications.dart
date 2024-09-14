import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class TeacherNotificationsPage extends StatefulWidget {
  const TeacherNotificationsPage({super.key});

  @override
  State<TeacherNotificationsPage> createState() =>
      _TeacherNotificationsPageState();
}

List<List> TeacherNotiFications = [
  [
    "https://static-00.iconduck.com/assets.00/push-notifications-icon-2048x2048-wtj9rz41.png",
    "Title 1",
    "Body 1ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt",
    "Date",
    false,
  ],
  [
    "https://static-00.iconduck.com/assets.00/push-notifications-icon-2048x2048-wtj9rz41.png",
    "Title 2",
    "Body 2",
    "Date",
    true,
  ],
];

class _TeacherNotificationsPageState extends State<TeacherNotificationsPage> {
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
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: const Color.fromARGB(255, 233, 255, 247),
          ),
          body: CMaker(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: (TeacherNotiFications.length == 0)
            ? Center(
                child: TMaker(
                    text: "No Notifications",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black))
            : ListView.builder(
              itemCount: TeacherNotiFications.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    TeacherNotiFications[index][4] = true;
                    print(TeacherNotiFications);
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
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    alignment: Alignment.center,
                                    child: TMaker(
                                        textAlign: TextAlign.start,
                                        text: TeacherNotiFications[index][1],
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
                                        text: TeacherNotiFications[index][2],
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
                    height: 80,
                    circularRadius: 10,
                    child: ListTile(
                      minTileHeight: 100,
                      title: TMaker(
                          textAlign: TextAlign.start,
                          text: (TeacherNotiFications[index][1].length>10)?TeacherNotiFications[index][1].substring(0,10)+"...":TeacherNotiFications[index][1],
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(TeacherNotiFications[index][0]),
                      ),
                      subtitle: TMaker(
                          textAlign: TextAlign.start,
                          text: (TeacherNotiFications[index][2].length>20)?TeacherNotiFications[index][2].substring(0,20)+"...":TeacherNotiFications[index][2],
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 78, 78, 78)),
                      trailing: CMaker(
                        width: 100,
                        child: TMaker(
                            textAlign: TextAlign.end,
                            text: TeacherNotiFications[index][3],
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 78, 78, 78)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
