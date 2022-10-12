import 'dart:convert';

class CardModel {
  int? id;
  int? price;
  String? name;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;  

  CardModel({
    this.id,
    this.price,
    this.name,
    this.img,
    this.isExist,
    this.quantity,
    this.time,
  }); 
  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id']?.toInt(),
      price: map['price']?.toInt(),
      name: map['name'],
      img: map['img'],
      quantity: map['quantity']?.toInt(),
      isExist: map['isExist'],
      time: map['time'],
    );
  }

}