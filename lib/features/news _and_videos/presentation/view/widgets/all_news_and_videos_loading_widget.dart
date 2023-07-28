import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/constant.dart';

class AllNewsAndVideosLoadingWidget extends StatelessWidget {
  const AllNewsAndVideosLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
          child: Container(
            height: 330.h,
            width: 312.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(
                color: MyColors.borders,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 209.h,
                  width: double.infinity,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: MyColors.lightPrimary2,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.w, 0, 3.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10.h,
                        width: 75.w,
                        child: Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: MyColors.lightPrimary2,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 65.h,
                        width: 310.w,
                        child: Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: MyColors.lightPrimary2,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
