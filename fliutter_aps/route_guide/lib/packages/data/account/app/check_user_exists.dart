import 'package:route_guide/packages/data/account/domain/user/auth_repository.dart';

class CheckUserExists {
  final AuthRepository _authRepository;

  const CheckUserExists(this._authRepository);

  Stream<bool> call() => _authRepository.checkUser();
}
