
import 'package:food_delivery/presentation/pages/cart/cart_page.dart';
import 'package:food_delivery/presentation/pages/food/food_detail.dart';
import 'package:food_delivery/presentation/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/presentation/pages/home/home_page.dart';
import 'package:food_delivery/presentation/pages/home/main_food_page.dart';
import 'package:food_delivery/presentation/pages/splash/splash_screen.dart';
import 'package:get/get.dart'; 
import 'package:flutter/widgets.dart';
class RouteHelper{
static String getInitial()=>'/';
static String getFoodDetails(int pageId) => '/foodDetails?pageId=$pageId'; 
static String getRecommendedFoodDetail(int pageId) => '/recommendedFoodDetail?pageId=$pageId'; 
static String getCartPage() => '/cartPage';
static String getSplashScreen() => '/splashScreen';
static List<GetPage> routes =[ 
GetPage(name: getInitial(), page: ()=>HomePage(),), 
GetPage(name:'/recommendedFoodDetail' , page: (){
   String? pageId = Get.parameters['pageId'];
   return RecommendedFoodDetail(pageId:int.parse(pageId!));}),
GetPage(name:'/foodDetails', page: (){
 String? pageId = Get.parameters['pageId'];
 return FoodDetail(pageId:int.parse(pageId!));}, 
 ),
//  GetPage(name: '/cartPage', page: ()=> CartPage()),
 GetPage(name: '/splashScreen', page: ()=> SplashScreen()),
 


];

}