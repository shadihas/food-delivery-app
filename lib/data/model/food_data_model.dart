import 'dart:convert';

class Product {
   int? totalSize;
   int? typeId;
  int? offset;
   List<Product>? products;
  Product({
    required this.totalSize,
    required this.typeId,
   required this.offset,
     this.products,
  });

 

 
  

  factory Product.fromJson(Map<dynamic, dynamic> map) {
    return Product(
      totalSize: map['total_size']?.toInt(),
      typeId: map['type_id']?.toInt(),
      offset: map['offset']?.toInt(),
      products: map['products'] != null ? List<Product>.from(map['products']?.map((x) => Product.fromJson(x))) : null,
    );
  }

}
class Products {
int id;
String name;
String description;
int price;
int stars;
String img;
String location;
// String createdAt;
// String updatedAt;
// int typeId;
  Products({ 
    required this.id,
  required  this.name,
  required  this.description,
   required this.price,
   required this.stars,
  required  this.img,
   required this.location,
  //  required this.createdAt,
  // required  this.updatedAt,
  //  required this.typeId,
  });
   

 

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id']?.toInt(),
      name: json['name'],
      description: json['description'],
      price: json['price']?.toInt(),
      stars: json['stars']?.toInt(),
      img: json['img'],
      location: json['location'],
      // createdAt: json['createdAt'],
      // updatedAt: json['updatedAt'],
      // typeId: json['typeId'],
    );
  }

 


 }
