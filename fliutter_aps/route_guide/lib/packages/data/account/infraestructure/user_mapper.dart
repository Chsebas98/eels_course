import 'package:route_guide/packages/data/account/domain/models/user_model.dart';
import 'package:route_guide/packages/data/account/infraestructure/user_cache_dtos.dart';

class UserMapper {
  const UserMapper();

  UserModel fromCacheDto(UserCacheDto dto) {
    final name = dto.name;
    final age = dto.age;
    final weight = dto.weight;
    final email = dto.email;

    return UserModel(name: name, age: age, weight: weight, email: email);
  }
}
