import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  double? size;
  Color? color;
  int? maxLines;
  double? height;
  TextOverflow? overflow;

  SmallText({
    Key? key,
    required this.text,
    this.size = 12,
    this.color = const Color(0xFFccc7c5),
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.height
    

    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
    maxLines: maxLines,
    overflow: overflow,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'Roboto',
          height: height
        ));
  }
}
