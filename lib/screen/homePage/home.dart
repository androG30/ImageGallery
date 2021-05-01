import 'package:flutter/material.dart';
import 'package:gallery_app/bottomNavigation/bottom_nav.dart';
import 'package:gallery_app/constant/constant.dart';
import 'package:gallery_app/constant/sizes_helpers.dart';

import 'components/gallery_page.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  String title;
  int position=0;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: textColorLight,
          appBar: AppBar(
            title: Text(
              widget.title,
              style: TextStyle(
                color: whiteColor,
                fontSize: normalFontSize,
              ),
            ),
            backgroundColor: accentColor,
          ),
          body: Container(
            child: Gallery(pos: widget.position+1,),
          ),
          bottomNavigationBar: Container(
            height: displayHeight(context)*0.08,
            child: BottomNavigation(onNavChange:(int newPos) {
              updatePos(newPos);
            },
            ),
          ),
        )
    );
  }

  void updatePos(int pos) {
    setState(() {
      if(pos==0)
      {
        widget.title="Page A";
      }
      else if(pos==1)
      {
        widget.title="Page B";
      }
      else if(pos==2)
      {
        widget.title="Page C";
      }
      widget.position = pos;
    });
  }

}
