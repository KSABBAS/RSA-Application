// import 'dart:convert';
import 'dart:developer';

import 'package:edu_academy/ParentPages/ParentMainPageContents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState() {
    super.initState();
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
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 255, 247),
        body: ParentMainPageContents(ParentName: "Kareem said",),
      );
  }
}
