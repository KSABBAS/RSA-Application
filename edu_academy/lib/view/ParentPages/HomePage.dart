// import 'dart:convert';
import 'dart:developer';

import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/ParentPages/ParentMainPageContents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_extensions/string_extensions.dart';

class ParentMainPage extends StatefulWidget {
  const ParentMainPage({super.key});

  @override
  State<ParentMainPage> createState() => _ParentMainPageState();
}

int PageIndex = 0;

String name = '';
String grade = "";
class _ParentMainPageState extends State<ParentMainPage> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? items = prefs.getStringList('id');
      log(items.toString());
      if (items != null && items.isNotEmpty) {
        setState(() {
          name = items[2].split("-")[0];
          name = "${name.split(" ")[0]} ${name.split(" ")[1]}".toTitleCase;
          // grade = items[2].split("-")[1] as String;
          // userData = jsonDecode(items[2]) as Map<String, dynamic>;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      if (ConnectedToInternet) {
      return Scaffold(
      backgroundColor: const Color.fromARGB(255, 74, 193, 241),
      body: LiquidPullToRefresh(
          showChildOpacityTransition: false,
          backgroundColor: const Color.fromARGB(255, 74, 193, 241),
              color: const Color.fromARGB(255, 233, 255, 247),
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            setState(() {
            });
          },
          child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        body: ParentMainPageContents(ParentName: "Kareem said",),
      )),
    );
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        body: Center(child:CMaker(
          height: 150,
          width: 270,
              color: Colors.white,
                boxShadow: const [
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