import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/food_data_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  late PopularProductController popularProductController;

  CartController({required this.cartRepo});
  Map<int , CartModel> _items = {};
   Map get items =>_items ;
   int totalPrice = 0;
  
  void addItem(ProductModel product, int quantity){
    
    if(!_items.containsKey(product.id)){
   _items.putIfAbsent(product.id, () { 
    return CartModel(
      id: product.id
    ,img: product.img,
    isExist:true ,
    name:product.name ,
    price: product.price,
    quantity:quantity ,
    product: product,
    time:DateTime.now().toString() , );
  }); }else{
  _items.update( product.id, (value) {
 return CartModel( id: product.id 
    ,img: product.img,
    isExist:true ,
    name:product.name ,
    price: product.price, 
    quantity:quantity,
    product: product,
    time:DateTime.now().toString() , );
  }); 
  } 
  cartRepo.addToCart(getItems);
   _items.removeWhere((k,v) => v.quantity==0);
   // getItems.forEach((element) {
   //
   // });
 // print(getItems[0].product!.id); 
  }

List<CartModel> get getItems => _items.entries.map((e) => e.value).toList(); 
int getQuantity(ProductModel product){
  var quantity = 0;
  if(_items.containsKey(product.id)){
    _items.forEach((key, value) {
      if(key ==product.id){
        quantity = value.quantity!;
      } 
    }); 
  }return quantity; 
}
 
 int get totalItems{
  int totalQuantity = 0;
  _items.forEach((key, value) { 
    totalQuantity += value.quantity!;
  });
  return totalQuantity;
 } 
 
int countTotalPrice(){
totalPrice =0;
getItems.forEach((e) {
  totalPrice = (e.price! * e.quantity!) +totalPrice;

});
  return totalPrice;
}
 
 
List<CartModel> storageItems = [];
List<CartModel> getCartData(){
   setCart = cartRepo.getCartList();
   _items.removeWhere((key, value) => value.quantity ==0);
   // print('=======');
   // print(getItems[0].product!.id);
   // print('=======');
  return storageItems;
}

set setCart(List<CartModel> store) {
 storageItems = store; 
for (var i = 0; i < storageItems.length; i++) {
   _items.putIfAbsent(storageItems[i].product!.id, () => storageItems[i]);
}
}

// bool existInCart(ProductModel product){
// if(_items.containsKey(product.id)){
//   return true;
// }  else return false;
// }
 
 
//   getTotalInStorage(){ 
//    Get.find<PopularProductController>().totalItems = 0;
//   _items.forEach((k,v) { 
//   Get.find<PopularProductController>().totalItems  += v.quantity!;
// });
// update();
// } 

 addToHistory() {
   cartRepo.addToHistory();
   _items.clear();
//  getTotalInStorage();
   update();
}

}

// when we want to create a cart we have to follow the steps:
// 1- we should create a cartController and remember in getX we 
// should always extends GetXController for each controller 
// 2-  we have to create a function addItems that takes 2 parameters
// the first one is the quantity and the second one the product that has 
// all the parameters that are needed 
// 3- inside the function we have to add to buildIn functions which are 
// putIfAbsent and update if it is exist 
// 4 - earlier we have to create a map to add the catItems in 
// and create a a model to pass in the map as a value 
// 5 - we have to initialize the Cart Controller by call in it 
// inside a lazyPut in the init method then we create a repo to save the items 
