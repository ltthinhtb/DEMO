import 'package:equatable/equatable.dart';

class SignUpFormState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpFormState {
  @override
  String toString() {
    return 'SignUpInitial{}';
  }
}

class SignUploading extends SignUpFormState {
  @override
  String toString() {
    return 'SignUploading{}';
  }
}

class SignUpLoaded extends SignUpFormState {
  @override
  String toString() {
    return 'SignUpLoaded{}';
  }
}
