import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart';
import 'package:lottie/lottie.dart';
import 'package:mine/Features/Weather/WeatherInfoHandling.dart';
import 'package:mine/Features/Weather/WeatherModel.dart';
import 'package:mine/Features/Weather/service.dart';
import 'package:mine/MyTools.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as Parser;
import 'package:html/dom.dart' as dom;
import 'package:html/dom_parsing.dart';
import 'package:html/html_escape.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mine/SplashViewPage.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (done == false) {
      return CMaker(
        height: PageHeight(context),
        width: PageWidth(context),
        gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 148, 145, 129),
              Color.fromARGB(255, 233, 235, 231),
            ]),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: LiquidPullToRefresh(
          showChildOpacityTransition: false,
          backgroundColor: Color.fromARGB(255, 148, 145, 129),
          color: Color.fromARGB(255, 233, 235, 231),
          onRefresh: () async {
            await Future.delayed(Duration(milliseconds: 500));
            setState(() {
              Weatherinfohandler.fetchWeather();
            });
          },
          child: CMaker(
            height: PageHeight(context),
            width: PageWidth(context),
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(255, 148, 145, 129),
                  Color.fromARGB(255, 233, 235, 231),
                ]),
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {});
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Expanded(child: Container()),
                      TMaker(
                          text: "Weather",
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)
                    ],
                  ),
                ),
                CMaker(
                  padding: EdgeInsets.all(20),
                  circularRadius: 20,
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 31, 98, 255),
                        Color.fromARGB(255, 173, 198, 255),
                      ]),
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Expanded(child: Container()),
                        CMaker(
                          alignment: Alignment.topCenter,
                          child: TMaker(
                            text: Weatherinfohandler.waether?.cityName ??
                                "loading city",
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        ),
                        Expanded(flex: 2,child: Container()),
                        CMaker(
                          alignment: Alignment.topCenter,
                          child: TMaker(
                            text: "${Weatherinfohandler.waether?.temperature.round()}°C",
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        ),
                        Expanded(child: Container()),
                      ],),
                      Row(children: [
                        CMaker(
                          height: 180,
                          width: 160,
                          child: Lottie.asset(
                                    'images/Animations/${Weatherinfohandler.WeatherAnimation(Weatherinfohandler.waether?.mainCondition)}.json'),
                        ),
                        Expanded(
                            child: Column(
                              children: [
                                CMaker(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  circularRadius: 15,
                                  margin: EdgeInsets.only(right: 0,left: 20),
                                  color: Color.fromARGB(207, 24, 94, 224),
                                  height: 60,
                                  child: Row(children: [
                                    TMaker(
                            text: Weatherinfohandler.waether?.cityName ??
                                "loading city",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                            Expanded(child: Container()),
                            TMaker(
                            text:"الأمطار ",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                                  ],)),
                                  Padding(padding:EdgeInsets.only(top: 20)),
                                CMaker(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  circularRadius: 15,
                                  margin: EdgeInsets.only(right: 0,left: 20),
                                  color: Color.fromARGB(207, 24, 94, 224),
                                  height: 60,
                                  child: Row(children: [
                                    TMaker(
                            text: Weatherinfohandler.waether?.cityName ??
                                "loading city",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                            Expanded(child: Container()),
                            TMaker(
                            text:"الرطوبة ",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                                  ],)),
                                
                              ],
                            ),
                          )
                      ],),
                      Row(children: [
                        Expanded(
                          child: CMaker(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    circularRadius: 15,
                                    color: Color.fromARGB(207, 24, 94, 224),
                                    height: 60,
                                    child: Row(children: [
                              Expanded(child: Container()),
                                      TMaker(
                              text: Weatherinfohandler.waether?.mainCondition ??
                                  "loading",
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                              Expanded(child: Container()),
                                    ],)),
                        ),
                        Expanded(
                          child: CMaker(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    circularRadius: 15,
                                    margin: EdgeInsets.only(right: 0,left: 15),
                                    color: Color.fromARGB(207, 24, 94, 224),
                                    height: 60,
                                    child: Row(children: [
                                      TMaker(
                              text: Weatherinfohandler.waether?.cityName ??
                                  "loading city",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                              Expanded(child: Container()),
                              TMaker(
                              text:"الرياح ",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                                    ],)),
                        ),
                      ],)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}

class LittleWeatherWindow extends StatefulWidget {
  const LittleWeatherWindow({super.key});

  @override
  State<LittleWeatherWindow> createState() => _LittleWeatherWindowState();
}


bool LittleDone = true;
class _LittleWeatherWindowState extends State<LittleWeatherWindow> {
  Widget build(BuildContext context) {
    if (LittleDone == false) {
      return CMaker(
          child: Center(
        child: CircularProgressIndicator(),
      ));
    }
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, "Weather");
        },
        child: CMaker(
            circularRadius: 20,
            color: Color.fromARGB(133, 255, 255, 255),
            child: Row(
              children: [
                Expanded(
                    child: CMaker(
                        circularRadius: 20,
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromARGB(255, 31, 98, 255),
                              Color.fromARGB(255, 173, 198, 255),
                            ]),
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 5),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Lottie.asset(
                                  'images/Animations/${Weatherinfohandler.WeatherAnimation(Weatherinfohandler.waether?.mainCondition)}.json'),
                            ),
                            Expanded(
                                child: TMaker(
                                    text:
                                        "${Weatherinfohandler.waether?.mainCondition}",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))
                          ],
                        ))),
                Expanded(
                  child: CMaker(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 20,
                          child: CMaker(
                            width: double.infinity,
                            circularRadius: 10,
                            padding: EdgeInsets.all(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color.fromARGB(255, 31, 98, 255),
                                  Color.fromARGB(255, 173, 198, 255),
                                ]),
                            margin: EdgeInsets.only(
                                top: 12, bottom: 5, left: 5, right: 10),
                            child: Column(
                              children: [
                                TMaker(
                                    text: "درجة الحرارة",
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                TMaker(
                                    text:
                                        "${Weatherinfohandler.waether?.temperature.round()}°C",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 15,
                            child: Row(
                              children: [
                                Expanded(
                                    child: CMaker(
                                        circularRadius: 10,
                                        padding: EdgeInsets.all(10),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Color.fromARGB(255, 31, 98, 255),
                                              Color.fromARGB(
                                                  255, 173, 198, 255),
                                            ]),
                                        margin: EdgeInsets.only(
                                            top: 5,
                                            bottom: 10,
                                            left: 5,
                                            right: 5),
                                        child: Column(
                                          children: [
                                            TMaker(
                                                text: "الضغط",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                            TMaker(
                                                text:
                                                    "${Weatherinfohandler.waether?.pressure}",
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ],
                                        ))),
                                Expanded(
                                    child: CMaker(
                                        circularRadius: 10,
                                        padding: EdgeInsets.all(10),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Color.fromARGB(255, 31, 98, 255),
                                              Color.fromARGB(
                                                  255, 173, 198, 255),
                                            ]),
                                        margin: EdgeInsets.only(
                                            top: 5,
                                            bottom: 10,
                                            left: 5,
                                            right: 10),
                                        child: Column(
                                          children: [
                                            TMaker(
                                                text: "الرياح",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                            TMaker(
                                                text:
                                                    "${Weatherinfohandler.waether?.windSpeed}",
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ],
                                        ))),
                              ],
                            ))
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
