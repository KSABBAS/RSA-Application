import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/ParentPages/SonPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentMainPageContents extends StatefulWidget {
  ParentMainPageContents({super.key, required this.ParentName});
  String ParentName;
  @override
  State<ParentMainPageContents> createState() => _ParentMainPageContentsState();
}

List<List> Sons = [
  [
    "Yossef Kareem Said",
    "Grade 5",
    "8", //Age
    "images/Person.png", // here will be the link to son photo,
    "yossefkareem234@gmail.com",
    "+201006270833",
  ],
  [
    "Ali Kareem Said",
    "Grade 6",
    "10", //Age,
    "images/Person.png", // here will be the link to son photo,
    "alikareem234@gmail.com",
    "+201264670833",
  ],
  [
    "Fatema Kareem Said",
    "Grade 4",
    "6", //Age,
    "images/Person.png", // here will be the link to son photo,
    "fatemakareem234@gmail.com",
    "+201076270833",
  ],
  [
    "Sara Kareem Said",
    "Grade 2",
    "5", //Age,
    "images/Person.png", // here will be the link to son photo,
    "sarakareem234@gmail.com",
    "+20108270883",
  ],
];
int sonSelectedIndex=0;
class _ParentMainPageContentsState extends State<ParentMainPageContents> {
  @override
  Widget build(BuildContext context) {
    print(Sons[0][3]);
    Widget SonsBuilder = CMaker(
        padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
        circularRadius: 25,
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
        width: double.infinity,
        color: const Color.fromARGB(255, 36, 160, 209),
        child: ListView.builder(
            itemCount: Sons.length,
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
                circularRadius: 25,
                margin: const EdgeInsets.only(bottom: 30),
                color: const Color.fromARGB(255, 233, 255, 247),
                height: 80,
                width: double.infinity,
                child: Row(
                  children: [
                    CMaker(
                      height: 70,
                      width: 70,
                    child: CircleAvatar(backgroundImage: AssetImage(Sons[index][3])),//the asset will change to network
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    CMaker(
                        padding: const EdgeInsets.only(right: 10),
                        child: TMaker(
                            text: Sons[index][0].split(" ")[0]+" "+Sons[index][0].split(" ")[1],
                            fontSize: (PageWidth(context)<550)?17:25,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        sonSelectedIndex=index;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SonPage(SonIndex: sonSelectedIndex,SonsList: Sons,ParentName: widget.ParentName,)));
                      },
                      child: CMaker(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          circularRadius: 20,
                          color: const Color.fromARGB(255, 235, 218, 118),
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          height: 40,
                          child: TMaker(
                              text: "Open",
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                ),
              );
            }));
    Widget StudentNameTC = CMaker(
      alignment: Alignment.bottomCenter,
      child: Text(
        widget.ParentName,
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
    Widget Logo = InkWell(
        onTap: () {
          // setState(() {
          // });
        },
        child: Image.asset("images/Book.png"));
    Widget LogOutButton = InkWell(
                      onTap: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove("id");
                        Navigator.pushReplacementNamed(context, "SplashView");
                      },
                      child: Container(
                        width: 70,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        child: Icon(Icons.logout,
          size: (PageWidth(context) < 550)
              ? 25
              : (PageHeight(context) < 900)
                  ? 30
                  : 35,
        ),
      ),
    );
    return CMaker(
        child: Column(
      children: [
        Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 6,
                      spreadRadius: .03,
                      color: Color.fromARGB(82, 0, 0, 0)),
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            height: 80,
            child: Row(
              children: [
                Expanded(child: SizedBox(width: 30, height: 30, child: Logo)),
                Expanded(flex: 3, child: StudentNameTC),
                Expanded(child: LogOutButton)
              ],
            )),
        const Padding(padding: EdgeInsets.only(top: 20)),
        CMaker(child: TMaker(text: "Children", fontSize: 30, fontWeight:FontWeight.w700, color:Colors.black)),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Expanded(child: CMaker(child: SonsBuilder)),
        const Padding(padding: EdgeInsets.only(top: 20)),
      ],
    ));
  }
}
