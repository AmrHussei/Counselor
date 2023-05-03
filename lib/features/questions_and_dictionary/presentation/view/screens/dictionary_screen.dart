import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/constant.dart';
import '../../view_model/dictionary_cubit/dictionary_cubit.dart';
import '../../view_model/questions_cubit/questions_cubit.dart';
import '../widgets/dictionary_widgets/dictionary_viewer_widget.dart';
import '../widgets/questions_widgets/spacific_question/specific_questions_viewer_widget.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen();

  @override
  State<DictionaryScreen> createState() => _QuestionsViewerScreenState();
}

class _QuestionsViewerScreenState extends State<DictionaryScreen> {
  @override
  void initState() {
    BlocProvider.of<DictionaryCubit>(context).getDictionaryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('القاموس القانوني'),
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
                'المصطلحات الشائعه في مجال القانون',
                style: GoogleFonts.almarai(
                    fontSize: 16.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                    color: MyColors.descriptionText),
                textAlign: TextAlign.end,
              ),
            ),
            const DictionaryViewerWidget(),
          ],
        ),
      ),
    );
  }
}
