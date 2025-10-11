import 'dart:convert';

import 'package:route_guide/packages/data/account/domain/models/user_model.dart';
import 'package:route_guide/packages/data/account/domain/user/auth_repository.dart';
import 'package:route_guide/packages/data/account/infraestructure/user_cache_dtos.dart';
import 'package:route_guide/packages/data/account/infraestructure/user_mapper.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authCache, this._mapper);

  final AuthCache _authCache;
  final UserMapper _mapper;

  @override
  Future<void> saveUser(UserModel user) =>
      _authCache.update(UserCacheDto.fromEntity(user));

  @override
  Stream<bool> checkUser() =>
      _authCache.snapshots.map((userCacheDto) => userCacheDto != null);

  @override
  Stream<UserModel?> get currentUser => _authCache.snapshots.map(
    (userCacheDto) =>
        userCacheDto != null ? _mapper.fromCacheDto(userCacheDto) : null,
  );
}

class AuthCache {
  static String authDataKey = 'authData';

  const AuthCache(this._preferences);

  final RxSharedPreferences _preferences;

  Future<void> update(UserCacheDto userCacheDto) =>
      _preferences.setString(authDataKey, jsonEncode(userCacheDto));

  Stream<UserCacheDto?> get snapshots => _preferences
      .getStringStream(authDataKey)
      .map(
        (rawUserData) => rawUserData != null
            ? UserCacheDto.fromJson(jsonDecode(rawUserData))
            : null,
      );
}
