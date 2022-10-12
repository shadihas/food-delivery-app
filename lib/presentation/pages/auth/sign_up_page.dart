import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/model/response_model.dart';
import 'package:food_delivery/model/signup_body_model.dart';
import 'package:food_delivery/presentation/widgets/app_text_field.dart';
import 'package:food_delivery/presentation/widgets/big_text.dart';
import 'package:food_delivery/presentation/widgets/custom_loader.dart';
import 'package:food_delivery/presentation/widgets/progress_Indicator.dart';
import 'package:food_delivery/presentation/widgets/show_custom_stackBar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
class SignUpPage extends StatefulWidget {

  const SignUpPage({ Key? key }) : super(key: key); 

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
      TextEditingController emailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
      TextEditingController nameController = TextEditingController();
      TextEditingController phoneController = TextEditingController();
      List SignUpImages =[
        't.png',
        'f.png',
        'g.png',
      ]; 
      void _registration (AuthController authController){ 
         String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim(); 
         if(name.isEmpty){
   showCustomSnackbar('Type in your name');
        }else if(phone.isEmpty){
showCustomSnackbar('Type in your phone');
        }else if(email.isEmpty){
showCustomSnackbar('Type in your email');
        }else if(!GetUtils.isEmail(email)){
showCustomSnackbar('Your email address is not Valid');
        }else if(password.length<=6){
          showCustomSnackbar('Password should be more than 6 characters');
        }else {
          SignUpBody signUpBody = SignUpBody(name: name, phone: phone, email: email, password: password); 
          authController.registration(signUpBody).then(
            (status) {
              if(status.isSuccess){
                print('registration has completed successfully');
                Get.toNamed(RouteHelper.getSplashScreen());
              }else{
                showCustomSnackbar(status.message.toString());
              } 
            });
            
        } 
        
      }
    return GetBuilder<AuthController>(
      builder: (authController) {
        return (!authController.isLoading)? Scaffold(
          backgroundColor: AppColors.buttonBackgroundColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
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
                ) 
                , SizedBox(height: Dimension.pix10,),
                 AppTextField(controller: emailController,hintText: 'Email',
                 icon: Icon(Icons.email),),
                 SizedBox(height: Dimension.pix10,),
                 AppTextField(controller: passwordController,hintText: 'Password',
                 icon: Icon(Icons.password_outlined),obscureText: true,),
                 SizedBox(height: Dimension.pix10,)
                 ,
                 AppTextField(controller: nameController,hintText: 'Name',
                 icon: Icon(Icons.person),),
                 SizedBox(height: Dimension.pix10,),
                 AppTextField(controller: phoneController,hintText: 'Phone',
                 icon: Icon(Icons.phone),),
                 SizedBox(height: Dimension.pix20,),
                 GestureDetector(
                  onTap: (){
                     _registration(authController);
                    
                  },
                   child: Container(
                    height: Dimension.pix70,
                    width: Dimension.screenWidth/2,
                    child: Center(child: BigText(text : 'Sign up' ,size:Dimension.pix30 ,color: Colors.white,)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.pix30)
                      ,color: AppColors.mainColor,
                       
                    ),
                             
                   ),
                 ),
                   SizedBox(height: Dimension.pix10,),
                   RichText(
                    
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=> Get.toNamed(RouteHelper.getSignInPage()),
                      text: 'Have an account',
                      style: TextStyle(
                        color: Colors.grey.shade500
                      ),
                    )),
                   SizedBox(height: Dimension.pix20,),
                   BigText(text: 'Sign up using one of the following methods',size: Dimension.pix15,color:AppColors.signColor , ),
                   Wrap(
                    children:   
                      List.generate(SignUpImages.length, (index) => 
                        
                          Padding(
                            padding: EdgeInsets.all(Dimension.pix10),
                            child: CircleAvatar(
                              radius: Dimension.pix20,
                             backgroundImage: AssetImage("assets/image/"+SignUpImages[index]),
                            ),
                        
                     
                      ),
                     
                      )
                    
                   )
          
              ],
            ),
          ),
          
        ):CustomLoader();
      }
    );
  }
}