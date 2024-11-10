import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/service/Databse_Service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminFirstPageContents extends StatefulWidget {
  AdminFirstPageContents({super.key, required this.AdminName});
  String AdminName;
  @override
  State<AdminFirstPageContents> createState() => _AdminFirstPageContentsState();
}

int TabBarIndex = 0;
List<List> GradesTablesData = [
  [
    "Grade 1",
    [
      ["", "00:00", "00:00", "00:00", "00:00", "00:00"],
      ["السبت", "arabic", "English", "math", "geo", "other"],
      ["الاحد", "arabic", "English", "math", "geo", "other"],
      ["الاثنين", "arabic", "English", "math", "geo", "other"],
      ["الثلاثاء", "arabic", "English", "math", "geo", "other"],
      ["الاربعاء", "arabic", "English", "math", "geo", "other"],
      ["الخميس", "arabic", "English", "math", "geo", "other"],
      ["الجمعة", "arabic", "English", "math", "geo", "other"],
    ],
  ],
  [
    "Grade 2",
    [
      ["", "00:00", "00:00", "00:00", "00:00", "00:00"],
      ["السبت", "arabic", "English", "math", "geo", "other"],
      ["الاحد", "arabic", "English", "math", "geo", "other"],
      ["الاثنين", "arabic", "English", "math", "geo", "other"],
      ["الثلاثاء", "arabic", "English", "math", "geo", "other"],
      ["الاربعاء", "arabic", "English", "math", "geo", "other"],
      ["الخميس", "arabic", "English", "math", "geo", "other"],
      ["الجمعة", "arabic", "English", "math", "geo", "other"],
    ],
  ],
  [
    "Grade 3",
    [
      ["", "00:00", "00:00", "00:00", "00:00", "00:00"],
      ["السبت", "arabic", "English", "math", "geo", "other"],
      ["الاحد", "arabic", "English", "math", "geo", "other"],
      ["الاثنين", "arabic", "English", "math", "geo", "other"],
      ["الثلاثاء", "arabic", "English", "math", "geo", "other"],
      ["الاربعاء", "arabic", "English", "math", "geo", "other"],
      ["الخميس", "arabic", "English", "math", "geo", "other"],
      ["الجمعة", "arabic", "English", "math", "geo", "other"],
    ],
  ],
];
List<List> TeachersTablesData = [
  [
    "Arabic",
    [
      ["", "00:00", "00:00", "00:00", "00:00", "00:00"],
      ["السبت", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الاحد", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الاثنين", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الثلاثاء", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الاربعاء", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الخميس", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الجمعة", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
    ],
  ],
  [
    "English",
    [
      ["", "00:00", "00:00", "00:00", "00:00", "00:00"],
      ["السبت", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الاحد", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الاثنين", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الثلاثاء", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الاربعاء", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الخميس", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الجمعة", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
    ],
  ],
  [
    "Chemistry",
    [
      ["", "00:00", "00:00", "00:00", "00:00", "00:00"],
      ["السبت", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الاحد", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الاثنين", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الثلاثاء", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الاربعاء", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الخميس", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
      ["الجمعة", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"],
    ],
  ],
];

class _AdminFirstPageContentsState extends State<AdminFirstPageContents> {
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    Widget Logo = InkWell(onTap: () {}, child: Image.asset("images/Book.png"));
    Widget StudentNameTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        widget.AdminName,
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
    Widget StateTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        "Admin",
        style: TextStyle(
            fontSize: (PageWidth(context) < 550)
                ? 17
                : (PageHeight(context) < 900)
                    ? 20
                    : 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 89, 89, 87)),
      ),
    );
    Widget LogOutButton = InkWell(
      onTap: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove("id");
        Navigator.pushReplacementNamed(context, "SplashView");
      },
      child: Container(
        width: 70,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
        height: 50,
        child: const Icon(Icons.logout),
      ),
    );
    List<Widget> TabBarItems = [
      CMaker(
        boxShadow: const [
          BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
        ],
        height: PageHeight(context) - 320,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        circularRadius: 20,
        width: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                width: double.infinity,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    dbService.one_time_set();
                  },
                  child: CMaker(
                      color: const Color.fromARGB(255, 192, 255, 176),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      circularRadius: 20,
                      boxShadow: const [
                        BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(50, 0, 0, 0)),
                      ],
                      child: TMaker(text: "Upload a table", fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                )),
            const Padding(padding: EdgeInsets.only(top: 50)),
            CMaker(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: GradesTablesData.length * 250,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: false,
                  itemCount: GradesTablesData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CMaker(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: TMaker(text: GradesTablesData[index][0], fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                        CMaker(
                            width: double.infinity,
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: false,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: GradesTablesData[index][1][0].length,
                              itemBuilder: (context, ColumnIndex) {
                                return CMaker(
                                    width: (PageWidth(context) - 40) / GradesTablesData[index][1][0].length,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: false,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: GradesTablesData[index][1].length,
                                      itemBuilder: (context, RowIndex) {
                                        return CMaker(
                                            height: (200) / GradesTablesData[index][1].length,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: const Border(right: BorderSide(), bottom: BorderSide()),
                                                  borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        ("$ColumnIndex $RowIndex" == "0 0") ? const Radius.circular(10) : const Radius.circular(0),
                                                    bottomLeft: ("$ColumnIndex $RowIndex" == "0 ${GradesTablesData[index][1].length - 1}")
                                                        ? const Radius.circular(10)
                                                        : const Radius.circular(0),
                                                    topRight: ("$ColumnIndex $RowIndex" == "${GradesTablesData[index][1][0].length - 1} 0")
                                                        ? const Radius.circular(10)
                                                        : const Radius.circular(0),
                                                    bottomRight: ("$ColumnIndex $RowIndex" ==
                                                            "${GradesTablesData[index][1][0].length - 1} ${GradesTablesData[index][1].length - 1}")
                                                        ? const Radius.circular(10)
                                                        : const Radius.circular(0),
                                                  ),
                                                  color: (ColumnIndex == 0 || RowIndex == 0) ? const Color.fromARGB(255, 36, 160, 209) : Colors.white,
                                                ),
                                                alignment: Alignment.center,
                                                child: TMaker(
                                                    text: "${GradesTablesData[index][1][RowIndex][ColumnIndex]}",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: (ColumnIndex == 0 || RowIndex == 0)
                                                        ? const Color.fromARGB(255, 255, 255, 255)
                                                        : const Color.fromARGB(255, 0, 0, 0))));
                                      },
                                    ));
                              },
                            )),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                      ],
                    );
                  },
                ))
          ],
        ),
      ),
      CMaker(
        boxShadow: const [
          BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
        ],
        height: PageHeight(context) - 320,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        circularRadius: 20,
        width: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                width: double.infinity,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {},
                  child: CMaker(
                      color: const Color.fromARGB(255, 192, 255, 176),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      circularRadius: 20,
                      boxShadow: const [
                        BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(50, 0, 0, 0)),
                      ],
                      child: TMaker(text: "Upload a table", fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                )),
            const Padding(padding: EdgeInsets.only(top: 50)),
            CMaker(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: GradesTablesData.length * 250,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: false,
                  itemCount: TeachersTablesData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CMaker(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: TMaker(text: TeachersTablesData[index][0], fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                        CMaker(
                            width: double.infinity,
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: false,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: TeachersTablesData[index][1][0].length,
                              itemBuilder: (context, ColumnIndex) {
                                return CMaker(
                                    width: (PageWidth(context) - 40) / TeachersTablesData[index][1][0].length,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: false,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: TeachersTablesData[index][1].length,
                                      itemBuilder: (context, RowIndex) {
                                        return CMaker(
                                            height: (200) / TeachersTablesData[index][1].length,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: const Border(right: BorderSide(), bottom: BorderSide()),
                                                  borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        ("$ColumnIndex $RowIndex" == "0 0") ? const Radius.circular(10) : const Radius.circular(0),
                                                    bottomLeft: ("$ColumnIndex $RowIndex" == "0 ${TeachersTablesData[index][1].length - 1}")
                                                        ? const Radius.circular(10)
                                                        : const Radius.circular(0),
                                                    topRight: ("$ColumnIndex $RowIndex" == "${TeachersTablesData[index][1][0].length - 1} 0")
                                                        ? const Radius.circular(10)
                                                        : const Radius.circular(0),
                                                    bottomRight: ("$ColumnIndex $RowIndex" ==
                                                            "${TeachersTablesData[index][1][0].length - 1} ${TeachersTablesData[index][1].length - 1}")
                                                        ? const Radius.circular(10)
                                                        : const Radius.circular(0),
                                                  ),
                                                  color: (ColumnIndex == 0 || RowIndex == 0) ? const Color.fromARGB(255, 36, 160, 209) : Colors.white,
                                                ),
                                                alignment: Alignment.center,
                                                child: TMaker(
                                                    text: "${TeachersTablesData[index][1][RowIndex][ColumnIndex]}",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: (ColumnIndex == 0 || RowIndex == 0)
                                                        ? const Color.fromARGB(255, 255, 255, 255)
                                                        : const Color.fromARGB(255, 0, 0, 0))));
                                      },
                                    ));
                              },
                            )),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                      ],
                    );
                  },
                ))
          ],
        ),
      ),
    ];
    return CMaker(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(offset: Offset(1, 1), blurRadius: 6, spreadRadius: .03, color: Color.fromARGB(82, 0, 0, 0)),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                height: 80,
                child: Row(
                  children: [
                    Expanded(child: SizedBox(width: 30, height: 30, child: Logo)),
                    Expanded(flex: 3, child: StudentNameTC),
                    Expanded(flex: 2, child: StateTC),
                    Expanded(child: LogOutButton)
                  ],
                )),
            const Padding(padding: EdgeInsets.only(top: 40)),
            CMaker(
              alignment: Alignment.center,
              width: double.infinity,
              child: CMaker(
                  color: Colors.white,
                  circularRadius: 20,
                  boxShadow: const [
                    BoxShadow(offset: Offset(1, 1), blurRadius: 4, spreadRadius: .03, color: Color.fromARGB(37, 0, 0, 0)),
                  ],
                  width: 300,
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          setState(() {
                            TabBarIndex = 0;
                          });
                        },
                        child: CMaker(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(1, 1),
                                  blurRadius: 4,
                                  spreadRadius: .03,
                                  color: (TabBarIndex == 0) ? const Color.fromARGB(82, 0, 0, 0) : const Color.fromARGB(0, 255, 255, 255)),
                            ],
                            height: 55,
                            width: 90,
                            alignment: Alignment.center,
                            circularRadius: 20,
                            color: (TabBarIndex == 0) ? const Color.fromARGB(255, 233, 255, 247) : const Color.fromARGB(255, 255, 255, 255),
                            child: TMaker(text: "Grades", fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          setState(() {
                            TabBarIndex = 1;
                          });
                        },
                        child: CMaker(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(1, 1),
                                  blurRadius: 4,
                                  spreadRadius: .03,
                                  color: (TabBarIndex == 1) ? const Color.fromARGB(82, 0, 0, 0) : const Color.fromARGB(0, 255, 255, 255)),
                            ],
                            height: 55,
                            width: 90,
                            alignment: Alignment.center,
                            circularRadius: 20,
                            color: (TabBarIndex == 1) ? const Color.fromARGB(255, 233, 255, 247) : const Color.fromARGB(255, 255, 255, 255),
                            child: TMaker(text: "Teachers", fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                      ),
                      Expanded(child: Container()),
                    ],
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            TabBarItems[TabBarIndex],
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ));
  }
}
