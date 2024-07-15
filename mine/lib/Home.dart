import 'dart:async';
import 'dart:math';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine/Features/QuranSource.dart';
import 'package:mine/Features/Weather/Weather.dart';
import 'package:mine/MyTools.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/dom_parsing.dart';
import 'package:html/html_escape.dart';
import 'package:html/parser.dart' as Parser;
import 'package:http/http.dart' as http;
import 'package:mine/SplashViewPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int PageIndex = 0;

Random r = new Random();

List verces = [];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int surah = r.nextInt(113) + 1;
    int ayat = r.nextInt(Quran[surah].length - 1) + 1;
    List Widgets = [
      Container(
        child: TMaker(
            text: "feature",
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    ];
    List<Widget> Pages = [
      CMaker(
        gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 148, 145, 129),
              Color.fromARGB(255, 233, 235, 231),
            ]),
        height: PageHeight(context),
        width: PageWidth(context),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                alignment: Alignment.center,
                child: TMaker(
                    text: "صل على محمد",
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 0, 0, 0))),
            Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                height: PageHeight(context) - 600,
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: const Color.fromARGB(0, 0, 0, 0),
                child: LittleWeatherWindow()),
            CMaker(
                circularRadius: 10,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                color: Color.fromARGB(133, 255, 255, 255),
                child: TMaker(
                    text: Quran[surah][ayat],
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            CMaker(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 10000,
              width: PageWidth(context),
              circularRadius: 20,
              child: GVBuilder(
                scroll: false,
                onTap: () {},
                list: Widgets,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                color: Color.fromARGB(133, 255, 255, 255),
                alignment: Alignment.center,
                circularRadius: 20,
              ),
            )
          ],
        ),
      ),
      CMaker(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 148, 145, 129),
              Color.fromARGB(255, 233, 235, 231),
            ]),
        height: PageHeight(context),
        width: PageWidth(context),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
                alignment: Alignment.center,
                child: TMaker(
                    text: "صل على محمد",
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 0, 0, 0))),
          ],
        ),
      ),
    ];
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CrystalNavigationBar(
            backgroundColor: Color.fromARGB(139, 255, 255, 255),
            selectedItemColor: Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: Color.fromARGB(255, 2, 48, 19),
            currentIndex: PageIndex,
            paddingR: EdgeInsets.symmetric(horizontal: 50),
            enableFloatingNavBar: true,
            onTap: (p0) {
              setState(() {
                PageIndex = p0;
              });
            },
            items: [
              CrystalNavigationBarItem(icon: Icons.home),
              CrystalNavigationBarItem(icon: Icons.settings)
            ]),
        body: LiquidPullToRefresh(
            showChildOpacityTransition: false,
            backgroundColor: Color.fromARGB(255, 148, 145, 129),
            color: Color.fromARGB(255, 233, 235, 231),
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 500));
              setState(() {
                done = false;
                LittleDone = false;
                Weatherinfohandler.fetchWeather();
              });
            },
            child: Pages[PageIndex]));
  }
}
