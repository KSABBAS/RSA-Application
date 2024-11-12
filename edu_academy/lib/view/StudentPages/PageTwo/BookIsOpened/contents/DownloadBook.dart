import 'package:edu_academy/MyTools.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:flutter/material.dart';
class DownloadBook extends StatelessWidget {
  const DownloadBook({super.key});

  @override
  Widget build(BuildContext context) {
    return  CMaker(
          height: 120,
          width: (PageWidth(context) < 600) ? double.infinity : 400,
          color: const Color.fromARGB(255, 36, 160, 209),
          circularRadius: 8,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(child: Container()),
              TMaker(
                  // book name text
                  text:
                      "${(all_books[bookOpend][2].length > 10) ? all_books[bookOpend][2].substring(0, 10) + "...." : all_books[bookOpend][2]}",
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  launchURL(url: all_books[bookOpend][0]);
                  //${all_books[bookOpend][0]}
                  // in here you must add ,the download function and its animation all by yourself
                },
                child: CMaker(
                  alignment: Alignment.center,
                  circularRadius: 25,
                  width: 100,
                  height: 50,
                  color: const Color.fromARGB(255, 18, 207, 60),
                  child: TMaker(
                      text: "تنزيل",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Expanded(child: Container()),
            ],
          ));
  }
}