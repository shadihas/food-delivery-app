import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/model/food_data_model.dart';
import 'package:get/get.dart'; 

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({
    required this.recommendedProductRepo,
  });
   final List<ProductModel> recommendedProductList = [];
   List recommendedProductIdList = [];
   bool isLoaded = false;
  // List<dynamic> get RecommendedProductList => RecommendedProductList; 
  Future<void> getRecommendedProductList()async{ 
   Response response = await recommendedProductRepo.getRecommendedProductList();
   if(response.statusCode == 200){ 
     recommendedProductList.addAll(Product.fromJson(response.body).products!); 
     recommendedProductIdList = recommendedProductList.map((e) => e.id).toList();
     isLoaded =true; 
       update();
   }else{

   }

  }

  



}
