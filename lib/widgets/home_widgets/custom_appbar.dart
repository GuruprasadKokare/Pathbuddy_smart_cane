import 'package:flutter/material.dart';
import 'package:pathbuddy/utils/quotes.dart';

class CustomAppBar extends StatelessWidget {
  // const CustomAppBar({super.key});
  Function? onTap;
  int? quoteIndex;
  CustomAppBar({this.onTap, this.quoteIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
          child: Text(
        Sweetsaying[quoteIndex!],
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 232, 0, 0)),
      )),
    );
  }
}
