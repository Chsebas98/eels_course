import 'package:route_guide/packages/data/account/domain/models/user_model.dart';

abstract class AuthRepository {
  Future<void> saveUser(UserModel user);

  Stream<bool> checkUser();

  Stream<UserModel?> get currentUser;
}
