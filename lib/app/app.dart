import 'package:bitsgap/res/color_schemes.dart';
import 'package:bitsgap/screens/auth_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: 'TT-Norms-Pro-Trial',
        colorScheme: lightColorScheme,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        fontFamily: 'TT-Norms-Pro-Trial',
        colorScheme: darkColorScheme,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const AuthScreen(),
    );
  }

}
