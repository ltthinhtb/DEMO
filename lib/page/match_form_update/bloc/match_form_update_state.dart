import 'package:equatable/equatable.dart';

abstract class MatchFormUpdateState extends Equatable {
  @override
  List<Object> get props => [];
}

class MatchFormUpdateInitial extends MatchFormUpdateState {
  @override
  String toString() {
    return 'MatchFormUpdateInitial{}';
  }
}

class MatchFormUpdateLoading extends MatchFormUpdateState {
  @override
  String toString() {
    return 'MatchFormUpdateLoading{}';
  }
}

class MatchFormUpdateLoaded extends MatchFormUpdateState {
  @override
  String toString() {
    return 'MatchFormUpdateLoaded{}';
  }
}

class ValidatorUpdateFormError extends MatchFormUpdateState {
  final String error;

  ValidatorUpdateFormError(this.error);

  @override
  String toString() {
    return 'ValidatorUpdateFormError{error: $error}';
  }
}
