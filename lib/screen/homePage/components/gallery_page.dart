import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/constant/constant.dart';
import 'package:gallery_app/constant/sizes_helpers.dart';
import 'package:gallery_app/screen/detailPage/gallery_detail_page.dart';
import 'package:gallery_app/screen/homePage/model/ImageItem.dart';

import 'error.dart';
import 'loading.dart';

// ignore: must_be_immutable
class Gallery extends StatefulWidget {
  Gallery({Key key, @required this.pos}) : super(key: key);
  int pos = 1;

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<ImageItem>>(
        future: getImageData(widget.pos), // async work
        builder:
            (BuildContext context, AsyncSnapshot<List<ImageItem>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return ListLoading();
            default:
              if (snapshot.hasError)
                return ErrorMsg(snapshot.error.toString());
              else
                return GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(defaultSmallPadding),
                        width: displayWidth(context),
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data[index].url,
                          placeholder: (context, url) => Image(
                            image: AssetImage(
                                'assets/images/imageplaceholder.png'),
                          ),
                          errorWidget: (context, url, error) => Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/imageplaceholder.png'),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.error)),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GalleryDetail(
                                    images: snapshot.data,
                                    clickPos: index,
                                  )),
                        );
                      },
                    );
                  },
                );
          }
        },
      ),
    );
  }

  Future<List<ImageItem>> getImageData(int page) async {
    final List<ImageItem> compiled = [];
    for (int i = 0, iL = 100; i < iL; i += 1) {
      print(i);
      final url = 'https://picsum.photos/id/${page * 100 + i}/1000/800';
      final imageItem = ImageItem(
        url: url,
        width: 1000,
        height: 800,
      );
      compiled.add(imageItem);
    }
    return compiled;
  }
}
