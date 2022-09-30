import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  const Test({ Key? key }) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          image:DecorationImage(image: NetworkImage('http://mvs.bslmeiyu.com/uploads/images/ea9367e8a16f1d3e41d4a3ae9af2baff.png',),
         ) ),
      
      ),
    );
  }
}
//
//'https://th.bing.com/th/id/R.6ec88e2869458d5d9a6bccfe233d4fa5?rik=K05NKY0eMIYZsw&pid=ImgRaw&r=0'