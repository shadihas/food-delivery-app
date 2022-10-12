import 'package:flutter/material.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/utils/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Dimension.pix100,
          width: Dimension.pix100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.pix50),
            color: AppColors.mainColor
          ),
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}