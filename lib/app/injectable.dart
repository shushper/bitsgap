import 'package:bitsgap/app/app_navigator.dart';
import 'package:bitsgap/data/database/database.dart';
import 'package:bitsgap/data/prefs/prefs.dart';
import 'package:bitsgap/repositories/auth_repository.dart';
import 'package:bitsgap/screens/auth/auth_mode_store.dart';
import 'package:bitsgap/screens/auth/login_store.dart';
import 'package:bitsgap/screens/auth/signup_store.dart';
import 'package:bitsgap/screens/home/home_store.dart';
import 'package:bitsgap/utils/validator.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final database = Database();
  await database.init();

  getIt.registerSingleton(AppNavigator());
  getIt.registerSingleton(Prefs());
  getIt.registerSingleton<Database>(database);
  getIt.registerSingleton<Validator>(Validator());
  getIt.registerSingleton<AuthRepository>(AuthRepository(
    getIt.get<Database>(),
    getIt.get<Prefs>(),
  ));

  getIt.registerFactory<AuthModeStore>(() => AuthModeStore());
  getIt.registerFactory<LoginStore>(() => LoginStore(
        getIt.get<Validator>(),
        getIt.get<AuthRepository>(),
        getIt.get<AppNavigator>(),
      ));
  getIt.registerFactory<SignUpStore>(() => SignUpStore(
        getIt.get<Validator>(),
        getIt.get<AuthRepository>(),
        getIt.get<AppNavigator>(),
      ));

  getIt.registerFactory<HomeStore>(() => HomeStore(
        getIt.get<AppNavigator>(),
        getIt.get<AuthRepository>(),
      ));
}
