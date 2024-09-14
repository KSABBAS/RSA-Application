import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/TeacherPages/TeacherMainPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherFirstPageContenets extends StatefulWidget {
  const TeacherFirstPageContenets({super.key});

  @override
  State<TeacherFirstPageContenets> createState() =>
      _TeacherFirstPageContenetsState();
}

class _TeacherFirstPageContenetsState extends State<TeacherFirstPageContenets> {
  int DayIndex = DateTime.now().weekday;
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
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(153, 24, 58, 60)),
          subtitle: TMaker(
              text: "AT 00:00",
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(153, 24, 58, 60)),
        ));
    Widget JoinButton = InkWell(
      onTap: () {
        _launchURL(
            url:
                "https://us06web.zoom.us/j/3088571822?pwd=E5VM4ANDKYA5jW59RKUuwRvVA2onkA.1");
      },
      child: CMaker(
        alignment: Alignment.center,
        circularRadius: 13,
        height: (PageWidth(context) < 550)
            ? 40
            : (PageHeight(context) < 900)
                ? 60
                : 70,
        width: (PageWidth(context) < 550)
            ? 120
            : (PageHeight(context) < 900)
                ? 120
                : 200,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: const Color.fromARGB(255, 36, 160, 209),
        child: TMaker(
            text: "Join",
            fontSize: (PageWidth(context) < 550)
                ? 20
                : (PageHeight(context) < 900)
                    ? 25
                    : 30,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
    Widget FullScadual = CMaker(
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: TableData[0].length,
            itemBuilder: (context, ColumnIndex) {
              return CMaker(
                  width: (PageWidth(context) - 80) / TableData[0].length,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: TableData.length,
                    itemBuilder: (context, RowIndex) {
                      return CMaker(
                          height: (200) / TableData.length,
                          child: Container(
                              decoration: BoxDecoration(
                                border: const Border(
                                    right: BorderSide(), bottom: BorderSide()),
                                borderRadius: BorderRadius.only(
                                  topLeft: ("$ColumnIndex $RowIndex" == "0 0")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  bottomLeft: ("$ColumnIndex $RowIndex" ==
                                          "0 ${TableData.length - 1}")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  topRight: ("$ColumnIndex $RowIndex" ==
                                          "${TableData[0].length - 1} 0")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  bottomRight: ("$ColumnIndex $RowIndex" ==
                                          "${TableData[0].length - 1} ${TableData.length - 1}")
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                ),
                                color: (ColumnIndex == 0 || RowIndex == 0)
                                    ? const Color.fromARGB(255, 36, 160, 209)
                                    : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: TMaker(
                                  text: "${TableData[RowIndex][ColumnIndex]}",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: (ColumnIndex == 0 || RowIndex == 0)
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : const Color.fromARGB(255, 0, 0, 0))));
                    },
                  ));
            },
          ));
    Widget OneDayTable = InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(child: FullScadual,);
          },
        );
      },
      child: Column(
        children: [
          CMaker(
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 6,
                    spreadRadius: .03,
                    color: Color.fromARGB(82, 0, 0, 0)),
              ],
              circularRadius: 15,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(15)),
                            color: Color.fromARGB(255, 36, 160, 209)),
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        child: TMaker(
                            text: "",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: CMaker(
                        alignment: Alignment.center,
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        color: const Color.fromARGB(255, 36, 160, 209),
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15)),
                            color: Color.fromARGB(255, 36, 160, 209)),
                        height: (PageWidth(context) < 550)
                            ? 80
                            : (PageHeight(context) < 900)
                                ? 100
                                : 150,
                        child: TMaker(
                            text: "00:00\nto\n00:00",
                            fontSize: (PageWidth(context) < 550)
                                ? 13
                                : (PageHeight(context) < 900)
                                    ? 18
                                    : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                    ],
                  ),
                  CMaker(
                      height: 70,
                      width: PageWidth(context) - 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: TableData[0].length,
                        itemBuilder: (context, index) {
                          return CMaker(
                              height: 70,
                              width: (PageWidth(context) >= 550 &&
                                      PageWidth(context) < 1200 &&
                                      PageHeight(context) < 900)
                                  ? (PageWidth(context) - 165) /
                                      TableData[0].length
                                  : (PageWidth(context) >= 550 &&
                                          PageWidth(context) >= 1200 &&
                                          PageHeight(context) < 900)
                                      ? (PageWidth(context) - 790) /
                                          TableData[0].length
                                      : ((PageWidth(context) - 40) /
                                          TableData[0].length),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: (index == 0)
                                            ? const Radius.circular(15)
                                            : const Radius.circular(0),
                                        bottomRight:
                                            (index == TableData[0].length - 1)
                                                ? const Radius.circular(15)
                                                : const Radius.circular(0)),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: TMaker(
                                      text: "${TableData[DayIndex][index]}",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: (index == 0)
                                          ? const Color.fromARGB(
                                              255, 36, 160, 209)
                                          : const Color.fromARGB(
                                              255, 0, 0, 0))));
                        },
                      ))
                ],
              )),
        ],
      ),
    );
    if (PageWidth(context) < 550) {
      setState(() {
        FirstPageBody = Column(
          children: [
            CMaker(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: OneDayTable),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
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
                width: (PageWidth(context) < 650) ? double.infinity : 500,
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 6,
                          child: NewClassTC,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          flex: 6,
                          child: LessonAndDate,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(),
                        ),
                      ],
                    )),
                    Expanded(
                        child: CMaker(
                            alignment: Alignment.center, child: JoinButton))
                  ],
                )),
          ],
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      setState(() {
        FirstPageBody = Column(
          children: [
            CMaker(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: OneDayTable),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
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
                width: (PageWidth(context) < 650) ? double.infinity : 500,
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 6,
                          child: NewClassTC,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          flex: 6,
                          child: LessonAndDate,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(),
                        ),
                      ],
                    )),
                    Expanded(
                        child: CMaker(
                            alignment: Alignment.center, child: JoinButton))
                  ],
                )),
          ],
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      setState(() {
        FirstPageBody = Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                children: [
                  (PageWidth(context) < 1200)
                      ? Column(
                          children: [
                            CMaker(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: OneDayTable),
                            const Padding(padding: EdgeInsets.only(bottom: 40)),
                            CMaker(
                                circularRadius: 20,
                                height: 200,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 6,
                                      spreadRadius: .03,
                                      color: Color.fromARGB(82, 0, 0, 0)),
                                ],
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: NewClassTC,
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: LessonAndDate,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                        child: CMaker(
                                            alignment: Alignment.center,
                                            child: JoinButton))
                                  ],
                                )),
                          ],
                        )
                      : CMaker(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  child: CMaker(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: OneDayTable)),
                              const Padding(padding: EdgeInsets.only(left: 20)),
                              CMaker(
                                  circularRadius: 20,
                                  height: 200,
                                  width: 350,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 6,
                                        spreadRadius: .03,
                                        color: Color.fromARGB(82, 0, 0, 0)),
                                  ],
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: NewClassTC,
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: LessonAndDate,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: CMaker(
                                              alignment: Alignment.center,
                                              child: JoinButton))
                                    ],
                                  )),
                            ],
                          ),
                        )])]);
      });
    }
    return FirstPageBody;
  }
}
