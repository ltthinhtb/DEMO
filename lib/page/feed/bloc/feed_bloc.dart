import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/service/model/match_update_form_model.dart';
import 'package:bloc_example/service/model/news_feed.dart';
import 'package:bloc_example/service/repository/feed_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedInitial()){
    add(FeedInitialData());
  }

  List<Player> listPlayer = [];

  List<NewsFeed> listNews = [];
  final FeedRepository repository = FeedRepository();

  @override
  Stream<FeedState> mapEventToState(
    FeedEvent event,
  ) async* {
    if(event is FeedInitialData){
      yield FeedLoading();
      listPlayer = await repository.getListPlayer();
      listNews = await repository.getNewsFeed();
      yield FeedLoaded();
    }
    // TODO: implement mapEventToState
  }
}
