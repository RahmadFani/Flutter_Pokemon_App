import 'package:esensi_solusi_buana_test/helpers/theme.dart';
import 'package:esensi_solusi_buana_test/router/router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = MyRouter.init();
    return MaterialApp.router(
      title: 'Flutter ESB Technical Test',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                width: 2,
                color: primaryColor,
              ),
              minimumSize: const Size(100, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )
          // * adding global text theme if you have
          ),
      routerConfig: router,
    );
  }
}
