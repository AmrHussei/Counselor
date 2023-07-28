import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/news%20_and_videos/data/models/videos_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';

class SingleVideosScreen extends StatelessWidget {
  const SingleVideosScreen(
      {super.key, required this.video, required this.videoId});

  final VideosModel video;
  final String videoId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الفديو'),
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 19.sp,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 209.h,
                width: double.infinity,
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: videoId,
                      flags: const YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                        loop: false,
                        showLiveFullscreenButton: false,
                      ),
                    ),
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: ProgressBarColors(
                          playedColor: MyColors.primary,
                          handleColor: MyColors.borders,
                        ),
                      ),
                      const PlaybackSpeedButton(),
                    ],
                  ),
                  builder: (context, player) {
                    return Column(
                      children: [
                        player,
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.w, 0, 3.w, 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextUtils(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      text: video.title,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      video.desc,
                      style: GoogleFonts.almarai(
                        color: MyColors.descriptionText,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
