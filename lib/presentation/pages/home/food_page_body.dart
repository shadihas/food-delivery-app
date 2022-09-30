
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/core/utils/app_constants.dart'; 
import 'package:food_delivery/presentation/pages/food/food_detail.dart';
import 'package:food_delivery/presentation/widgets/widgets.dart';
import 'package:food_delivery/core/utils/colors.dart';

import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  // PageController pageController = PageController(viewportFraction: 0.8);
  //  var currentPage = 0.0;
  // @override
  // void initState() {
  //   pageController.addListener((){
  //   setState(() {
  //      currentPage = pageControllerpage!;

  //   });});

  //   super.initState();
  // }
  double pix10 = Dimension.pix10; 
  

  @override
  Widget build(BuildContext context) { 
   
        return GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            
            return popularProducts.isLoaded? PageView.builder(
                // controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (BuildContext context, int index) {
                  String url = AppConstants.BASE_URL + AppConstants.IMAGE_FOLDER_URL +popularProducts.popularProductList[index].img;
                  return  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getFoodDetails(index));
                    //  if ( !popularProducts.map.containsKey(index)) { 
                    //    popularProducts.product=0;}
                     },
                    child: Column(
                      children: [ 
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Dimension.pix30,
                                  right: Dimension.pix30,
                                  top: pix10,
                                  bottom: pix10 * 5),
                              child: ImageContainer(
                                  height: Get.context!.height / 4,
                                  width: MediaQuery.of(context).size.width / 1.3,
                                  borderRadius: pix10 * 2,
                                   image: NetworkImage(url)
                                  ),
                            ),
                            Container(
                              padding: EdgeInsets.all(pix10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: popularProducts.popularProductList[index].name,size: Dimension.pix20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          children: List.generate(
                                              5,
                                              (index) => Icon(
                                                    Icons.star,
                                                    size: pix10 * 1.5,
                                                    color: AppColors.mainColor,
                                                  ))),
                                      SmallText(text: '4.5'),
                                      SmallText(text: '12344 comments')
                                    ],
                                  ),
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
                                ],
                              ),
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.width / 1.4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(0, 3),
                                        blurRadius: 5)
                                  ],
                                  borderRadius: BorderRadius.circular(pix10 * 2)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: pix10 * 2,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              popularProducts.popularProductList.isEmpty? 1:popularProducts.popularProductList.length,
                                (i) => Row(
                                      children: [
                                        
                                        Container(
                                          width: index == i ? pix10 * 2 : pix10,
                                          height: pix10,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(pix10),
                                              color: i == index
                                                  ? AppColors.mainColor
                                                  : AppColors.titleColor),
                                        ),
                                        SizedBox(
                                          width: pix10,
                                        ),
                                      ],
                                    ))),
                      ],
                    ),
                  );
                
            }): Container(
              
             child: ProgressIndicatorApp(),
                  decoration: BoxDecoration(
                 
                   
                    borderRadius: BorderRadius.circular(Dimension.pix20)
                  ),
                  margin: EdgeInsets.all(Dimension.pix20),
                  height: Dimension.screenHeight/3,width: Dimension.screenWidth,);
          }
        );
   

  }
}
class Shimmer extends StatefulWidget {
  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  const Shimmer({
    Key? key,
    required this.linearGradient,
    this.child,
  }) : super(key: key);

  final LinearGradient linearGradient;
  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> {
  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}
