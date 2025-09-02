import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()){
    on<EmailChange>((event, emit) {
      emit(state.copyWith(
        email: event.email
      ));
      
    },);

    on<PasswordChange>((event, emit) {
      emit(state.copyWith(
        password: event.password
      ));
    },);

    on<FormSubmitted>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true, isSuccess: false, isFailure: false
      ));
      await Future.delayed(Duration(seconds: 2));
    },);

  }
  
}