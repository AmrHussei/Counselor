import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../data/models/dictionary_model.dart';
import '../../../data/repository/dictionary_repo.dart';
part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  DictionaryCubit() : super(DictionaryInitial());
  late List<DictionaryModel> dictionaryList;
  Future<void> getDictionaryData() async {
    try {
      emit(DictionaryLoading());
      dictionaryList = await DictionaryRepo.getDictionaryData();
      emit(DictionaryLoaded());
    } catch (error) {
      emit(DictionaryError());
      print('********************Error SpecificQuestionsError from cubit ');
      print(error.toString());
    }
  }
}
