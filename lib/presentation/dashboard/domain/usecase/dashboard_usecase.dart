import '../entity/dashboard_entities.dart';
import '../repositories/dashboard_repositories.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<List<UserEntity>> call() {
    return repository.getUsers();
  }
}
