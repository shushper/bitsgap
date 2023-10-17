import 'package:bitsgap/app/injectable.dart';
import 'package:bitsgap/res/text_styles.dart';
import 'package:bitsgap/screens/home/home_store.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeStore = getIt.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Home Screen',
                style: MyTextStyles.h6.copyWith(color: colorScheme.onBackground),
              ),
              const SizedBox(
                height: 12,
              ),
              FilledButton(onPressed: () {}, child: const Text('Log out')),
            ],
          ),
        ),
      ),
    );
  }
}
