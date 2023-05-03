import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/utils/constant.dart';

class AllQuestionsLoadingWidget extends StatelessWidget {
  const AllQuestionsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16.w,
            childAspectRatio: 1.3,
            crossAxisCount: 2,
            crossAxisSpacing: 16.h),
        itemBuilder: (context, index) {
          return Container(
            height: 120.h,
            width: 148.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(
                color: MyColors.borders,
              ),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: MyColors.lightPrimary2,
              child: Container(
                color: Colors.white,
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
