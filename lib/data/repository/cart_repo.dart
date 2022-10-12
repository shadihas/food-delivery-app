import 'dart:convert';

import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/food_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{ 
  List<CartModel> historyCart =[];
  List<String> cart = [];
  final SharedPreferences sharedPreferences; 
  CartRepo({required this.sharedPreferences});


 void addToCart(List<CartModel> cartList){
   cart=[];
 // sharedPreferences.remove(AppConstants.CART_KEY);

   // var time = DateTime.now();
  // cart.clear();
 cartList.forEach((element) { 
 // element.time = time.toString();
    cart.add(jsonEncode(element));
 });
sharedPreferences.setStringList(AppConstants.CART_KEY,cart);
//print(sharedPreferences.getStringList(AppConstants.CART_KEY));
getCartList();

 }
  List<String> carts = [];
  List<CartModel> cartList = [];
 // List<String> historyStringList = [];
List<CartModel> getCartList(){
  carts = [];
  if(sharedPreferences.containsKey(AppConstants.CART_KEY)){
    carts = sharedPreferences.getStringList(AppConstants.CART_KEY)!;
  }
cartList=[];
  carts.forEach((element) {
  cartList.add( CartModel.fromMap(jsonDecode(element)));
    });
  print('=======$cartList==========');
  return cartList;
} 
void addToHistory(){
  carts.removeWhere((element) => element.contains('"quantity":0'));
   sharedPreferences.setStringList(AppConstants.HISTORY_KEY, carts);
  print( sharedPreferences.getStringList(AppConstants.HISTORY_KEY));
 if( sharedPreferences.containsKey(AppConstants.CART_KEY)){
  sharedPreferences.remove(AppConstants.CART_KEY);
  }

  // void getFromHistory(){
  //   if(sharedPreferences.containsKey(AppConstants.HISTORY_KEY)){
  //    historyStringList =   sharedPreferences.getStringList(AppConstants.HISTORY_KEY)!;}
  //
  //      historyStringList.forEach((element) {
  //        historyCart.add(CartModel.fromJson(jsonDecode(element)));
  //      });
  // }
}
}

//  --- SharedPreferences with getX ----
// if we have a list and we need to save it in 
// the sharedPreferences first we have to encode it 
// and save it in a knew list typed List<String> using jsonEncode 
// note :: we have to define toJson method that converts
// a model we have to a string like : Map<String , dynamic> toJson(){
// return{ 'quantity':  this.quantity, ... ,...}; }
// second we have to take the list we have and create a key and add
// them inside sharedPreferences.setStringList(AppConstants.CART_KEY, cart);
// then in order to get it from the sharedPreferences and store it in
// a list we have to use  List<String> carts = [];
  // if(sharedPreferences.containsKey(AppConstants.CART_KEY)){
  //   carts = sharedPreferences.getStringList(AppConstants.CART_KEY)!;
  // } 
  // so in this case we have encoded List we have to 
  // decode it to but it inside an the map that would be displayed
  // inside our app
