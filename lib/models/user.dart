import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  String email;
  String username;
  String password;

  User(this.email, this.username, this.password);
}