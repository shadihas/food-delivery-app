import 'dart:developer'; 
import 'package:flutter/material.dart'; 
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart'; 
import 'package:get/get.dart';
import '/core/dimension.dart';
import '/core/utils/colors.dart'; 
import 'widgets.dart'; 
class FoodDetailBottomBar extends StatefulWidget {
  final int index;
  
  const FoodDetailBottomBar({Key? key, required this.index}) : super(key: key);

  @override
  State<FoodDetailBottomBar> createState() => _FoodDetailBottomBarState(); 
}

class _FoodDetailBottomBarState extends State<FoodDetailBottomBar> { 
  
  
   

  @override
  Widget build(BuildContext context) { 
     var product = Get.find<PopularProductController>().popularProductList[widget.index]; 
      
    
        return GetBuilder<CartController>(
          builder: (cartController) {
            return GetBuilder<PopularProductController>(
              builder: (count) {
                return Container(
                  padding: EdgeInsets.all(Dimension.pix15),
                  height: Dimension.screenHeight / 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimension.pix30),
                          topRight: Radius.circular(Dimension.pix30)),
                      color: Colors.black12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                           Row(
                            children: [
                              Container(
                                width: Dimension.screenWidth / 3,
                                padding: EdgeInsets.all(Dimension.pix15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimension.pix10),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                      count.setQuantity(true);    },
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.signColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimension.pix10,
                                    ),
                                  BigText(text: count.inCartItems.toString(),size: Dimension.pix20,),
                                    SizedBox(
                                      width: Dimension.pix10,
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                       count.setQuantity(false);

                                         },
                                      child: Icon(Icons.remove, color: AppColors.signColor))
                                  ],
                                ),
                              ),
                              SizedBox(width: Dimension.pix20,),

                      GestureDetector(
                        onTap: () {
                            count.addItem(product);
                            // cartController.getCartData();

                            print('here you go');
                            // count.getTotal();
                             },
                        child: Container(
                          child: BigText(
                              text: "${product.price} Add to cart",
                              color: AppColors.buttonBackgroundColor,
                              size: Dimension.pix20),
                          width: Dimension.screenWidth / 2.2,
                          padding: EdgeInsets.all(Dimension.pix15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimension.pix10),
                              color: AppColors.mainColor),
                        ),
                      ),
                    ],
                  ),

                      ]));
              }
            );
          }
        );
   
  }
  }


