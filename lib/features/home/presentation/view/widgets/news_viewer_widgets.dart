import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../../../news _and_videos/presentation/view/screens/single_news_screen.dart';
import '../../../../news _and_videos/presentation/view_model/news_cubit/news_cubit.dart';

class NewsViewerWidges extends StatelessWidget {
  const NewsViewerWidges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is AllNewsLoading) {
          return const LoadingNewsAndVideosWidgetForHome();
        } else if (state is AllNewsError) {
          return SizedBox();
        } else {
          return const LoadedNewsWidgetForHome();
        }
      },
    );
  }
}

class LoadedNewsWidgetForHome extends StatelessWidget {
  const LoadedNewsWidgetForHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SingleNewsScreen(
                    singlenews: BlocProvider.of<NewsCubit>(context)
                        .listOfAllNews[index]),
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
                      child: Image(
                        image: NetworkImage(
                          BlocProvider.of<NewsCubit>(context)
                              .listOfAllNews[index]
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
                            text: BlocProvider.of<NewsCubit>(context)
                                .listOfAllNews[index]
                                .title,
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Text(
                            BlocProvider.of<NewsCubit>(context)
                                .listOfAllNews[index]
                                .desc,
                            style: GoogleFonts.almarai(
                              color: MyColors.descriptionText,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w300,
                              height: 1.3,
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
            ],
          ),
        );
      },
      itemCount: BlocProvider.of<NewsCubit>(context).listOfAllNews.length > 10
          ? 10
          : BlocProvider.of<NewsCubit>(context).listOfAllNews.length,
      scrollDirection: Axis.horizontal,
      reverse: true,
    );
  }
}

class LoadingNewsAndVideosWidgetForHome extends StatelessWidget {
  const LoadingNewsAndVideosWidgetForHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Row(
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
                    child: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: MyColors.lightPrimary2,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.w, 0, 3.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10.h,
                          width: 65.w,
                          child: Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: MyColors.lightPrimary2,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          height: 32.h,
                          width: 250.w,
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
          ],
        );
      },
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      reverse: true,
    );
  }
}
