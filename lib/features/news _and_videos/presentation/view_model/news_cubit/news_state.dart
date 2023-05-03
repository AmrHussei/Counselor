part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class AllNewsLoaded extends NewsState {}

class AllNewsLoading extends NewsState {}

class AllNewsError extends NewsState {}
