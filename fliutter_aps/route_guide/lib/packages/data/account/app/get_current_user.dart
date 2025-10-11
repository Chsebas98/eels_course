import 'package:route_guide/packages/data/account/domain/models/user_model.dart';
import 'package:route_guide/packages/data/account/domain/user/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository _authRepository;

  const GetCurrentUser(this._authRepository);

  Stream<UserModel?> call() => _authRepository.currentUser;
}
