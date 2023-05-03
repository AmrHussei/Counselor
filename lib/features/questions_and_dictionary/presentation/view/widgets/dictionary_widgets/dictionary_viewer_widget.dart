import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_advice_app/features/questions_and_dictionary/presentation/view/widgets/dictionary_widgets/dictionary_loaded_widget.dart';
import 'package:legal_advice_app/features/questions_and_dictionary/presentation/view/widgets/dictionary_widgets/dictionary_loading_widget.dart';

import '../../../view_model/dictionary_cubit/dictionary_cubit.dart';

class DictionaryViewerWidget extends StatelessWidget {
  const DictionaryViewerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionaryCubit, DictionaryState>(
      builder: (context, state) {
        if (state is DictionaryError) {
          return const SizedBox();
        } else if (state is DictionaryLoading) {
          return const DictionaryLoadingWidget();
        } else {
          return const DictionaryLoadedWidget();
        }
      },
    );
  }
}
