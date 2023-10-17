import 'package:bitsgap/data/database/database.dart';
import 'package:bitsgap/models/user.dart';

class AuthRepository {

  final Database _database;

  AuthRepository(this._database);

  Future<LoginResult> loginUser(String username, String password) async {
    final userWithUsername = await _database.getUserByUsername(username);
    if (userWithUsername == null) {
      return LoginResult.userNotFound;
    }

    if (userWithUsername.password != password) {
      return LoginResult.wrongPassword;
    }

    return LoginResult.userLoggedIn;
  }

  Future<RegisterResult> registerUser(String email, String username, String password) async {

    final userWithEmail = await _database.getUserByEmail(email);
    if (userWithEmail != null) {
      return RegisterResult.userWithEmailAlreadyExists;
    }

    final userWithUsername = await _database.getUserByUsername(username);
    if (userWithUsername != null) {
      return RegisterResult.userWithUsernameAlreadyExists;
    }

    final user = User(email, username, password);

    await _database.saveUser(user);

    return RegisterResult.userRegistered;
  }
}

enum LoginResult{
  userNotFound,
  wrongPassword,
  userLoggedIn,
}

enum RegisterResult{
  userWithEmailAlreadyExists,
  userWithUsernameAlreadyExists,
  userRegistered,
}
