
import 'package:food_delivery/presentation/pages/cart/cart_page.dart';
import 'package:food_delivery/presentation/pages/food/food_detail.dart';
import 'package:food_delivery/presentation/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/presentation/pages/home/home_page.dart';
import 'package:food_delivery/presentation/pages/home/main_food_page.dart';
import 'package:food_delivery/presentation/pages/splash/splash_screen.dart';
import 'package:get/get.dart'; 
import 'package:flutter/widgets.dart';
class RouteHelper{
static  String getInitial()=>'/initial';
static String getFoodDetails(int pageId, String page) => '/foodDetails?pageId=$pageId&page=$page'; 
static String getRecommendedFoodDetail(int pageId, String page) => '/recommendedFoodDetail?pageId=$pageId&page=$page'; 
static String getCartPage() => '/cartPage';
static String getSplashScreen() => '/splashScreen';
static List<GetPage>   routes =[ 
GetPage(name: '/initial', page: ()=>HomePage(),), 

GetPage(name:'/recommendedFoodDetail' , page: (){
   String? pageId = Get.parameters['pageId'];
    String? page = Get.parameters['page'];
   return RecommendedFoodDetail(pageId:int.parse(pageId!),page: page.toString());}),
GetPage(name:'/foodDetails', page: (){
 String? pageId = Get.parameters['pageId'];
 String? page = Get.parameters['page'];
 return FoodDetail(pageId:int.parse(pageId!),page: page.toString(),);}, 
 ),
  GetPage(name: '/cartPage', page: ()=> CartPage()),
 GetPage(name: '/splashScreen', page: ()=> SplashScreen()), 
];

}