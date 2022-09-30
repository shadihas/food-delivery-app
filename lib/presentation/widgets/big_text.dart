import 'package:flutter/material.dart';
import '../../core/dimension.dart';

class BigText extends StatelessWidget {
 final String text;
final  double size;
  Color? color;
 TextOverflow? overflow;

 BigText({Key? key,required this.text , 
 required this.size,
 this.color=const Color(0xFF332d2b),
 this.overflow = TextOverflow.ellipsis}) : super(key: key);
     
  @override
  Widget build(BuildContext context) {
   
    return Text(text , 
    overflow: overflow,
    maxLines: 1,
    style: TextStyle(color: color,fontSize: size,fontFamily: 'Roboto',fontWeight: FontWeight.w400),
      
    );
  }
}