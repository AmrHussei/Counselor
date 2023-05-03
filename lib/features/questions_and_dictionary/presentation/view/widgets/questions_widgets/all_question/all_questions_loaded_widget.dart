import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/utils/assets_data.dart';
import '../../../../../../../core/utils/constant.dart';
import '../../../../../../../core/widgets/text_utils.dart';
import '../../../../../../Community/presentation/view_model/community_cubit/community_cubit.dart';
import '../../../../view_model/questions_cubit/questions_cubit.dart';
import '../../../screens/questions_viewer.dart';

class AllQuestionsLoadedWidget extends StatelessWidget {
  const AllQuestionsLoadedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16.w,
            childAspectRatio: 1.3,
            crossAxisCount: 2,
            crossAxisSpacing: 16.h),
        itemBuilder: (context, index) {
          int animationDuration = index == 0
              ? 100
              : index == 1
                  ? 150
                  : index > 8
                      ? 700
                      : index * 100;
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QuestionsViewerScreen(
                    questionId: BlocProvider.of<QuestionsCubit>(context)
                        .allQuestionList[index]
                        .id,
                  ),
                ),
              );
            },
            child: Container(
              height: 120.h,
              width: 148.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(
                  color: MyColors.borders,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60.h,
                      width: 53.h,
                      child: Image(
                        image: NetworkImage(
                            BlocProvider.of<QuestionsCubit>(context)
                                .allQuestionList[index]
                                .image), //todo: add portrait image
                        fit: BoxFit.cover,
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
                      height: 9.h,
                    ),
                    TextUtils(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      text: BlocProvider.of<QuestionsCubit>(context)
                          .allQuestionList[index]
                          .title,
                    ),
                  ],
                ),
              ),
            ),
          ).animate().fade(duration: animationDuration.milliseconds).slideX();
        },
        itemCount:
            BlocProvider.of<QuestionsCubit>(context).allQuestionList.length,
      ),
    );
  }
}
