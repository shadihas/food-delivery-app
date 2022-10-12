import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/model/response_model.dart';
import 'package:food_delivery/model/user_info_model.dart';
import 'package:get/get_connect/http/src/response/response.dart'; 
import 'package:food_delivery/data/api/api_client.dart'; 
class UserRepo {
  final ApiClient apiClient;
  //  final SharedPreferences;
  UserRepo({
    required this.apiClient,
    // required this.SharedPreferences,
  }); 
  Future<Response> getUserInfo()async{
   Response response = await apiClient.getData(AppConstants.USER_INFO); 
   return response;
  }
}
