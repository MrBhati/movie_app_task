import 'package:flutter/material.dart';

class LargeVrLine extends StatelessWidget {
  final Color lineColor;
  final double height;
  final double hrMargin;
  final double veMargin;
  const LargeVrLine(
      {Key? key,
      required this.height,
      required this.lineColor,
      required this.hrMargin,
      required this.veMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: veMargin, horizontal: hrMargin),
      height: height,
      width: double.infinity,
      color: lineColor,
    );
  }
}
