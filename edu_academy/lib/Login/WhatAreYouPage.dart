import 'package:edu_academy/MyTools.dart';
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
    late Widget WhatAreYouBody;
    Widget ChoseWhatYouAre = Column(
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
                      child: const Text("انشاء حساب  كـ :",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 8, 125, 159)))),
                ),
                Expanded(flex: 2, child: Container()),
                Container(
                  width: 190,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color.fromARGB(115, 194, 194, 194)),
                  child: RadioListTile(
                      title: const Text("طالب"),
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color.fromARGB(115, 194, 194, 194)),
                  child: RadioListTile(
                      title: const Text("ولي امر"),
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color.fromARGB(115, 194, 194, 194)),
                  child: RadioListTile(
                      title: const Text("معلم"),
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
                    if (as != "") {
                      Navigator.pushNamed(context, as);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color.fromARGB(255, 74, 193, 241)),
                    child:
                        const Text("التالي", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 255, 255, 255))),
                  ),
                ),
                Expanded(flex: 2, child: Container())
              ],
            ),
          ),
        ),
      ],
    );
    Widget BackButton = Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    );
    Widget SignUpCircle = Container(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
          alignment: Alignment.center,
          width: 160,
          height: 160,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.zero, topLeft: Radius.circular(10), topRight: Radius.circular(5000), bottomRight: Radius.circular(10)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: const Text(
            "انشاء حساب",
            style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 8, 125, 159), fontWeight: FontWeight.w700),
          ),
        ));
    Widget Logo = SizedBox(
        height: 150,
        child: Image.asset(
          "images/Logo.png",
          fit: BoxFit.contain,
        ));
    if (PageWidth(context) <= 550) {
      setState(() {
        WhatAreYouBody = Scaffold(
          body: CMaker(
            height: PageHeight(context),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Color.fromARGB(255, 8, 125, 159), Color.fromARGB(255, 74, 193, 241)])),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(children: [
                        Expanded(
                          child: Container(child: BackButton),
                        ),
                        Expanded(
                          flex: 2,
                          child: SignUpCircle,
                        ),
                      ])),
                      Expanded(child: CMaker(height: double.infinity, alignment: Alignment.center, child: Logo))
                    ],
                  ),
                ),
                Expanded(flex: 2, child: CMaker(color: Colors.white, padding: const EdgeInsets.all(30), child: ChoseWhatYouAre)),
              ],
            ),
          ),
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      print("===============================================\nnot a phone");
      setState(() {
        WhatAreYouBody = Scaffold(
          body: CMaker(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color.fromARGB(255, 8, 125, 159), Color.fromARGB(255, 74, 193, 241)]),
              child: Column(
                children: [
                  Expanded(flex: 3, child: Container()),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        CMaker(width: 80, child: BackButton),
                        Expanded(
                          child: Image.asset(
                            "images/Logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(width: 80),
                      ],
                    ),
                  ),
                  CMaker(
                      circularRadius: 20,
                      color: Colors.white,
                      height: 500,
                      width: 400,
                      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: ChoseWhatYouAre),
                  Expanded(flex: 5, child: Container()),
                ],
              )),
        );
      });
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      print("===============================================\nnot a phone");
      setState(() {
        WhatAreYouBody = Scaffold(
          body: CMaker(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color.fromARGB(255, 8, 125, 159), Color.fromARGB(255, 74, 193, 241)]),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        CMaker(
                          height: 70,
                          child: BackButton,
                        ),
                        (PageWidth(context) < 800)
                            ? Expanded(
                                flex: 20,
                                child: Image.asset(
                                  "images/Logo.png",
                                  fit: BoxFit.contain,
                                ),
                              )
                            : Expanded(
                                flex: 20,
                                child: CMaker(
                                  width: 200,
                                  child: Image.asset(
                                    "images/Logo.png",
                                    fit: BoxFit.contain,
                                  ),
                                )),
                        Container(height: 70),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  CMaker(
                      circularRadius: 20,
                      color: Colors.white,
                      height: 400,
                      width: (PageWidth(context) < 800) ? PageWidth(context) / 2 : 400,
                      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: ChoseWhatYouAre),
                  Expanded(child: Container()),
                ],
              )),
        );
      });
    }
    return WhatAreYouBody;
  }
}
