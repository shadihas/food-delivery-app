import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String message ,{bool isError =true,String title = 'Error' }){
  Get.snackbar(title, message,
  colorText: Colors.white,
  backgroundColor: Colors.red);
}