import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/community_cubit/community_cubit.dart';
import '../widgets/published_post_widget.dart';

class CommunityMainScreen extends StatefulWidget {
  const CommunityMainScreen({super.key});

  @override
  State<CommunityMainScreen> createState() => _CommunityMainScreenState();
}

class _CommunityMainScreenState extends State<CommunityMainScreen> {
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    BlocProvider.of<CommunityCubit>(context).getAllPosts();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommunityCubit, CommunityState>(
      listener: (context, state) {
        if (state is AllPostsLoaded) {
          if (_refreshController.isRefresh) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.isLoading) {
            _refreshController.refreshCompleted();
          }
        }
        if (state is AllPostsLoading) {
          if (_refreshController.isRefresh) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.isLoading) {
            _refreshController.refreshCompleted();
          }
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SmartRefresher(
                  controller: _refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                    BlocProvider.of<CommunityCubit>(context).getAllPosts();
                    await Future.delayed(const Duration(milliseconds: 1000));
                    _refreshController.loadComplete();
                  },
                  header: WaterDropHeader(waterDropColor: MyColors.primary),
                  enablePullDown: true,
                  onLoading: () async {
                    BlocProvider.of<CommunityCubit>(context).loadMorePosts();
                    await Future.delayed(const Duration(milliseconds: 1000));
                    _refreshController.loadComplete();
                  },
                  child: CustomScrollView(
                    slivers: [
                      AllPostsViewer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllPostsViewer extends StatelessWidget {
  const AllPostsViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityState>(
      builder: (context, state) {
        if (state is AllPostsLoading) {
          return const LoadingpostsWidget();
        } else if (state is AllPostsError) {
          return SizedBox();
        } else {
          return const LoadedpostsWidget();
        }
      },
    );
  }
}

class LoadedpostsWidget extends StatelessWidget {
  const LoadedpostsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          int animationDuration = index == 0
              ? 400
              : index == 1
                  ? 500
                  : index > 5
                      ? 700
                      : index * 200;
          return Padding(
            padding: EdgeInsets.only(bottom: 13.h),
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
                    child: Image(
                      image: NetworkImage(
                        BlocProvider.of<CommunityCubit>(context)
                            .allPostsList[index]
                            .image,
                      ), //todo: add portrait image
                      fit: BoxFit.fill,
                      errorBuilder: (_, __, ___) {
                        return Center(
                          child: Icon(
                            Icons.broken_image_sharp,
                            color: Colors.blueGrey,
                            size: 60.sp,
                          ),
                        );
                      },
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
                        ),
                        SizedBox(
                          child: Text(
                            BlocProvider.of<CommunityCubit>(context)
                                .allPostsList[index]
                                .text,
                            maxLines: 4,
                            style: GoogleFonts.almarai(
                              color: MyColors.descriptionText,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.6,
                            ),
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InteractionWidgets(
                              onPressed: () {},
                              icon: AssetsData.commint,
                            ),
                            InteractionWidgets(
                              onPressed: () {},
                              icon: AssetsData.like,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fade(duration: animationDuration.milliseconds).slideX();
        },
        itemCount: BlocProvider.of<CommunityCubit>(context).allPostsList.length,
      ),
    );
  }
}

class LoadingpostsWidget extends StatelessWidget {
  const LoadingpostsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 13.h),
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
                        ),
                        SizedBox(
                          height: 42.h,
                          width: 230.w,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InteractionWidgets(
                              onPressed: () {},
                              icon: AssetsData.commint,
                            ),
                            InteractionWidgets(
                              onPressed: () {},
                              icon: AssetsData.like,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class InteractionWidgets extends StatelessWidget {
  const InteractionWidgets({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final Function() onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 40.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextUtils(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              text: '1',
            ),
            IconButton(
              onPressed: onPressed,
              icon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: Image.asset(
                  icon,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
