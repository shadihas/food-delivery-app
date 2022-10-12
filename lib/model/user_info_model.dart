import 'dart:convert';

class UserModel {
int id;
String name;
String email;
String phone;
int orderCount;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.orderCount,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'f_name': name,
      'email': email,
      'phone': phone,
      'order_count': orderCount,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      name: map['f_name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      orderCount: map['orderCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
