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
  List<String>tabs=['A','B','C'];

  setBottomBarIndex(index) {
    widget.onNavChange(index);
    setState(() {
      currentIndex = index;
    });
  }

  Widget getTabsWidgets()
  {
    List<Widget> list = [];
    for(var i = 0; i < tabs.length; i++){
      list.add( Container(
        padding:EdgeInsets.all(defaultPadding),
        child: TextButton(
            child: Text(
              tabs[i],
              style: TextStyle(
                color: currentIndex == 0 ? accentColor : blackColor,
                fontSize: smallFontSize,
              ),
            ),
            onPressed: () {
              setBottomBarIndex(i);
            }
        ),
      ));
    }
    return Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: list);
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
                    child: getTabsWidgets(),
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
