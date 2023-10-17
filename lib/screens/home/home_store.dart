import 'package:bitsgap/app/app_navigator.dart';
import 'package:bitsgap/app/app_routes.dart';
import 'package:bitsgap/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final AuthRepository authRepository;
  final AppNavigator appNavigator;

  HomeStoreBase(this.appNavigator, this.authRepository);

  @action
  Future<void> logout() async {
    await authRepository.setAuthorized(false);
    appNavigator.pushNamedAndRemoveUntil(AppRoutes.auth, (route) => false);
  }
}
