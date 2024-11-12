import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/Other/StudentAppBar.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/FirstPage/Contents/SubjectsGrid.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/FirstPage/Contents/TitleContainer.dart';
import 'package:flutter/material.dart';

class AllSubjectsPage extends StatefulWidget {
  const AllSubjectsPage({super.key,required this.Refresh});
  final Function()? Refresh;
  @override
  State<AllSubjectsPage> createState() => _AllSubjectsPageState();
}

class _AllSubjectsPageState extends State<AllSubjectsPage> {
  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
      return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const StudentAppBar(),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TitleContainer(),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Expanded(child: SubjectsGrid(Refresh: () {
                            widget.Refresh!();
                          },)),
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      );
    }
    if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
      return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const StudentAppBar(),
            const Padding(padding: EdgeInsets.only(top: 20)),
            CMaker(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TitleContainer(),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Expanded(child: SubjectsGrid(Refresh: () {
                            widget.Refresh!();
                          },)),
          ],
        ),
      );
    }
    if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return Expanded(
        child: Container(
          child: Column(
            children: [
              const StudentAppBar(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CMaker(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TitleContainer(),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(child: SubjectsGrid(Refresh: () {
                widget.Refresh!();
              },)),
              const Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        ),
      );
    } else {
      //later on we can use this for reloading
      return Container();
    }
  }
}
