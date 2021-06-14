part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {}
