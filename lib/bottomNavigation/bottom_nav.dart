import 'package:flutter/material.dart';
import 'package:gallery_app/constant/constant.dart';
import 'customDesign.dart';

typedef void IntCallback(int val);

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  IntCallback onNavChange;
  BottomNavigation({@required this.onNavChange});
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int currentIndex = 0;

  setBottomBarIndex(index) {
    widget.onNavChange(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: textColorLight,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 55,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: CustomDesign(),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Container(
                            padding:EdgeInsets.all(defaultPadding),
                            child: Text(
                              'A',
                              style: TextStyle(
                                color: currentIndex == 0 ? accentColor : blackColor,
                                fontSize: smallFontSize,
                              ),
                            ),
                          ),
                          onTap: (){
                            setBottomBarIndex(0);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            padding:EdgeInsets.all(defaultPadding),
                            child: Text(
                              'B',
                              style: TextStyle(
                                color: currentIndex == 1 ? accentColor : blackColor,
                                fontSize: smallFontSize,
                              ),
                            ),
                          ),
                          onTap: (){
                            setBottomBarIndex(1);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            padding:EdgeInsets.all(defaultPadding),

                            child: Text(
                              'C',
                              style: TextStyle(
                                color: currentIndex == 2 ? accentColor : blackColor,
                                fontSize: smallFontSize,
                              ),
                            ),
                          ),
                          onTap: (){
                            setBottomBarIndex(2);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
