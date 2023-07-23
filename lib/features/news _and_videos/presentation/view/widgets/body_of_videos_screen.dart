import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/news%20_and_videos/presentation/view/widgets/body_of_news_screen.dart';
import 'package:legal_advice_app/features/news%20_and_videos/presentation/view_model/videos_cubit/videos_cubit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/error_widget_for_screens.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../screens/single_videos_screen.dart';

class BodyOfVideosScreen extends StatefulWidget {
  const BodyOfVideosScreen({
    super.key,
  });

  @override
  State<BodyOfVideosScreen> createState() => _BodyOfVideosScreenState();
}

class _BodyOfVideosScreenState extends State<BodyOfVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosCubit, VideosState>(
      builder: (context, state) {
        if (state is AllVideosLoading) {
          return const AllNewsAndVideosLoadingWidget();
        } else if (state is AllVideosError) {
          return const ErrorWidgetForScreens();
        } else {
          return const AllVideosLoadedWidget();
        }
      },
    );
  }
}

class AllVideosLoadedWidget extends StatelessWidget {
  const AllVideosLoadedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        String videoId = YoutubePlayer.convertUrlToId(
                BlocProvider.of<VideosCubit>(context)
                    .listOfAllVideos[index]
                    .link) ??
            '';
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SingleVideosScreen(
                  video: BlocProvider.of<VideosCubit>(context)
                      .listOfAllVideos[index],
                  videoId: videoId,
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0.h),
            child: Container(
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
                          text: BlocProvider.of<VideosCubit>(context)
                              .listOfAllVideos[index]
                              .title,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          BlocProvider.of<VideosCubit>(context)
                              .listOfAllVideos[index]
                              .desc,
                          style: GoogleFonts.almarai(
                            color: MyColors.descriptionText,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.6,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: BlocProvider.of<VideosCubit>(context).listOfAllVideos.length,
    );
  }
}

class AllVideosLoadingWidget extends StatelessWidget {
  const AllVideosLoadingWidget({
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
