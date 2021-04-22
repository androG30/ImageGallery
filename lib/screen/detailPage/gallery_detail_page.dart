import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/constant/constant.dart';
import 'package:gallery_app/constant/sizes_helpers.dart';
import 'package:gallery_app/screen/homePage/model/ImageItem.dart';

// ignore: must_be_immutable
class GalleryDetail extends StatefulWidget {
  GalleryDetail({Key key, @required this.images, @required this.clickPos})
      : super(key: key);

  List<ImageItem> images = [];
  int clickPos = 0;

  @override
  _GalleryDetailState createState() => _GalleryDetailState();
}

class _GalleryDetailState extends State<GalleryDetail> {
  void update(String task) {
    int pos = widget.clickPos;
    if (task == 'Add') {
      if (widget.images.length != widget.clickPos) {
        pos = widget.clickPos + 1;
      }
    } else {
      if (widget.clickPos != 0) {
        pos = widget.clickPos-1;
      }
    }
    setState(() {
      widget.clickPos = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image ${widget.clickPos}',
          style: TextStyle(
            color: whiteColor,
            fontSize: normalFontSize,
          ),
        ),
        backgroundColor: accentColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Middle View
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: displayWidth(context),
                  height: displayHeight(context) * 0.50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.images[widget.clickPos].url),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.chevron_left),
                  iconSize: 20.0,
                  tooltip: 'Previous image',
                  onPressed: () {
                    update('Minus');
                  },
                  color: accentColor,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.chevron_right),
                  iconSize: 20.0,
                  tooltip: 'Next image',
                  onPressed: () {
                    update('Add');
                  },
                  color: accentColor,
                ),
              )
            ],
          ),

          //Bottom View
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  update('Minus');
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        accentColor,
                        accentColor,
                      ])),
                  child: Center(
                    child: Text(
                      "Previous",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: smallFontSize,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  update('Add');
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        accentColor,
                        accentColor,
                      ])),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: smallFontSize,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
