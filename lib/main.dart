import 'package:bitsgap/app/app.dart';
import 'package:bitsgap/app/app_startup.dart';
import 'package:bitsgap/app/injectable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  await startup();
  runApp(const MyApp());
}
