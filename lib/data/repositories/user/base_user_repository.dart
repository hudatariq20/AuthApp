import 'package:auth_ui/domain/models/user.dart';
abstract class BaseUserRepository {
  //getUser
  Stream<User> getUser(String userId);
  //createUser
  Future<void> createUser(User user);
  //updateUser
  Future<void> updateUser(User user);
}
