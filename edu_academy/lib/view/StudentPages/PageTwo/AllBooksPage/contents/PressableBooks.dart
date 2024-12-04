import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class PressableBooks extends StatelessWidget {
  const PressableBooks({super.key, required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return (all_books.isEmpty)
        ? Center(
            child: TMaker(
                text: "لا يوجد كتب",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          )
        : ListView.builder(
            itemCount: all_books.length, //all_books.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        OverlayLoadingProgress.start(
                          context,
                          widget: CMaker(
                            circularRadius: 15,
                            color: const Color.fromARGB(198, 255, 255, 255),
                            width: MediaQuery.of(context).size.width / 3.6,
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 13),
                            child: const AspectRatio(
                              aspectRatio: 1,
                              child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 36, 160, 209),
                              ),
                            ),
                          ),
                        );
                        // add database action here
                        OverlayLoadingProgress.stop();
                        OpenBook = true;
                        OpenBooks = false;
                        anySubjectSelected = false;
                        bookOpend = index;
                        Refresh!();
                      },
                      child: CMaker(
                          height: (PageWidth(context) < 550)
                              ? 50
                              : (PageHeight(context) < 900)
                                  ? 80
                                  : 80,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          circularRadius: 5,
                          color: const Color.fromARGB(255, 19, 218, 132),
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          // height: 40
                          width: double.infinity,
                          child: TMaker(
                              text:
                                  "${index + 1}- ${"${(all_books[index][2].length > 15) ? all_books[index][2].substring(0, 15) + "...." : all_books[index][2]}"}", //////
                              fontSize: (PageWidth(context) < 550)
                                  ? 30
                                  : (PageHeight(context) < 900)
                                      ? 40
                                      : 40,
                              fontWeight: FontWeight.w500,
                              color:
                                  const Color.fromARGB(255, 255, 255, 255)))),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  )
                ],
              );
            });
  }
}
