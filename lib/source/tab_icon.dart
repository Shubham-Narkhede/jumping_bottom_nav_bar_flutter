import 'package:flutter/material.dart';

 class TabIcon {
  final Color startColor;
  final Color endColor;
  final IconData iconData;
  final Color curveColor;


  TabIcon({
    this.curveColor =  Colors.white,
    this.startColor = Colors.black,
    this.endColor = Colors.white,
    @required this.iconData,
  });
}