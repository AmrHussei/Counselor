import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/questions_cubit/questions_cubit.dart';
import '../widgets/questions_widgets/all_question/type_of_questions_viewer_widget.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  void initState() {
    BlocProvider.of<QuestionsCubit>(context).getAllTypesOfQustions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 33.h, 20.w, 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextUtils(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            text: 'اكتر الاسئلة الشائعة في القانون',
          ),
          SizedBox(
            height: 24.h,
          ),
          const TypeOfQuestionsViewerWidget()
        ],
      ),
    );
  }
}
