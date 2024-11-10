import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SonPage extends StatefulWidget {
  SonPage({super.key, required this.SonIndex, required this.SonsList, required this.ParentName});
  int SonIndex;
  List<List> SonsList;
  String ParentName;
  @override
  State<SonPage> createState() => _SonPageState();
}

class _SonPageState extends State<SonPage> {
  @override
  Widget build(BuildContext context) {
    Widget StudentNameTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        widget.ParentName,
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
    Widget Logo = InkWell(
        onTap: () {
          // setState(() {
          // });
        },
        child: Image.asset("images/Book.png"));
    Widget LogOutButton = InkWell(
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
                        child: Icon(Icons.logout,
          size: (PageWidth(context) < 550)
              ? 25
              : (PageHeight(context) < 900)
                  ? 30
                  : 35,
        ),
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 255, 247),
      body: CMaker(
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
                  Expanded(child: LogOutButton)
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          CMaker(
            height: 70,width: double.infinity,child: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 20)),
              InkWell(onTap: () {
                Navigator.pop(context);
              },child: CMaker(height: 50,width: 50,circularRadius: 50,child: const Icon(Icons.arrow_back))),
              Expanded(child: Container()),
              TMaker(text: "Informations", fontSize: 30, fontWeight:FontWeight.w700, color:Colors.black),
              Expanded(child: Container()),
            ],
          )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(child: CMaker(
            margin: const EdgeInsetsDirectional.only(bottom: 20,start: 20,end: 20),
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
            child: Column(children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(
                height: 130,
                width: 130,
                child: CircleAvatar(backgroundImage: AssetImage(widget.SonsList[widget.SonIndex][3]),)),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(
                width: double.infinity,
                alignment: Alignment.center,
                child: TMaker(text: widget.SonsList[widget.SonIndex][0], fontSize: 30, fontWeight:FontWeight.w700, color:Colors.black),),
              const Padding(padding: EdgeInsets.only(top: 40)),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CMaker(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "Grade",
                            fontSize: (PageWidth(context) < 550)
                                ? 20
                                : (PageHeight(context) < 900)
                                    ? 30
                                    : 30,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
                  CMaker(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
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
                            padding: const EdgeInsets.only(right: 10),
                            child: TMaker(
                                text: widget.SonsList[widget.SonIndex][1],
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
                ],
              ),
              Expanded(child: Container()),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CMaker(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "Age",
                            fontSize: (PageWidth(context) < 550)
                                ? 20
                                : (PageHeight(context) < 900)
                                    ? 30
                                    : 30,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
                  CMaker(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
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
                            padding: const EdgeInsets.only(right: 10),
                            child: TMaker(
                                text: widget.SonsList[widget.SonIndex][2],
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
                ],
              ),
              Expanded(child: Container()),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CMaker(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "Email",
                            fontSize: (PageWidth(context) < 550)
                                ? 17
                                : (PageHeight(context) < 900)
                                    ? 30
                                    : 30,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
                  CMaker(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
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
                            padding: const EdgeInsets.only(right: 10),
                            child: TMaker(
                                text: widget.SonsList[widget.SonIndex][4],
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
                ],
              ),
              Expanded(child: Container()),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CMaker(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TMaker(
                            textAlign: TextAlign.start,
                            text: "Number",
                            fontSize: (PageWidth(context) < 550)
                                ? 20
                                : (PageHeight(context) < 900)
                                    ? 30
                                    : 30,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
                  CMaker(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
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
                            padding: const EdgeInsets.only(right: 10),
                            child: TMaker(
                                text: widget.SonsList[widget.SonIndex][5],
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
                ],
              ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            ],),
            )),
        ],
      )),
    );
  }
}
