import 'dart:convert';

import 'package:food_delivery/model/food_data_model.dart';

class CartModel {
  int? id;
  int? price;
  String? name;
  String? img;
  int? quantity;
  bool? isExist;
  String? time; 
  ProductModel? product;
  
  CartModel({
    this.id,
    this.price,   
    this.name,
    this.img,
    this.isExist,
    this.quantity,
    this.time,
    this.product
  }); 
  factory CartModel.fromMap(Map<String, dynamic> map) {
  return  CartModel(
      id: map['id']?.toInt(),
      price: map['price']?.toInt(),
      name: map['name'],
      img: map['img'],
      quantity: map['quantity']?.toInt(),
      isExist: map['isExist'],
      time: map['time'], 
      product: ProductModel.fromJson(map)
    );
  } 
    Map<String , dynamic> toJson(){
  return{
  'id':  this.id,
  'price': this.price,
  'name': this.name,
  'img': this.img,
  'isExist': this.isExist,
  'quantity':  this.quantity,
    'time':  this.time,
    'product':this.product?.toJson(),
  };
    }

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source));
}
