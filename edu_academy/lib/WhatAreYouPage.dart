import 'package:flutter/material.dart';

class WhatAreYouPage extends StatefulWidget {
  const WhatAreYouPage({super.key});

  @override
  State<WhatAreYouPage> createState() => _WhatAreYouPageState();
}

String as = "";

class _WhatAreYouPageState extends State<WhatAreYouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                    Color.fromARGB(255, 8, 125, 159),
                    Color.fromARGB(255, 74, 193, 241)
                  ])),
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 20),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.arrow_back)),
                                  ),
                                ),
                                Expanded(flex: 2,
                                  child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(0, 40, 20, 0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Sign up",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color:
                                                  Color.fromARGB(255, 8, 125, 159),
                                              fontWeight: FontWeight.w700),
                                        ),
                                        width: 160,
                                        height: 160,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.zero,
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(23000),
                                              bottomRight: Radius.circular(10)),
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                      Expanded(flex: 3,
                          child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                                height: double.infinity,
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  "images/Logo.png",
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ],
                      ))
                    ],
                  )),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 20,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 5000,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.topLeft,
                                    child: Text("Sign up as :  ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 8, 125, 159)))),
                              ),
                              Expanded(flex: 2, child: Container()),
                              Container(
                                width: 190,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(
                                        115, 194, 194, 194)),
                                child: RadioListTile(
                                    title: Text("Student"),
                                    value: "StudentMobileSignUpPage",
                                    groupValue: as,
                                    onChanged: (val) {
                                      setState(() {
                                        as = val.toString();
                                      });
                                    }),
                              ),
                              Expanded(flex: 2, child: Container()),
                              Container(
                                width: 190,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(
                                        115, 194, 194, 194)),
                                child: RadioListTile(
                                    title: Text("Gardian"),
                                    value: "ParentSignUpPage",
                                    groupValue: as,
                                    onChanged: (val) {
                                      setState(() {
                                        as = val.toString();
                                      });
                                    }),
                              ),
                              Expanded(flex: 2, child: Container()),
                              Container(
                                width: 190,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(
                                        115, 194, 194, 194)),
                                child: RadioListTile(
                                    title: Text("Teacher"),
                                    value: "TeacherSignUpPage",
                                    groupValue: as,
                                    onChanged: (val) {
                                      setState(() {
                                        as = val.toString();
                                      });
                                    }),
                              ),
                              Expanded(flex: 2, child: Container()),
                              InkWell(
                                onTap: () {
                                  if (as!="")
                                  Navigator.pushNamed(context, as);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text("Go",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255))),
                                  height: 50,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(255, 74, 193, 241)),
                                ),
                              ),
                              Expanded(flex: 2, child: Container())
                            ],
                          ),
                        ),
                      ),
                    ],
                  )))
        ]));
  }
}
