import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart'; 
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/model/food_data_model.dart';
import 'package:food_delivery/presentation/pages/cart/cart_page.dart';
import 'package:food_delivery/presentation/pages/food/test.dart'; 
import 'package:food_delivery/presentation/pages/home/main_food_page.dart';
import 'package:food_delivery/presentation/pages/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'controllers/recommended_product_controller.dart';
import 'core/helper/dependencies.dart' as dep;
import 'presentation/pages/home/home_page.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
     
    
        return GetBuilder<PopularProductController>(
          builder: (_) {
            return GetBuilder<RecommendedProductController>(
              builder: (_) {
                return GetMaterialApp(
                      title: 'Flutter E-commerce', 
                       getPages: RouteHelper.routes,
                      initialRoute:RouteHelper.getSplashScreen(),
                        // home: SplashScreen()
                      
                );
              }
            );
          }
        );
      
    
  }
}
