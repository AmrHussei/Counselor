import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/home/presentation/view/widgets/buttons_that_nav_to_my_profile.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';

class DescriptionAboutMeWidget extends StatelessWidget {
  const DescriptionAboutMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextUtils(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                text: 'عني',
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 252.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(
                color: MyColors.borders,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(13.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextUtils(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        text: 'عمرو حسين',
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      CircleAvatar(
                        backgroundImage: const AssetImage(AssetsData.amr),
                        radius: 19.h,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 118.h,
                    child: Text(
                      'يعد المحامون في مصر مسؤولين عن تمثيل الموكلين في القضايا القانونية والدفاع عن حقوقهم في المحاكم. يجب على المحامين في مصر إتمام دراسة الحقوق وتلقي التدريب اللازم للحصول على شهادة المحاماة.',
                      style: GoogleFonts.almarai(
                        color: MyColors.descriptionText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        height: 1.9,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const ButtonsToNavToMyProfile()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
