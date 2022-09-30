import 'package:flutter/material.dart'; 
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/model/food_data_model.dart';
import 'package:food_delivery/presentation/pages/cart/cart_page.dart'; 
import 'package:food_delivery/presentation/widgets/widgets.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class RecommendedFoodDetail extends StatefulWidget {
  final int pageId; 
  const RecommendedFoodDetail({ Key? key,  required this.pageId }) : super(key: key);

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
     ProductModel product = Get.find<RecommendedProductController>().recommendedProductList[widget.pageId];  
     Get.find<PopularProductController>().intProduct(product,Get.find<CartController>());
      return GetBuilder<RecommendedProductController>(
        builder: (recommendedProduct) {
          return Scaffold(
              body: Container(
                height: Dimension.screenHeight/1.2,
                child: CustomScrollView(   slivers: <Widget>[
             SliverAppBar(
               automaticallyImplyLeading: false,
               title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(Dimension.pix10 * 3),
                            child: GestureDetector( 
                              onTap: ()=> Get.back(),
                              child: AppIcon(
                                  iconSize: Dimension.pix10 * 2,
                                  icon: Icons.clear),
                            ),
                          ),
                          GetBuilder<PopularProductController>(
                            
                            builder: (cart) {
                              return GestureDetector(
                                onTap:(){
                                  Get.toNamed(RouteHelper.getCartPage());
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(Dimension.pix10 * 3),
                                  child: cart.totalItems>0?
                                  Stack(children: [
                                     AppIcon(
                                      iconSize: Dimension.pix20,
                                      icon: Icons.shopping_cart_outlined),
                                     Container( 
                                       child: Center(child: Text(cart.totalItems.toString(),style: TextStyle(fontSize: Dimension.pix10),)),
                                       width: Dimension.pix20,
                                       height: Dimension.pix20,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(Dimension.pix20),
                                         color: AppColors.mainColor 
                                       ),
                                     )
                                  ],): 
                                  AppIcon(
                                      iconSize: Dimension.pix20,
                                      icon: Icons.shopping_cart_outlined),
                                ),
                              ); 
                                  }
                          ),
                        ],
                      ), 
               bottom: PreferredSize(child: Container(
                 padding: EdgeInsets.all(Dimension.pix10),
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                 ),
                 width: double.maxFinite,
                 child: BigText(text:product.name.toString(),size: Dimension.pix20),
                 
               ),
               preferredSize: Size.zero,),  pinned: true,
                 backgroundColor: AppColors.yellowColor,
                expandedHeight: Dimension.screenHeight/2,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(AppConstants.BASE_URL+AppConstants.IMAGE_FOLDER_URL+recommendedProduct.recommendedProductList[widget.pageId].img,fit: BoxFit.cover,),      
                ),
            ),
            SliverToBoxAdapter(
              
              child: Container(
              
                height: Dimension.screenHeight,
                color: AppColors.buttonBackgroundColor,
                child: ExtendableText(
                  text: recommendedProduct.recommendedProductList[widget.pageId].description 
                //  'Chicken marinated in a spiced yoghurt is placed'
                // 'in a  large pot, then layered with fried onions '
                // '(cheeky easy sub below!),fresh coriander/cilantro, then'
                // 'par boiled lightly spiced rice.'
                // 'the crowing glory is to finish it off with a drizzle'
                // 'of saffron infused water to give it the signature patches'
                // 'of bright yellow rice''Chicken marinated in a spiced yoghurt is placed'
                // 'in a  large pot, then layered with fried onions '
                // '(cheeky easy sub below!),fresh coriander/cilantro, then'
                // 'par boiled lightly spiced rice.'
                // 'the crowing glory is to finish it off with a drizzle'
                // 'of saffron infused water to give it the signature patches'
                // 'of bright yellow rice',
                )
              ),
            ),
    
          
           ]
            
    ),
              ),
              bottomNavigationBar: GetBuilder<PopularProductController>(
                builder: (controller) {
                  return Container(
                    height: Dimension.screenHeight/4.3,
                    child: Column(
                     children: [
                      Container(
                        width: Dimension.screenWidth / 1.6,
                        padding: EdgeInsets.all(Dimension.pix15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimension.pix10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           GestureDetector(
                             onTap: (){
                                   controller.setQuantity(true);
                             },
                             child: AppIcon(icon:Icons.add,color: Colors.white,backgroundColor: AppColors.mainColor,)),
                            SizedBox(
                              width: Dimension.pix10,
                            ),
                            BigText(text: '\$${product.price} '+' X '+'${controller.inCartItems.toString()}',size: Dimension.pix20),
                            SizedBox(
                              width: Dimension.pix10,
                            ),
                           GestureDetector(
                             onTap:(){
                                   controller.setQuantity(false);
                             },
                             child: AppIcon(icon:Icons.remove,color: Colors.white,backgroundColor: AppColors.mainColor,)),
                          ],
                        ),
                      ),
                       Container(
                  padding: EdgeInsets.all(Dimension.pix15),
                  height: Dimension.screenHeight /8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimension.pix30),
                          topRight: Radius.circular(Dimension.pix30)),
                      color: Colors.black12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Dimension.screenWidth / 4,
                        padding: EdgeInsets.all(Dimension.pix15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimension.pix10),
                            color: Colors.white),
                        child:Icon(Icons.favorite,color: AppColors.mainColor,)
                      ),
                      GestureDetector(
                        onTap: (){
                              controller.addItem(product);
                              // controller.getTotal();
                        },
                        child: Container(
                          child: BigText(text:'${product.price}'+ ' | '+'Add to Cart',color: AppColors.buttonBackgroundColor    ,size: Dimension.pix20),
                          width: Dimension.screenWidth / 2.2,
                          padding: EdgeInsets.all(Dimension.pix15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimension.pix10),
                              color: AppColors.mainColor),
                        ),
                      ),
                      
                    ],
                  ),
            ),
             
          
    
                     ],
                    ),
                  );
                }
              ),
              
            
  
    );
        }
      );
  }
}