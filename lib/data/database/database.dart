import 'package:bitsgap/models/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  late Isar _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [UserSchema],
      directory: dir.path,
    );
  }

  Future<void> saveUser(User user) async {
    await _isar.writeTxn(() async {
      await _isar.users.put(user);
    });
  }

  Future<User?> getUserByEmail(String email) async {
    return await _isar.users.filter().emailEqualTo(email, caseSensitive: false).findFirst();
  }

  Future<User?> getUserByUsername(String username) async {
    return await _isar.users.filter().usernameEqualTo(username, caseSensitive: true).findFirst();
  }
}
