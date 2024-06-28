import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ParentSignUpPage extends StatefulWidget {
  const ParentSignUpPage({super.key});
  @override
  State<ParentSignUpPage> createState() => _ParentSignUpPageState();
}

var obscureText = true;
List ll = [2.2];

class _ParentSignUpPageState extends State<ParentSignUpPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    final Sheigt = MediaQuery.of(context).size.height;
    ll.add(Sheigt);
    double Sheight = ll[1];
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: ListView(
          children: [
            Container(
              height: Sheight / 3,
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
                          flex: 1,
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
                                      padding:
                                          EdgeInsets.fromLTRB(0, 40, 20, 0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                            fontSize: 35,
                                            color: Color.fromARGB(
                                                255, 8, 125, 159),
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
                        Expanded(
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
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              height: Sheight * (2 / 3),
              width: 400,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text("Student Gardian  ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Color.fromARGB(255, 8, 125, 159)))),
                          Container(
                              height: 8,
                              alignment: Alignment.bottomLeft,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color.fromARGB(255, 8, 125, 159),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              label: Text(
                                "Full Name",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      )),
                  Expanded(child: Container()),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              label: Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      )),
                  Expanded(child: Container()),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              label: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      )),
                  Expanded(child: Container()),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        child: TextField(
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                child: Icon(Icons.remove_red_eye_outlined),
                              ),
                              label: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              icon: Icon(Icons.password),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      )),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "StudentMainPage", (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "sign up",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w700),
                      ),
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 74, 193, 241),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Already have an account ? ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 206, 206, 206),
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "LogInPage");
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 74, 193, 241),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container())
                ]),
              ),
            ),
          ],
        ));
  }
}
