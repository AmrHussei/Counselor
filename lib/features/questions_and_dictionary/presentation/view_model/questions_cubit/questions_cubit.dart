import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../data/models/all_type_questions_model.dart';
import '../../../data/models/specific_questions_model.dart';
import '../../../data/repository/questions_repo.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());
  late List<AllQuestionModel> allQuestionList;
  late List<SpecificQuestioncModel> specificQuestionList;

  Future<void> getAllTypesOfQustions() async {
    try {
      emit(AllQuestionsLoading());
      allQuestionList = await QuestionsRepo.getAllTypesOfQustions();
      emit(AllQuestionsLoaded());
    } catch (error) {
      emit(AllQuestionsError());
      print('********************Error fromAllQuestionsError cubit ');
      print(error.toString());
    }
  }

  Future<void> getSpecificQustions({required String questionsId}) async {
    try {
      emit(SpecificQuestionsLoading());
      specificQuestionList =
          await QuestionsRepo.getSpecificQustions(questionsId: questionsId);
      emit(SpecificQuestionsLoaded());
    } catch (error) {
      emit(SpecificQuestionsError());
      print('********************Error SpecificQuestionsError from cubit ');
      print(error.toString());
    }
  }
}
