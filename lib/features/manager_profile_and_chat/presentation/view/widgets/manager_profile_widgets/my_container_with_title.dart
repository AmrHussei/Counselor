import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';

class MyContainerWithTitle extends StatelessWidget {
  const MyContainerWithTitle({
    super.key,
    required this.title,
    required this.child,
    required this.hight,
  });

  final String title;
  final double hight;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextUtils(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              text: title,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: hight.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(
              color: MyColors.borders,
            ),
          ),
          child: child,
        )
      ],
    );
  }
}
