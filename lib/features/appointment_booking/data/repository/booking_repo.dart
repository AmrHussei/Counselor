import '../services/booking_services.dart';

class BookingRepo {
  static Future<dynamic> postOrder({
    required String date,
    required String phone,
    required String desc,
    required String reason,
  }) async {
    try {
      await BookingServices.postOrder(
        date: date,
        phone: phone,
        desc: desc,
        reason: reason,
      );
    } catch (error) {
      print(
          '----------------------Rrrrrrrrrrrrrrrrrrrrrrrrr-----------------------------');
      print(error.toString());
      return;
    }
  }
}
