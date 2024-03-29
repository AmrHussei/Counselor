import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/news%20_and_videos/presentation/view/widgets/all_news_and_videos_loading_widget.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/error_widget_for_screens.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/news_cubit/news_cubit.dart';
import '../screens/single_news_screen.dart';

class BodyOfNewsScreen extends StatefulWidget {
  const BodyOfNewsScreen({
    super.key,
  });

  @override
  State<BodyOfNewsScreen> createState() => _BodyOfNewsScreenState();
}

class _BodyOfNewsScreenState extends State<BodyOfNewsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is AllNewsLoading) {
          return const AllNewsAndVideosLoadingWidget();
        } else if (state is AllNewsError) {
          return const ErrorWidgetForScreens();
        } else {
          return const AllNewsLoadedWidget();
        }
      },
    );
  }
}

class AllNewsLoadedWidget extends StatelessWidget {
  const AllNewsLoadedWidget({
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
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
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
                          text: BlocProvider.of<NewsCubit>(context)
                              .listOfAllNews[index]
                              .title,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          BlocProvider.of<NewsCubit>(context)
                              .listOfAllNews[index]
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
      itemCount: BlocProvider.of<NewsCubit>(context).listOfAllNews.length,
    );
  }
}
