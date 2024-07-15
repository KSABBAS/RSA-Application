import 'package:flutter/material.dart';
import 'package:mine/MyTools.dart';
import 'package:mine/SplashViewPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItIsMe extends StatefulWidget {
  const ItIsMe({super.key});

  @override
  State<ItIsMe> createState() => _ItIsMeState();
}

SharedPreferences? Ensure;

class _ItIsMeState extends State<ItIsMe> {
  @override
  void i() async {
    Ensure = await SharedPreferences.getInstance();
    Ensure!.setString("Password", "mine5988");
  }
  Widget build(BuildContext context) {
    i();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Color.fromARGB(255, 40, 35, 35),
              Color.fromARGB(255, 214, 213, 213)
            ])),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(top: PageHeight(context) / 2.5)),
            TextField(
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              onSubmitted: (value) async {
                if (Ensure!.getString("Password") == value) {
                  await Ensure!.setBool("ItIsMe", true);
                  Navigator.pushReplacementNamed(context, "FingerPrint");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
