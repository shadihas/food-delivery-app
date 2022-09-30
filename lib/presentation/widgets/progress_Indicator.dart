import 'package:flutter/material.dart';
import 'package:food_delivery/core/dimension.dart';
import 'package:progress_indicators/progress_indicators.dart';


class ProgressIndicatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Container(
           height: Dimension.screenHeight/3,width: Dimension.screenWidth,
          // width: Dimension.screenWidth/2,
          // height: Dimension.screenHeight/4,
         decoration: BoxDecoration(  gradient:LinearGradient(
   colors: [
   
   Color(0xFFccc7c5),
     Color(0xFFccc7c5),
     Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.mirror,
),),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text('Loading'),
               SizedBox(width: Dimension.pix10,),
              JumpingDotsProgressIndicator(
                fontSize: Dimension.pix30,
              ),
              // SizedBox(height: 60.0),
              // new Text('Heartbeat'),
              // SizedBox(height: 16.0),
              // HeartbeatProgressIndicator(
              //   child: Icon(Icons.home),
              // ),
              // SizedBox(height: 60.0),
              // new Text('Glowing'),
              // GlowingProgressIndicator(
              //   child: Icon(Icons.home),
              // ),
              // SizedBox(height: 32.0),
              // FadingText('Loading...'),
              // SizedBox(height: 32.0),
              // JumpingText('Loading...'),
              // SizedBox(height: 32.0),
              // ScalingText('Loading...'),
              // SizedBox(height: 32.0),
              // CollectionSlideTransition(
              //   children: <Widget>[
              //     Icon(Icons.android),
              //     Icon(Icons.apps),
              //     Icon(Icons.announcement),
              //   ],
              // ),
            //   SizedBox(height: 32.0),
            //   CollectionScaleTransition(
            //     children: <Widget>[
            //       Icon(Icons.android),
            //       Icon(Icons.apps),
            //       Icon(Icons.announcement),
            // ],
            //   ),
            ],
          ),
        ),
      ),
    );
  }
}