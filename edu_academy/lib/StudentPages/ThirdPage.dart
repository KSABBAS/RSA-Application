import 'package:edu_academy/MyTools.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

bool HomeWorkOpend = false;
List Cols = [
  const Color.fromARGB(255, 142, 255, 43),
  const Color.fromARGB(255, 255, 204, 0),
  const Color.fromARGB(255, 255, 0, 0),
  const Color.fromARGB(255, 42, 226, 236),
  const Color.fromARGB(255, 42, 90, 236),
  const Color.fromARGB(255, 162, 42, 236),
  const Color.fromARGB(255, 236, 42, 145),
  const Color.fromARGB(255, 161, 255, 126)
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
int HomeWorkIndex = 0;

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    if (HomeWorkOpend) {
      return CMaker(
          child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
              InkWell(
                  onTap: () {
                    setState(() {
                      HomeWorkOpend = false;
                    });
                  },
                  child: CMaker(
                      margin: const EdgeInsets.only(left: 15),
                      height: 30,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      circularRadius: 20,
                      child: const Icon(
                        Icons.arrow_back,
                        size: 28,
                      ))),
              CMaker(
                width: double.infinity,
                alignment: Alignment.center,
                child: CMaker(
                    boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 6,
                                  spreadRadius: .03,
                                  color: Color.fromARGB(58, 0, 0, 0)),
                            ],
                    circularRadius: 20,
                    color: const Color.fromARGB(255, 32, 186, 158),
                    alignment: Alignment.center,
                    height: 70,
                    width: 150,
                    child: TMaker(
                        text: HomeWorks[HomeWorkIndex][0]["Name"],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
              Padding(padding:EdgeInsets.only(bottom: 30)),
          Expanded(
            flex: 13,
            child: CMaker(
                padding: const EdgeInsets.only(top:50,right: 15,left:15),
                circularRadius: 25,
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
                width: double.infinity,
                color: Color.fromARGB(255, 32, 186, 158),
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CMaker(
                        boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 6,
                                  spreadRadius: .03,
                                  color: Color.fromARGB(58, 0, 0, 0)),
                            ],
                        padding: const EdgeInsets.all(10),
                        circularRadius: 25,margin: const EdgeInsets.only(bottom: 30),
                        color: const Color.fromARGB(255, 233, 255, 247),
                        height: 80,
                        width: double.infinity,
                        child: Row(children: [
                        CMaker(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric( horizontal: 15),
                          circularRadius: 20,
                          color: Color.fromARGB(255, 235, 218, 118),
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          height: 40,
                          child: TMaker(
                      text: "State",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0))),
                        Expanded(child: Container()),
                        CMaker(padding: EdgeInsets.only(right: 10),child: TMaker(
                      text: " الواجب رقم ${index+1}",
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0))),
                      ],
                    ),
                  );
                }
              )
            ),
          )
        ],
      ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
              boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 6,
                                  spreadRadius: .03,
                                  color: Color.fromARGB(82, 0, 0, 0)),
                            ],
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                              border:  const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                            ),
                        height: 30,
                        child: Container()
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      )),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                              border:  const Border(
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                            ),
                        height: 30,
                        child: Container()
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                        child: Center(
                            child: TMaker(
                                text: "الأحد",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 255, 255, 255))),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                        child: Center(
                            child: TMaker(
                                text: "الأثنين",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 255, 255, 255))),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                        child: Center(
                            child: TMaker(
                                text: "الثلاثاء",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 255, 255, 255))),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                        child: Center(
                            child: TMaker(
                                text: "الأربعاء",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 255, 255, 255))),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 32, 186, 158),
                        child: Center(
                            child: TMaker(
                                text: "الخميس",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 255, 255, 255))),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            bottom: BorderSide(width: .5)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                              border:  const Border(
                            right: BorderSide(width: .5),),
                        color: const Color.fromARGB(255, 32, 186, 158),
                            ),
                        child: Center(
                            child: TMaker(
                                text: "الجمعة",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 255, 255, 255))),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            ),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            ),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            ),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: CMaker(
                        height: 30,
                        border: const Border(
                            right: BorderSide(width: .5),
                            ),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      Expanded(
                          child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                        color: Color.fromARGB(255, 255, 255, 255),
                            ),
                        child: Center(
                            child: TMaker(
                                text: "",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            CMaker(
              alignment: Alignment.center,
              circularRadius: 8,
              margin: const EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
              width: double.infinity,
              height: (PageHeight(context) - 430),
              boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 6,
                                  spreadRadius: .03,
                                  color: Color.fromARGB(82, 0, 0, 0)),
                            ],
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  CMaker(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: CMaker(
                          circularRadius: 20,
                          height: 25,
                          width: 80,
                          color: Color.fromARGB(255, 233, 255, 247),
                          margin:
                              const EdgeInsets.only(top: 20, bottom: 15, right: 10),
                          alignment: Alignment.center,
                          child: TMaker(
                              text: "الواجبات",
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: const Color.fromARGB(255, 20, 206, 61)))),
                  CMaker(
                    height: PageHeight(context) - 490,
                    child: ListView.builder(
                        itemCount: HomeWorks.length,
                        itemBuilder: (context, index) {
                          return CMaker(
                              circularRadius: 10,
                              boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 6,
                                  spreadRadius: .03,
                                  color: Color.fromARGB(82, 0, 0, 0)),
                            ],
                              color: const Color.fromARGB(255, 233, 255, 247),
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 30),
                              width: double.infinity,
                              height: 95,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      TMaker(
                                          text:
                                              "${HomeWorks[index][0]["Name"]}",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(255, 0, 0, 0)),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 5, left: 10),
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Cols[index]),
                                      )
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.only(bottom: 2)),
                                  CMaker(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.only(right: 10),
                                      child: TMaker(
                                          text: "واجب محلول : 3",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromARGB(
                                              255, 101, 239, 106))),
                                  const Padding(padding: EdgeInsets.only(bottom: 2)),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            HomeWorkIndex = index;
                                            HomeWorkOpend = true;
                                          });
                                        },
                                        child: CMaker(
                                          margin: const EdgeInsets.only(
                                              left: 7, bottom: 2),
                                          alignment: Alignment.center,
                                          color:
                                              Color.fromARGB(255, 32, 186, 158),
                                          circularRadius: 10,
                                          height: 30,
                                          width: 60,
                                          child: TMaker(
                                              text: "تصفح",
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      CMaker(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: TMaker(
                                            text: "واجب غير محلول : 0",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 255, 36, 36)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                        }
                      ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
