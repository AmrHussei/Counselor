import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/constant.dart';

Widget pinCodeWidget({required BuildContext context, required String otpCode}) {
  return PinCodeTextField(
    appContext: context,
    length: 6,
    obscureText: false,
    autoFocus: true,
    cursorColor: Colors.black,
    keyboardType: TextInputType.number,
    textStyle: TextStyle(color: Colors.black, fontSize: 17.sp),
    animationType: AnimationType.scale,
    pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(6.sp),
        fieldHeight: 45.h,
        fieldWidth: 35.w,
        activeFillColor: MyColors.lightPrimary,
        activeColor: MyColors.primary,
        inactiveColor: MyColors.primary,
        inactiveFillColor: MyColors.authTextFormFiled,
        selectedColor: MyColors.primary,
        selectedFillColor: Colors.white),
    animationDuration: const Duration(milliseconds: 300),
    enableActiveFill: true,
    onCompleted: (code) {
      otpCode = code;
      print("Completed");
    },
    onChanged: (code) {
      print(code);
    },
  ).animate().fade(duration: 500.milliseconds).slide(curve: Curves.easeIn);
}
