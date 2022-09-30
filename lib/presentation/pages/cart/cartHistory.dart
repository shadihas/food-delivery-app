
import 'package:flutter/material.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/presentation/widgets/big_text.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({ Key? key }) : super(key: key);

  @override
  State<CartHistory> createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: AppColors.mainColor,
        title: BigText(text: 'YOUR CART HISTORYsssssssssssssssssssssssssssss',size:Dimension.pix20 ,color: AppColors.buttonBackgroundColor,),
      ),
    );
  }
}