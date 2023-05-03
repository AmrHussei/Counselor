import '../../../../core/helper/services_helper.dart';
import '../../../../core/utils/constant.dart';

class QuestionsServices {
  static Future<dynamic> getAllTypesOfQustions() async {
    try {
      return await ServicesHelper.getData(url: ApiConstant.getAllTypesQustions);
    } catch (error) {
      print(
          '---------------------- error from getAllTypesOfQustions -----------------------------');
      print(error.toString());
      return;
    }
  }

  static Future<dynamic> getSpecificQustions(
      {required String questionsId}) async {
    try {
      return await ServicesHelper.getData(
          url: '${ApiConstant.getSpecificQustions}$questionsId');
    } catch (error) {
      print(
          '---------------------- error from getAllTypesOfQustions -----------------------------');
      print(error.toString());
      return;
    }
  }
}
