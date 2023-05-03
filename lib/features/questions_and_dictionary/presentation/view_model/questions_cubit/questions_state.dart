part of 'questions_cubit.dart';

@immutable
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class AllQuestionsLoaded extends QuestionsState {}

class AllQuestionsLoading extends QuestionsState {}

class AllQuestionsError extends QuestionsState {}

//SpecificQuestions states

class SpecificQuestionsLoaded extends QuestionsState {}

class SpecificQuestionsLoading extends QuestionsState {}

class SpecificQuestionsError extends QuestionsState {}
