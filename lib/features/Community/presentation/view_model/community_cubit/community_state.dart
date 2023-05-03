part of 'community_cubit.dart';

@immutable
abstract class CommunityState {}

class CommunityInitial extends CommunityState {}

class AllPostsLoaded extends CommunityState {}

class AllPostsLoading extends CommunityState {}

class AllPostsError extends CommunityState {}
