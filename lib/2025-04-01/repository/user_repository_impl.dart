import '../data_source/user_datasource.dart';
import '../model/user.dart';
import 'interface/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _datasource;

  const UserRepositoryImpl(this._datasource);

  @override
  Future<List<User>> getUsers() async {
    final raw = await _datasource.fetchUsers();
    return raw.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final raw = await _datasource.fetchUsers();
    final users = raw.map((e) => User.fromJson(e)).toList();
    users.sort((a, b) => a.username.compareTo(b.username));

    //return users.take(10).toList();

    final top10 = <User>[];
    for (int i = 0; i < 10 && i < users.length; i++) {
      top10.add(users[i]);
    }

    return top10;
  }
}
