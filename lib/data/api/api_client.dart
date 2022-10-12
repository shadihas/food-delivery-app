import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/model/signup_body_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService{
   String token = AppConstants.TOKEN;
  final String AppBaseUrl;
  late SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.AppBaseUrl , required this.sharedPreferences}){
     baseUrl = AppBaseUrl; 
    timeout =const Duration(hours: 1 );
    token = sharedPreferences.getString(AppConstants.TOKEN)??"";
    _mainHeaders ={
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    }; 
  }
  updateHeader(token){
     _mainHeaders ={
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    }; 
  }
Future<Response> getData(String url ,{ Map<String, String>? headers})async{
      try {
        Response response = await get(url,headers: headers??_mainHeaders);
        print(response.statusCode);
        return response; 
      } catch (error) {
        return Response(statusCode: 1,statusText: error.toString());
      }
    } 
    Future<Response> postData(String uri , dynamic body)async{
         try{ Response response =await post(uri, body, headers:_mainHeaders );
         print('=======${response.body}=====');
         return response; 
          }catch(error){
            return Response(statusCode: 1,statusText: error.toString()); 
          } 
           }
}