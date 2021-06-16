part of 'biography_bloc.dart';

@immutable
abstract class BiographyState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class BiographyInitial extends BiographyState {}

class BiographyLoading extends BiographyState {}

class BiographyLoaded extends BiographyState {}

class BiographyError extends BiographyState {}
