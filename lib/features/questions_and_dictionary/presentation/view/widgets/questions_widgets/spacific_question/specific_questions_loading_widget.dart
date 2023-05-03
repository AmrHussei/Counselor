import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/utils/constant.dart';

class SpecificQuestionsLoadingWidget extends StatelessWidget {
  const SpecificQuestionsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 16.h),
              child: Container(
                height: 60.h,
                width: double.infinity,
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
              ),
            );
          },
          itemCount: 15),
    );
  }
}
