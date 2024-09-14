import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/TeacherPages/TeacherMainPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoweredByPage extends StatefulWidget {
  const PoweredByPage({super.key});

  @override
  State<PoweredByPage> createState() => _PoweredByPageState();
}

class _PoweredByPageState extends State<PoweredByPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          CMaker(height: 100,padding: EdgeInsets.only(left: 20),width: double.infinity,alignment: Alignment.centerLeft,child: IconButton(onPressed: (){Get.back();}, icon:Icon(Icons.arrow_back,size: 30,))),
          Padding(padding: EdgeInsets.only(top: 30)),
          CMaker(
              width: double.infinity,
              alignment: Alignment.center,
              child: CMaker(
                  height: 250,
                  width: 250,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/Codeveloper.jpg"),
                  ))),
          Padding(padding: EdgeInsets.only(top: 40)),
          CMaker(
              width: double.infinity,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  
                },
                child: CMaker(
                  color: const Color.fromARGB(255, 32, 58, 252),
                  circularRadius: 20,
                  alignment: Alignment.center,
                  height: 70,
                  width: PageWidth(context)-100,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(82, 0, 0, 0)),
                    ],
                    child: TMaker(
                        text: "Facebook",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              )),
          Padding(padding: EdgeInsets.only(top: 20)),
          CMaker(
              width: double.infinity,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  
                },
                child: CMaker(
                  color: const Color.fromARGB(255, 252, 32, 116),
                  circularRadius: 20,
                  alignment: Alignment.center,
                  height: 70,
                  width: PageWidth(context)-100,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(82, 0, 0, 0)),
                    ],
                    child: TMaker(
                        text: "Instagram",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              )),
          Padding(padding: EdgeInsets.only(top: 20)),
          CMaker(
              width: double.infinity,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  
                },
                child: CMaker(
                  color: const Color.fromARGB(255, 28, 26, 27),
                  circularRadius: 20,
                  alignment: Alignment.center,
                  height: 70,
                  width: PageWidth(context)-100,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(82, 0, 0, 0)),
                    ],
                    child: TMaker(
                        text: "Tik Tok",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              )),
          Padding(padding: EdgeInsets.only(top: 20)),
          CMaker(
              width: double.infinity,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  
                },
                child: CMaker(
                  color: const Color.fromARGB(255, 50, 252, 32),
                  circularRadius: 20,
                  alignment: Alignment.center,
                  height: 70,
                  width: PageWidth(context)-100,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: .03,
                          color: Color.fromARGB(82, 0, 0, 0)),
                    ],
                    child: TMaker(
                        text: "WhatsApp",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              )),
              Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(width: double.infinity,
              height: 100,
                child: Row(children: [
                  Expanded(flex: 2,child: Container()),
                  TMaker(
                          text: "Eng : Kareem Saeed",
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                  Expanded(flex: 1,child: Container()),
                  TMaker(
                          text: "|",
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                  Expanded(flex: 1,child: Container()),
                  TMaker(
                          text: "Eng : Mohamed Hosny",
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                Expanded(flex: 2,child: Container()),
                          ],),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
        ],
      ),
    );
  }
}
