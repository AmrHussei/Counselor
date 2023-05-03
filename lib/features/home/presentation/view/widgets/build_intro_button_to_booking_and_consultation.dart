import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';

class BuildIntroButtonToBookingAndConsultation extends StatelessWidget {
  const BuildIntroButtonToBookingAndConsultation({
    super.key,
    required this.image,
    required this.mainText,
    required this.subText,
    required this.onTap,
  });
  final String image;
  final String mainText;
  final String subText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120.h,
        width: 148.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(
            color: MyColors.borders,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w.w, vertical: 5.h),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
                width: 50.h,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              TextUtils(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                text: mainText,
              ),
              SizedBox(
                height: 9.h,
              ),
              TextUtils(
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
                text: subText,
                color: MyColors.descriptionText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
