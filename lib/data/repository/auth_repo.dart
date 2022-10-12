import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/model/signup_body_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient , required this.sharedPreferences})  ;

  Future<Response> registration(signUpBody)async{
     return await apiClient.postData(AppConstants.REGISTRATION_URI,signUpBody ) ;
  }
  Future<Response> login(String email , String password , String phone)async{
     return await apiClient.postData(AppConstants.LOGIN_URI,{"email":email,"password":password , "phone":phone}) ; 
  }
  saveUserToken(token)async{
   apiClient.token = token;
   apiClient.updateHeader(token);
  return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
  bool userLoggedIn(){
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }
  bool clearSharedData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token ='';
    apiClient.updateHeader('');
    return true;
  }
}