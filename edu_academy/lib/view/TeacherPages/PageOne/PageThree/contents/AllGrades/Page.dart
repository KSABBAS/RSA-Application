import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/PageThree/contents/AllGrades/contents/AllGradesView.dart';
import 'package:flutter/material.dart';

class ThirdPageAllGrades extends StatelessWidget {
  const ThirdPageAllGrades({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    if (PageWidth(context) < 550) {
        return Column(
          children: [
            CMaker(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 13,
          width: (PageWidth(context) < 700) ? double.infinity : 500,
          height: 60,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: TMaker(
              text: "الواجبات",
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black)),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            ThirdPageAllGradesView(Refresh:() {
              Refresh!();
            },)
          ],
        );
    } else if (PageWidth(context) >= 550 && PageHeight(context) >= 900) {
        return Column(
          children: [
            CMaker(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 13,
          width: (PageWidth(context) < 700) ? double.infinity : 500,
          height: 60,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: TMaker(
              text: "الواجبات",
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black)),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            ThirdPageAllGradesView(Refresh:() {
              Refresh!();
            },)
          ],
        );
    } else if (PageWidth(context) >= 550 && PageHeight(context) < 900) {
      return Column(
        children: [
          CMaker(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(61, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: .06)
          ],
          circularRadius: 13,
          width: (PageWidth(context) < 700) ? double.infinity : 500,
          height: 60,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: TMaker(
              text: "الواجبات",
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black)),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          ThirdPageAllGradesView(Refresh:() {
                        Refresh!();
                      },)
        ],
      );
    } else {
      return Container();
    }
  }
}
