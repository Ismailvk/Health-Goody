import 'package:health_goody/core/data/datasources/remote_data_source.dart';
import 'package:health_goody/core/data/models/auth_user_model.dart';
import 'package:health_goody/core/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<AuthUserModel> authenticateUser(String email, String password) {
    return _remoteDataSource.authenticateUser(email, password);
  }
}
