part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class FeedInitialData extends FeedEvent {}
