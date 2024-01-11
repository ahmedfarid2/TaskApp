import 'package:flutter/material.dart';
import 'package:taskapp/core/constants/constants.dart';

extension TextStyleExtension on TextTheme {
  /// [Titles]
  TextStyle titleBold_20(BuildContext context) {
    return Constants.constValues.getResponsiveTextStyle(
      context,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle titleSemiBold_18(BuildContext context) {
    return Constants.constValues.getResponsiveTextStyle(
      context,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle titleSemiBold_16(BuildContext context) {
    return Constants.constValues.getResponsiveTextStyle(
      context,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle titleSemiBold_14(BuildContext context) {
    return Constants.constValues.getResponsiveTextStyle(
      context,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}
