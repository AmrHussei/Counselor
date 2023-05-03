import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/core/utils/constant.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: MyColors.primary,
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    //app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: MyColors.primary,
      elevation: 1.h,
      shadowColor: Colors.white,
      titleTextStyle: GoogleFonts.tajawal(
          fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500),
    ),
    //elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.tajawal(color: Colors.white, fontSize: 15.sp),
        backgroundColor: MyColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
      ),
    ),
  );
}
