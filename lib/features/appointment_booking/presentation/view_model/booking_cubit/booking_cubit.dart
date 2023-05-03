import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/booking_repo.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  Future<void> postOrder({
    required String date,
    required String phone,
    required String desc,
    required String reason,
  }) async {
    emit(BookingLoading());
    try {
      await BookingRepo.postOrder(
          date: date, phone: phone, desc: desc, reason: reason);
      emit(BookingSuccess());
    } catch (error) {
      emit(BookingError());
      print(
          '--------------------hhhhhhhhhhhhhhhhhhhhhh-------------------------------');
      print(error.toString());
      return;
    }
  }
}
