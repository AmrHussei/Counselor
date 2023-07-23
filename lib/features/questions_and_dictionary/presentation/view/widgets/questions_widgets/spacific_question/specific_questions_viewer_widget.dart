import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_advice_app/features/questions_and_dictionary/presentation/view/widgets/questions_widgets/spacific_question/specific_questions_loaded_widget.dart';
import 'package:legal_advice_app/features/questions_and_dictionary/presentation/view/widgets/questions_widgets/spacific_question/specific_questions_loading_widget.dart';

import '../../../../../../../core/widgets/error_widget_for_screens.dart';
import '../../../../view_model/questions_cubit/questions_cubit.dart';

class SpecificQuestionsViewerWidget extends StatelessWidget {
  const SpecificQuestionsViewerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        if (state is SpecificQuestionsError) {
          return const ErrorWidgetForScreens();
        } else if (state is SpecificQuestionsLoading) {
          return const SpecificQuestionsLoadingWidget();
        } else {
          return const SpecificQuestionsLoadedWidget();
        }
      },
    );
  }
}
