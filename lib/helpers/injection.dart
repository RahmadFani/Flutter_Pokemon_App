import 'package:esensi_solusi_buana_test/router/router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

GetIt getIt = GetIt.I;

class Injection {
  static init() {
    final router = MyRouter.init();
    getIt.registerLazySingleton<GoRouter>(() => router);
  }
}
