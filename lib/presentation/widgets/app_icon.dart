import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:get/get.dart';

class AppIcon extends StatelessWidget {
  IconData icon;
  double? iconSize;
  Color color ;
  Color backgroundColor;
 AppIcon({ Key? key , required this.icon, this.iconSize , this.color = const Color(0xFF5c524f), this.backgroundColor = Colors.white54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
      builder: (product) {
        return Container(
          child: Icon(icon,size: iconSize, color:color), 
          width: Dimension.pix10*4,
          height: Dimension.pix10*4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimension.pix10*4),
          color:backgroundColor 
          ),
          
        );
      }
    );
  }
}