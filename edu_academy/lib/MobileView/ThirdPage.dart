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
int HomeWorkIndex = 0;

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    if (HomeWorkOpend) {
      return CMaker(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      HomeWorkOpend = false;
                    });
                  },
                  child: CMaker(
                      margin: EdgeInsets.only(left: 15),
                      height: 30,
                      width: 30,
                      circularRadius: 50,
                      color: const Color.fromARGB(255, 6, 122, 153),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 15,
                      ))),
              Expanded(child: Container()),
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 6, 122, 153),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  child: TMaker(
                      text: HomeWorks[HomeWorkIndex][0]["Name"],
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white))
            ],
          ),
          CMaker(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 70),
                height: 30,
                width: 30,
                color: const Color.fromARGB(255, 6, 122, 153),
              )),
          Expanded(
            flex: 13,
            child: CMaker(
                padding: EdgeInsets.only(top:50,right: 15,left:15),
                circularRadius: 15,
                margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                width: double.infinity,
                color: const Color.fromARGB(255, 6, 122, 153),
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CMaker(padding: EdgeInsets.all(10),circularRadius: 15,margin: EdgeInsets.only(bottom: 30),color: Color.fromARGB(255, 255, 255, 255),height: 50,width: double.infinity,child: Row(children: [
                        CMaker(alignment: Alignment.center,width: 50,height: 40,circularRadius: 7,color: Color.fromARGB(255,216,217,216),child: TMaker(
                      text: "State",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0))),
                        Expanded(child: Container()),
                        CMaker(child: TMaker(
                      text: " الواجب رقم ${index+1}",
                      fontSize: 15,
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
    } else
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: [
                    Expanded(
                        child: CMaker(
                      height: 30,
                      color: Color.fromARGB(255, 6, 122, 153),
                      child: Center(
                          child: Image.asset(
                        "images/Time.png",
                        fit: BoxFit.fill,
                      )),
                    )),
                    Expanded(
                        child: CMaker(
                      height: 30,
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: 2),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
                      child: Center(
                          child: TMaker(
                              text: "",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CMaker(
                      height: 30,
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: 2),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: 2),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: 2),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: 2),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: 2),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 6, 122, 153),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: .5),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      border: Border(
                          right: BorderSide(width: 2),
                          bottom: BorderSide(width: .5)),
                      color: Color.fromARGB(255, 255, 255, 255),
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
            CMaker(
              alignment: Alignment.center,
              circularRadius: 8,
              margin: EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
              width: double.infinity,
              height: (PageHeight(context) - 430),
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
                          margin:
                              EdgeInsets.only(top: 20, bottom: 15, right: 10),
                          alignment: Alignment.center,
                          child: TMaker(
                              text: "الواجبات",
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 20, 206, 61)))),
                  CMaker(
                    height: PageHeight(context) - 490,
                    child: ListView.builder(
                        itemCount: HomeWorks.length,
                        itemBuilder: (context, index) {
                          return CMaker(
                              circularRadius: 10,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              margin: EdgeInsets.only(
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
                                  Padding(padding: EdgeInsets.only(bottom: 2)),
                                  CMaker(
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.only(right: 10),
                                      child: TMaker(
                                          text: "واجب محلول : 3",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 101, 239, 106))),
                                  Padding(padding: EdgeInsets.only(bottom: 2)),
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
                                          margin: EdgeInsets.only(
                                              left: 7, bottom: 2),
                                          alignment: Alignment.center,
                                          color:
                                              Color.fromARGB(255, 6, 122, 153),
                                          circularRadius: 10,
                                          height: 30,
                                          width: 60,
                                          child: TMaker(
                                              text: "تصفح",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      CMaker(
                                        padding: EdgeInsets.only(right: 10),
                                        child: TMaker(
                                            text: "واجب غير محلول : 0",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
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
