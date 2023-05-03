import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constant.dart';

class SubmitedButton extends StatelessWidget {
  const SubmitedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });
  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: MyColors.primary,
      minWidth: double.infinity,
      height: 48.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: child,
    );
  }
}
