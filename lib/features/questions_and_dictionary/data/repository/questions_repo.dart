import 'package:dio/dio.dart';

import '../models/all_type_questions_model.dart';
import '../models/specific_questions_model.dart';
import '../services/questions_services.dart';

class QuestionsRepo {
  static Future<List<AllQuestionModel>> getAllTypesOfQustions() async {
    Response response = await QuestionsServices.getAllTypesOfQustions();

    print('this is all questions respons $response');
    List allQuestionLis = response.data['questions'];
    return allQuestionLis
        .map((question) => AllQuestionModel.fromJson(question))
        .toList();
  }

  static Future<List<SpecificQuestioncModel>> getSpecificQustions(
      {required String questionsId}) async {
    Response response =
        await QuestionsServices.getSpecificQustions(questionsId: questionsId);

    print('this is getSpecificQustions respons $response');
    List specificQuestionLis = response.data['questions']['subTitle'];
    return specificQuestionLis
        .map((question) => SpecificQuestioncModel.fromJson(question))
        .toList();
  }
}
