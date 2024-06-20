import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'resources.dart';

class StyleText {
  //Auth text style
  static TextStyle authTitle1 = TextStyle(
      fontFamily: Resources.font.primaryFont,
      fontWeight: FontWeight.w700,
      height: 0,
      color: Resources.color.titleColor,
      decoration: TextDecoration.none,
      fontSize: 23.sp);

  static TextStyle authTitle2 = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.subtitleColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle authSubtitle1 = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.subtitleColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle signInField = TextStyle(
      color: Resources.color.hintColor,
      fontSize: 10.sp,
      fontFamily: Resources.font.primaryFont,
      fontWeight: FontWeight.w500);

  static TextStyle authTextButton = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.primaryColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle authElevatedButton = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.whiteColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle signInSubtitle1 = TextStyle(
      decoration: TextDecoration.none,
      color: Resources.color.subtitleColor,
      fontSize: 12.sp,
      fontFamily: Resources.font.primaryFont,
      fontWeight: FontWeight.w400);

  static TextStyle signInSubtitle2 = TextStyle(
      decoration: TextDecoration.none,
      color: Resources.color.subtitleColor,
      fontSize: 12.sp,
      fontFamily: Resources.font.primaryFont,
      fontWeight: FontWeight.w700);

  static TextStyle appBarTitle = TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      fontFamily: Resources.font.primaryFont);
  static TextStyle noteTitle = TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      fontFamily: Resources.font.primaryFont);
}
