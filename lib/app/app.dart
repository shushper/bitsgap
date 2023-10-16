import 'package:bitsgap/screens/auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF4A55A7),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFFBFDBFE),
          onSecondary: Color(0xFF262931),
          error: Color(0xFFE12E0D),
          onError: Color(0xFFFFFFFF),
          background: Color(0xFFF9F9F9),
          onBackground: Color(0xFF4A55A7),
          surface: Colors.transparent,
          onSurface: Colors.transparent,
        ),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF6371DE),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFF1E293B),
          onSecondary: Color(0xFFFFFFFF),
          error: Color(0xFFE12E0D),
          onError: Color(0xFFFFFFFF),
          background: Color(0xFF181818),
          onBackground: Color(0xFFFFFFFF),
          surface: Colors.transparent,
          onSurface: Colors.transparent,
        ),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const AuthScreen(),
    );
  }
}