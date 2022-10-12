import 'dart:convert';

import 'package:food_delivery/data/http/data_food_http.dart';
import 'package:food_delivery/data/model/food_data_model.dart';
import 'package:food_delivery/data/repositories/base_food_data_repo.dart';
import 'package:http/http.dart' as http;

class FoodDataRepo{
  
  @override
  Future getFoodDetailsList() async{ 
    List service;
   
    http.Response response = await http.get(Uri.parse(AppUrl.Base_Url + AppUrl.Popular_Product_Url)); 
  
        List productDetailList = await json.decode(response.body)['products'];
      return service =  productDetailList.map((e) => Products.fromJson(e)).toList(); 
    }

  @override
  Future getFoodProductList()async {
  http.Response response =await http.get(Uri.parse(AppUrl.Base_Url + AppUrl.Popular_Product_Url));
  Map map = json.decode(response.body);
   return Product.fromJson(map);

   
  }

  }

// api : http://mvs.bslmeiyu.com/api/v1/products/popular