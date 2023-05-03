import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/home/presentation/view/widgets/video_viewer_widgets.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../../../news _and_videos/presentation/view/screens/videos_screen.dart';

class BuildVideosWidgets extends StatelessWidget {
  const BuildVideosWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0.h, 23.w, 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const VideosScreen(),
                    ),
                  );
                },
                child: TextUtils(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  text: 'فيديوهات',
                ),
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(height: 288.h, child: const VideoViewerWidges())
        ],
      ),
    );
  }
}
