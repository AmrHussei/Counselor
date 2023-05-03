import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';

class PublishedPostWidget extends StatelessWidget {
  const PublishedPostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40.h,
          width: 213.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: MyColors.borders,
          ),
        ),
        SizedBox(
          width: 92.w,
          height: 24.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(
                  AssetsData.pen,
                  fit: BoxFit.fill,
                ),
              ),
              TextUtils(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                text: 'كتابة منشور',
                color: MyColors.primary,
              )
            ],
          ),
        )
      ],
    );
  }
}
