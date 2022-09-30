import 'package:flutter/material.dart';

import 'widgets.dart'; 
class IconAndText extends StatelessWidget {
 final IconData icon;
 final Color iconColor;

 final String text;
 IconAndText({ Key? key, required this.icon,required this.iconColor ,required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    child:  Row(children: [
      Icon(icon , color: iconColor, ),
      SizedBox(),
      SmallText(text: text,)
      
    ],)
      
    );
  }
}