// data/datasources/user_remote_datasource.dart
import 'package:it_matrimony/core/services/api_services.dart';

import '../model/dashboard_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
   final response = await ApiServices().getResponse("/users");

    // Simulating real response with your provided JSON
    final List<dynamic> jsonList = response;

    return jsonList.map((e) => UserModel.fromJson(e)).toList();
  }
}
