import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart'; 
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/core/utils/app_constants.dart'; 
import 'package:food_delivery/presentation/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/presentation/widgets/widgets.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:get/get.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);


  @override
  State<MainFoodPage> createState() => _MainFoodPageState();

}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> loadRecourses()async{
   await    Get.find<PopularProductController>().getPopularProductList();
   await Get.find<RecommendedProductController>().getRecommendedProductList(); 
  }
  double pix10 = Dimension.pix10;
  @override
  Widget build(BuildContext context) {

    return  RefreshIndicator(
      onRefresh: loadRecourses,
      child: Scaffold(
          backgroundColor: AppColors.buttonBackgroundColor,
          body: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(pix10, pix10 * 3.5, pix10, 0),
                  child: Container(
                    height: pix10 * 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            BigText(
                              text: 'Country',
                              size: Dimension.pix20,
                            ),
                            Row(
                              children: [
                                SmallText(
                                  text: 'Damascus',
                                  color: Colors.black54,
                                ),
                                Icon(Icons.arrow_drop_down_rounded)
                              ],
                            )
                          ],
                        ),
                        Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          width: pix10 * 5,
                          height: pix10 * 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.mainColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: Dimension.screenHeight / 1.27,
                child: ListView(children: [
                  Container(
                    height: Dimension.screenHeight / 2.3,
                    width: MediaQuery.of(context).size.width,
                    child: FoodPageBody(),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: pix10 * 3),
                    alignment: Alignment.topLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: 'Recommended', size: Dimension.pix20),
                        SizedBox(
                          width: pix10,
                        ),
                        SmallText(text: '.'),
                        SizedBox(
                          width: pix10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: pix10 / 2),
                          child: SmallText(text: 'Food Pairing'),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<RecommendedProductController>(
                    builder: (recommendedProduct) {
                      return Container(

                            width: Dimension.screenWidth,
                             height:Dimension.screenHeight/5 * recommendedProduct.recommendedProductList.length,

                            child: ListView.builder(

                              physics: NeverScrollableScrollPhysics(),
                              itemCount:recommendedProduct.recommendedProductList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                     Get.toNamed(RouteHelper.getRecommendedFoodDetail(index,'home'));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(pix10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ImageContainer(
                                          width: Dimension.screenWidth / 3,
                                          height: Dimension.screenHeight / 6,
                                          borderRadius: pix10 * 2,
                                          image: NetworkImage(AppConstants.BASE_URL +AppConstants.IMAGE_FOLDER_URL +recommendedProduct.recommendedProductList[index].img),
                                        ),
                                        Container(
                                          width: Dimension.screenWidth / 1.7,
                                          height: Dimension.screenHeight / 6,
                                          padding: EdgeInsets.all(pix10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              BigText(
                                                  text: recommendedProduct.recommendedProductList[index].name,
                                                  size: Dimension.pix20),
                                              SmallText(
                                                  text:recommendedProduct.recommendedProductList[index].description),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
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
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }
                            ),


                      );
                    }
                  )
                ]),
              ),
            ],
          ),

      ),
    );
  }
  // @override
  // void dispose() {
  //   Get.find<PopularProductController>();
  //   super.dispose();
  // }

 
}

//  height :683.4285714285714