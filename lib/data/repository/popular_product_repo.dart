import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:get/get.dart';

import 'package:food_delivery/data/api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({
    required this.apiClient,
  });
  Future<Response> getPopularProductList() async {
   return await apiClient.getData( AppConstants.POPULAR_PRODUCT_URL);
  }
  
}
// note ) How the UI talks with the server :
//  ApiClient receives the data from the server 
//=> repository receives the data from ApiClient
//=> the controller receives the data from repository
// => the controller is refreshed by the init method in the dependency 
//=> the init method is called in the amin file as an instance of the dependency library 
//=> the UI receives the data from the controller to get refreshed .
 