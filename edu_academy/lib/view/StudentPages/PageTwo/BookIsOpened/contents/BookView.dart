import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return CMaker(
          border: Border.all(width: .5),
          alignment: Alignment.center,
          circularRadius: 8,
          color: const Color.fromARGB(255, 217, 216, 216),
          width: (PageWidth(context) < 800) ? double.infinity : 600,
          height: (PageHeight(context) - 420),
          child:
              SfPdfViewer.network(maxZoomLevel: 20, all_books[bookOpend][0]));
  }
}