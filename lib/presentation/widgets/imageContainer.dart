import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  double? width;
   double? height;
   double borderRadius ;
   ImageProvider image ;
  ImageContainer({
    this.width,
    this.height,
    this.borderRadius = 0,  
    required this.image,

    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: width,
      height: height,
                               
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(borderRadius),
      image: DecorationImage(image: image,fit: BoxFit.fill),)
    );
  }
}