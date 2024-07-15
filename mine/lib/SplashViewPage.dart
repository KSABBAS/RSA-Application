import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mine/Features/Weather/WeatherInfoHandling.dart';
import 'package:mine/ItIsMe.dart';
import 'package:mine/MyTools.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

late LocalAuthentication auth;
Weatherinfohandling Weatherinfohandler = Weatherinfohandling();
bool done = false;
bool supported = false;

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? fading;
  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isDeviceSupported) => setState(() {
          supported = isDeviceSupported;
        }));
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    fading = Tween<double>(begin: .1, end: 1).animate(animationController!)
      ..addListener(() {
        setState(() {
          if (animationController!.isCompleted) {
            Timer(Duration(milliseconds: 300), () async {
              SharedPreferences test = await SharedPreferences.getInstance();
              if (test.getBool("ItIsMe") == true) {
                if (supported)
                  Navigator.of(context).pushReplacementNamed("FingerPrint");
                else
                  Navigator.of(context).pushReplacementNamed("Home");
              } else {
                Navigator.of(context).pushReplacementNamed("ItIsMe");
              }
            });
          }
        });
      });
    animationController!.forward();
    IsConnectedToInternet();
    Weatherinfohandler.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
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
            child: Opacity(
                opacity: fading!.value, child: Image.asset("images/Logo.png")),
          )),
    );
    ;
  }
}
