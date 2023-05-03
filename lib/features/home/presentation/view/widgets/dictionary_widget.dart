import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../questions_and_dictionary/presentation/view/screens/dictionary_screen.dart';

class DictionaryWidget extends StatelessWidget {
  const DictionaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DictionaryScreen(),
          ),
        );
      },
      child: Container(
        height: 119.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          gradient: const LinearGradient(
            colors: [MyColors.gradient1, MyColors.gradient2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 14.h),
              child: SizedBox(
                height: 90.h,
                width: 80.w,
                child: SvgPicture.asset(
                  AssetsData.dictionarylogo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25.h, 10.w, 25.h),
              child: Text(
                'افهم المصطلحات القانونية\n واستخدامها بشكل صحيح',
                style: GoogleFonts.almarai(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  height: 1.9,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
