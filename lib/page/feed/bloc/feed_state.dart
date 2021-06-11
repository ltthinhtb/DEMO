part of 'feed_bloc.dart';

@immutable
abstract class FeedState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class FeedInitial extends FeedState {}

class FeedLoaded extends FeedState {}

class FeedLoading extends FeedState {}
