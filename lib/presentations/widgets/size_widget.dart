import 'package:flutter/material.dart';

class SizeCustomWidget {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width1percent(BuildContext context) {
    return width(context) * 0.01;
  }

  static double hiegth9percent(BuildContext context) {
    return screenHeigth(context) * 0.09; // 9%
  }

  static double width5(BuildContext context) {
    return width(context) * 0.05; // 5% of the screen width
  }

  static double hiegth5percent(BuildContext context) {
    return screenHeigth(context) * 0.05; // 5% of the screen height
  }

  static double radius1percent(BuildContext context) {
    return width(context) * 0.01; // 1% of the screen width
  }

  static double radius2percent(BuildContext context) {
    return width(context) * 0.02;
  }

  ///
  static double font15(BuildContext context) {
    return width(context) * 0.04; // 4% of screen width as base size
  }

  static double font20(BuildContext context) {
    return width(context) * 0.05; // 5% of screen width as base size
  }

  static double font25(BuildContext context) {
    return width(context) * 0.06; // 6% of screen width as base size
  }

  static double font30(BuildContext context) {
    return width(context) * 0.07; // 7% of screen width as base size
  }
}
