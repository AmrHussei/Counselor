part of 'videos_cubit.dart';

@immutable
abstract class VideosState {}

class VideosInitial extends VideosState {}

class AllVideosLoaded extends VideosState {}

class AllVideosLoading extends VideosState {}

class AllVideosError extends VideosState {}
