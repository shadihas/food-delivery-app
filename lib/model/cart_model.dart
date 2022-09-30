import 'dart:convert';

class CartModel {
  int? id;
  int? price;
  String? name;
  String? img;
  int? quantity;
  bool? isExist;
  String? time; 
  
  CartModel({
    this.id,
    this.price,   
    this.name,
    this.img,
    this.isExist,
    this.quantity,
    this.time,
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
    
  };
    }

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source));
}
