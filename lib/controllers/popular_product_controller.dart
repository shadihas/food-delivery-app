
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/model/food_data_model.dart';
import 'package:get/get.dart'; 
import 'package:food_delivery/data/repository/popular_product_repo.dart'; 
class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({
    required this.popularProductRepo,

  });
    List<ProductModel> popularProductList = []; 
   bool isLoaded = false;
   late CartController _cart;
  
  

  Future<void> getPopularProductList()async{
     popularProductList = [];
   Response response = await popularProductRepo.getPopularProductList(); 
   if(response.statusCode == 200){ 
     popularProductList.addAll(Product.fromJson(response.body).products!); 
     isLoaded =true;    
      update();
   }else{ 
   } 
  }
  int product = 0; 
void setQuantity(bool isIncremented){
  if(isIncremented){
    if(inCartItems<20){
    quantity = quantity+1;}
    else{
 Get.snackbar('note','you can not add more then 20'
     ,backgroundColor:AppColors.mainColor,
      colorText: Colors.white); 
      }
  }else{
     if (inCartItems>0) { 
    quantity = quantity -1;
     }else{
        Get.snackbar('note','you can not decrease less then zero',
        backgroundColor:AppColors.mainColor,
        colorText: Colors.white,);
     }
  }
  update();
} 
int quantity =0;
int get inCartItems => quantity; 
intProduct(ProductModel product, CartController cart ){ 
 quantity =0;
  _cart = cart; 
    quantity = _cart.getQuantity(product);

  
}
//  intProduct(CartController cart , productModel){ 

//    _cart = cart; 
//    _cart.items.containsKey(productModel.id)?
   
//  _cart.items.forEach((key, value) {
   
//    if(key == productModel.id){
    
//      _quantity = value.quantity!;
//    }
//   }): _quantity = 0;
//   quantity = 0; 
  // if exist
  // get from storage _inCartItem
// }

void addItem(product){ 
    // if(quantity ==0 && showSnackBar ){
    //     Get.snackbar('Add Item','you should add at least one item !'
    //  ,backgroundColor:AppColors.mainColor,
    //   colorText: Colors.white);
    // }
    
    //  quantity = _cart.getQuantity (product); 
    inCartItems;
    _cart.addItem(product,inCartItems); 
    
    // _quantity =0;
  // _cart.items.removeWhere((key, value) => value.quantity ==0); 
  //  _cart.countTotalPrice();

update();
} 
int get totalItems{
  return _cart.totalItems;
}

// num totalItems = 0;
// getTotal(){ 
//   totalItems =0;
//   _cart.items.forEach((key, value) { 
//   totalItems = totalItems + value.quantity!;
// });
// update();
// } 



  


}
