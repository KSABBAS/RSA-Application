import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherFirstPageContenets extends StatefulWidget {
  const TeacherFirstPageContenets({super.key});

  @override
  State<TeacherFirstPageContenets> createState() =>
      _TeacherFirstPageContenetsState();
}

class _TeacherFirstPageContenetsState extends State<TeacherFirstPageContenets> {
  Future<void> _launchURL({required String url}) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      //mj
    }
  }
  @override
  Widget build(BuildContext context) {
    late Widget FirstPageBody;
    Widget NewClassTC = CMaker(
        width: 130,
        child: TMaker(
            text: "Next Class :",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(153, 24, 58, 60)));
    Widget LessonAndDate = Container(
        alignment: Alignment.centerLeft,
        width: 150,
        child: ListTile(
          title: TMaker(
              text: "loading...",
              fontSize:20,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(153, 24, 58, 60)),
          subtitle: TMaker(
              text: "AT 00:00",
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(153, 24, 58, 60)),
        ));
    Widget JoinButton=InkWell(
                      onTap: () {
                        _launchURL(
                            url:
                                "https://us06web.zoom.us/j/3088571822?pwd=E5VM4ANDKYA5jW59RKUuwRvVA2onkA.1");
                        
                      },
                      child: CMaker(
                        alignment: Alignment.center,
                        circularRadius: 13,
                        height: (PageWidth(context)<550)? 40:(PageHeight(context)<900)? 60:70,
                        width: (PageWidth(context)<550)? 120:(PageHeight(context)<900)? 120:200,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "Join",
                            fontSize: (PageWidth(context)<550)? 20:(PageHeight(context)<900)? 25:30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    );
    if(PageWidth(context) < 550){
      setState(() {
        FirstPageBody=CMaker(
              circularRadius: 20,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 6,
                    spreadRadius: .03,
                    color: Color.fromARGB(82, 0, 0, 0)),
              ],
              width: (PageWidth(context)<650)?double.infinity:500,
              color: Colors.white,
              child: Column(children: [
              Expanded(child: Row(children: [
                Expanded(flex: 2,child: Container(),),
                Expanded(flex: 6,child: NewClassTC,),
                Expanded(child: Container(),),
                Expanded(flex: 6,child: LessonAndDate,),
                Expanded(flex: 2,child: Container(),),
              ],)),
              Expanded(child: CMaker(alignment: Alignment.center,child: JoinButton))
                      ],)
          );
        });
      }else if(PageWidth(context) >= 550&&PageHeight(context)>=900){
        setState(() {
        FirstPageBody=CMaker(
              circularRadius: 20,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 6,
                    spreadRadius: .03,
                    color: Color.fromARGB(82, 0, 0, 0)),
              ],
              width: (PageWidth(context)<650)?double.infinity:500,
              color: Colors.white,
              child: Column(children: [
              Expanded(child: Row(children: [
                Expanded(flex: 2,child: Container(),),
                Expanded(flex: 6,child: NewClassTC,),
                Expanded(child: Container(),),
                Expanded(flex: 6,child: LessonAndDate,),
                Expanded(flex: 2,child: Container(),),
              ],)),
              Expanded(child: CMaker(alignment: Alignment.center,child: JoinButton))
                      ],)
          );
        });
      }else if(PageWidth(context) >= 550&&PageHeight(context)<900){
        setState(() {
        FirstPageBody=CMaker(
              circularRadius: 20,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 6,
                    spreadRadius: .03,
                    color: Color.fromARGB(82, 0, 0, 0)),
              ],
              width: (PageWidth(context)<650)?double.infinity:500,
              color: Colors.white,
              child: Column(children: [
              Expanded(child: Row(children: [
                Expanded(flex: 2,child: Container(),),
                Expanded(flex: 6,child: NewClassTC,),
                Expanded(child: Container(),),
                Expanded(flex: 6,child: LessonAndDate,),
                Expanded(flex: 2,child: Container(),),
              ],)),
              Expanded(child: CMaker(alignment: Alignment.center,child: JoinButton))
                      ],)
          );
        });
      }
    return FirstPageBody;
  }
}
