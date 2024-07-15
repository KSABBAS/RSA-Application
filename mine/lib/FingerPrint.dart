import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mine/MyTools.dart';
import 'package:mine/SplashViewPage.dart';
class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  State<FingerPrint> createState() => _FingerPrintState();
}

String verify = "You Are Not Verified";
bool authed = false;

class _FingerPrintState extends State<FingerPrint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
            height: PageHeight(context),
            width: PageWidth(context),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                  Color.fromARGB(255, 40, 35, 35),
                  Color.fromARGB(255, 214, 213, 213)
                ])),
            alignment: Alignment.center,
            child: Center(
              child: Container(
                height: PageHeight(context) / 4,
                width: PageWidth(context) / 1.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(0, 131, 131, 131)
                    ),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 30)),
                    TMaker(
                        text: "$verify",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    InkWell(
                      onTap: () async {
                        if (await auth.authenticate(
                          options: AuthenticationOptions(
                            useErrorDialogs: true,
                            stickyAuth: true,
                            biometricOnly: false
                          ),
                          localizedReason: 'Authenticate yourself') == true) {
                          Navigator.pushReplacementNamed(context, "Home");
                        }
                      },
                      child: CMaker(
                        circularRadius: 15,
                        alignment: Alignment.center,
                        width: 80,
                        height: 40,
                        color: Color.fromARGB(255, 161, 155, 155),
                        child: TMaker(
                            text: "Verify",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            )),
      ],
    ));
  }
}
