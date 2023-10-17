import 'package:bitsgap/repositories/auth_repository.dart';
import 'package:bitsgap/screens/login_store.dart';
import 'package:bitsgap/screens/signup_store.dart';
import 'package:bitsgap/utils/validator.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton<Validator>(Validator());
  getIt.registerSingleton<AuthRepository>(AuthRepository());
  getIt.registerFactory<LoginStore>(() => LoginStore(getIt.get<Validator>()));
  getIt.registerFactory<SignUpStore>(() => SignUpStore(getIt.get<Validator>()));
}
