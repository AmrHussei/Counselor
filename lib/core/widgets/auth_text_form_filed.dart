import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/core/widgets/text_utils.dart';

import '../utils/constant.dart';

class AuthTextFormFiled extends StatelessWidget {
  const AuthTextFormFiled({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.textInputType,
    required this.validator,
    required this.prefixIcon,
    required this.hintText,
    required this.suffixIcon,
    required this.headerText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textInputType;
  final Function validator;
  final Widget prefixIcon;
  final String suffixIcon; //becuse this icon will be image
  final String hintText;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextUtils(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              text: headerText,
              color: MyColors.primary,
            )
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          textAlign: TextAlign.right,
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.black,
          keyboardType: textInputType,
          validator: (value) => validator(value),
          style: GoogleFonts.tajawal(color: Colors.black),
          decoration: InputDecoration(
            fillColor: MyColors.authTextFormFiled,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 4.h, vertical: 17.h),
            filled: true,
            prefixIcon: prefixIcon,
            suffixIconConstraints: BoxConstraints(
                maxWidth: 36.w,
                maxHeight: 36.w,
                minHeight: 24.w,
                minWidth: 24.w),
            suffixIcon: Padding(
              padding: EdgeInsets.fromLTRB(0.w, 0, 12.w, 0),
              child: SizedBox(
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset(
                  suffixIcon,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.almarai(
              color: MyColors.descriptionText,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(color: MyColors.pink),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(color: MyColors.primary),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(color: MyColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
