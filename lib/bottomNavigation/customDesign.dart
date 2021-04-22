import 'package:flutter/material.dart';

class CustomDesign extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.quadraticBezierTo(size.width*0.0015625,size.height*0.2425000,size.width*0.1237500,size.height*0.2300000);
    path_0.quadraticBezierTo(size.width*0.2175000,size.height*0.2300000,size.width*0.4987500,size.height*0.2300000);
    path_0.quadraticBezierTo(size.width*0.7818750,size.height*0.2250000,size.width*0.8762500,size.height*0.2233333);
    path_0.quadraticBezierTo(size.width*1.0021875,size.height*0.3608333,size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

