import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_advice_app/features/news%20_and_videos/presentation/view/widgets/all_news_and_videos_loading_widget.dart';
import 'package:legal_advice_app/features/news%20_and_videos/presentation/view/widgets/all_videos_loaded_widget.dart';
import 'package:legal_advice_app/features/news%20_and_videos/presentation/view_model/videos_cubit/videos_cubit.dart';
import '../../../../../core/widgets/error_widget_for_screens.dart';

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
