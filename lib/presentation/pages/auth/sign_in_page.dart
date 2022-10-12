import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/model/response_model.dart';
import 'package:food_delivery/presentation/widgets/app_text_field.dart';
import 'package:food_delivery/presentation/widgets/big_text.dart';
import 'package:food_delivery/presentation/widgets/custom_loader.dart';
import 'package:food_delivery/presentation/widgets/show_custom_stackBar.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
     TextEditingController passwordController = TextEditingController(); 
      TextEditingController phoneController = TextEditingController(); 
   _login(AuthController authController) { 
    String email = emailController.text.trim();
     String password = passwordController.text.trim(); 
     String phone = phoneController.text.trim();
     if(!email.isEmail){
         showCustomSnackbar('type in your email address'); 
     }else if(password.length<=6){
      showCustomSnackbar('password must be more than 6 characters') ;
     }else {
              authController.login(email, password , '00963944021831').then((status)  {
                if(status.isSuccess){
                  print('that is correct');
                  Get.toNamed(RouteHelper.getSplashScreen());
                }
                else{
                  showCustomSnackbar(status.message);
                }
              });
     }
   }
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<AuthController>(
      builder: (authController) {
        return (!authController.isLoading)? Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(Dimension.pix10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [ 
                   SizedBox(height: Dimension.pix30,), 
                   Container( 
                        color: Colors.white,
                        width: Dimension.screenWidth,
                        height: Dimension.screenHeight/4,
                        child: Center(child: CircleAvatar(
                          radius: Dimension.pix80,
                          
                          backgroundImage: AssetImage('assets/image/logo part 1.png',),
                        )), 
                      ) ,
                        BigText(text: 'Hello', size: Dimension.pix70,color: Colors.black,), 
                        
                          BigText(text: 'sign into your account', size: Dimension.pix20,color: Colors.grey.shade600),
                           SizedBox(height: Dimension.pix30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                        
                          AppTextField(controller: emailController, hintText: 'Email', icon: Icon(Icons.email,color: AppColors.yellowColor,)),
                          SizedBox(height: Dimension.pix15,),
                           AppTextField(controller: passwordController, hintText: 'Password', icon: Icon(Icons.password),obscureText: true,),
                             SizedBox(height: Dimension.pix15,),
                             AppTextField(controller: phoneController,hintText: 'Phone',
                 icon: Icon(Icons.phone),),
                                              SizedBox(height: Dimension.pix15,),
                            BigText(text: 'sign into your account', size: Dimension.pix20,color: Colors.grey.shade600),
                             SizedBox(height: Dimension.pix30,),
                             GestureDetector(
                              onTap: ()=>_login(authController),
                               child: Center(
                                 child: Container(
                                             height: Dimension.pix70,
                                             width: Dimension.screenWidth/2,
                                             child: Center(child: BigText(text : 'Sign in' ,size:Dimension.pix30 ,color: Colors.white,)),
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(Dimension.pix30)
                                               ,color: AppColors.mainColor,
                                     
                                             ),
                                             
                                           
                                            ),
                               ),
                             ),
                              SizedBox(height: Dimension.pix20,),
                        ],
                      ),

                      
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      BigText(text: 'Don\'t have an account? ', size: Dimension.pix20,color: Colors.grey.shade500),
                        GestureDetector(
                          onTap:(){
                            Get.toNamed(RouteHelper.getSignUpPage(

                            ));
                          },
                          child: BigText(text: 'Create', size: Dimension.pix20,color: Colors.black)),
                  ],
                 )       
                ],
              ),
            ),
          ),
        ):CustomLoader();
      }
    );
  }

 
}