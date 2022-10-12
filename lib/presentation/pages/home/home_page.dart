import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/presentation/pages/account/account-page.dart';
import 'package:food_delivery/presentation/pages/cart/cartHistory.dart';
import 'package:food_delivery/presentation/pages/cart/cart_page.dart';
import 'package:food_delivery/presentation/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/presentation/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 

  int sel = 0;
  List pages =[
   MainFoodPage(),
   CartHistory(),
    CartPage(),
    Account()
  // Container(),
  ];
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: pages[sel],
      bottomNavigationBar: Stack(  
        children: [
          BottomNavigationBar(  backgroundColor: Colors.black,
            type: BottomNavigationBarType.shifting,
            selectedFontSize: Dimension.pix15,
            unselectedFontSize: Dimension.pix10, 
            currentIndex: sel,
            onTap: (value) { 
            setState(() {
                sel = value; 
            });
            },
            selectedItemColor:AppColors.mainColor,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: AppColors.signColor, 
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'home',),
               BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'history'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'cart'),
                 BottomNavigationBarItem(icon: Icon(Icons.person), label: 'me'),
            ]),
        ],
      ),
    );
  }
}