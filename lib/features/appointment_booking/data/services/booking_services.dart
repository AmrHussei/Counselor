import '../../../../core/helper/services_helper.dart';
import '../../../../core/utils/constant.dart';

class BookingServices {
  static Future<void> postOrder({
    required String date,
    required String phone,
    required String desc,
    required String reason,
  }) async {
    try {
      await ServicesHelper.postDataWithToken(
        url: ApiConstant.orders,
        data: {
          "phone": phone,
          "desc": desc,
          "reason": reason,
          "date": date,
        },
      );
    } catch (error) {
      print(
          '----------------------erof frrom postDataWithToken -----------------------------');
      print(error.toString());
      return;
    }
  }
}
