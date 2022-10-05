import 'package:flutter/material.dart'; 
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/core/utils/app_constants.dart'; 
import 'package:food_delivery/presentation/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/presentation/widgets/widgets.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:get/get.dart';



class FoodDetail extends StatefulWidget {
 final  int pageId;
 final  String page;

  const FoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  
  
  @override
  Widget build(BuildContext context) {
     var product = Get.find<PopularProductController>().popularProductList[widget.pageId]; 
     Get.find<PopularProductController>().intProduct(product,Get.find<CartController>());
   
    
                  return Scaffold(
        body: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
              width: double.maxFinite,
              height: double.infinity,
              child: Stack(
                children: [
                  ImageContainer(
                                    width: double.infinity,
                                    height: Dimension.screenHeight / 2,
                                    image: NetworkImage(AppConstants.BASE_URL+AppConstants.IMAGE_FOLDER_URL+popularProduct.popularProductList[widget.pageId].img),),
                    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){ 
                         if(widget.page=='cartPage'){
                                  Get.toNamed(RouteHelper.getCartPage());
                                 }else if(widget.page =='home'){
                                  Get.toNamed(RouteHelper.getInitial());
                                 }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(Dimension.pix10 * 3),
                          child: AppIcon(
                              iconSize: Dimension.pix10 * 2,
                              icon: Icons.arrow_back_ios),
                        ),
                      ),
                      GetBuilder<PopularProductController>(
                        
                        builder: (cart) {
                          
                          return GestureDetector(
                           onTap:() =>  Get.toNamed(RouteHelper.getCartPage()),
                            child: Padding(
                              padding: EdgeInsets.all(Dimension.pix10 * 3),
                              child: 
                              cart.totalItems>0?
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
                  Positioned(
                    top: Dimension.screenHeight / 2.3,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(Dimension.pix10 * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text:'',size: Dimension.pix20),
                          SizedBox(height: Dimension.pix10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            size: Dimension.pix10 * 1.5,
                                            color: AppColors.mainColor,
                                          ))),
                              SmallText(text: '4.5'),
                              SmallText(text: '12344 comments')
                            ],
                          ),
                          SizedBox(height: Dimension.pix10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconAndText(
                                  icon: Icons.circle,
                                  iconColor: AppColors.yellowColor,
                                  text: 'Normal'),
                              IconAndText(
                                  icon: Icons.location_on,
                                  iconColor: AppColors.mainColor,
                                  text: '1.7km'),
                              IconAndText(
                                  icon: Icons.timer,
                                  iconColor: AppColors.iconColor2,
                                  text: '32min')
                            ],
                          ),
                          SizedBox(height: Dimension.pix10,),
                          BigText(text: 'Introduce',size: Dimension.pix20),
                         ExtendableText(text: 
            'Chicken marinated in a spiced yoghurt is placed' 
            'in a  large pot, then layered with fried onions '
            '(cheeky easy sub below!),fresh coriander/cilantro, then'
            'par boiled lightly spiced rice.'
            'the crowing glory is to finish it off with a drizzle'
            'of saffron infused water to give it the signature patches'
            'of bright yellow rice',
            ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimension.pix10 * 2),
                              topRight: Radius.circular(Dimension.pix10 * 2)),
                          color: AppColors.buttonBackgroundColor),
                    ),
                  ),
                  
                ],
              ),
            );
          }
        ),
        bottomNavigationBar: FoodDetailBottomBar(index:widget.pageId)
                  );
      
              
  }
 
}

