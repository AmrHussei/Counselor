import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_advice_app/features/questions_and_dictionary/presentation/view/widgets/questions_widgets/all_question/all_questions_loaded_widget.dart';
import 'package:legal_advice_app/features/questions_and_dictionary/presentation/view/widgets/questions_widgets/all_question/all_questions_loading_widget.dart';

import '../../../../view_model/questions_cubit/questions_cubit.dart';

class TypeOfQuestionsViewerWidget extends StatelessWidget {
  const TypeOfQuestionsViewerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
      if (state is AllQuestionsError) {
        return SizedBox(); //to do
      } else if (state is AllQuestionsLoading) {
        return const AllQuestionsLoadingWidget();
      } else {
        return const AllQuestionsLoadedWidget();
      }
    });
  }
}
