// presentation/bloc/user_bloc.dart
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_matrimony/core/services/api_services.dart';
import 'package:it_matrimony/presentation/dashboard/data_layer/model/dashboard_model.dart';
import './dashboard_event.dart';
import './dashboard_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiServices apiServices;

  UserBloc(this.apiServices) : super(UserInitials()) {
    on<FetchUser>((event, emit) async {
      
      

      try {
        final respone = await apiServices.getResponse("/users");

      if (respone == null){
        emit(UserError(respone));
        return;
      }

      final List jsonList = jsonDecode(respone);
      final users = jsonList.map((element) => UserModel.fromJson(element)).toList();

      emit(FetchUserState(users));
      } catch (e) {
        emit(UserError("Error :$e"));
      }


            
    },);
    // on<LoadUsers>((event, emit) async {
    //   emit(state.copyWith(loading: true));

    //   try {
    //     final result = await ApiServices().getResponse("/users");
    //     final res = result.map<UserModel>((use) => UserModel.fromJson(use));
    //     emit(state.copyWith(loading: false, users: res));
    //   } catch (e) {
    //     emit(state.copyWith(loading: false, error: e.toString()));
    //   }
    // });
  }
}
