import 'package:flutter/material.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/utils/colors.dart';

class AppTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  Widget icon;
  bool obscureText; 
   AppTextField({ Key? key , required this.controller, required this.hintText,required this.icon, this.obscureText =false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              height: Dimension.pix50,
            margin: EdgeInsets.symmetric(horizontal: Dimension.pix10), 
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimension.pix20),
              boxShadow: [
                BoxShadow(
                  spreadRadius: Dimension.pix5,
                  blurRadius: Dimension.pix5,
                  offset: Offset(Dimension.pix5,Dimension.pix5),
                  color: Colors.grey.withOpacity(0.2)
                )
              ]
            ),
             child: TextField(
              controller: controller,
              
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: icon, 
                focusedBorder: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(Dimension.pix30),
                  borderSide: BorderSide(
                    
                    width: 1,
                    color: Colors.white,

                  ),
                  

                ),
                enabledBorder:  OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(Dimension.pix30),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white,

                  ),
                  
                  

                ),
                
              ),
              obscureText: obscureText,
             ),
           );
        
  }
}