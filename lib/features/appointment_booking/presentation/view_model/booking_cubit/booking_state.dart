part of 'booking_cubit.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingError extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {}
