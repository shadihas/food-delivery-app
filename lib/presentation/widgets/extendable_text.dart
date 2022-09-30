 


import 'package:flutter/material.dart';
import '../../core/dimension.dart';
import '../../core/utils/colors.dart';


class ExtendableText extends StatefulWidget {
 final String text;
 double? size = Dimension.pix10;

  
 ExtendableText({ Key? key, required this.text, this.size}) : super(key: key);

  @override
  State<ExtendableText> createState() => _ExtendableTextState(text, size);
}

class _ExtendableTextState extends State<ExtendableText> {
   String text;
   double? size;
  bool show = true;

  _ExtendableTextState(this.text, this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
    height: Dimension.screenHeight/5.2,
    child: ListView(
    children: [
        Text( text 
    ,maxLines: show ?3 :null, overflow:text.length<=150? TextOverflow.ellipsis: TextOverflow.visible,style: TextStyle(
      fontSize: size,
      height: Dimension.pix10/6,
    color: Colors.black54
    ),),
    SizedBox(height: 10,),
    text.length >=150?
     InkWell(onTap: () { setState(() {
      show = !show;
     
     });},
     child:!show? Row(
       children: [
         Text('show less ',style: TextStyle( color: AppColors.mainColor,),),
         Icon(Icons.arrow_drop_up,color: AppColors.mainColor,)
       ],
     ):Row(
       children: [
         Text('show more ',style: TextStyle( color: AppColors.mainColor,)),
         Icon(Icons.arrow_drop_down,color: AppColors.mainColor,)
       ],
     )):Text('')
    ],
    ),     
    );
  }
}