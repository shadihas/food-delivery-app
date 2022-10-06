import 'dart:convert'; 

class Product {
   int? totalSize;
   int? typeId;
  int? offset;
   List<ProductModel>? products;
  Product({
    required this.totalSize,
    required this.typeId,
   required this.offset,
     this.products,
  }); 
  factory Product.fromJson(Map<dynamic, dynamic> map) {
    List mapProduct = map['products'];
    return Product(
      totalSize: map['total_size']?.toInt(),
      typeId: map['type_id']?.toInt(),
      offset: map['offset']?.toInt(),
      products:  mapProduct != null ? mapProduct.map((x) => ProductModel.fromJson(x)).toList() : null,
    );
  } 
}
class ProductModel {
int id;
String name;
String description;
int price;
int stars;
String img;
String location;
String createdAt;
String updatedAt;
int typeId;
  ProductModel({ 
    required this.id,
  required  this.name,
  required  this.description,
   required this.price,
   required this.stars,
  required  this.img,
   required this.location,
   required this.createdAt,
  required  this.updatedAt,
   required this.typeId,
  }); 
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toInt(),
      name: json['name'],
      description: json['description'],
      price: json['price']?.toInt(),
      stars: json['stars']?.toInt(),
      img: json['img'],
      location: json['location'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      typeId: json['type_id'],
    );
  } 
  Map<String , dynamic> toJson(){
   return{
     'id':this.id,
    'name':this.name,
    'description':this.description,
    'price':this.price,
    'stars':this.stars,
    'img':this.img,
    'location':this.location,
    'created_at':this.createdAt,
    'updated_at':this.updatedAt,
    'type_id':this.typeId,
   };
  }
 }
