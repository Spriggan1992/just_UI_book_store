import 'package:flutter/material.dart';

class TextHolder extends StatelessWidget {
  const TextHolder({
    Key key,
    @required this.title,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.height = 1,
  }) : super(key: key);

  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height));
  }
}
