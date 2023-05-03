import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/utils/constant.dart';
import '../../../../view_model/questions_cubit/questions_cubit.dart';

class SpecificQuestionsLoadedWidget extends StatelessWidget {
  const SpecificQuestionsLoadedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          int animationDuration = index == 0
              ? 150
              : index == 1
                  ? 300
                  : index > 8
                      ? 700
                      : index * 100;
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),
              side: const BorderSide(width: 1.0, color: MyColors.borders),
            ),
            child: ExpansionTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  side: BorderSide(color: MyColors.pink)),
              title: Text(
                BlocProvider.of<QuestionsCubit>(context)
                    .specificQuestionList[index]
                    .question,
                style: GoogleFonts.almarai(
                    fontSize: 13.sp,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: MyColors.descriptionText),
                textAlign: TextAlign.center,
              ),
              children: [
                ListTile(
                  title: Text(
                    BlocProvider.of<QuestionsCubit>(context)
                        .specificQuestionList[index]
                        .answer,
                    style: GoogleFonts.almarai(
                        fontSize: 12.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                        color: MyColors.descriptionText),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ).animate().fade(duration: animationDuration.milliseconds).slideX();
        },
        itemCount: BlocProvider.of<QuestionsCubit>(context)
            .specificQuestionList
            .length,
      ),
    );
  }
}
