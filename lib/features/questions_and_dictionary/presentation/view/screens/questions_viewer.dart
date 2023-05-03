import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/constant.dart';
import '../../view_model/questions_cubit/questions_cubit.dart';
import '../widgets/questions_widgets/spacific_question/specific_questions_viewer_widget.dart';

class QuestionsViewerScreen extends StatefulWidget {
  const QuestionsViewerScreen({super.key, required this.questionId});
  final String questionId;

  @override
  State<QuestionsViewerScreen> createState() => _QuestionsViewerScreenState();
}

class _QuestionsViewerScreenState extends State<QuestionsViewerScreen> {
  @override
  void initState() {
    BlocProvider.of<QuestionsCubit>(context)
        .getSpecificQustions(questionsId: widget.questionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اسئلة القانون الجنائي'),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(13.w, 34.h, 17.w, 24.h),
              child: Text(
                'طبقًا للقانون الجنائي المصري، اليك \n الأسئلة الشائعة وإجابتها',
                style: GoogleFonts.almarai(
                    fontSize: 16.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                    color: MyColors.descriptionText),
                textAlign: TextAlign.end,
              ),
            ),
            const SpecificQuestionsViewerWidget(),
          ],
        ),
      ),
    );
  }
}
