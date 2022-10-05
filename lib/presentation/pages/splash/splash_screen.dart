import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:get/get.dart'; 
class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
} 
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  Future<void> loadRecourses()async{ 
     await Get.find<CartController>();
   await    Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList(); 
  }
  late AnimationController animationController;
  late CurvedAnimation curvedAnimation; 
  void initState() {  
     super.initState(); 
    loadRecourses();   
   
    
    
   animationController = AnimationController(vsync: this,duration: Duration(seconds: 2))..forward();
   curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.linear);
   Timer(Duration(seconds: 4),()=> Get.toNamed(RouteHelper.getInitial()));   
    
  } 
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(scale: curvedAnimation,
              child: Image.asset('assets/image/logo part 1.png' , width: Dimension.screenWidth/2,),),
               Image.asset('assets/image/logo part 2.png', width: Dimension.screenWidth/2,),  
          ],
        ),
      ),
      
    );
  } 
}