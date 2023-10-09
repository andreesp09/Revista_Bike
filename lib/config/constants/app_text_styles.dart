import 'package:flutter/material.dart';
import 'package:revistabike_app/config/00-configs.dart';

class KCustomTextStyle {
  static kBold(BuildContext context, double fontSize,
      [Color? color, bool needItalics = false, FontWeight? fontWeight]) {
    return TextStyle(
        fontFamily: KConstantFonts.poppinsBold,
        fontSize: fontSize,
        fontStyle: needItalics ? FontStyle.italic : FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Colors.white);
  }

  static kBoldItalic(BuildContext context, double fontSize,
      [Color? color, bool needItalics = false, FontWeight? fontWeight]) {
    return TextStyle(
        fontFamily: KConstantFonts.poppinsBoldItalic,
        fontSize: fontSize,
        fontStyle: needItalics ? FontStyle.italic : FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Colors.white);
  }

  static kRegular(BuildContext context, double fontSize,
      [Color? color,
      bool needItalics = false,
      FontWeight? fontWeight,
      bool needUnderline = false]) {
    return TextStyle(
        decoration: needUnderline ? TextDecoration.underline : null,
        fontFamily: KConstantFonts.poppinsRegular,
        fontSize: fontSize,
        fontStyle: needItalics ? FontStyle.italic : FontStyle.normal,
        color: Colors.white);
  }

  static kLight(BuildContext context, double fontSize,
      [Color? color, bool needItalics = false, FontWeight? fontWeight]) {
    return TextStyle(
        fontFamily: KConstantFonts.poppinsLight,
        fontSize: fontSize,
        fontStyle: needItalics ? FontStyle.italic : FontStyle.normal,
        color: color ?? Colors.white);
  }

  static kSemiBold(BuildContext context, double fontSize,
      [Color? color,
      bool needItalics = false,
      FontWeight? fontWeight,
      bool needUnderline = false]) {
    return TextStyle(
        decoration: needUnderline ? TextDecoration.underline : null,
        fontFamily: KConstantFonts.poppinsSemiBold,
        fontSize: fontSize,
        fontStyle: needItalics ? FontStyle.italic : FontStyle.normal,
        color: color ?? Colors.white);
  }

  static kMedium(BuildContext context, double fontSize,
      [Color? color, bool isItalic = false, FontWeight? fontWeight]) {
    return TextStyle(
        fontWeight: fontWeight,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        fontFamily: KConstantFonts.poppinsMedium,
        fontSize: fontSize,
        color: color ?? Colors.white);
  }
}
