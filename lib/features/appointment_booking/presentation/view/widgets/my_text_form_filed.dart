import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';

class MyTextFormFiled extends StatelessWidget {
  const MyTextFormFiled({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.validator,
    required this.headerText,
    required this.maxLines,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final Function validator;
  final int? maxLines;
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
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              text: headerText,
              color: Colors.black,
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        TextFormField(
          maxLines: maxLines,
          textAlign: TextAlign.right,
          controller: controller,
          cursorColor: Colors.black,
          keyboardType: textInputType,
          validator: (value) => validator(value),
          style: GoogleFonts.tajawal(color: Colors.black),
          decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 4.h, vertical: 17.h),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(
                color: MyColors.pink,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: const BorderSide(
                width: 1.5,
                color: MyColors.borders, // Change border color here
              ),
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
