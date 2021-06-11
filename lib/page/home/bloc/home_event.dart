part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class HomeChangeScreen extends HomeEvent{
  final int indexScreen;

  HomeChangeScreen(this.indexScreen);
}
