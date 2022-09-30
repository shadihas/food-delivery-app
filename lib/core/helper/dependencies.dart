import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
Future<void> init()async{
  // apiClient 
  final sharedPreferences = await SharedPreferences.getInstance();
 Get.lazyPut(() => sharedPreferences);

   Get.lazyPut(() => ApiClient(AppBaseUrl:AppConstants.BASE_URL));
  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
   Get.lazyPut(() => CartRepo(
     sharedPreferences:Get.find()
     ));

  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(
    cartRepo: Get.find(),
    ));
  
}