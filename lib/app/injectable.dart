import 'package:bitsgap/data/database/database.dart';
import 'package:bitsgap/repositories/auth_repository.dart';
import 'package:bitsgap/screens/login_store.dart';
import 'package:bitsgap/screens/signup_store.dart';
import 'package:bitsgap/utils/validator.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final database = Database();
  await database.init();

  getIt.registerSingleton<Database>(database);
  getIt.registerSingleton<Validator>(Validator());
  getIt.registerSingleton<AuthRepository>(AuthRepository(
    getIt.get<Database>(),
  ));
  getIt.registerFactory<LoginStore>(() => LoginStore(
        getIt.get<Validator>(),
        getIt.get<AuthRepository>(),
      ));
  getIt.registerFactory<SignUpStore>(() => SignUpStore(
        getIt.get<Validator>(),
        getIt.get<AuthRepository>(),
      ));
}
