import 'dart:math';

import 'package:book_shop/theme/colors.dart';
import 'package:flutter/material.dart';

import 'avatar_image.dart';

class LibCover extends StatelessWidget {
  LibCover({Key? key, required this.book}) : super(key: key);
  final book;

  @override
  Widget build(BuildContext context) {
    double _width = 75, _height = 90;
    return Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Stack(children: [
              Container(
                  padding: EdgeInsets.only(bottom: 50, right: 40),
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    width: _width / 2,
                    height: _height / 2,
                    decoration: BoxDecoration(
                        color:
                            Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(15))),
                  )),
              Container(
                width: _width,
                height: _height,
                padding: EdgeInsets.all(8),
                child: AvatarImage(
                  book["image"],
                  isSVG: false,
                  radius: 8,
                ),
              )
            ]),
            SizedBox(
              height: 15,
            ),
            Text(book["title"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 6,
            ),
          ],
        ));
  }
}
