import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/home/presentation/view/widgets/news_viewer_widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../../../news _and_videos/presentation/view/screens/single_videos_screen.dart';
import '../../../../news _and_videos/presentation/view_model/videos_cubit/videos_cubit.dart';

class VideoViewerWidges extends StatelessWidget {
  const VideoViewerWidges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosCubit, VideosState>(
      builder: (context, state) {
        if (state is AllVideosLoading) {
          return const LoadingNewsAndVideosWidgetForHome();
        } else if (state is AllVideosError) {
          return SizedBox();
        } else {
          return const LoadedVideosWidgetForHome();
        }
      },
    );
  }
}

class LoadedVideosWidgetForHome extends StatelessWidget {
  const LoadedVideosWidgetForHome({
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
          child: Row(
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
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.w, 0, 3.w, 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextUtils(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            text: BlocProvider.of<VideosCubit>(context)
                                .listOfAllVideos[index]
                                .title,
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          SizedBox(
                            child: Text(
                              BlocProvider.of<VideosCubit>(context)
                                  .listOfAllVideos[index]
                                  .desc,
                              style: GoogleFonts.almarai(
                                color: MyColors.descriptionText,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w300,
                                height: 1.2,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount:
          BlocProvider.of<VideosCubit>(context).listOfAllVideos.length > 10
              ? 10
              : BlocProvider.of<VideosCubit>(context).listOfAllVideos.length,
      scrollDirection: Axis.horizontal,
      reverse: true,
    );
  }
}
