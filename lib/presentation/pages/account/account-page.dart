 import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart'; 
import 'package:food_delivery/controllers/user_info_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/presentation/widgets/account-widget.dart';
import 'package:food_delivery/presentation/widgets/big_text.dart';
import 'package:food_delivery/presentation/widgets/custom_loader.dart';
import 'package:get/get.dart'; 

class Account extends StatelessWidget {
  const Account({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
   
  
    return GetBuilder<UserController>(
      builder: (userController) {
        return !userController.isLoading? Scaffold(
          appBar: AppBar(
            title: BigText(text: 'Profile',color: Colors.white,size: Dimension.pix20,),
            centerTitle: true,
            backgroundColor: AppColors.mainColor,
          ),
             body: Column(
               children: [
                 Container(
                   color: Colors.white,
                   height: Dimension.screenHeight/5,
                   width: Dimension.screenWidth,
                   padding: EdgeInsets.all(Dimension.pix10),
                   child: CircleAvatar(
                     backgroundColor: AppColors.mainColor,
                     child: Icon(Icons.person,size: Dimension.pix60,color: Colors.white,),
                   ),
                 ),
                 Container(
                   height: Dimension.screenHeight/1.73,
                   child: ListView(
                      children: [
                       AccountWidget(icon: Icons.person, color: AppColors.mainColor, text: userController.userModel.name),
                        Container(height: Dimension.pix5,color: Colors.grey.withOpacity(0.2),),
                        AccountWidget(icon: Icons.phone, color: AppColors.yellowColor, text: userController.userModel.phone),
                        Container(height: Dimension.pix5,color: Colors.grey.withOpacity(0.2),),
                        AccountWidget(icon: Icons.message, color: AppColors.yellowColor, text: userController.userModel.email),
                        Container(height: Dimension.pix5,color: Colors.grey.withOpacity(0.2),),
                        AccountWidget(icon: Icons.location_on, color: AppColors.yellowColor, text: 'Fill in your address'),
                        Container(height: Dimension.pix5,color: Colors.grey.withOpacity(0.2),),
                        AccountWidget(icon: Icons.message_outlined, color: Colors.red, text: 'Message'),
                        Container(height: Dimension.pix5,color: Colors.grey.withOpacity(0.2),),
                        GestureDetector(
                          onTap: (){
                            if(Get.find<AuthController>().userLoggedIn()){
                              Get.find<AuthController>().clearSharedData();
                              Get.offNamed(RouteHelper.getSignInPage());
                            }
                          },
                          child: AccountWidget(icon: Icons.logout_outlined, color:Colors.red, text: 'log out')),
                        Container(height: Dimension.pix5,color: Colors.grey.withOpacity(0.2),),
                      ],
                    ),),

               ],
             )
        ):CustomLoader();
      }
    );
  }
}

