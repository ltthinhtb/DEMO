import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  List<String> list = [
    S.current.feed,
    S.current.dashboard,
    S.current.account_setting,
    S.current.biography,
    S.current.support
  ];

  int _indexScreen = 0;

  int get indexScreen => _indexScreen;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeChangeScreen) {
      yield HomeLoading();
      _indexScreen = event.indexScreen;
      yield HomeLoaded();
    }
    // TODO: implement mapEventToState
  }
}
