import 'package:bitsgap/app/app_routes.dart';
import 'package:bitsgap/app/injectable.dart';
import 'package:bitsgap/repositories/auth_repository.dart';

Future<void> startup() async {
  final authRepository = getIt.get<AuthRepository>();
  final isAuthorized = await authRepository.isAuthorized();

  if (isAuthorized) {
    getIt.registerSingleton<String>(AppRoutes.home, instanceName: 'initialRoute');
  } else {
    getIt.registerSingleton<String>(AppRoutes.auth, instanceName: 'initialRoute');
  }
}
