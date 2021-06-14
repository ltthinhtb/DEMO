part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable {

  @override
  List<Object> get props {
    return [];
  }
}

class ChangeTabBar extends DashboardEvent {
  final int position;

  ChangeTabBar(this.position);
}

class GetDashBoardData extends DashboardEvent {

}
