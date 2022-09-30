import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
   String token = AppConstants.TOKEN;
  final String AppBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.AppBaseUrl}){
     baseUrl = AppBaseUrl;
      
    timeout =const Duration(hours: 1);
    _mainHeaders ={
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token '
    }; 
  }
  Future<Response> getData(String url)async{
      try {
        Response response = await get(url);
        return response;
        
      } catch (error) {
        return Response(statusCode: 1,statusText: error.toString());
      }
    } 
}