
import 'package:flutter/material.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/utils/colors.dart';

import 'widgets.dart';

class AccountWidget extends StatelessWidget {
  IconData icon;
  Color color;
  String text;
   AccountWidget({Key? key, required this.icon, required this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: EdgeInsets.all(Dimension.pix5),
      tileColor:Colors.white,
      title: BigText(text: text,size: Dimension.pix20,),
      leading: CircleAvatar(

        radius: Dimension.pix30,
        child: Icon(icon,size: Dimension.pix30,color: Colors.white,),
        backgroundColor: color,
      ),
    );
  }
}
