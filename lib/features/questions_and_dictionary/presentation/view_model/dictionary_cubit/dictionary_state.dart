part of 'dictionary_cubit.dart';

@immutable
abstract class DictionaryState {}

class DictionaryInitial extends DictionaryState {}

class DictionaryLoading extends DictionaryState {}

class DictionaryLoaded extends DictionaryState {}

class DictionaryError extends DictionaryState {}
