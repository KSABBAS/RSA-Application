import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:flutter/material.dart';
class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: (PageWidth(context) < 550)
            ? 50
            : (PageHeight(context) < 900)
                ? 70
                : 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 36, 160, 209),
        ),
        child: Text(
          "الكتب الدراسية",
          style: TextStyle(
              fontSize: (PageWidth(context) < 550)
                  ? 30
                  : (PageHeight(context) < 900)
                      ? 40
                      : 30,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w600),
        ),
      );
  }
}