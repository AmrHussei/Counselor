import '../../../../core/helper/services_helper.dart';

class NewsServices {
  static Future<dynamic> getAllNews() async {
    try {
      return await ServicesHelper.getDataWithoutToken(url: 'news');
    } catch (error) {
      print(
          '---------------------- error from getAllTypesOfQustions -----------------------------');
      print(error.toString());
      return;
    }
  }
}
