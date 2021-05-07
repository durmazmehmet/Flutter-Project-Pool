// Advanced SizeConfig class
// Mehmet DURMAZ @ 2019
//
// void init(BuildContext context) ->
//    This method should called under MaterialApp since
//    MediaQuery can only be accessed inside MaterialApp.
//
// SizeConfig({double w, double h})
//    SizeConfig({double w}).width
//    SizeConfig({double h}).height

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  double height;
  double width;

  SizeConfig({double w, double h}) {
    if (w != null) width = safeBlockHorizontal * w;
    if (h != null) height = safeBlockVertical * h;
  }

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}