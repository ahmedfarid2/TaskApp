import 'package:flutter/material.dart';

class CSTConstValues {
  final List<int> successStatusCodes = [200, 201];
  bool isNetworkDisconnected = false;

  static const int wideScreenBreakpoint = 600;
  bool isWideScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > wideScreenBreakpoint;
  }

  TextStyle getResponsiveTextStyle(BuildContext context, {required double fontSize, FontWeight fontWeight = FontWeight.normal, Color? color}) {
    return TextStyle(
      fontSize: MediaQuery.of(context).textScaler.scale(fontSize),
      fontWeight: fontWeight,
      color: color,
    );
  }
}
