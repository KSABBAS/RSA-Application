import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:on_off_switch/on_off_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminThirdPageContenets extends StatefulWidget {
  AdminThirdPageContenets({super.key, required this.AdminName});
  String AdminName;
  @override
  State<AdminThirdPageContenets> createState() =>
      _AdminThirdPageContenetsState();
}

bool StudentOpend = false;
List<List> Students = [
  [
    "images/Person.png", //image
    "Ali Ahmed", //Name,
    "kareemsaid234@gmail.com", //Email,
    "+201065866283", //Number,
    "Active" //State
  ],
  [
    "images/Person.png", //image
    "Tarek Esam", //Name,
    "kareemsaid234@gmail.com", //Email,
    "+201065866283", //Number,
    "Active" //State
  ],
  [
    "images/Person.png", //image
    "Weal monir", //Name,
    "kareemsaid234@gmail.com", //Email,
    "+201065866283", //Number,
    "Not Active" //State
  ],
];
int StudentSelected = 0;
bool StudentState = (Students[StudentSelected][4] == "Active") ? true : false;

class _AdminThirdPageContenetsState extends State<AdminThirdPageContenets> {
  @override
  Widget build(BuildContext context) {
    late Widget ThirdPageBody;
    Widget Logo = InkWell(onTap: () {}, child: Image.asset("images/Book.png"));
    Widget StudentNameTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        widget.AdminName,
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
    Widget StateTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        "Admin",
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
    Widget LogOutButton = InkWell(
      onTap: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
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
    );
    if (StudentOpend) {
      ThirdPageBody = CMaker(
          child: Column(
        children: [
          Container(
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
                  Expanded(flex: 2, child: StateTC),
                  Expanded(child: LogOutButton)
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          CMaker(
              height: 70,
              width: double.infinity,
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          StudentOpend = false;
                        });
                      },
                      child: CMaker(
                          height: 50,
                          width: 50,
                          circularRadius: 50,
                          child: Icon(Icons.arrow_back))),
                  Expanded(child: Container()),
                  TMaker(
                      text: "Informations",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  Expanded(child: Container()),
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(
              child: CMaker(
            margin: EdgeInsetsDirectional.only(bottom: 20, start: 20, end: 20),
            width: double.infinity,
            color: Colors.white,
            circularRadius: 20,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 6,
                  spreadRadius: .03,
                  color: Color.fromARGB(82, 0, 0, 0)),
            ],
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                CMaker(
                    height: 130,
                    width: 130,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Students[StudentSelected][0]),
                    )),
                const Padding(padding: EdgeInsets.only(top: 20)),
                CMaker(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: TMaker(
                      text: Students[StudentSelected][1],
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Expanded(child: Container()),
                CMaker(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: (PageWidth(context) < 550)
                      ? 60
                      : (PageHeight(context) < 900)
                          ? 80
                          : 80,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(58, 0, 0, 0)),
                  ],
                  circularRadius: 20,
                  color: const Color.fromARGB(255, 233, 255, 247),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      CMaker(
                          padding: EdgeInsets.only(right: 10),
                          child: TMaker(
                              text: Students[StudentSelected][4],
                              fontSize: (PageWidth(context) < 550)
                                  ? 20
                                  : (PageHeight(context) < 900)
                                      ? 40
                                      : 40,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                CMaker(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: (PageWidth(context) < 550)
                      ? 60
                      : (PageHeight(context) < 900)
                          ? 80
                          : 80,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(58, 0, 0, 0)),
                  ],
                  circularRadius: 20,
                  color: const Color.fromARGB(255, 233, 255, 247),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      CMaker(
                          padding: EdgeInsets.only(right: 10),
                          child: TMaker(
                              text: Students[StudentSelected][2],
                              fontSize: (PageWidth(context) < 550)
                                  ? 20
                                  : (PageHeight(context) < 900)
                                      ? 40
                                      : 40,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                CMaker(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: (PageWidth(context) < 550)
                      ? 60
                      : (PageHeight(context) < 900)
                          ? 80
                          : 80,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: .03,
                        color: Color.fromARGB(58, 0, 0, 0)),
                  ],
                  circularRadius: 20,
                  color: const Color.fromARGB(255, 233, 255, 247),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      CMaker(
                          padding: EdgeInsets.only(right: 10),
                          child: TMaker(
                              text: Students[StudentSelected][3],
                              fontSize: (PageWidth(context) < 550)
                                  ? 20
                                  : (PageHeight(context) < 900)
                                      ? 40
                                      : 40,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                CMaker(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CMaker(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: (PageWidth(context) < 550)
                        ? 60
                        : (PageHeight(context) < 900)
                            ? 80
                            : 80,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(58, 0, 0, 0)),
                    ],
                    circularRadius: 20,
                    color: const Color.fromARGB(255, 233, 255, 247),
                    width: 250,
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        CMaker(
                            padding: EdgeInsets.only(right: 10),
                            child: TMaker(
                                text: "Activate",
                                fontSize: (PageWidth(context) < 550)
                                    ? 20
                                    : (PageHeight(context) < 900)
                                        ? 40
                                        : 40,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                        Expanded(child: Container()),
                        OnOffSwitch(
                          value: StudentState,
                          onChanged: (bool newValue) {
                            setState(() {
                              StudentState = newValue;
                            });
                          },
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 40)),
              ],
            ),
          )),
        ],
      ));
    } else {
      ThirdPageBody = CMaker(
          width: double.infinity,
          child: Column(
            children: [
              Container(
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
                      Expanded(
                          child: SizedBox(width: 30, height: 30, child: Logo)),
                      Expanded(flex: 3, child: StudentNameTC),
                      Expanded(flex: 2, child: StateTC),
                      Expanded(child: LogOutButton)
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CMaker(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Colors.white,
                      alignment: Alignment.center,
                      circularRadius: 20,
                      height: 70,
                      width: 200,
                      child: TMaker(
                          text: "Students",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black))),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CMaker(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Colors.white,
                      alignment: Alignment.center,
                      circularRadius: 20,
                      height: 70,
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          TMaker(
                              text: "Number : 3",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                          Expanded(child: Container()),
                          TMaker(
                              text: "Active : 2",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 65, 215, 54)),
                          Expanded(child: Container()),
                        ],
                      ))),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(
                child: CMaker(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CMaker(
                        padding: EdgeInsets.only(top: 20),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(82, 0, 0, 0)),
                        ],
                        color: Colors.white,
                        alignment: Alignment.center,
                        circularRadius: 20,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  StudentOpend = true;
                                  StudentSelected = index;
                                });
                              },
                              child: CMaker(
                                  circularRadius: 20,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 6,
                                        spreadRadius: .03,
                                        color: Color.fromARGB(82, 0, 0, 0)),
                                  ],
                                  height: 80,
                                  alignment: Alignment.center,
                                  color: Color.fromARGB(255, 233, 255, 247),
                                  margin: EdgeInsets.only(
                                      bottom: 30, right: 20, left: 20),
                                  child: ListTile(
                                    leading: CMaker(
                                        height: 70,
                                        width: 70,
                                        child: CircleAvatar(
                                          backgroundImage:
                                              AssetImage((Students[index][0])),
                                        )),
                                    title: TMaker(
                                        text: Students[index][1],
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    trailing: TMaker(
                                        text: Students[index][4],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: (Students[index][4] == "Active")
                                            ? Color.fromARGB(255, 73, 213, 31)
                                            : const Color.fromARGB(
                                                255, 224, 9, 9)),
                                  )),
                            );
                          },
                        ))),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ));
    }
    return ThirdPageBody;
  }
}
