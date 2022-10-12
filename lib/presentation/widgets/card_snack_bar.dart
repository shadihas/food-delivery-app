 import 'package:flutter/material.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/utils/colors.dart';

void cardSnackBar(BuildContext context , String text) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: EdgeInsets.all(0),
         
         backgroundColor: Colors.white70,
          dismissDirection: DismissDirection.up,
          duration: Duration(seconds:2),
         content: Container( 
           margin: EdgeInsets.all(Dimension.pix10), 
           height:Dimension.screenHeight/10,
           width: Dimension.screenWidth /1.2,
           decoration: BoxDecoration( 
              color: AppColors.mainColor,
             borderRadius: BorderRadius.circular(Dimension.pix20)
           ),
         
           child: Center(child: Text(text, 
             ))),
       
       ),
    );
  }