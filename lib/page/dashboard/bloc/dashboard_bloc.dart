import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/service/model/total_value.dart';
import 'package:bloc_example/service/repository/dashboard_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()){
    add(GetDashBoardData());
  }

  int _position = 0;

  int get position => _position;

  TotalData totalData = TotalData(
    pieStats: [],
    dataStats: []
  );
  DashBoardRepository _repository = DashBoardRepository();


  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if(event is GetDashBoardData){
      yield DashboardLoading();
      totalData = await _repository.getTotalData();
      yield DashboardLoaded();
    }
    if(event is ChangeTabBar) {
      yield DashboardLoading();
      totalData = await _repository.getTotalData();
      _position = event.position;
      yield DashboardLoaded();
    }
  }
}
