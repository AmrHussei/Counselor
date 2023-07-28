import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constant.dart';

class LoadingNewsAndVideosWidgetForHome extends StatelessWidget {
  const LoadingNewsAndVideosWidgetForHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(
              width: 16.w,
            ),
            Container(
              height: 261.h,
              width: 265.w,
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
                    height: 177.h,
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
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.w, 0, 3.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10.h,
                          width: 65.w,
                          child: Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: MyColors.lightPrimary2,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          height: 32.h,
                          width: 250.w,
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
          ],
        );
      },
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      reverse: true,
    );
  }
}
