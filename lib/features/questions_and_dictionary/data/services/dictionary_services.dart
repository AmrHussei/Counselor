import '../../../../core/helper/services_helper.dart';
import '../../../../core/utils/constant.dart';

class DictionaryServices {
  static Future<dynamic> getDictionaryData() async {
    try {
      return await ServicesHelper.getDataWithoutToken(
          url: ApiConstant.criminalDictionary);
    } catch (error) {
      print(
          '---------------------- error from getAll dectonary -----------------------------');
      print(error.toString());
      return;
    }
  }
}
