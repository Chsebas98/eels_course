import 'package:route_guide/packages/data/account/domain/models/user_model.dart';
import 'package:route_guide/packages/data/account/domain/user/auth_repository.dart';

class SaveUser {
  final AuthRepository _authRepository;

  const SaveUser(this._authRepository);

  Future<void> call(UserModel user) => _authRepository.saveUser(user);
}
