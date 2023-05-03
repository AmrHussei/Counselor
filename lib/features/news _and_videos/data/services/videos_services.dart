import 'package:legal_advice_app/core/utils/constant.dart';

import '../../../../core/helper/services_helper.dart';

class VideosServices {
  static Future<dynamic> getAllVideos() async {
    try {
      return await ServicesHelper.getDataWithoutToken(url: ApiConstant.videos);
    } catch (error) {
      print(
          '---------------------- error from getAllTypesOfQustions -----------------------------');
      print(error.toString());
      return;
    }
  }
}
