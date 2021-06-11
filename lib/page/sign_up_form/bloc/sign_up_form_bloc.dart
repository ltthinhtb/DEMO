import 'package:bloc_example/page/sign_up_form/bloc/sign_up_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc(this.context) : super(SignUpInitial());
  final BuildContext context;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();

  @override
  Stream<SignUpFormState> mapEventToState(SignUpFormEvent event) async* {
    // TODO: implement mapEventToState
  }
}
