import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/home/presentation/view/widgets/news_viewer_widgets.dart';

import '../../../../../core/widgets/text_utils.dart';
import '../../../../news _and_videos/presentation/view/screens/news_screen.dart';

class BuildNewsWidgets extends StatelessWidget {
  const BuildNewsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0.h, 23.w, 32.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NewsScreen(),
                    ),
                  );
                },
                child: TextUtils(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  text: 'الأخبار والتحديثات',
                ),
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(height: 288.h, child: const NewsViewerWidges())
        ],
      ),
    );
  }
}
