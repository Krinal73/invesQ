import 'package:flutter/material.dart';

class ColorUtils {
  static final primaryColor = HexColor('#1C629E');
  static final whiteColor = Colors.white;
  static final errorColor = HexColor('#E40000');
  static final greyColor = Colors.grey;
  static final blackColor = Colors.black;
  static final greyProfileTextColor = HexColor('#787878');

  static final snackBarInfoColor = HexColor('#0F61AC');
  static final snackBarErrorColor = HexColor('#BF2600');
  static final snackBarSuccessColor = HexColor('#027243');
  static final snackBarWarningColor = HexColor('#FF8B00');

  static final scaffoldBackgroundColor = HexColor('#F2F2F2');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
