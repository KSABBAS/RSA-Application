import 'package:edu_academy/view/StudentPages/PageTwo/SecondPageContents.dart';
import 'package:flutter/material.dart';
class PageBackButton extends StatelessWidget {
  const PageBackButton({super.key,required this.Refresh});
  final Function()? Refresh;

  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed: () {
              anySubjectSelected = false;
              OpenBooks = false;
              OpenBook = false;
              Refresh!();
          },
          icon: const Icon(Icons.arrow_back));
  }
}