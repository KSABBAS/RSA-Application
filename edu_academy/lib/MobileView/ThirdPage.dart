import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

bool HomeWorkOpend = false;
List Cols = [
  Color.fromARGB(255, 142, 255, 43),
  Color.fromARGB(255, 255, 204, 0),
  Color.fromARGB(255, 255, 0, 0),
  Color.fromARGB(255, 42, 226, 236),
  Color.fromARGB(255, 42, 90, 236),
  Color.fromARGB(255, 162, 42, 236),
  Color.fromARGB(255, 236, 42, 145),
  Color.fromARGB(255, 161, 255, 126)
];
List HomeWorks = [
  [
    {"Name": "اللغة العربية"},
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "no"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "yes"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "9"}
    ],
  ],
  [
    {"Name": "الرياضيات"},
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "no"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "yes"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "9"}
    ],
  ],
  [
    {"Name": "الكيمياء"},
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "no"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "yes"},
      {"Rated": "no"}
    ],
    [
      {"الواجب الاول": "القراءة ص22"},
      {"Solved": "yes"},
      {"WaitingToBeMarked": "no"},
      {"Rated": "9"}
    ],
  ],
];

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    if (HomeWorkOpend) {
      return Container();
    } else
      return Column(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                children: [
                  Expanded(
                      child: CMaker(
                    height: 20,
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: Image.asset(
                      "images/Time.png",
                      fit: BoxFit.fill,
                    )),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: 2),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "الأحد",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 255, 255))),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: 2),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "الأثنين",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 255, 255))),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: 2),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "الثلاثاء",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 255, 255))),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: 2),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "الأربعاء",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 255, 255))),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: 2),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "الخميس",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 255, 255))),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: 2),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 6, 122, 153),
                    child: Center(
                        child: TMaker(
                            text: "الجمعة",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 255, 255))),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: .5),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                  Expanded(
                      child: CMaker(
                    height: 20,
                    border: Border(
                        right: BorderSide(width: 2),
                        bottom: BorderSide(width: .5)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Center(
                        child: TMaker(
                            text: "",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  )),
                ],
              ),
            ],
          ),
          CMaker(
            alignment: Alignment.center,
            circularRadius: 8,
            margin: EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
            width: double.infinity,
            height: (PageHeight(context) - 360),
            color: Color.fromARGB(255, 6, 122, 153),
            child: Column(
              children: [
                CMaker(
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    child: CMaker(
                        circularRadius: 20,
                        height: 25,
                        width: 80,
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 20, bottom: 15, right: 10),
                        alignment: Alignment.center,
                        child: TMaker(
                            text: "الواجبات",
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 20, 206, 61)))),
                CMaker(
                  height: PageHeight(context) - 420,
                  child: ListView.builder(
                      itemCount: HomeWorks.length,
                      itemBuilder: (context, index) {
                        return CMaker(
                            circularRadius: 10,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 30),
                            width: double.infinity,
                            height: 90,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Container()),
                                    TMaker(
                                        text: "${HomeWorks[index][0]["Name"]}",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 5, left: 10),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Cols[index]),
                                    )
                                  ],
                                ),
                                Padding(padding:EdgeInsets.only(bottom: 10)),
                                CMaker(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(right: 10),
                                    child: TMaker(
                                        text:
                                            "واجب محلول : 3",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 101, 239, 106))),
                                Padding(padding:EdgeInsets.only(bottom: 5)),
                                Row(children: [
                                  InkWell(onTap: () {
                                  },
                                    child: CMaker(margin: EdgeInsets.only(left: 7,bottom: 2),alignment: Alignment.center,color:Color.fromARGB(255, 6, 122, 153),circularRadius: 10,height: 30,width: 60,child: TMaker(
                                        text:"تصفح",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),),),
                                  Expanded(child: Container(),),
                                  CMaker(
                                    padding: EdgeInsets.only(right: 10),
                                    child: TMaker(
                                          text:
                                              "واجب غير محلول : 0",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(255, 255, 36, 36)),
                                  ),
                                ],)
                              ],
                            ));
                      }),
                ),
              ],
              
            ),
          )
        ],
      );
  }
}
