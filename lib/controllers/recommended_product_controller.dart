import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/model/food_data_model.dart';
import 'package:get/get.dart'; 

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({
    required this.recommendedProductRepo,
  });
    List<ProductModel> recommendedProductList = []; 
   bool isLoaded = false; 
  Future<void> getRecommendedProductList()async{ 
     recommendedProductList = [];
   List recommendedProductIdList = [];
   Response response = await recommendedProductRepo.getRecommendedProductList();
   if(response.statusCode == 200){ 
     recommendedProductList.addAll(Product.fromJson(response.body).products!); 
     isLoaded =true; 
       update();
   }else{

   }

  }

  



}
