import 'package:equatable/equatable.dart';
import 'package:it_matrimony/presentation/dashboard/data_layer/model/dashboard_model.dart';



abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}


class UserInitials extends UserState {}

class UserLoading extends UserState {}

class FetchUserState extends UserState {

  final List<UserModel> users;

  FetchUserState(this.users);

  @override
  List<Object> get props => [users]; 
}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object?> get props => [message];
}
