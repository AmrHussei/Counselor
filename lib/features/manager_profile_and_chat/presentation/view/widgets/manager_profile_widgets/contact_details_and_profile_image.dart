import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/assets_data.dart';
import '../../../../../../core/widgets/text_utils.dart';

class ContactDetailsAndProfileImage extends StatelessWidget {
  const ContactDetailsAndProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 18.h,
          width: 78.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextUtils(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                text: 'رقم الهاتف',
              ),
              SizedBox(
                height: 18.h,
                width: 18.w,
                child: SvgPicture.asset(
                  AssetsData.call,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
        CircleAvatar(
          backgroundImage: const AssetImage(
            AssetsData.amr,
          ),
          maxRadius: 60.w,
          minRadius: 57.w,
        ),
        Row(
          children: [
            SizedBox(
              height: 18.h,
              width: 78.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    text: 'رقم الهاتف',
                  ),
                  SizedBox(
                    height: 18.h,
                    width: 18.w,
                    child: SvgPicture.asset(
                      AssetsData.emailIcon,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
