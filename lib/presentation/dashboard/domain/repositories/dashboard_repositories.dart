import '../entity/dashboard_entities.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}
