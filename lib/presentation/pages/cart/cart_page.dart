import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

// class CartPage extends StatelessWidget {
  
//    CartPage( {Key? key,  }) : super(key: key);

 
//   @override
//   Widget build(BuildContext context) {
//    return  GetBuilder<PopularProductController>(
//           builder: (count) {
//             return GetBuilder<CartController>(
//               builder: (controller  ) {
//                 return
//      Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//                   height: Dimension.screenHeight,
//                   width: Dimension.screenWidth,
//                  child: Stack(
//                    children: [
//                      Padding(
//                        padding: EdgeInsets.only(top:Dimension.pix30 ,left:Dimension.pix20 ,right:Dimension.pix20 ,bottom:Dimension.pix10 ),
//                        child: Container( 
//                          height: Dimension.screenHeight/14, 
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children:[
//                            GestureDetector(
//                              onTap:(){
                              
//                              },
//                              child: AppIcon(icon: Icons.arrow_back,iconSize: Dimension.pix20,color: Colors.white, backgroundColor: AppColors.mainColor,)),
//                            SizedBox(),
//                              GestureDetector(
//                                onTap: (){
//                                        Get.toNamed(RouteHelper.getInitial());
//                                },
//                                child: AppIcon(icon: Icons.home,iconSize: Dimension.pix20,color: Colors.white, backgroundColor: AppColors.mainColor,)),
//                               count.totalItems>0?
//                               Stack(children: [
//                                  AppIcon(icon: Icons.shopping_cart_rounded,iconSize: Dimension.pix20,color: Colors.white, backgroundColor: AppColors.mainColor,),
//                                  Container(  child: Center(child: Text(count.totalItems.toString(),style: TextStyle(fontSize: Dimension.pix10),)),
//                                    width: Dimension.pix20,
//                                    height: Dimension.pix20,
//                                    decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(Dimension.pix20),
//                                      color: AppColors.buttonBackgroundColor , 
//                                    ),
//                                  )
//                               ],): 
//                            AppIcon(icon: Icons.shopping_cart_rounded,iconSize: Dimension.pix20,color: Colors.white, backgroundColor: AppColors.mainColor,)     
//                            ]
//                          ),
//                        ),
//                      ),
//                      Positioned( 
//                         top: Dimension.pix80,
//                        height: Dimension.screenHeight/1.34,
//                        width: Dimension.screenWidth,
//                        child: MediaQuery.removePadding(
//                          context: context,
//                          removeTop: true,
//                          child: ListView.builder(
//                            itemCount: controller.totalItems,
//                            itemBuilder: (context , index){
//                              var items = Get.find<CartController>().cartRepo; 
//                              return Container(  
//                                child: Row(
//                             children: [
//                                 GestureDetector(
//                                   onTap:() {
//                                     var popularIndex = count.popularProductIdList.
//                                     indexOf(controller.cartId[index]);
//                                     if(popularIndex >=0){
//                                                Get.toNamed(RouteHelper.getFoodDetails(popularIndex));
//                                                print(popularIndex);
//                                     }else { 
//                                         var recommendedIndex = Get.find<RecommendedProductController>().recommendedProductIdList.
//                                     indexOf(controller.cartId[index]);
//                                           Get.toNamed(RouteHelper.getRecommendedFoodDetail(recommendedIndex));
//                                           print(index);
//                                     }
//                                   },
//                                   child: Container(
//                                     margin: EdgeInsets.all(Dimension.pix5),
//                                     width: Dimension.screenWidth/4,
//                                     height: Dimension.screenHeight/7,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(Dimension.pix10),
//                                       image: DecorationImage( 
//                                         image:NetworkImage(AppConstants.BASE_URL+ AppConstants.IMAGE_FOLDER_URL + controller.cartItems[index].img.toString())
//                                         ,fit: BoxFit.fill,
//                                         ),                  
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(Dimension.pix10),
//                                   child: Container( 
//                                     width: Dimension.screenWidth/1.5,
//                                     height: Dimension.screenHeight/8,
                       
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 BigText(text: controller.cartItems[index].name.toString(), size: Dimension.pix20),
//                                                 SmallText(text: 'spicy'),
//                                                 Row(
//                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                   children: [
//                                                     BigText(text: ' \$ ${controller.cartItems[index].price}', size: Dimension.pix20 ,color: Colors.redAccent,),
//                                                                               Container(
//                                   width: Dimension.screenWidth / 4,
//                                   padding: EdgeInsets.all(Dimension.pix5),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(Dimension.pix10),
//                                       color: Colors.white),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       GestureDetector( 
//                                         onTap: (){ 
//                                           // count.intProduct(Get.find<CartController>(), items[index]);
//                                         count.setQuantity(true);  
//                                           count.addItem(items[index] , false);
//                                         //  count.getTotal(); 
//                                           },
//                                         child: Icon(
//                                           Icons.add,
//                                           color: AppColors.signColor,
//                                           size: Dimension.pix15
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: Dimension.pix5,
//                                       ),
//                                     BigText(text: items[index].quantity.toString(),size: Dimension.pix15,),
//                                       SizedBox(
//                                         width: Dimension.pix5,
//                                       ),
//                                       GestureDetector(
//                                         onTap: (){
//                                             // count.intProduct(Get.find<CartController>(), items[index]);
//                                          count.setQuantity(false);
//                                            count.addItem(items[index], false);
//                                           //  count.getTotal(); 
                                          
//                                            },
//                                         child: Icon(Icons.remove,size: Dimension.pix15, color: AppColors.signColor))
//                                     ],
//                                   ),
//                                 )                                                 
//                                                   ],
//                                                 )
//                                               ],
//                                     )
//                                   ),
//                                 )
//                             ],
//                                ),
//                              );
                       
//                          }),
//                        ),
//                      )
//                    ],
//                  )
                  
//               )
//               ,)
//               ,bottomNavigationBar: Container(
//               padding: EdgeInsets.all(Dimension.pix20),
//               height: Dimension.screenHeight / 7,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(Dimension.pix30),
//                       topRight: Radius.circular(Dimension.pix30)),
//                   color: Colors.black12),
//               child:    
//                        Row( 
//                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          
//                         children: [
//                           Container( 
//                             width: Dimension.screenWidth / 3,
//                             height: Dimension.screenHeight/10,
//                             padding: EdgeInsets.all(Dimension.pix15),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(Dimension.pix10),
//                                 color: Colors.white),
//                             child:Center(child: BigText(text :'\$ ${controller.countTotalPrice()}' , size: Dimension.pix20, ))
//                           ), 
//                   GestureDetector(
//                     onTap: () { 
//                       print('tapped'); 
//                       // controller.addToHistory();
//                          },
//                     child: Container(
//                       child: BigText(
//                           text: " Check out",
//                           color: AppColors.buttonBackgroundColor,
//                           size: Dimension.pix20),
//                       width: Dimension.screenWidth / 3,
//                       padding: EdgeInsets.all(Dimension.pix15),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(Dimension.pix10),
//                           color: AppColors.mainColor),
//                     ),
//                   ),
//                 ],
//               ),
            
//                   ) ,
//               );
//               }
//             );
//           }
//         );
      
  
//   }
// }
