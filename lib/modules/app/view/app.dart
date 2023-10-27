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
      theme: ThemeData(),
      routerConfig: router,
    );
  }
}
